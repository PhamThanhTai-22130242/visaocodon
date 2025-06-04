package com.baya.baya_project.service;

import com.baya.baya_project.Dao.OrderDao;
import com.baya.baya_project.Model.Cart;
import com.baya.baya_project.Model.Order;
import com.baya.baya_project.Model.OrderDetail;
import com.baya.baya_project.Model.User;

import java.text.SimpleDateFormat;
import java.time.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderService {
    OrderDao orderDao;

    public OrderService(){
        orderDao = new OrderDao();
    }

    public Order insertOrder(User user, Cart cart, String name, String email, String phone, String address, String note, String method) {
        Order order = new Order();
        order.setUserId(user.getUserID());
        order.setFullname(name);
        order.setEmail(email);
        order.setPhoneNumber(Integer.valueOf(phone));
        order.setAddress(address);
        order.setNote(note);
        Date date = Date.from(LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant());
        order.setCreateAt(date);
        order.setOrderStatusID(1);
        order.setOrderStatusName("Đang xử lí");
        order.setPaymentName(method);
        int idPayment=0;
        if(method.equalsIgnoreCase("cod")){
            idPayment = 1;
        }else if(method.equalsIgnoreCase("vnpay")){
            idPayment = 2;

        }else{
            idPayment = 3;

        }
        order.setPaymentID(idPayment);


        order.setDeliveredDate(null);
        order.setTotalPrice(cart.totalPriceCartItemInCart());
        order.setFee(cart.getFee());
        order.setDiscount(cart.getDiscount());
        List<OrderDetail> details = new ArrayList<>();

        cart.itemCartIsChooseIncart().forEach(item ->{
            details.add(new OrderDetail(0,item.getProductId(),item.getName(), item.getPrice(), item.getDiscountDefault(), item.getThumbnail(), item.getQuantity(),item.totalPriceCartItem()));
                });
        order.setItems(details);
        int rs = orderDao.insert(order);
        order.setOrderId(rs);
        return order;
    }

    public List<Order> getOrderByUserID(int userID) {
        return orderDao.selectByUserId(userID);
    }

    public Order getOrderByID(int orderID) {
        return orderDao.selectById(orderID);
    }

    public List<OrderDetail> getAllOrderDetailsByUser(int userID) {
        List<Order> orderList = getOrderByUserID(userID);
        List<OrderDetail> allOrderDetails = new ArrayList<>();

        for (Order order : orderList) {
            allOrderDetails.addAll(order.getItems());
        }

        return allOrderDetails;
    }



    public int removeOrderById(String id) {
        return orderDao.delete(id);
    }

    public List<Order> getOrderByFilter(int userID, String status,String date,int methodPaymentID) {

        System.out.println(userID);
        System.out.println(status);
        System.out.println(date);
        System.out.println(methodPaymentID);
        int statusID = 0;

        if(status.equals("Đang xử lí")){
            statusID = 1;
        }else if(status.equals("Đang vận chuyển")){
            statusID = 2;
        }else if(status.equalsIgnoreCase("Hoàn Thành")){
            statusID = 3;
        }else if(status.equalsIgnoreCase("Đã hủy")){
            statusID = 4;
        }else if(status.equalsIgnoreCase("Hoàn trả")){
            statusID = 5;
        }

        Date startDate = null,endDate = null;


        if(!date.isEmpty()){
               SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
               switch (date){
                   case "today" :
                       startDate = java.sql.Date.valueOf(LocalDate.now());
                       endDate = java.sql.Date.valueOf(LocalDate.now());
                       break;
                   case "month":
                       LocalDate today = LocalDate.now();
                       startDate = java.sql.Date.valueOf(today.withDayOfMonth(1));
                       endDate = java.sql.Date.valueOf(today.withDayOfMonth(today.lengthOfMonth()));
                       break;

                   case "year":
                       int currentYear = LocalDate.now().getYear();
                       startDate = java.sql.Date.valueOf(LocalDate.of(currentYear, 1, 1));
                       endDate = java.sql.Date.valueOf(LocalDate.of(currentYear, 12, 31));
                       break;
               }
           }






        if(!status.equalsIgnoreCase("all")){
            if (methodPaymentID > 0 && !date.isEmpty()) {
                return orderDao.selectByStatusDateAndMethodPayment(userID, statusID, startDate, endDate, methodPaymentID);
            } else if (methodPaymentID > 0) {
                return orderDao.selectByStatusAndMethodPayment(userID, statusID, methodPaymentID);
            } else if (!date.isEmpty()) {
                return orderDao.selectByStatusAndDate(userID, statusID, startDate, endDate);
            }
        }else{
            if (methodPaymentID > 0 && !date.isEmpty()) {
                return orderDao.selectByStatusDateAndMethodPayment(userID, null, startDate, endDate, methodPaymentID);
            } else if (methodPaymentID > 0) {
                return orderDao.selectByStatusAndMethodPayment(userID, null, methodPaymentID);
            } else if (!date.isEmpty()) {
                return orderDao.selectByStatusAndDate(userID, null, startDate, endDate);
            }
        }


        return orderDao.selectByStatus(userID,statusID);
    }


    public List<Order> getAllOrder() {
        return orderDao.selectAll();
    }


    public boolean setStatusOrder(int id, int idStatus) {
        if(idStatus<3)   idStatus++;
        return orderDao.setStatusOrder(id,idStatus);
    }


    public int updateOrder(Order order) {
        return orderDao.update(order);
    }

    public static void main(String[] args) {
        System.out.println(new OrderService().getOrderByFilter(11,"Hoàn thành","",1).get(0).getItems().size());
    }
}
