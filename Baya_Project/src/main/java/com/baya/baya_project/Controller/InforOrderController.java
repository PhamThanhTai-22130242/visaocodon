package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Dao.SpecificationDao;
import com.baya.baya_project.Dao.SubImageDao;
import com.baya.baya_project.Model.*;
import com.baya.baya_project.service.MailService;
import com.baya.baya_project.service.OrderService;
import com.baya.baya_project.service.VoucherService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

@WebServlet(name = "InforOrder", value = "/infor-order")
public class InforOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        session.removeAttribute("method");
        session.removeAttribute("date");
        session.removeAttribute("phone");
        session.removeAttribute("address");
        session.removeAttribute("note");
        session.removeAttribute("name");
        session.removeAttribute("email");
        Cart cart = (Cart) session.getAttribute("oldCart");

        if(cart!=null) {
            session.setAttribute("cart",cart);
            session.removeAttribute("oldCart");
        }else{
            Cart cartNew= (Cart) session.getAttribute("cart");
            cartNew.removeItemIsChoose();
            session.setAttribute("cart",cartNew);
        }



        response.sendRedirect("home");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}