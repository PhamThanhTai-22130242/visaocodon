package com.baya.baya_project.Controller;


import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Model.Cart;
import com.baya.baya_project.Model.Order;
import com.baya.baya_project.Model.Product;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.service.LogService;
import com.baya.baya_project.service.MailService;
import com.baya.baya_project.service.OrderService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

@WebServlet(name = "StatusPayment", value = "/status-payment")
public class StatusPaymentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String status = request.getParameter("vnp_TransactionStatus");

        HttpSession session = request.getSession(true);
        Date date = Date.from(LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant());
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        session.setAttribute("date", dateFormat.format(date));
        String name = session.getAttribute("name").toString();
        String email = session.getAttribute("email").toString();
        String phone = session.getAttribute("phone").toString();
        String address = session.getAttribute("address")==null ? "Đại học Nông Lâm " : session.getAttribute("address").toString();
        User user = (User) session.getAttribute("user");

        String note = session.getAttribute("note").toString();

        System.out.println(name + " " + email + " " + phone + " " + address + " " + note);

        LogService logService = new LogService();
        String beforeData= "UserId : "+user.getUserID()+" đang thực hiện mua hàng " ;
        String location ="Mua hàng";
        String afterData="";



        if(status.equalsIgnoreCase("00")){

        OrderService service = new OrderService();
        Order order =service.insertOrder((User) session.getAttribute("user"), (Cart)session.getAttribute("cart"),name,email,phone,address,note,"vnpay");
        response.sendRedirect("inforOrder.jsp");
            afterData = "mua thành công với mã đơn hàng "+order.getOrderId();
        MailService mailService = new MailService();
        mailService.sendMailTo(email, "Thông tin đơn hàng", order);

    }else{
            afterData = "mua hàng thất bại do thanh toán";

            response.sendRedirect("error-404.jsp");
        }

        logService.infor(user.getUserID(),location,beforeData,afterData);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}