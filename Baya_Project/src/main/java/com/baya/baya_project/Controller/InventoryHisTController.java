package com.baya.baya_project.Controller;

import com.baya.baya_project.Model.User;
import com.baya.baya_project.service.ProductAdminService;
import com.baya.baya_project.Model.Inventory_History;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(value = "/admin/warehouseHistories/view/inventoryHistory")
public class InventoryHisTController extends HttpServlet {

    ProductAdminService productAdminService = new ProductAdminService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Inventory_History> historyList = productAdminService.selectAll();
        request.setAttribute("historyList", historyList);
        request.getRequestDispatcher("/inventory_history_Admin.jsp").forward(request, response);

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
