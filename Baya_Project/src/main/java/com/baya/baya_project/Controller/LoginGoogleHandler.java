package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Handle.AccountGoogle;
import com.baya.baya_project.Handle.GoogleDTO;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.Model.UserPrincipal;
import com.baya.baya_project.service.LogService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LoginGoogleHandler", value = "/loginGoogleHandler")
public class LoginGoogleHandler extends HttpServlet {
    public final int undetermined = -1;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LogService log = new LogService();
        String code = request.getParameter("code");
        String error = request.getParameter("error");
        if (error != null) {
            response.sendRedirect("/login");
            return;
        }
        GoogleDTO googleDTO = new GoogleDTO();
        String tokens = googleDTO.getToken(code);
        System.out.println(tokens);
        AccountGoogle acc = googleDTO.getUserInfo(tokens);
        HttpSession session = request.getSession();
        if (acc == null || acc.getEmail() == null) {
            log.warning(undetermined, "Đăng nhập bằng Google", "Bắt đầu nhận data người dùng", "Không có kết quả nào được tìm thấy");

            response.sendRedirect("error-404.jsp");
            return;
        }
        UserDAO dao = new UserDAO();
        String url = null;
        if (dao.checkEmail(acc.getEmail())) {

            

            User user = dao.findUserByEmail(acc.getEmail());
            if (dao.checkStatus(acc.getEmail()) == 1) {
                log.infor(user.getUserID(), "Đăng nhập bằng Facebook", "Nhận tokens", "Đăng nhập thành công");
                session.setAttribute("user", user);
                url = "/";
            } else {
                int updateStatus = dao.updateStatus(acc.getEmail(), 1);
                log.infor(user.getUserID(), "Đăng nhập bằng Facebook", "Nhận tokens", "Đăng nhập thành công");
                session.setAttribute("user", user);
                url = "/";
            }

        } else {
            log.infor(undetermined, "Đăng nhập bằng Facebook", "Nhận tokens", "Bắt đầu tạo tài khoản User mới");
            request.setAttribute("acc", acc);
            url = "FormLoginHandler.jsp";

        }


        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}