package com.baya.baya_project.Controller;

import com.baya.baya_project.Model.User;
import com.baya.baya_project.service.OrderService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "OrderHistory", value = "/order-history")
public class OrderHistoryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       User user = (User) request.getSession(true).getAttribute("user");

       if(user == null) {
           response.sendRedirect("login.jsp");
           return;
       }
        OrderService orderService = new OrderService();

       request.setAttribute("orders", orderService.getOrderByUserID(user.getUserID()));
       request.getRequestDispatcher("orderHistory.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}