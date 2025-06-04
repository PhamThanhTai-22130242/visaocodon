package com.baya.baya_project.Controller;

import com.baya.baya_project.Handle.CaptchaGoogle;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;

@WebServlet(name = "HandlerCaptcha", value = "/handlerCaptcha")
public class HandlerCaptcha extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userResponse = request.getParameter("respone");
        System.out.println(userResponse);
        boolean result = new CaptchaGoogle().getCaptcha(userResponse);

        System.out.println(result);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result", result);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonObject.toString());
        System.out.println(jsonObject.toString());

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}