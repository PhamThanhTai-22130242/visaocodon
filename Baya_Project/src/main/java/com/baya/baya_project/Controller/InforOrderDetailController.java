package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ReturnRequestOrderDao;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.service.OrderService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "InforOrderDetail", value = "/infor-order-detail")
public class InforOrderDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession(true).getAttribute("user");


        if(user == null) {
            response.sendRedirect("login");
            return;
        }

        String id = request.getParameter("id");
        OrderService orderService = new OrderService();

        request.setAttribute("returnRequest",new ReturnRequestOrderDao().selectByOrderID(Integer.valueOf(id)));

        request.setAttribute("order",orderService.getOrderByID(Integer.parseInt(id)));
        request.getRequestDispatcher("inforOrderDetail.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}