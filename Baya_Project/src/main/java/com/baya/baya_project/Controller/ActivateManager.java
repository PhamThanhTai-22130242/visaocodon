package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Model.HashTokens;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.service.LogService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;

@WebServlet(name = "ActivateManager", value = "/activateManager")
public class ActivateManager extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String activeTokens = request.getParameter("tokens");
        LogService log = new LogService();
        String email = request.getParameter("email");
        UserDAO userDAO = new UserDAO();
        HttpSession session = request.getSession();
        User user = userDAO.findUserByEmail(email);
        System.out.println(activeTokens);
        String message;
        if (activeTokens == null || activeTokens.isEmpty()) {
            response.sendRedirect("/errorTokens");
            log.alert(user.getUserID(), "Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ", "Nhận tokens", "Tokens không tồn tại");
            return;
        } else {
            if (user == null) {
                request.setAttribute("type", 9);
                request.getRequestDispatcher("/resultRegister.jsp").forward(request, response);
                return;
            }
            if (userDAO.checkStatus(email) == 1) {
                request.setAttribute("type", 4);
                request.getRequestDispatcher("/resultRegister.jsp").forward(request, response);
                return;
            }
            if (userDAO.checkStatus(email) == 2) {
                request.setAttribute("type", 4);
                request.getRequestDispatcher("/resultRegister.jsp").forward(request, response);
                return;
            }
            session.setAttribute("email", email);
            LocalDateTime now = LocalDateTime.now();
            if (new HashTokens().checkTokens(activeTokens, userDAO.getActiveCode(email))) {
                LocalDateTime timeCreated = userDAO.getTimeActiveMail(email);
                if (Duration.between(now, timeCreated).toHours() < 24) {
                    request.setAttribute("email", email);
                        log.warning(user.getUserID(), "Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ", "Nhận tokens", "Tokens hợp lệ, chuyển sang trang nhập mật khẩu");
                        response.sendRedirect("/successTokensManager");
                } else {
                    log.warning(user.getUserID(), "Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ", "Nhận tokens", "Đã hết thời gian kích hoạt tokens");
                    response.sendRedirect("/expiredTokens");
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}