package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.NewsDao;
import com.baya.baya_project.Model.*;
import com.baya.baya_project.service.ProductAdminService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@MultipartConfig
@WebServlet(name = "AddProduct", value = "/AddProduct")
public class AddProductAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String name = request.getParameter("pname");
        String id = request.getParameter("pcode");
        String description = request.getParameter("pdescription");
        String material = request.getParameter("pmaterial");
        String size = request.getParameter("psize");
        String tieuchuan = request.getParameter("ptieuchuan");
        String category = request.getParameter("catefather");
        String subCategory = request.getParameter("catebaby");
        String origin = request.getParameter("porigin");
        String quanlity = request.getParameter("pquanlity");
        String price = request.getParameter("pprice");

        if(name.isEmpty() || price.isEmpty()|| id.isEmpty()){
            request.setAttribute("Error", "Vui lòng nhập đầy đủ thông tin.");
            request.getRequestDispatcher("addProductPage.jsp").forward(request,response);
            return;
        }

        LocalDateTime createAuto = LocalDateTime.now();
        int douPrice  = Integer.parseInt(price);
        int quanlityInt  = Integer.parseInt(quanlity);

        List<SubImage> subImageList = new ArrayList<>();

        for (Part part : request.getParts()) {
            if (part.getName().equalsIgnoreCase("upload") && part.getSize() > 0) {
                InputStream inputStream = part.getInputStream();
                byte[] bytes = inputStream.readAllBytes();
                String base64Image = Base64.getEncoder().encodeToString(bytes);
                String base64WithPrefix = "data:" + part.getContentType() + ";base64," + base64Image;

                subImageList.add(new SubImage(null, base64WithPrefix, createAuto, id));
            }
        }

        String thumbnailImage = (subImageList.isEmpty()) ? "Khong có ảnh" : subImageList.get(0).getImage();

        ProductListImg productListImg = new ProductListImg(
                id, name, douPrice, description,
                category,
                quanlityInt,
                0, thumbnailImage,
                createAuto, subImageList,
                new Specification(id, size, material, origin, tieuchuan)
        );

        ProductAdminService.addProduct(productListImg);

        response.sendRedirect("ListProductAdmin?success=true");
    }

}

