package com.baya.baya_project.Controller;

import com.baya.baya_project.DTO.RoleDTO;
import com.baya.baya_project.Dao.RoleDao;
import com.baya.baya_project.Dao.RolePermissionDao;
import com.baya.baya_project.Dao.UserRoleDao;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "LoadUserRole", value = "/loadUserRole")
public class LoadUserRole extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doPost load role");
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        System.out.println(sb.toString());
        String jsonString = sb.toString();
        JSONObject json = new JSONObject(jsonString);

        int userID = json.getInt("userID");
        System.out.println("userID: " + userID);

        RoleDao roleDao = new RoleDao();
        UserRoleDao userRoleDao = new UserRoleDao();
        List<Integer> listRole = userRoleDao.listRoles(userID);
        System.out.println("listRole: " + listRole);
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("lists",listRole.toString());
        response.setStatus(HttpServletResponse.SC_OK);
        response.getWriter().write(jsonResponse.toString());
    }
}