package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Dao.ReturnRequestOrderDao;
import com.baya.baya_project.Model.*;
import com.baya.baya_project.service.OrderService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "OrderListAdmin", value = "/order-list-admin")
public class OrderListAdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        OrderService service = new OrderService();
        List<Order> list = service.getAllOrder();

        Gson gson = new Gson();
        List<JsonObject> jsonList = new ArrayList<>();

        ReturnRequestOrderDao serviceOrder = new ReturnRequestOrderDao();



        for (Order order : list) {
            JsonObject json = new JsonObject();
            json.addProperty("orderId", order.getOrderId());
            json.addProperty("fullname", order.getFullname());
            json.addProperty("createAt", order.getFormattedDateSimple());
            json.addProperty("address", order.getAddress());
            json.addProperty("totalPrice", order.getTotalPrice());

            json.addProperty("orderStatusName", order.getOrderStatusName());

            json.addProperty("phoneNumber", order.getPhoneNumber());


            String iconStatus = "";
            String disabled = "";
            String linkDisabled = "";
            String buttonStatus="";
            UserPrincipal user =(UserPrincipal) request.getSession().getAttribute("user");
            if(user.hasPermission("orders","update")){

                if (order.getOrderStatusID() == 1) {
                    iconStatus = "<i class='fa-solid fa-spinner' style='color: #ffffff;'></i>";
                } else if (order.getOrderStatusID() == 2) {
                    iconStatus = "<i class='fa-solid fa-truck' style='color: #ffffff;'></i>";
                } else if (order.getOrderStatusID() == 3) {
                    disabled = "disabled";
                    linkDisabled = "style='pointer-events: none; opacity: 0.7;'";
                    iconStatus = "<i class='fa-solid fa-check' style='color: #ffffff;'></i>";
                } else {
                    disabled = "disabled style='opacity:0.7'";
                    linkDisabled = "style='pointer-events: none; opacity: 0.7;'";
                    iconStatus = "<i class='fa-solid fa-ban' style='color: #ffffff;'></i>";
                }
                buttonStatus  = "<button class='btn btn-success btn-sm btn-confirm-status'  data-id='" + order.getOrderId() + "' data-id-status='" + order.getOrderStatusID() + "' data-bs-toggle='modal' data-bs-target='#confirmOrderModal' " + disabled + " >"
                        + iconStatus + "</button>";

            }




            String returnButton = "";
            if(user.hasPermission("orders","update")) {

                ReturnRequestOrder returnOrder = serviceOrder.selectByOrderID(order.getOrderId());
                if (order.getOrderStatusID() == 3 && returnOrder != null) {
                    String disabled2 = order.before3Day() && returnOrder.getStatus().equalsIgnoreCase("Đang duyệt") ? "" : "disabled style='opacity: 0.6; cursor: not-allowed;'";
                    returnButton = "<button class='btn btn-danger btn-sm btn-return-order' data-id='" + returnOrder.getReturnOrderID() + "' " + disabled2 + ">" + returnOrder.getStatus() + " </button> ";
                }
            }

            String editButton = "";

            if(user.hasPermission("orders","update")) {
                editButton = "<a href='/admin/orders/update/edit-order-admin?id=" + order.getOrderId() + "' " + linkDisabled + ">"
                        + "<button class='btn btn-warning btn-sm'><i class='fa-solid fa-pen-to-square'></i></button></a>";
            }
            String actions = buttonStatus
                    + "<a href='/admin/orders/view/order-detail-admin?id=" + order.getOrderId() + "'>"
                    + "<button class='btn btn-info btn-sm'>" +
                    "<i class='fa-solid fa-circle-info'></i></button></a> "+
                     editButton+
                    returnButton;

            json.addProperty("actions", actions);
            jsonList.add(json);
        }


        JsonObject jsonResponse = new JsonObject();
        jsonResponse.add("data", new Gson().toJsonTree(jsonList));
        System.out.println(jsonResponse);
        response.getWriter().write(jsonResponse.toString());

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}