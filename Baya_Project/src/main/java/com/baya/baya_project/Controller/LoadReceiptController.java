package com.baya.baya_project.Controller;

import com.baya.baya_project.Model.StockReceipt;
import com.baya.baya_project.service.StockService;
import com.google.gson.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.lang.reflect.Type;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "LoadReceipt", value = "/load-receipt-stock")
public class LoadReceiptController extends HttpServlet {
    private static final Gson gson = new GsonBuilder()
            .registerTypeAdapter(LocalDateTime.class, new LocalTimeAdapter())
            .setPrettyPrinting()
            .create();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");


        StockService stockReceiptService = new StockService();
        JsonObject result = new JsonObject();

        if(action.equalsIgnoreCase("all")) {

        List<StockReceipt> receipts = stockReceiptService.getAll();
        JsonElement jsonElement = gson.toJsonTree(receipts);
        result.add("data", jsonElement);
        }else{
            StockReceipt receipt= stockReceiptService.getById(Integer.valueOf(request.getParameter("id")));
            JsonElement jsonElement = gson.toJsonTree(receipt);
            result.add("data", jsonElement);

        }

        System.out.println(gson.toJson(result));
        response.getWriter().write(gson.toJson(result));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public static class LocalTimeAdapter implements JsonSerializer<LocalDateTime> {
        private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        @Override
        public JsonElement serialize(LocalDateTime src, Type typeOfSrc, JsonSerializationContext context) {
            return src == null ? null : context.serialize(src.format(formatter));
        }
    }


}