package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductAdminDao;
import com.baya.baya_project.Model.*;
import com.baya.baya_project.service.ProductAdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@MultipartConfig
@WebServlet(name = "EditProduct", value = "/EditProduct")
public class EditProductAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Hàm tiện ích chuyển ảnh sang chuỗi base64
    private String convertToBase64(Part part) throws IOException {
        try (InputStream inputStream = part.getInputStream()) {
            byte[] bytes = inputStream.readAllBytes();
            return "data:" + part.getContentType() + ";base64," + Base64.getEncoder().encodeToString(bytes);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("id");
        Product product = ProductAdminDao.findProductById(productId);
        Specification specification = ProductAdminDao.findSpecificationBy(productId);
        List<SubImage> subImageList = ProductAdminDao.findListImgProductID(productId);

        if (product == null || specification == null || subImageList == null) {
            request.setAttribute("Error", "Lỗi không có dữ liệu");
            request.getRequestDispatcher("editProductPage.jsp").forward(request, response);
            return;
        }

        request.setAttribute("product", product);
        request.setAttribute("specification", specification);
        request.setAttribute("subImageList", subImageList);
        request.getRequestDispatcher("editProductPage.jsp").forward(request, response);
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
        String origin = request.getParameter("porigin");
        String quanlity = request.getParameter("pquanlity");
        String price = request.getParameter("pprice");
        String createDate = request.getParameter("pcreatedate");

        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("Error", "Tên sản phẩm không được để trống.");
            request.getRequestDispatcher("editProductPage.jsp").forward(request, response);
            return;
        }

        if (category == null) {
            request.setAttribute("Error", "Sản phẩm này chưa có danh mục");
            request.getRequestDispatcher("editProductPage.jsp").forward(request, response);
            return;
        }

        if (name.isEmpty() || id == null || id.isEmpty() || price == null || price.isEmpty()) {
            request.setAttribute("Error", "Vui lòng nhập đầy đủ thông tin.");
            request.getRequestDispatcher("editProductPage.jsp").forward(request, response);
            return;
        }

        String dateTimeStr = createDate + "T00:00:00";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
        LocalDateTime createAt = LocalDateTime.now();

        int douPrice = Integer.parseInt(price);
        int quanlityInt = Integer.parseInt(quanlity);

        List<SubImage> subImageList = new ArrayList<>();

        for (Part part : request.getParts()) {
            if (part.getName().equalsIgnoreCase("upload") && part.getSize() > 0) {
                String base64Image = convertToBase64(part);
                subImageList.add(new SubImage(null, base64Image, createAt, id));
            }
        }

        // Ảnh đầu tiên làm thumbnail, nếu không có ảnh thì để chuỗi rỗng
        String thumbnailImage = subImageList.isEmpty() ? "" : subImageList.get(0).getImage();

        ProductListImg productListImg = new ProductListImg(
                id, name, douPrice, description,
                category,
                quanlityInt,
                0, thumbnailImage,
                createAt, subImageList,
                new Specification(id, size, material, origin, tieuchuan)
        );

        ProductAdminService.updateProduct(productListImg);

        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");

        response.sendRedirect("ListProductAdmin?success=1");
    }
}
