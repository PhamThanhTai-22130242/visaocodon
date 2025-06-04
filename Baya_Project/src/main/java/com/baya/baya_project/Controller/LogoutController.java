package com.baya.baya_project.Controller;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.service.LogService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LogoutController", value = "/logout")
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LogService log = new LogService();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        log.infor(user.getUserID(), "Đăng xuất", "Còn lưu tài khoản ở Session", "Session được xóa và thoát tài khoản");
        session.invalidate();
        response.sendRedirect("home");
        return;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}