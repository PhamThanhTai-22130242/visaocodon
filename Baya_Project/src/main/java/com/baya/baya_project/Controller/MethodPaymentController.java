package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Dao.SpecificationDao;
import com.baya.baya_project.Dao.SubImageDao;
import com.baya.baya_project.Model.*;
import com.baya.baya_project.service.LogService;
import com.baya.baya_project.service.MailService;
import com.baya.baya_project.service.OrderService;
import com.baya.baya_project.service.VoucherService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

@WebServlet(name = "methodPayment", value = "/method-payment")
public class MethodPaymentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);

        String method = request.getParameter("method");
        session.setAttribute("method", method);

        Date date = Date.from(LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant());
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

        session.setAttribute("date", dateFormat.format(date));
        String name = session.getAttribute("name").toString();
        String email = session.getAttribute("email").toString();
        String phone = session.getAttribute("phone").toString();
        String address = session.getAttribute("address")==null ? "abc" :session.getAttribute("address").toString();




        String note = session.getAttribute("note").toString();
        System.out.println(name + " " + email + " " + phone + " " + address );

        User user = (User) session.getAttribute("user");

        LogService logService = new LogService();
        String beforeData= "UserId : "+user.getUserID()+" đang thực hiện mua hàng " ;
        String location ="Mua hàng";
        String afterData="";
        System.out.println(method);

        if ("cod".equalsIgnoreCase(method)) {
            OrderService service = new OrderService();
            Order order =service.insertOrder((User) session.getAttribute("user"), (Cart)session.getAttribute("cart"),name,email,phone,address,note,method);
            afterData = "mua thành công với mã đơn hàng "+order.getOrderId();
            logService.infor(user.getUserID(),location,beforeData,afterData);

            MailService mailService = new MailService();
            mailService.sendMailTo(email, "Thông tin đơn hàng", order);
            response.sendRedirect("inforOrder.jsp");

        } else  {
            response.sendRedirect(request.getContextPath() + "/payment-vnpay");
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String note = request.getParameter("note-content");
        System.out.println(name + " " + email + " " + phone + " " + address + " " + note);

        HttpSession session = request.getSession(true);

        session.setAttribute("name", name);
        session.setAttribute("email", email);
        session.setAttribute("phone", phone);
        session.setAttribute("address", address);
        session.setAttribute("note", note);


        response.sendRedirect("methodPayment.jsp");

    }
}