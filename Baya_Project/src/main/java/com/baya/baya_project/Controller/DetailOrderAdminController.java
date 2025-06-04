package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Model.Cart;
import com.baya.baya_project.Model.Order;
import com.baya.baya_project.Model.Product;
import com.baya.baya_project.service.OrderService;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;


@WebServlet(name = "DetailOrderAdmin", value = "/admin/orders/view/order-detail-admin")

public class  DetailOrderAdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        OrderService orderService = new OrderService();
        Order order = orderService.getOrderByID(Integer.parseInt(id));
        request.setAttribute("order", order);

        request.getRequestDispatcher("/detailOrderPageSuccess.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}