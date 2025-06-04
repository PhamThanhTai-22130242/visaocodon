package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.CategoryDao;
import com.baya.baya_project.Model.Category;
import com.baya.baya_project.Model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "categoryAdmin", value = "/admin/categories/view")
public class categoryAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("da vao controller");
        CategoryDao categoryDao = new CategoryDao();
        List<Category> list = categoryDao.selectAll();
        request.setAttribute("list", list);
        request.getRequestDispatcher("/category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        doGet(request, response);
    }
}