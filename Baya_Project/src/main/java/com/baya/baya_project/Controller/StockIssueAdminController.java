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

@WebServlet(name = "StockssueAdmin",value = "/admin/dispatches/view/stock-issue-admin")
public class StockIssueAdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        if(user == null || user.getRoleID() != 0) {
//            response.sendRedirect("login");
//            return;
//        }
        ProductDao productDao = new ProductDao();
        List<Product> products = productDao.selectAllProducts();
        request.setAttribute("products", products);
        System.out.println(products.size());
        request.getRequestDispatcher("/stock_issue_Admin.jsp").forward(request, response);
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

            UserPrincipal user = (UserPrincipal) request.getSession(true).getAttribute("user");
            StockIssue issues = new StockIssue(user.getUser().getUserID(), note, receiptType);

            Map<String, StockIssueDetail> detailMap = new HashMap<>();

            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);
                String productId = item.getString("productId");
                int quantity = item.getInt("quantity");
                double price = item.getDouble("price");
                double total = price * quantity;

                if (detailMap.containsKey(productId)) {
                    StockIssueDetail existing = detailMap.get(productId);
                    existing.setQuantity(existing.getQuantity() + quantity);
                    existing.setUnit_price(existing.getUnit_price() + total);
                } else {
                    StockIssueDetail detail = new StockIssueDetail(productId, quantity, total);
                    detailMap.put(productId, detail);
                }
            }

            List<StockIssueDetail> details = new ArrayList<>(detailMap.values());
            issues.setItems(details);

            StockService service = new StockService();
            boolean check = service.addStockIssue(issues);

            if (check) {
                out.write("{\"success\": true, \"message\": \"Xuất kho thành công!\"}");
            } else {
                out.println("{\"success\": false, \"message\": \"Lỗi khi xuất kho!\"}");
            }

        } catch (Exception e) {
            out.println("{\"success\": false, \"message\": \"Lỗi khi xuất kho!\"}");
            e.printStackTrace();
        }
    }
}