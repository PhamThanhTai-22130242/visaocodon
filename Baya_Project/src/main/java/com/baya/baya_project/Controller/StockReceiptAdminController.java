package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Model.*;
import com.baya.baya_project.service.StockService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "StockReceiptAdmin", value = "/admin/inventories/view/stock-receipt-admin")
public class StockReceiptAdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ProductDao productDao = new ProductDao();
        List<Product> products = productDao.selectAllProducts();
        request.setAttribute("products", products);
        System.out.println(products.size());
        request.getRequestDispatcher("/stockReceiptAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");

        PrintWriter out = response.getWriter();

        try {
            StringBuilder sb = new StringBuilder();
            String line;
            BufferedReader reader = request.getReader();
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }

            JSONObject json = new JSONObject(sb.toString());
            String receiptType = json.getString("receiptType");
            String note = json.getString("note");
            JSONArray items = json.getJSONArray("items");

            StockReceipt receipt = new StockReceipt(11, note, receiptType);

            Map<String, StockReceiptDetail> detailMap = new HashMap<>();

            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);
                String productId = item.getString("productId");
                int quantity = item.getInt("quantity");
                double price = item.getDouble("price");
                String itemReceiptType = item.getString("receiptType");
                double total = price * quantity;

                if (detailMap.containsKey(productId)) {
                    StockReceiptDetail existing = detailMap.get(productId);
                    existing.setQuantity(existing.getQuantity() + quantity);
                    existing.setUnit_price(existing.getUnit_price() + total);
                } else {
                    StockReceiptDetail detail = new StockReceiptDetail(productId, quantity, total);
                    detail.setReceipt_type(itemReceiptType);
                    detailMap.put(productId, detail);
                }
            }

            List<StockReceiptDetail> details = new ArrayList<>(detailMap.values());
            receipt.setItems(details);

            StockService service = new StockService();
            boolean check = service.addStockReceipt(receipt);

            if (check) {
                out.write("{\"success\": true, \"message\": \"Nhập kho thành công!\"}");
            } else {
                out.write("{\"success\": false, \"message\": \"Lỗi khi nhập kho!\"}");
            }

        } catch (Exception e) {
            out.write("{\"success\": false, \"message\": \"Lỗi khi nhập kho!\"}");
            e.printStackTrace();
        }
    }

}