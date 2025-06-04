package com.baya.baya_project.Controller;

import com.baya.baya_project.Model.Order;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.service.OrderService;
import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "StatusOrder", value = "/status-order")
public class  StatusOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession(true).getAttribute("user");

        if(user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String status = request.getParameter("status");
        String date = request.getParameter("date");
        String methodPayment = request.getParameter("methodPayment");


        System.out.println(status+" "+date+" "+methodPayment);

        OrderService orderService = new OrderService();
        List<Order> rs = orderService.getOrderByFilter(user.getUserID(),status,date,Integer.valueOf(methodPayment));
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Gson gson = new Gson();
        response.getWriter().write(gson.toJson(rs));


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }


}