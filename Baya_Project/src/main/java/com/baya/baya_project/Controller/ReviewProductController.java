package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Model.*;
import com.baya.baya_project.service.OrderService;
import com.baya.baya_project.service.ReviewProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ReviewProduct", value = "/review-product")
public class ReviewProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProdct = request.getParameter("id");
        ReviewProductService service = new ReviewProductService();
        ProductDao dao = new ProductDao();
        Product p =dao.selectById(idProdct);
        List<ReviewProduct> list = service.getReviewProductByProductId(idProdct);
        double avg = service.averageRating(list);
        request.setAttribute("list", list);
        request.setAttribute("avg", avg);
        request.setAttribute("productID", idProdct);
        request.setAttribute("nameProduct",p.getName());
        request.setAttribute("quantitySell",p.getQuanlitySell());
        System.out.println(idProdct);


        request.getRequestDispatcher("reviewProduct.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession(true).getAttribute("user");

        if(user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

    }


}