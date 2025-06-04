package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Model.Cart;
import com.baya.baya_project.Model.Order;
import com.baya.baya_project.Model.Product;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.service.OrderService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CancelOrder", value = "/cancel-order")
public class CancelOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession(true).getAttribute("user");

        if(user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String orderId = request.getParameter("orderId");

        OrderService orderService = new OrderService();
        int rs = orderService.removeOrderById(orderId);
        JSONObject jsonResponse = new JSONObject();
        System.out.println(rs);

        if(rs>0){
            jsonResponse.put("success",true);

        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());


    }


}