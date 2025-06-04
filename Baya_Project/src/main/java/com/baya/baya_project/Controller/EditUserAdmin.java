package com.baya.baya_project.Controller;

import com.baya.baya_project.Model.User;
import com.baya.baya_project.Model.UserPrincipal;
import com.baya.baya_project.service.LogService;
import com.baya.baya_project.service.UserAdminService;
import com.google.gson.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.lang.reflect.Type;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "EditUser", value = "/editUser")
public class EditUserAdmin extends HttpServlet {

    private static final Gson gson = new GsonBuilder()
            .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
            .setPrettyPrinting()
            .create();

    private final LogService logService = new LogService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        UserPrincipal admin = (UserPrincipal) session.getAttribute("user");

        try (BufferedReader reader = request.getReader()) {
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }

            User updatedUser = gson.fromJson(sb.toString(), User.class);

            if (updatedUser == null ||
                    updatedUser.getFullName() == null || updatedUser.getFullName().trim().isEmpty() ||
                    updatedUser.getEmail() == null || updatedUser.getEmail().trim().isEmpty() ||
                    updatedUser.getPhoneNumber() == null || updatedUser.getPhoneNumber().trim().isEmpty()) {

                sendErrorResponse(response, HttpServletResponse.SC_BAD_REQUEST, "Vui lòng nhập đầy đủ thông tin");
                return;
            }

            User oldUser = UserAdminService.getUserById(updatedUser.getUserID());

            UserAdminService.updateUser(updatedUser);

            String changes = getChanges(oldUser, updatedUser);

            logService.infor(
                    admin.getUser().getUserID(),
                    "Trang quản lí người dùng",
                    "Đang thực hiện cập nhật người dùng ID: " + updatedUser.getUserID(),
                    changes
            );

            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("success", true);
            jsonResponse.addProperty("userID", updatedUser.getUserID());

            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write(gson.toJson(jsonResponse));
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
    private String getChanges(User oldUser, User newUser) {
        StringBuilder changes = new StringBuilder();

        if (!equals(oldUser.getFullName(), newUser.getFullName())) {
            changes.append("fullName: ").append(oldUser.getFullName()).append(" -> ").append(newUser.getFullName()).append("; ");
        }
        if (!equals(oldUser.getEmail(), newUser.getEmail())) {
            changes.append("email: ").append(oldUser.getEmail()).append(" -> ").append(newUser.getEmail()).append("; ");
        }
        if (!equals(oldUser.getPhoneNumber(), newUser.getPhoneNumber())) {
            changes.append("phoneNumber: ").append(oldUser.getPhoneNumber()).append(" -> ").append(newUser.getPhoneNumber()).append("; ");
        }

        return changes.length() > 0 ? changes.toString() : "Không có gì thay đổi.";
    }

    private boolean equals(String a, String b) {
        return (a == null && b == null) || (a != null && a.equals(b));
    }

}
