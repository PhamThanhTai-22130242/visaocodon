package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.NewsDao;
import com.baya.baya_project.Model.*;
import com.baya.baya_project.service.ProductAdminService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Locale;
@WebServlet(name = "AddTest", value = "/AddTest")
public class AddTest extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("pname");
        String price = request.getParameter("pprice");
        String id = request.getParameter("pcode");
        String description = request.getParameter("pdescription");
        String material = request.getParameter("pmaterial");
        String size = request.getParameter("psize");
//        String category = request.getParameter("catefather");
        String subCategory = request.getParameter("catebaby");
        String origin = request.getParameter("porigin");
        String quanlity = request.getParameter("pquanlity");
        String createDate = request.getParameter("pcreatedate");

        System.out.println("Tên sản phẩm: " + id);
        System.out.println("Tên sản phẩm: " + name);


        if(name.isEmpty() ||  id.isEmpty()){
            request.setAttribute("Error", "Vui lòng nhập đầy đủ thông tin.");
            request.getRequestDispatcher("addProductPage.jsp").forward(request,response);
        }else{
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");  // Định dạng ngày giờ không có giây
            LocalDateTime createdDate = LocalDateTime.parse(createDate, formatter);
            int douPrice  = Integer.parseInt(price);
            int quanlityInt  = Integer.parseInt(quanlity);
            Product product = new Product(id, name, douPrice, 1,description, subCategory,quanlityInt, 0, origin, 0,createdDate);
            ProductAdminService.addProductTest(product);
            HttpSession session = request.getSession(true);
            User user = (User) session.getAttribute("auth");
            response.sendRedirect("ListProductAdmin");
        }



    }

}


