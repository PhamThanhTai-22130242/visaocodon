package com.baya.baya_project.Controller;

import com.baya.baya_project.Model.Log;
import com.baya.baya_project.Dao.LogDao;
import com.google.gson.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.lang.reflect.Type;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "GetLogById", value = "/getLogById")
public class GetLogByIdServlet extends HttpServlet {

    private static final Gson gson = new GsonBuilder()
            .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter()) // Custom Adapter for LocalDateTime
            .setPrettyPrinting()
            .create();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            String logID = request.getParameter("logID");
            if (logID == null || logID.trim().isEmpty()) {
                sendErrorResponse(response, HttpServletResponse.SC_BAD_REQUEST, "Thiếu ID nhật ký");
                return;
            }

            int id;
            try {
                id = Integer.parseInt(logID);
            } catch (NumberFormatException e) {
                sendErrorResponse(response, HttpServletResponse.SC_BAD_REQUEST, "ID không hợp lệ");
                return;
            }
            LogDao logDao = new LogDao();
            Log log = logDao.selectById(id);
            if (log == null) {
                System.out.println("Log not found for ID: " + id);
                sendErrorResponse(response, HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy nhật ký");
                return;
            }

            String jsonResponse = gson.toJson(log);  // Convert Log object to JSON
            System.out.println("Returning log data: " + jsonResponse);

            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write(jsonResponse);  // Send the log data as JSON response
        } catch (Exception e) {
            e.printStackTrace();
            sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi server");
        }
    }

    private void sendErrorResponse(HttpServletResponse response, int status, String message) throws IOException {
        response.setStatus(status);
        response.getWriter().write("{\"error\": \"" + message + "\"}");  // Send error message in JSON format
    }

    // Adapter to handle LocalDateTime serialization/deserialization
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
