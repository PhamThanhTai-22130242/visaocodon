package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ResourceDao;
import com.baya.baya_project.Model.Resource;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.google.gson.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.lang.reflect.Type;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "GetResourceByID", value = "/getResourceByID")
public class GetResourceByID extends HttpServlet {
    private static final Gson gson = new GsonBuilder()
            .registerTypeAdapter(LocalDateTime.class, new GetResourceByID.LocalDateTimeAdapter())
            .setPrettyPrinting()
            .create();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int featureID = Integer.parseInt(request.getParameter("featureID"));
            ResourceDao dao = new ResourceDao();
            Resource resource = dao.selectResourceById(featureID);

            String jsonResponse = gson.toJson(resource);
            System.out.println("Returning log data: " + jsonResponse);

            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write(jsonResponse);

        } catch (Exception e) {
            e.printStackTrace();
            sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi");
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void sendErrorResponse(HttpServletResponse response, int status, String message) throws IOException {
        response.setStatus(status);
        response.getWriter().write("{\"error\": \"" + message + "\"}");  // Send error message in JSON format
    }

    private static class LocalDateTimeAdapter implements JsonSerializer<LocalDateTime>, JsonDeserializer<LocalDateTime> {
        private static final DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;

        @Override
        public JsonElement serialize(LocalDateTime src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive(formatter.format(src));  // Serialize LocalDateTime to string
        }

        @Override
        public LocalDateTime deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
                throws JsonParseException {
            return LocalDateTime.parse(json.getAsString(), formatter);  // Deserialize string to LocalDateTime
        }
    }
}