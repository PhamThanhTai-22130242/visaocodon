package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.CategoryDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "RemoveCate", value = "/admin/categories/delete/removeCate")
public class RemoveCate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String message = null;

        if ("delete".equals(action)) {
            String id = request.getParameter("id");

            if (id != null && !id.trim().isEmpty()) {
                try {
                    CategoryDao categoryDao = new CategoryDao();
                    int result = categoryDao.delete(id);

                    if (result > 0) {
                        message = "Xóa danh mục thành công.";
                    } else {
                        message = "Không tìm thấy danh mục để xóa.";
                    }
                } catch (Exception e) {
                    message = "Đã xảy ra lỗi khi xóa: " + e.getMessage();
                    e.printStackTrace();
                }
            } else {
                message = "ID không được để trống.";
            }
        }

        request.setAttribute("message", message);
    }
}