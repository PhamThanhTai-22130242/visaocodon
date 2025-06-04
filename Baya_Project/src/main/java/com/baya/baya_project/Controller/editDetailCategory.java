package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.CategoryDao;
import com.baya.baya_project.Model.Category;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "editDetailCategory", value = "/editDetailCategory")
public class editDetailCategory extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//        String id = request.getParameter("id");
//        String name = request.getParameter("name");
////        Category category = new Category(id, name);
//        CategoryDao dao = new CategoryDao();
//        String url;
//        String message;
//        if(dao.update(category)>0){
//            message = "Cập nhập thành công";
//
//            url = "/categoryAdmin";
//        }
//        else{
//            message = "Đã xảy ra lỗi";
//
//            url = "/editDetailCategory";
//        }
//        request.setAttribute("message", message);
//        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
//        dispatcher.forward(request, response);
//
//
//    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}