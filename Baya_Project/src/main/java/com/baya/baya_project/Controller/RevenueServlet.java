package com.baya.baya_project.Controller;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

import java.util.List;
import com.baya.baya_project.Dao.OrderDao;

@WebServlet("/revenue")
public class RevenueServlet extends HttpServlet {
    private OrderDao orderDao = new OrderDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Integer> monthlyRevenue = orderDao.getMonthlyRevenue();
            String jsonRevenue = new Gson().toJson(monthlyRevenue);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonRevenue);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"Lỗi server\"}");
        }
    }
}


