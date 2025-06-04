package com.baya.baya_project.Controller;

import com.baya.baya_project.Model.*;
import com.baya.baya_project.service.VoucherService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;

@WebServlet(name = "Voucher", value = "/voucher")
public class VoucherController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String discountCode = request.getParameter("discountCode");
        String deliveryCode = request.getParameter("deliveryCode");

        VoucherService voucherService = new VoucherService();
        HttpSession session = request.getSession(true);
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        JSONObject jsonResponse = new JSONObject();

        if (discountCode != null && !discountCode.isEmpty()) {
            Voucher discountVoucher = voucherService.searchVoucher(discountCode, cart.totalPriceCartItemInCart());
            if (discountVoucher != null) {
                cart.setDiscount(discountVoucher);
                jsonResponse.put("discount", cart.getDiscount());
            } else {
                cart.setDiscount(0);
                jsonResponse.put("discount", 0);
            }
        }

        if (deliveryCode != null && !deliveryCode.isEmpty()) {
            Voucher deliveryVoucher = voucherService.searchVoucher(deliveryCode, cart.totalPriceCartItemInCart());
            if (deliveryVoucher != null) {
                cart.setDiscountShipping(deliveryVoucher);
                jsonResponse.put("discountShipping", cart.getDiscountShipping());
            } else {
                cart.setDiscountShipping(0);
                jsonResponse.put("discountShipping", 0);
            }
        }

        jsonResponse.put("totalPrice", cart.totalPriceCart());
        jsonResponse.put("status", "Áp dụng voucher thành công");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
    }
}