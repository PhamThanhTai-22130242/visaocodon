package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Model.Cart;
import com.baya.baya_project.Model.Product;
import com.baya.baya_project.Model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "RePurchase", value = "/repruchase")
public class RePurchaseController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("user");
        if(user==null){
            response.sendRedirect("login");
            return;
        }
        Cart cart = (Cart) session.getAttribute("cart");
        String id = request.getParameter("orderId");


        if (cart == null) {
            cart = new Cart();
        }

        ProductDao dao = new ProductDao();
        List<Product> products = dao.getListProductByOrder(Integer.parseInt(id));

        session.setAttribute("oldCart", cart);

        Cart buyNowCart = new Cart();
        for (Product product : products) {
            buyNowCart.addCartItemIsChoose(product,1);
        }
        session.setAttribute("cart", buyNowCart);
        response.sendRedirect(getServletContext().getContextPath() + "/infor-payment");
    }


}