package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.CategoryDao;
import com.baya.baya_project.Model.Category;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

@WebServlet(name = "AddCategory", value = "/admin/categories/create/addCategory")
@MultipartConfig
public class AddCategory extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain;charset=UTF-8");

        CategoryDao categoryDao = new CategoryDao();

        String categoryID = request.getParameter("categoryID");
        String categoryName = request.getParameter("categoryName");

        if (categoryID == null || categoryID.trim().isEmpty() || categoryName == null || categoryName.trim().isEmpty()) {
            response.getWriter().write("error");
            return;
        }

        Part filePart = request.getPart("categoryThumbnail");
        String thumbnailBase64 = "";

        if (filePart != null && filePart.getSize() > 0) {
            thumbnailBase64 = convertToBase64(filePart);
        }

        Category category = new Category(categoryID, categoryName, thumbnailBase64);

        int result = categoryDao.insert(category);

        if (result > 0) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("error");
        }
    }

    private String convertToBase64(Part part) throws IOException {
        try (InputStream inputStream = part.getInputStream()) {
            byte[] bytes = inputStream.readAllBytes();
            return "data:" + part.getContentType() + ";base64," + Base64.getEncoder().encodeToString(bytes);
        }
    }
}
