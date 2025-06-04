package com.baya.baya_project.ViewAdmin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "Role", value = "/admin/permissions/view")
public class Role extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd  = request.getRequestDispatcher("/managementRolePage.jsp");
        rd.forward(request, response);
//        response.sendRedirect("/managementRolePage.jsp");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}