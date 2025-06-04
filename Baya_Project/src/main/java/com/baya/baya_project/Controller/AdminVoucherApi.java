package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Dao.VoucherDao;
import com.baya.baya_project.Model.*;
import com.baya.baya_project.service.OrderService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "GetVoucher", value = "/getSetVoucher")
public class AdminVoucherApi extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VoucherDao dao = new VoucherDao();
        List<Voucher> ls = dao.selectAll();

        Gson gson = new Gson();

        JsonObject jsonObject = new JsonObject();
        jsonObject.add("voucher", gson.toJsonTree(ls));

        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        System.out.println(jsonObject.toString());
        out.print(jsonObject.toString());

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }


}