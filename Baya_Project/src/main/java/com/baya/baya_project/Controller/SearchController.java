package com.baya.baya_project.Controller;

import com.google.gson.GsonBuilder;


import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Model.Product;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "SearchController", value = "/search")
public class SearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDao productDao = new ProductDao();

        String keyword = request.getParameter("keySearch");
        System.out.println(keyword);

        int idFilter = Integer.parseInt(request.getParameter("f"));

        int page = Integer.parseInt(request.getParameter("pi"));
        System.out.println("so page nhan dc"+page);
        if(page ==0){
            if(keyword.length()>0){
                List<Product> list = productDao.searchP(keyword, 10, 0);

                request.setAttribute("keySearch", keyword);
                request.setAttribute("list", list);

            }
            else{
                request.setAttribute("message", "Vui lòng nhập từ khoá tìm kiếm");
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("productSearch.jsp");
            dispatcher.forward(request, response);
            return;
        }
        else{
            System.out.println(page);
            List<Product> list = productDao.searchP(keyword, idFilter, page);

            System.out.println(list.toString());
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("list",list.toArray());

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonObject.toString());
            System.out.println(jsonObject.toString());





        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}