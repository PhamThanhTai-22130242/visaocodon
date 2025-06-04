package com.baya.baya_project.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ExpiredTokens", value = "/expiredTokens")
public class ExpiredTokens extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int type =3;
        HttpSession session = request.getSession();
        String email = session.getAttribute("email").toString();
        session.removeAttribute("email");
        request.setAttribute("type",type);
        request.setAttribute("email",email);
        request.getRequestDispatcher("resultRegister.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}