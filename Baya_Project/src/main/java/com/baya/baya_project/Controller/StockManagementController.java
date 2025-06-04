package com.baya.baya_project.Controller;

import com.baya.baya_project.Model.Product;
import com.baya.baya_project.service.ProductAdminService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonPrimitive;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/manageStock")
public class StockManagementController extends HttpServlet {
    private final ProductAdminService productAdminService = new ProductAdminService();
    private static final Logger logger = Logger.getLogger(StockManagementController.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String filter = request.getParameter("filter");
        logger.info("Received filter parameter: " + filter);
        List<Product> products = null;
        try {
            if ("low-stock".equals(filter)) {
                logger.info("Fetching products to import (low-stock filter).");
                products = productAdminService.getProductsToImport();
            } else if ("overstock".equals(filter)) {
                products =productAdminService.getProductsToExport();
            } else {
                logger.info("No valid filter specified.");
            }
            if (products == null) {
                logger.warning("No products found for the filter: " + filter);
            } else {
                logger.info("Found " + products.size() + " products for the filter: " + filter);
            }

            if (products == null || products.isEmpty()) {
                response.getWriter().write("{\"error\": \"Không có sản phẩm nào thỏa mãn bộ lọc.\"}");
            } else {
                Gson gson = new GsonBuilder()
                        .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                        .create();

                String json = gson.toJson(products);
                response.getWriter().write(json);
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "An error occurred while processing the request.", e);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Lỗi xử lý dữ liệu trên server.\"}");
        }
    }

    public class LocalDateTimeAdapter implements com.google.gson.JsonSerializer<LocalDateTime>, com.google.gson.JsonDeserializer<LocalDateTime> {
        private  final DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;

        @Override
        public JsonElement serialize(LocalDateTime src, java.lang.reflect.Type typeOfSrc, com.google.gson.JsonSerializationContext context) {
            return new JsonPrimitive(formatter.format(src));
        }

        @Override
        public LocalDateTime deserialize(JsonElement json, java.lang.reflect.Type typeOfT, com.google.gson.JsonDeserializationContext context) throws com.google.gson.JsonParseException {
            return LocalDateTime.parse(json.getAsString(), formatter);
        }
    }
}
