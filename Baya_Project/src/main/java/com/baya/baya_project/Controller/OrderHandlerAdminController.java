package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Model.Cart;
import com.baya.baya_project.Model.Product;
import com.baya.baya_project.service.OrderService;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;

@WebServlet(name = "/OrderHandlerAdmin", value = "/order-handler-admin")
public class OrderHandlerAdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");


        String idStatus = request.getParameter("idstatus");
        OrderService orderService = new OrderService();
        ProductDao productDao = new ProductDao();
        boolean check = orderService.setStatusOrder(Integer.parseInt(id),Integer.parseInt(idStatus));
        JSONObject jsonObject = new JSONObject();

        if( check ){
            int newStatus=Integer.parseInt(idStatus);
            newStatus++;
            jsonObject.put("success", true);
            jsonObject.put("newStatus", newStatus);

        }else{
            jsonObject.put("success", false);
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        System.out.println(jsonObject);
        response.getWriter().write(jsonObject.toString());



    }


}