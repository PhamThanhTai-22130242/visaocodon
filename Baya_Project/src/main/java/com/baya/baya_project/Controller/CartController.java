package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Model.Cart;
import com.baya.baya_project.Model.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "cart", value = "/cart")
public class
CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);

        Cart cartOld = (Cart) session.getAttribute("oldCart");
        Cart cart = (Cart) session.getAttribute("cart");

        if(cartOld !=null){
            cart = cartOld;
            session.setAttribute("cart", cart);
        }

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        response.sendRedirect(getServletContext().getContextPath() + "/cart.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}