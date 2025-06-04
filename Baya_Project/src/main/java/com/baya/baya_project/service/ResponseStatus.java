package com.baya.baya_project.service;

import com.google.gson.*;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ResponseStatus {
    private static final Gson gson = new GsonBuilder()
            .registerTypeAdapter(LocalDateTime.class, new ResponseStatus.LocalDateTimeAdapter()) // Custom Adapter for LocalDateTime
            .setPrettyPrinting()
            .create();
    public static void sendErrorResponse(HttpServletResponse response, int status, String message) throws IOException {
        response.setStatus(status);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print("{\"success\": false, \"message\":\"" + message + "\"}");
        out.flush();
    }
    public static void successResponse(HttpServletResponse response) throws IOException {
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("success", true);
        response.setStatus(HttpServletResponse.SC_OK);
        response.getWriter().write(gson.toJson(jsonResponse));
    }
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
