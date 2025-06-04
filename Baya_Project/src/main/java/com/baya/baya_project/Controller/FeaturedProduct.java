package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Model.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "FeaturedProduct", value = "/FeaturedProduct")
public class FeaturedProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDao productDao = new ProductDao();

        int featured = Integer.parseInt(request.getParameter("featured")) ;
        int filter = Integer.parseInt(request.getParameter("f"));
        int page = Integer.parseInt(request.getParameter("pi"));
         ProductDao dao = new ProductDao();
      
        if(page ==0){
            List<Product> list = null;
            if(featured ==1){
                //loc theo flash sale
                list =dao.featuredFlashSales(filter, page);
                
            }
            else if(featured ==2){
                //loc theo ban chay
                list = dao.featuredTopSells(filter, page);

                
            }
            else if(featured == 3){
                //loc theo full combo

            }

            request.setAttribute("list", list);

            RequestDispatcher dispatcher = request.getRequestDispatcher("productSearch.jsp");
            dispatcher.forward(request, response);
        }
      else{
          
        }




        System.out.println("so page nhan dc"+page);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}