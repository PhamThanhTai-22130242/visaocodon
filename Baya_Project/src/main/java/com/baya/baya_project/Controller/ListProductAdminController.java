package com.baya.baya_project.Controller;

import com.baya.baya_project.Model.ProductAdminCateDTO;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.Model.UserPrincipal;
import com.baya.baya_project.service.ProductAdminService;
import com.baya.baya_project.service.LogService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@WebServlet(name = "ListProductAdmin", value = "/ListProductAdmin")
public class ListProductAdminController extends HttpServlet {
    private LogService logService = new LogService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        UserPrincipal admin = (session != null) ? (UserPrincipal) session.getAttribute("user") : null;
        if (admin == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        ProductAdminService service = new ProductAdminService();
        String searchQuery = request.getParameter("search");

        List<ProductAdminCateDTO> ListProducts;
        int totalProducts;

        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            ListProducts = service.searchProductsByName(searchQuery.trim());
            totalProducts = ListProducts.size();
        } else {
            ListProducts = service.selectTableListProducts();
            totalProducts = service.getTotalProduct();
        }

        request.setAttribute("searchQuery", searchQuery);

        // Sort
        String sort = request.getParameter("sortValue");
        if (sort != null) {
            switch (sort) {
                case "Theo Tên":
                    ListProducts.sort(Comparator.comparing(o -> o.getProduct().getName()));
                    break;
                case "Theo Danh Mục":
                    ListProducts.sort(Comparator.comparing(o -> o.getCategory().getName()));
                    break;
                case "Giá Từ Cao Đến Thấp":
                    ListProducts.sort((o1, o2) -> Integer.compare(o2.getProduct().getPrice(), o1.getProduct().getPrice()));
                    break;
                case "Giá Từ Thấp Đến Cao":
                    ListProducts.sort((o1, o2) -> Integer.compare(o1.getProduct().getPrice(), o2.getProduct().getPrice()));
                    break;
            }
        }
        // Pagination
        String numberPage = request.getParameter("page");
        int numberPageInt = (numberPage == null || numberPage.equals("0")) ? 1 : Integer.parseInt(numberPage);
        int totalPages = (int) Math.ceil((double) totalProducts / 15);
        if (numberPageInt > totalPages) numberPageInt = totalPages;

        if (numberPageInt < 1) numberPageInt = 1;

        List<ProductAdminCateDTO> listProductsPage = ProductAdminService.getPaginationPageOwn(numberPageInt, ListProducts);

        request.setAttribute("numberPage", numberPageInt);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("listProductsPage", listProductsPage);
        request.setAttribute("totalProducts", totalProducts);

        request.getRequestDispatcher("productsPage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductAdminService productAdminService = new ProductAdminService();
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            try {
                String id = request.getParameter("id");
                productAdminService.deleteProduct(id);

                int userID = (int) request.getSession().getAttribute("userID");
                logService.infor(userID, "Xóa sản phẩm", "Product ID: " + id, "Đã xóa sản phẩm với ID: " + id);

                request.setAttribute("message", "Xóa sản phẩm thành công.");
            } catch (Exception e) {
                int userID = (int) request.getSession().getAttribute("userID");
                logService.warning(userID, "Lỗi khi xóa sản phẩm", "", "Lỗi: " + e.getMessage());

                request.setAttribute("message", "Đã xảy ra lỗi khi xóa sản phẩm: " + e.getMessage());
            }
        }

        response.sendRedirect(request.getContextPath() + "/ListProductAdmin");
    }
}