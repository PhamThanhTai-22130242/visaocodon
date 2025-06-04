package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Model.Cart;
import com.baya.baya_project.Model.Order;
import com.baya.baya_project.Model.Product;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.service.OrderService;
import com.baya.baya_project.service.OverviewAdminService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "OverviewAdmin", value = "/overview-admin")
public class OverviewAdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OverviewAdminService service = new OverviewAdminService();
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        request.setAttribute("totalUser",service.getTotalUsers());
        request.setAttribute("totalProduct",service.getTotalProducts());
        request.setAttribute("overturnToday",service.getTurnOverToday());
        request.setAttribute("overturnMonth",service.getTurnOverToMonth());
        request.setAttribute("orderList",service.getTop5rdersRecent());
        request.setAttribute("productList",service.getTop5ProductSellest());

        request.getRequestDispatcher("Dashboardadmin.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}

