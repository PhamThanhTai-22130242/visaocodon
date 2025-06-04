package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Model.HashTokens;
import com.baya.baya_project.Model.JavaMail;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.service.MailForgetPassword;
import com.baya.baya_project.service.RandomTokens;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ForgetPassword", value = "/forgetPassword")
public class ForgetPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDAO userDAO = new UserDAO();
        String email = request.getParameter("email");
        request.setAttribute("email", email);
        String tokens = new RandomTokens().generateToken();
        String hashTokens =  HashTokens.hashTokens(tokens);
        userDAO.updateActiveMail(email, hashTokens);

        new JavaMail().sendEmail(email, new MailForgetPassword().getSubject(), new MailForgetPassword(tokens, email, 0).getContent());
        int type = 5;
        request.setAttribute("type", type);
        request.getRequestDispatcher("/resultRegister.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}