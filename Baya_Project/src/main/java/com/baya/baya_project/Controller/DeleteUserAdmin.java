package com.baya.baya_project.Controller;

import com.baya.baya_project.service.ProductAdminService;
import com.baya.baya_project.service.UserAdminService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DeleteUser", value = "/deleteUser")
public class DeleteUserAdmin extends HttpServlet {

//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String userID = request.getParameter("userID");
//        int id = Integer.parseInt(userID);
//
//        UserAdminService.deleteUser(id);
//        request.getRequestDispatcher("userPage").forward(request, response);
//    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}