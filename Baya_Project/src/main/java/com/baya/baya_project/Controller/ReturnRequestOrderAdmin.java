package com.baya.baya_project.Controller;


import com.baya.baya_project.Dao.ReturnRequestOrderDao;
import com.baya.baya_project.Model.ReturnRequestOrder;
import com.baya.baya_project.service.OrderService;
import com.google.gson.JsonObject;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;

@WebServlet(name = "ReturnRequestOrderAdminName", value = "/return_request_order_admin")
public class ReturnRequestOrderAdmin extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("returnOrderID"));

        ReturnRequestOrderDao dao = new ReturnRequestOrderDao();
        ReturnRequestOrder r = dao.selectById(id);

        JsonObject json = new JsonObject();
        json.addProperty("orderID", r.getOrderID());
        json.addProperty("reason", r.getReason());
        json.addProperty("imagePath", r.getImagePath());

        response.setContentType("application/json");
        response.getWriter().write(json.toString());
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int orderID = Integer.valueOf(request.getParameter("orderID"));
        String note = request.getParameter("adminNote");
        String status = request.getParameter("status");
        ReturnRequestOrderDao dao = new ReturnRequestOrderDao();
        ReturnRequestOrder r =  dao.selectByOrderID(orderID);
        r.setAdminNote(note);
        r.setStatus(status);
        r.setImported(0);
        r.setResponseDate(LocalDateTime.now());

        int rs = dao.update(r);
        OrderService orderService = new OrderService();

        JSONObject json = new JSONObject();
        if(rs>0){
            json.put("success", true);
            json.put("id", r.getReturnID());
            boolean check = orderService.setStatusOrder(r.getOrderID(),5);
            System.out.println(check);
        }else{
            json.put("error", true);
        }
        response.setContentType("application/json");
        response.getWriter().write(json.toString());

    }
}

