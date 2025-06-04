package com.baya.baya_project.Controller;

import com.baya.baya_project.Model.Product;
import com.baya.baya_project.service.ProductAdminService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/productSearchCategory")
public class ProductSearchServlet extends HttpServlet {
    private final ProductAdminService productAdminService = new ProductAdminService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String subcategoryID = request.getParameter("subcategoryID");

        List<Product> productList = null;
        String subcategoryName = "";
        if (subcategoryID != null && !subcategoryID.isEmpty()) {
            productList = productAdminService.getProductsBySubcategory(subcategoryID);
            subcategoryName = productAdminService.getSubcategoryNameById(subcategoryID);

        }

        // Gửi danh sách sản phẩm
        request.setAttribute("products", productList);
        request.setAttribute("subcategoryName", subcategoryName);

        // Nếu không có sản phẩm -> gửi thông báo
        if (productList == null || productList.isEmpty()) {
            request.setAttribute("message", "Không có sản phẩm nào thuộc danh mục này.");
        }

        // Điều hướng về trang hiển thị
        request.getRequestDispatcher("productSearchCategory.jsp").forward(request, response);
    }
}
