package com.baya.baya_project.ViewAdmin;

import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Model.UserPrincipal;
import com.baya.baya_project.service.UserAdminService;
import com.baya.baya_project.service.LogService;
import com.baya.baya_project.Model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
@WebServlet(name = "UserPageAdmin", value = "/admin/users/view")
public class UserPageAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        List<User> listUser = userDAO.selectAll1();
        request.setAttribute("listUser", listUser);
        RequestDispatcher rd = request.getRequestDispatcher("/userPage.jsp");
        rd.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserAdminService userAdminService = new UserAdminService();
        LogService logService = new LogService();
        HttpSession session = request.getSession();
        UserPrincipal admin = (UserPrincipal) session.getAttribute("user");

        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));

        if ("delete".equals(action)) {
            try {
                userAdminService.deleteUser(id);
                request.setAttribute("message", "Xóa người dùng thành công.");

                logService.danger(admin.getUser().getUserID(), "Trang quản lý người dùng", "ID người dùng: " + id, "Đã xóa người dùng");
            } catch (Exception e) {
                request.setAttribute("message", "Đã xảy ra lỗi khi xóa người dùng: " + e.getMessage());
            }

        } else if ("ban_comment".equals(action)) {
            try {
                userAdminService.banned(id);
                request.setAttribute("message", "Cấm người dùng đánh giá/bình luận thành công.");

                logService.warning(admin.getUser().getUserID(), "Trang quản lý người dùng", "ID người dùng: " + id, "Cấm đánh giá/bình luận");
            } catch (Exception e) {
                request.setAttribute("message", "Đã xảy ra lỗi khi cấm người dùng đánh giá/bình luận: " + e.getMessage());
            }

        } else if ("unban_comment".equals(action)) {
            try {
                userAdminService.Unbanned(id);
                request.setAttribute("message", "Bỏ cấm người dùng đánh giá/bình luận thành công.");

                logService.infor(admin.getUser().getUserID(), "Trang quản lý người dùng", "ID người dùng: " + id, "Bỏ cấm đánh giá/bình luận");
            } catch (Exception e) {
                request.setAttribute("message", "Đã xảy ra lỗi khi bỏ cấm người dùng đánh giá/bình luận: " + e.getMessage());
            }
        }

        doGet(request, response);
    }

}