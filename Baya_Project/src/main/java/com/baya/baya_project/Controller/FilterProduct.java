package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Model.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FilterProduct", value = "/filterProduct")
public class FilterProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("da chay vao servlet");
        // fetch('/search?keySearch=' + keySearch +'&o=0&p=1&f='+ id +'&pr=' +numberProduct, {

        String keySearch = request.getParameter("keySearch");
        System.out.println("keySearch: " + keySearch);
        int filter =Integer.parseInt(request.getParameter("f")) ;
        int p = Integer.parseInt(request.getParameter("p"));
        int o = Integer.parseInt(request.getParameter("o"));

        int prod =Integer.parseInt(request.getParameter("pr")) ;
        System.out.println("filter: " + filter+p+o+prod);
        System.out.println(keySearch+ ":" + ":" + filter + ":" + prod);
        ProductDao dao = new ProductDao();
       List<Product> list = new ArrayList<Product>();

        System.out.println(list.toString());
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list",list.toArray());

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonObject.toString());
        System.out.println(jsonObject.toString());

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}