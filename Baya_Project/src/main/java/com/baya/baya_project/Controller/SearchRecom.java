package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Model.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchRecom", value = "/searchRecom")
public class SearchRecom extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        ProductDao productDao = new ProductDao();
        List<String> listKeyword = productDao.searchRecom(keyword);
        System.out.println("du lieu tra ve"+listKeyword.toString());
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list",listKeyword.toArray());

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonObject.toString());
        System.out.println("da chuyen qua "+jsonObject.toString());

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}