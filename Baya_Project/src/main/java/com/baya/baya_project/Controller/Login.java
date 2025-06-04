package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.PermissionDao;
import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Model.HashPasswords;
import com.baya.baya_project.Model.PermissionCacheManager;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.Model.UserPrincipal;
import com.baya.baya_project.service.LogService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Set;

@WebServlet(name = "helloServlet", value = "/login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        HttpSession session = request.getSession();
        LogService log = new LogService();
        if (session.getAttribute("user") != null) {
            response.sendRedirect("profile");
            return;
        }
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        if (email == null || password == null) {
            response.sendRedirect("/login.jsp");
            return;
        }
        UserDAO userDAO = new UserDAO();
        String url = null;
        String message = null;

        User user = userDAO.findUserByEmail(email);
        System.out.println("user: " + user);

        if (user != null && user.getStatusID() != 4) {
            HashPasswords hashPasswords = new HashPasswords();
            int failPassword = userDAO.failPassword(email);
            LocalDateTime lockUntil = userDAO.lockUntil(email);
            System.out.println("lockUntil: " + lockUntil);
            String hash = user.getPassword();
            System.out.println(hash);


            if (lockUntil != null && lockUntil.isAfter(LocalDateTime.now())) {
                long minutesDifference = Duration.between(LocalDateTime.now(), lockUntil).toMinutes();
                message = "Vui lòng thử lại sau " + minutesDifference + " phút";
                url = "login.jsp";
            }

            else if (lockUntil != null && lockUntil.isBefore(LocalDateTime.now())) {
                userDAO.updateLock(email);
                userDAO.updateFailPassword(email, 0);

                if (hashPasswords.checkPassword(password, hash)) {
                    System.out.println("pass đúng");
                    handleSuccessfulLogin(user, session, log, response);
                    return;
                } else {
                    // Password incorrect after unlocking
                    handleFailedLogin(user, userDAO, failPassword, log, request, response);
                    return;
                }
            }

            else if (hashPasswords.checkPassword(password, hash)) {
                System.out.println("pass đúng");
                handleSuccessfulLogin(user, session, log, response);
                return;
            } else {

                handleFailedLogin(user, userDAO, failPassword, log, request, response);
                return;
            }
        } else {
            message = "Không tìm thấy người dùng";
            url = "login.jsp";
        }
        request.setAttribute("message", message);
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }


    private void handleSuccessfulLogin(User user, HttpSession session, LogService log, HttpServletResponse response) throws IOException {
        if (user.getAccountType() == 0) {
            session.setAttribute("user", user);
            response.sendRedirect("/");
            log.infor(user.getUserID(), "Đăng nhập", "Chưa đăng nhập", "Đăng nhập thành công với tài khoản User");
        } else {
            PermissionDao permissionDao = new PermissionDao();
            Set<String> permissions = permissionDao.getPermissionsByUserId(user.getUserID());
            UserPrincipal userPrincipal = new UserPrincipal();
            PermissionCacheManager.setPermissionsForUser(user.getUserID(), permissions);
            System.out.println("PermissionCacheManager tu trang login : " + PermissionCacheManager.getPermissionsForUser(user.getUserID()));
            PermissionCacheManager.validateUser(user.getUserID());
            userPrincipal.setUser(user);
            userPrincipal.setPermissions(permissions);
            session.setAttribute("user", userPrincipal);
            log.infor(user.getUserID(), "Đăng nhập", "Chưa đăng nhập", "Đăng nhập thành công với tài khoản Người Quản Trị");
            response.sendRedirect("/admin/welcome/view");
        }
    }

    private void handleFailedLogin(User user, UserDAO userDAO, int failPassword, LogService log, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message;
        if (failPassword < 2) {
            message = "Sai mật khẩu";
        } else if (failPassword == 2) {
            message = "Mật khẩu nhập sai quá 5 lần thì sẽ bị khóa trong 15 phút";
        } else if (failPassword == 3) {
            message = "Tài khoản chỉ còn 1 lần nhập sai nữa";
        } else if (failPassword == 4) {
            message = "Bạn đã bị khóa tài khoản trong 15 phút";
            log.warning(user.getUserID(), "Đăng nhập", "Thực hiện đăng nhập", "Bị khóa tài khoản trong 15 phút");
            userDAO.updateLockUntil(LocalDateTime.now().plusMinutes(15), user.getEmail());
        } else if (failPassword == 5) {
            failPassword = 0;
            userDAO.updateLock(user.getEmail());
            message = "Sai mật khẩu";
        } else {
            message = "Đã xảy ra lỗi";
        }
        userDAO.updateFailPassword(user.getEmail(), failPassword + 1);
        request.setAttribute("message", message);
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}