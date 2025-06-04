package com.baya.baya_project.Controller;

import com.baya.baya_project.Model.StockIssue;
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

@WebServlet(name = "LoadIssue", value = "/load-issue-stock")
public class LoadIssueAdminController extends HttpServlet {
    private static final Gson gson = new GsonBuilder()
            .registerTypeAdapter(LocalDateTime.class, new LocalTimeAdapter())
            .setPrettyPrinting()
            .create();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");


        StockService service = new StockService();
        JsonObject result = new JsonObject();

        if(action.equalsIgnoreCase("all")) {

            List<StockIssue> issues = service.getAllStockIssue();
            JsonElement jsonElement = gson.toJsonTree(issues);
            result.add("data", jsonElement);
        }else{

            StockIssue issue= service.getByIssueId(Integer.valueOf(request.getParameter("id")));
            System.out.println(issue);
            JsonElement jsonElement = gson.toJsonTree(issue);
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