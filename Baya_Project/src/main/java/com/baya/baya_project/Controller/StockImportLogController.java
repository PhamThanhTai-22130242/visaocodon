package com.baya.baya_project.Controller;

import com.baya.baya_project.Model.Product;
import com.baya.baya_project.service.ProductAdminService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/stockImportLogs")
public class StockImportLogController extends HttpServlet {
    private final ProductAdminService productAdminService = new ProductAdminService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Product> logs = productAdminService.getVisibleStockImportLogs();

            if (logs == null || logs.isEmpty()) {
                request.setAttribute("errorMessage", "Không có dữ liệu nhập kho.");
            } else {
                request.setAttribute("logList", logs);
            }

            // Forward sang JSP để hiển thị
            request.getRequestDispatcher("Dashboardadmin.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            // Nếu lỗi server, gửi thông báo lỗi sang JSP
            request.setAttribute("errorMessage", "Lỗi server.");
            request.getRequestDispatcher("Dashboardadmin.jsp").forward(request, response);
        }
    }
}
