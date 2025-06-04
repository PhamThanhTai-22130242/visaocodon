package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SortProduct", value = "/sort")
public class SortProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keySearch = request.getParameter("keySearch");
        int numberProduct =Integer.parseInt(request.getParameter("numb"));
        int filer = Integer.parseInt(request.getParameter("f"));
        ProductDao productDao = new ProductDao();




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}