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

@WebServlet(name = "FilterProducts", value = "/filterProducts")
public class FilterProducts extends HttpServlet {
    private List<Product> listProducts = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("da chay voao filter");
        String keySearch = request.getParameter("keySearch");
        System.out.println("keySearch: " + keySearch);
        int more = Integer.parseInt(request.getParameter("m"));
        int filter = Integer.parseInt(request.getParameter("f"));
        int p = Integer.parseInt(request.getParameter("p"));
        int o = Integer.parseInt(request.getParameter("o"));
        int prod = Integer.parseInt(request.getParameter("pr"));
        System.out.println("filter: " + filter + p + o + prod);
        System.out.println(keySearch + ":" + ":" + filter + ":" + prod);
        ProductDao dao = new ProductDao();


        List<Product> list = new ArrayList<>();

        list.clear();
        if (prod == 0 && filter == 0) {
            if (keySearch.length() != 0) {
                listProducts.removeAll(listProducts);

                listProducts.addAll(dao.loadProd(keySearch, prod));
                list.addAll(listProducts);
                request.setAttribute("keySearch", keySearch);
                request.setAttribute("list", list);
            } else {
                request.setAttribute("message", "Vui lòng nhập từ khoá tìm kiếm");
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("productSearch.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if(more ==1){
            int index = listProducts.size()/20;
            listProducts.addAll(dao.loadProd(keySearch, index));


        }


//        listProducts.addAll(dao.loadProd(keySearch, prod));
//        list.clear();
        list.addAll(listProducts);
        dao.sortProd(list, filter);
        dao.sortPrice(list, p);
        System.out.println(list.toString());
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list", list.toArray());



        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonObject.toString());
        System.out.println(jsonObject.toString());


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}