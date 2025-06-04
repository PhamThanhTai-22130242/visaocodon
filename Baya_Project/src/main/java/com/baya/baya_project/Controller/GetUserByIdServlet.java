package com.baya.baya_project.Controller;

import com.baya.baya_project.Model.User;
import com.baya.baya_project.service.UserAdminService;
import com.google.gson.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.lang.reflect.Type;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "GetUserById", value = "/getUserById")
public class GetUserByIdServlet extends HttpServlet {

    private static final Gson gson = new GsonBuilder()
            .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter()) // Custom Adapter
            .setPrettyPrinting()
            .create();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            String userID = request.getParameter("userID");
            if (userID == null || userID.trim().isEmpty()) {
                sendErrorResponse(response, HttpServletResponse.SC_BAD_REQUEST, "Thiếu ID người dùng");
                return;
            }

            int id;
            try {
                id = Integer.parseInt(userID);
            } catch (NumberFormatException e) {
                sendErrorResponse(response, HttpServletResponse.SC_BAD_REQUEST, "ID không hợp lệ");
                return;
            }

            User user = UserAdminService.selectByID(id);
            if (user == null) {
                System.out.println("User not found for ID: " + id);
                sendErrorResponse(response, HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy người dùng");
                return;
            }

            String jsonResponse = gson.toJson(user);
            System.out.println("Returning user data: " + jsonResponse);

            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write(jsonResponse);
        } catch (Exception e) {
            e.printStackTrace();
            sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi server");
        }
    }

    private void sendErrorResponse(HttpServletResponse response, int status, String message) throws IOException {
        response.setStatus(status);
        response.getWriter().write("{\"error\": \"" + message + "\"}");
    }

    // Adapter để hỗ trợ chuyển đổi LocalDateTime trong Gson
    private static class LocalDateTimeAdapter implements JsonSerializer<LocalDateTime>, JsonDeserializer<LocalDateTime> {
        private static final DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;

        @Override
        public JsonElement serialize(LocalDateTime src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive(formatter.format(src));
        }

        @Override
        public LocalDateTime deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
                throws JsonParseException {
            return LocalDateTime.parse(json.getAsString(), formatter);
        }
    }
}
