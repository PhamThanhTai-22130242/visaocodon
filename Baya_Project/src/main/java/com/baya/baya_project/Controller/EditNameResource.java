package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ResourceDao;
import com.baya.baya_project.Model.Resource;
import com.baya.baya_project.service.ResponseStatus;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "EditNameResource", value = "/editNameResource")
public class EditNameResource extends HttpServlet {
    private static final Gson gson = new GsonBuilder()
            .registerTypeAdapter(LocalDateTime.class, new EditLogAdmin.LocalDateTimeAdapter()) // Custom Adapter for LocalDateTime
            .setPrettyPrinting()
            .create();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        try {


            System.out.println(sb.toString());
            String jsonString = sb.toString();
            JSONObject json = new JSONObject(jsonString);


            int featureID = json.getInt("featureID");
            String featureName = json.getString("featureName");

            System.out.println("Feature ID: " + featureID);
            System.out.println("Feature Name: " + featureName);
            ResourceDao resourceDao = new ResourceDao();
            List<Resource> list = resourceDao.selectAllResource();
            Resource resource = resourceDao.selectResourceById(featureID);
            resource.setFeatureName(featureName);
            boolean exists = list.stream()
                    .anyMatch(r -> r.getFeatureName().toLowerCase().equals(featureName.toLowerCase()));
            System.out.println("exist là:"+ exists);

            if (resource == null) {
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_BAD_REQUEST, "Không tìm thấy Resoure đó");
                return;
            } else if (exists) {
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Tên Resoure đã tồn tại. Vui lòng đặt tên khác");
                return;
            } else {


                if (resourceDao.updateResource(resource) > 0) {
                    JsonObject jsonResponse = new JsonObject();
                    jsonResponse.addProperty("success", true);
                    response.setStatus(HttpServletResponse.SC_OK);
                    response.getWriter().write(gson.toJson(jsonResponse));
                } else {

                    ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi cập nhật dữ liệu.");

                }
            }
        } catch (Exception e) {
            ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống: " );
        }



    }
}