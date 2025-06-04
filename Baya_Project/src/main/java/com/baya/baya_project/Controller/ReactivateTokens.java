package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Model.HashTokens;
import com.baya.baya_project.Model.JavaMail;
import com.baya.baya_project.service.RandomTokens;
import com.baya.baya_project.service.VetifyAccount;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ReactivateTokens", value = "/reactivate")
public class ReactivateTokens extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        String email = request.getParameter("email");
        String tokens = new RandomTokens().generateToken();

        String hashTokens = HashTokens.hashTokens(tokens);
        userDAO.updateActiveMail(email, hashTokens);
        String message = "Vui lòng kiểm tra email để kích hoạt tài khoản";
        String url = "login.jsp";
        new JavaMail().sendEmail(email, new VetifyAccount().getSubject(), new VetifyAccount(tokens, email).getContent());

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}