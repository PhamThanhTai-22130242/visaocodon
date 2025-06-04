package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.OrderDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UpdateOrderStatus", value = "/updateOrderStatus")
public class UpdateOrderStatus extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderIdStr = request.getParameter("orderID");
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        try {
            int orderId = Integer.parseInt(orderIdStr);
            OrderDao orderDao = new OrderDao();
            orderDao.updateOrderStatus(orderId);

            response.getWriter().write("success");
        } catch (NumberFormatException e) {
            response.getWriter().write("invalid orderID");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("error");
        }
    }
}
