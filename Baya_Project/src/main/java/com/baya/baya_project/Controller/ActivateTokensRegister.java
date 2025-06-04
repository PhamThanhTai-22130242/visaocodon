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

@WebServlet(name = "ActiveTokensRegister", value = "/activate")
public class ActivateTokensRegister extends HttpServlet {
    public final int IS_ACTIVE = 1;
    public final int undetermined =-1;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String activeTokens = request.getParameter("tokens");
        LogService log = new LogService();
        System.out.println(activeTokens);
        String ipAddress = request.getRemoteAddr();
        UserDAO userDAO = new UserDAO();
        String email = request.getParameter("email");
        User user = userDAO.findUserByEmail(email);
        int type = -1;
        String message;
        if (activeTokens == null || activeTokens.isEmpty()) {
            response.sendRedirect("/errorTokens");
            log.alert(user.getUserID(), "Tokens kích hoạt tài khoản", "Nhận tokens", "Tokens không tồn tại");

            return;
        } else {
            LocalDateTime now = LocalDateTime.now();
            HttpSession session = request.getSession();
            if (userDAO.checkStatus(email) == IS_ACTIVE) {
                log.alert(user.getUserID(), "Tokens kích hoạt tài khoản", "Nhận tokens", "Tokens đã được kích hoạt");
                response.sendRedirect("/isActivate");
                return;
            }
            else {


                if (userDAO.checkEmail(email) && new HashTokens().checkTokens(activeTokens, userDAO.getActiveCode(email))) {
                    LocalDateTime timeCreated = userDAO.getTimeActiveMail(email);
                    if (Duration.between(now, timeCreated).toHours() < 24) {
                        if (userDAO.updateStatus(email, IS_ACTIVE) > 0 && userDAO.updateCreateAt(now, email) > 0) {
                            log.infor(user.getUserID(), "Tokens kích hoạt tài khoản", "Nhận tokens", "Tokens kích hoạt thành công");
                            response.sendRedirect("/successTokens");
                            return;
                        }
                    } else {
                        session.setAttribute("email", email);
                        log.warning(user.getUserID(), "Tokens kích hoạt tài khoản", "Nhận tokens", "Đã hết thời gian kích hoạt tokens");

                        response.sendRedirect("/expiredTokens");
                        return;
                    }
                }
            }
            log.warning(user.getUserID(), "Tokens kích hoạt tài khoản", "Nhận tokens", "Đã xảy ra lỗi");
            response.sendRedirect("/errorTokens");
            return;

        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}