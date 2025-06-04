package com.baya.baya_project.Controller;



import com.baya.baya_project.Handle.MoMoService;
import com.baya.baya_project.Model.Cart;
import com.baya.baya_project.Model.MomoUtils;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "Momo", value = "/momo")
public class MomoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        Cart cart  = (Cart) request.getSession().getAttribute("cart");


        if(cart == null){
            cart = new Cart();
        }


        MoMoService paymentService = new MoMoService();
        String payUrl = paymentService.createPayment(String.valueOf(cart.totalPriceCart()),
                MomoUtils.REDIRECT_URL, MomoUtils.IPN_URL);
        response.sendRedirect(payUrl);

    }
}

