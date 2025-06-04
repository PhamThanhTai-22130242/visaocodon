package com.baya.baya_project.ControllerAdmin;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Model.*;
import com.baya.baya_project.service.LogService;
import com.baya.baya_project.service.OrderService;
import com.baya.baya_project.service.ReviewProductService;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderAdminController", value = "/admin/orders/view/order_view")
public class OrderAdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/orderPageAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}
