package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.CategoryDao;
import com.baya.baya_project.Model.Category;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.service.LogService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

@WebServlet(name = "EditCategory", value = "/admin/categories/update/editCategory")
@MultipartConfig
public class EditCategory extends HttpServlet {

    private final LogService logService = new LogService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        CategoryDao categoryDao = new CategoryDao();

        if (id == null || !categoryDao.checkID(id)) {
            response.sendRedirect("error-404.jsp");
            return;
        }

        Category category = categoryDao.selectById(id);
        request.setAttribute("category", category);

        RequestDispatcher rd = request.getRequestDispatcher("editDetailCategory.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String categoryID = request.getParameter("categoryID");
        String categoryName = request.getParameter("categoryName");

        if (categoryID == null || categoryName == null || categoryName.trim().isEmpty()) {
            response.getWriter().write("error");
            return;
        }

        CategoryDao categoryDao = new CategoryDao();
        Category oldCategory = categoryDao.selectById(categoryID);
        if (oldCategory == null) {
            response.getWriter().write("error");
            return;
        }

        Part filePart = request.getPart("thumail");
        String thumbnailBase64;

        if (filePart != null && filePart.getSize() > 0) {
            thumbnailBase64 = convertToBase64(filePart);
        } else {
            thumbnailBase64 = oldCategory.getThumbnail();
        }

        HttpSession session = request.getSession();
        User admin = (User) session.getAttribute("user");

        Category newCategory = new Category(categoryID, categoryName, thumbnailBase64);
        int result = categoryDao.update(newCategory);

        if (result > 0) {
            String changes = getChanges(oldCategory, newCategory);
            logService.infor(
                    14,
                    "Trang quản lí danh mục",
                    "Cập nhật danh mục ID: " + categoryID,
                    changes
            );
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

    private String getChanges(Category oldCategory, Category newCategory) {
        StringBuilder changes = new StringBuilder();

        if (!equals(oldCategory.getName(), newCategory.getName())) {
            changes.append("Tên danh mục: ")
                    .append(oldCategory.getName())
                    .append(" -> ")
                    .append(newCategory.getName())
                    .append("; ");
        }

        return changes.length() > 0 ? changes.toString() : "Không có gì thay đổi.";
    }

    private boolean equals(String a, String b) {
        return (a == null && b == null) || (a != null && a.equals(b));
    }
}
