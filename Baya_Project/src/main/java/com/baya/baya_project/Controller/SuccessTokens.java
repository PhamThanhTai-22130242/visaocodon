package com.baya.baya_project.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SuccessTokens", value = "/successTokens")
public class SuccessTokens extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int type = 1;
        request.setAttribute("type", type);
        RequestDispatcher rd = request.getRequestDispatcher("/resultRegister.jsp") ;
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}