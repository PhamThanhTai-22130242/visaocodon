package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Model.Cart;
import com.baya.baya_project.Model.Order;
import com.baya.baya_project.Model.Product;
import com.baya.baya_project.service.OrderService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EditOrderAdmin", value = "/admin/orders/update/edit-order-admin")

public class  EditOrderAdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");



        if(request.getParameter("success") != null){
             request.setAttribute("success",Boolean.valueOf(request.getParameter("success")));
        }
        OrderService orderService = new OrderService();
        Order order = orderService.getOrderByID(Integer.parseInt(id));

        request.setAttribute("order", order);
        request.getRequestDispatcher("editOrderPage.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String orderId = request.getParameter("id");
        String fullname = request.getParameter("usernameRE");
        String phoneNumber = request.getParameter("phoneRE");
        String email = request.getParameter("mailRE");
        String address = request.getParameter("address");
        String note = request.getParameter("note");
        String paymentMethod = request.getParameter("paymentName");
        String status = request.getParameter("status");

        System.out.println(status+" "+paymentMethod);

        if (fullname == null || fullname.isEmpty() ||
                phoneNumber == null || phoneNumber.isEmpty() ||
                address == null || address.isEmpty()) {
                response.sendRedirect(request.getContextPath()+"edit-order-admin?id=" + orderId+"&success=false");
            return;
        }else{
            Order order = new Order(orderId,fullname,email,phoneNumber,address,paymentMethod,status,note);
            order.setPaymentID(1);

            if(order.getPaymentName().equalsIgnoreCase("vnpay")){
                order.setPaymentID(2);
            }


            if(order.getOrderStatusID()==1 || order.getOrderStatusID()==0){
                order.setOrderStatusID(1);
                order.setOrderStatusName("Đang xử lí");
            }else if(order.getOrderStatusID()==2){
                order.setOrderStatusName("Đang vận chuyển");
            }else if(order.getOrderStatusID()==3){
                order.setOrderStatusName("Hoàn thành");
            }else if(order.getOrderStatusID()==4){
                order.setOrderStatusName("Đã hủy");
            }
            System.out.println(order.getOrderStatusID()+" "+order.getOrderStatusName());

            OrderService orderService = new OrderService();
            int rs = orderService.updateOrder(order);

            if(rs == 1){

                Order orderOld = orderService.getOrderByID(Integer.parseInt(orderId));
                order.setItems(orderOld.getItems());

                request.setAttribute("success",true);
                request.setAttribute("order",order);

            }else{
                response.sendRedirect(request.getContextPath()+"edit-order-admin?id=" + orderId+"&success=false");
            }

            request.getRequestDispatcher("editOrderPage.jsp").forward(request, response);
        }

    }


}