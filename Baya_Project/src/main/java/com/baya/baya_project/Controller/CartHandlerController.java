package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Model.Cart;
import com.baya.baya_project.Model.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;

@WebServlet(name = "/cart-handler", value = "/cart-handler")
public class CartHandlerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String id = request.getParameter("productId");
        int quatity = Integer.parseInt(request.getParameter("quatity") == null ? "0" : request.getParameter("quatity"));
        System.out.println("action: " + action);
        System.out.println("id: " + id);


        ProductDao productDao = new ProductDao();
        Product p = productDao.selectByID(id);

        HttpSession session = request.getSession();


        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
        }


        JSONObject jsonResponse = new JSONObject();

        boolean check = true;
        if (p != null) {
            String mess = "";
            System.out.println(0);

            switch (action) {
                case "add":
                    cart.addCartItem(p, quatity);
                    mess = "Thêm sản phẩm vào giỏ hàng thành công ";
                    break;
                case "delete":
                    cart.removeCartItem(id);
                    mess = "Xóa sản phẩm  giỏ hàng thành công ";
                    jsonResponse.put("sizeCart", cart.cartSize());
                    break;
                case "change":
                    int quantityStock = productDao.selectByID(p.getProductID()).getQuantity();
                    check  = cart.updateQuantity(id, quatity,quantityStock);
                    if(!check) {
                        check = false;
                        mess = "Sản phẩm trong kho chỉ còn "+quantityStock;
                    }else{
                        check = true;
                        mess = "Cập nhật số lượng sản phẩm trong giỏ hàng thành công ";
                        jsonResponse.put("totalPriceCartItem", cart.getCarts().get(id).totalPriceCartItem());
                    }
                    jsonResponse.put("check", check);

                    break;

                case "choose":
                    boolean choose  = Boolean.parseBoolean(request.getParameter("isChoose"));
                    check = cart.setChooseItem(id,choose,p.getQuantity());
                    mess = "Cập nhật trạng thái chọn đơn hàng thành công";
                    jsonResponse.put("check", check);
                    break;


            }



            jsonResponse.put("message", mess);
            System.out.println(mess);
            jsonResponse.put("totalPriceCart", cart.totalPriceCartItemInCart());

            System.out.println(jsonResponse.toString());
            session.setAttribute("cart", cart);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponse.toString());

        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "IdProduct không hợp lệ");
        }
    }


}