package com.baya.baya_project.Controller;

import com.baya.baya_project.DTO.RoleDTO;
import com.baya.baya_project.Dao.RoleDao;
import com.baya.baya_project.Dao.RolePermissionDao;
import com.baya.baya_project.service.ResponseStatus;
import com.google.gson.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.lang.reflect.Type;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "LoadRole", value = "/loadRole")
public class LoadRole extends HttpServlet {

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

        int roleID = json.getInt("roleID");
        System.out.println("roleID: " + roleID);
        RolePermissionDao rolePermissionDao = new RolePermissionDao();
        RoleDao roleDao = new RoleDao();
        String roleName =roleDao.getRoleNameById(roleID);
        RoleDTO role = new RoleDTO();
        role.setRoleName(roleName);
        role.setRoleID(roleID);
        HashMap<Integer, List<Integer>> listTick = roleDao.getFeatureAndAction(roleID);
        role.setListCheckboxes(listTick);
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("roleID", roleID);
        jsonResponse.addProperty("roleName", roleName);
        jsonResponse.addProperty("lists",new JSONObject(listTick).toString());

        response.setStatus(HttpServletResponse.SC_OK);
        response.getWriter().write(jsonResponse.toString());
    }

}