package com.baya.baya_project.Controller;

import com.baya.baya_project.Model.User;
import com.baya.baya_project.Model.UserPrincipal;
import com.google.gson.Gson;
import com.baya.baya_project.Model.ProductExcel;
import com.baya.baya_project.service.*;
import com.google.gson.JsonObject;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;


@WebServlet("/AddProductServlet")
public class AddProductAdminServlet extends HttpServlet {
    LogService logService = new LogService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        UserPrincipal admin = (UserPrincipal) session.getAttribute("user");
        try {
            req.setCharacterEncoding("UTF-8");
            resp.setContentType("application/json;charset=UTF-8");

            BufferedReader reader = req.getReader();
            Gson gson = new Gson();
            ProductExcel product = gson.fromJson(reader, ProductExcel.class);

            ProductAdminService service = new ProductAdminService();
            boolean success = service.insertFullProduct(product);

            if (success) {
                resp.setStatus(HttpServletResponse.SC_OK);
                JsonObject json = new JsonObject();
                json.addProperty("message", "Thêm sản phẩm thành công.");
                logService.infor(
                        admin.getUser().getUserID(),
                        "Thêm Sản phẩm",
                        "Mã sản phẩm: " + product.getCode() + " chưa có trong cơ sở dữ liệu.",
                        "Mã sản phẩm: " + product.getCode() + " đã được thêm thành công.");
                resp.getWriter().write(json.toString());
            } else {
                resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                resp.getWriter().write("{\"error\": \"Không thể thêm sản phẩm.\"}");
            }

        } catch (IllegalStateException e) {
            // Mã đã tồn tại
            resp.setStatus(HttpServletResponse.SC_CONFLICT); // 409
            resp.getWriter().write("{\"error\": \"Mã sản phẩm đã tồn tại trong hệ thống.\"}");
        } catch (Exception e) {
            e.printStackTrace();
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("{\"error\": \"Lỗi không xác định.\"}");
        }
    }
}
