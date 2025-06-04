package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ReturnRequestOrderDao;
import com.baya.baya_project.Model.ReturnRequestOrder;
import com.baya.baya_project.Model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.Base64;

@MultipartConfig
@WebServlet(name = "ReturnRequestOrder2", value = "/return_request_order")
public class ReturnRequestOrderController extends HttpServlet {

    private String convertToBase64(Part part) throws IOException {
        try (InputStream inputStream = part.getInputStream()) {
            byte[] bytes = inputStream.readAllBytes();
            return "data:" + part.getContentType() + ";base64," + Base64.getEncoder().encodeToString(bytes);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderID = request.getParameter("orderID");
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        request.setAttribute("orderID", orderID);
        request.getRequestDispatcher("return_request_order.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String reason = request.getParameter("reason");
        String orderID = request.getParameter("orderID");
        Part imagePart = request.getPart("image");

        String base64Image = convertToBase64(imagePart);

        ReturnRequestOrder requestOrder = new ReturnRequestOrder(
                Integer.parseInt(orderID),
                reason,
                base64Image,
                "Đang duyệt",
                null
        );
        requestOrder.setRequestDate(LocalDateTime.now());

        ReturnRequestOrderDao dao = new ReturnRequestOrderDao();
        int result = dao.insert(requestOrder);

        System.out.println(result);
        if (result > 0) {
            response.setContentType("application/json");
            response.getWriter().write("{\"message\":\"Yêu cầu hoàn trả đã được gửi!\"}");
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"Yêu cầu hoàn trả thất bại\"}");
        }
    }
}
