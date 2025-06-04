package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Dao.SpecificationDao;
import com.baya.baya_project.Dao.SubImageDao;
import com.baya.baya_project.Model.Product;
import com.baya.baya_project.Model.Specification;
import com.baya.baya_project.Model.SubImage;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Detail", value = "/detailProduct")
public class Detail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProduct = request.getParameter("id");

        ProductDao productDao = new ProductDao();


        String url;
        if (productDao.findByID(idProduct)) {
            SpecificationDao specificationDao = new SpecificationDao();
            Specification specification = specificationDao.selectById(idProduct);

            request.setAttribute("specification", specification);
            SubImageDao subImageDao = new SubImageDao();

            Product product = productDao.selectByID(idProduct);
            List<SubImage> listImg = subImageDao.selectByProductID(idProduct);
            request.setAttribute("listImg", listImg);
            request.setAttribute("product", product);
            url = "productDetail.jsp";
            request.setAttribute("product", product);

        } else {
            url = "error-404.jsp";
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}