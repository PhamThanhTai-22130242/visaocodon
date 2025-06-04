package com.baya.baya_project.ViewAdmin;
import com.baya.baya_project.Model.ProductAdminCateDTO;
import com.baya.baya_project.Model.UserPrincipal;
import com.baya.baya_project.service.ProductAdminService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.Comparator;
import java.util.List;

@WebServlet(name = "Product", value = "/admin/products/view")
public class Product extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        UserPrincipal admin = (session != null) ? (UserPrincipal) session.getAttribute("user") : null;
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
        RequestDispatcher rd = request.getRequestDispatcher("/productsPage.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}