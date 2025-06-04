package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.RoleDao;
import com.baya.baya_project.service.ResponseStatus;
import com.baya.baya_project.service.RolePermissionService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "NewRoleAdmin", value = "/admin/permissions/create/newRole")
public class NewRoleAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        try {
            System.out.println(sb.toString());
            String jsonString = sb.toString();
            JSONObject json = new JSONObject(jsonString);
            String roleName = json.getString("roleName");
            RoleDao roleDao = new RoleDao();

            if (roleDao.checkExist(roleName)) {
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_BAD_REQUEST, "Tên Roles đã tồn tại trong hệ thống");
                return;
            }
            String roleTick = json.getString("roleTick");
            JSONObject jsonRoleTick = new JSONObject(roleTick);
            System.out.println("jsonRoleTick:"+jsonRoleTick.toString());
            RolePermissionService rolePermissionService = new RolePermissionService();
            HashMap<Integer, List<Integer>> map = rolePermissionService.loadMap(jsonRoleTick);
            System.out.println("map:"+map.toString());
            if(  roleDao.insert(roleName) >0 && rolePermissionService.insertRolePermission(map,roleName)>0){
                    ResponseStatus.successResponse(response);
                    return;

            }
            else {
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi.");

            }

        } catch (Exception e) {
            ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống");


        }

    }
}