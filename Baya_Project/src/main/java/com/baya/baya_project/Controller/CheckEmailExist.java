package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;

@WebServlet(name = "CheckEmailExist", value = "/checkEmailExist")
public class CheckEmailExist extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        UserDAO dao = new UserDAO();
        boolean result = dao.checkEmail(email);

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