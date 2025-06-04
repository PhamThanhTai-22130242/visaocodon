package com.baya.baya_project.Controller;

import com.baya.baya_project.Model.Log;
import com.baya.baya_project.Dao.LogDao;
import com.google.gson.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.lang.reflect.Type;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "EditLog", value = "/editLog")
public class EditLogAdmin extends HttpServlet {

    private static final Gson gson = new GsonBuilder()
            .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter()) // Custom Adapter for LocalDateTime
            .setPrettyPrinting()
            .create();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (BufferedReader reader = request.getReader()) {
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }

            // Parse log data from JSON
            Log updatedLog = gson.fromJson(sb.toString(), Log.class);
            System.out.println("Received Log: " + updatedLog);

            // Validate the data
            if (updatedLog == null ||
                    updatedLog.getLabel() == null || updatedLog.getLabel().trim().isEmpty() ||
                    updatedLog.getUserID() == null || updatedLog.getUserID() <= 0 ||
                    updatedLog.getLocation() == null || updatedLog.getLocation().trim().isEmpty() ||
                    updatedLog.getBeforeData() == null || updatedLog.getBeforeData().trim().isEmpty() ||
                    updatedLog.getAfterData() == null || updatedLog.getAfterData().trim().isEmpty()) {
                sendErrorResponse(response, HttpServletResponse.SC_BAD_REQUEST, "Vui lòng nhập đầy đủ thông tin nhật ký");
                return;
            }

            // Debugging output to see the received data
            System.out.println("Received Log: " + updatedLog);

            LogDao logDao = new LogDao();
            int result = logDao.update(updatedLog);

            if (result > 0) {
                JsonObject jsonResponse = new JsonObject();
                jsonResponse.addProperty("success", true);
                jsonResponse.addProperty("logID", updatedLog.getLogID());

                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write(gson.toJson(jsonResponse));
            } else {
                sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi cập nhật dữ liệu.");
            }

        } catch (JsonSyntaxException e) {
            e.printStackTrace();
            sendErrorResponse(response, HttpServletResponse.SC_BAD_REQUEST, "Dữ liệu không hợp lệ: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống: " + e.getMessage());
        }
    }

    private void sendErrorResponse(HttpServletResponse response, int status, String message) throws IOException {
        response.setStatus(status);
        JsonObject errorResponse = new JsonObject();
        errorResponse.addProperty("error", message);
        response.getWriter().write(gson.toJson(errorResponse));
    }


    // Adapter for LocalDateTime to support Gson serialization/deserialization
    static class LocalDateTimeAdapter implements JsonSerializer<LocalDateTime>, JsonDeserializer<LocalDateTime> {
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
