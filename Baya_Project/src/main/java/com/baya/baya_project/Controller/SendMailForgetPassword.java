package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Model.HashTokens;
import com.baya.baya_project.Model.JavaMail;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.service.LogService;
import com.baya.baya_project.service.MailForgetPassword;
import com.baya.baya_project.service.RandomTokens;
import com.baya.baya_project.service.VetifyAccount;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "SendMailForgetPassword", value = "/forget")
public class SendMailForgetPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LogService log = new LogService();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String email = user.getEmail();
        UserDAO userDAO = new UserDAO();
        String tokens = new RandomTokens().generateToken();
        String hashTokens =  HashTokens.hashTokens(tokens);
        userDAO.updateActiveMail(email, hashTokens);
        userDAO.updateCreateAt(LocalDateTime.now().plusHours(24), email);
        new JavaMail().sendEmail(email, new VetifyAccount().getSubject(), new MailForgetPassword(tokens, email,1).getContent());
        int type = 5;
        request.setAttribute("type", type);
        log.infor(user.getUserID(), "Thay đổi mật khẩu","Thay đổi mật khẩu", "Hệ thống bắt đầu gửi mail");
        RequestDispatcher rd = request.getRequestDispatcher("/resultRegister.jsp") ;
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}