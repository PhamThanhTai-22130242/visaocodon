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

@WebServlet(name = "ActiPasswNoEmail", value = "/actiPasswNoEmail")
public class ActiPasswNoEmail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String activeTokens = request.getParameter("tokens");
        LogService log = new LogService();
        String email = request.getParameter("email");
        UserDAO userDAO = new UserDAO();
        HttpSession session = request.getSession();
        User user = userDAO.findUserByEmail(email);
        System.out.println(activeTokens);
        int typeChange = Integer.parseInt(request.getParameter("type"));
        if (activeTokens == null || activeTokens.isEmpty()) {
            response.sendRedirect("/errorTokens");
            log.alert(user.getUserID(), "Tokens Quên mật khẩu", "Nhận tokens", "Tokens không tồn tại");
            return;
        }
        else{
            if(user == null){
                request.setAttribute("type", 8);
                request.getRequestDispatcher("/resultRegister.jsp").forward(request, response);
                return;
            }
            LocalDateTime now = LocalDateTime.now();
            if (userDAO.checkEmail(email) && new HashTokens().checkTokens(activeTokens, userDAO.getActiveCode(email))) {
                LocalDateTime timeCreated = userDAO.getTimeActiveMail(email);
                if (Duration.between(now, timeCreated).toHours() < 24) {
                    if (userDAO.updateCreateAt(now, email) > 0) {
                        request.setAttribute("email", email);
                        log.warning(user.getUserID(), "Tokens Quên mật khẩu", "Nhận tokens", "Thay đổi mật khẩu thành công");
                        request.getRequestDispatcher("/ActivateNoPass.jsp").forward(request, response);
                        return;
                    }
                } else {
                    session.setAttribute("email", email);
                    log.warning(user.getUserID(), "Tokens Quên mật khẩu", "Nhận tokens", "Đã hết thời gian kích hoạt tokens");
                    response.sendRedirect("/expiredTokens");
                    return;
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}