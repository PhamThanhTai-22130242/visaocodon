package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.CategoryDao;
import com.baya.baya_project.Dao.NewsDao;
import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Dao.SubCategoryDao;
import com.baya.baya_project.Model.Category;
import com.baya.baya_project.Model.News;
import com.baya.baya_project.Model.Product;
import com.baya.baya_project.Model.SubCategory;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("")
public class Home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ProductDao productDao = new ProductDao();
        SubCategoryDao subCategoryDao = new SubCategoryDao();
        CategoryDao categoryDao = new CategoryDao();
        List<Product> listCombo = productDao.listTopComboProd();

        request.setAttribute("listCombo", listCombo);

        NewsDao newsDao = new NewsDao();
        List<News> newsList = newsDao.selectTop4();
        request.setAttribute("newsList", newsList);

        List<Product> listProductSale = productDao.selectTopLastDate();
        List<Category> categoryList = categoryDao.selectAll();
        HttpSession session = request.getSession();
        request.setAttribute("listProductSale", listProductSale);
//        session.setAttribute("subCategoryList", subCategoryList);
        List<Product> productSell = productDao.topProductSell();
        request.setAttribute("topProductSell", productSell);
        session.setAttribute("categoryList", categoryList);


        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}