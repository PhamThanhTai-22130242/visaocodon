package com.baya.baya_project.Controller;

import com.baya.baya_project.Model.*;
import com.baya.baya_project.service.VoucherService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "InforPayment", value = "/infor-payment")
public class InforPaymentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }


        VoucherService voucherService = new VoucherService();

        HttpSession session = request.getSession(true);
        Cart cart = (Cart) session.getAttribute("cart");


        List<Voucher> vouchers =  voucherService.getVoucherTop3BestByCondition(cart.totalPriceCartItemInCart(),"discount");

        List<Voucher> voucher_delivery =  voucherService.getVoucherTop3BestByCondition(cart.totalPriceCartItemInCart(),"delivery");

        vouchers.addAll(voucher_delivery);
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        request.setAttribute("vouchers",vouchers);
        request.getRequestDispatcher("inforPayment.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}