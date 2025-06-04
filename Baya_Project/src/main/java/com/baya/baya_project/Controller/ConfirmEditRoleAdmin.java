package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.RoleDao;
import com.baya.baya_project.Dao.RolePermissionDao;
import com.baya.baya_project.Model.Roles;
import com.baya.baya_project.service.ResponseStatus;
import com.baya.baya_project.service.RolePermissionService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "ConfirmEditRoleAdmin", value = "/admin/permissions/update/confirmEditRole")
public class ConfirmEditRoleAdmin extends HttpServlet {
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
            int roleId = json.getInt("roleID");
            String roleTick = json.getString("roleTick");
            System.out.println(roleId+":"+roleName+":");
            JSONObject jsonRoleTick = new JSONObject(roleTick);
            System.out.println("jsonRoleTick:" + jsonRoleTick.toString());
            RolePermissionService rolePermissionService = new RolePermissionService();
            HashMap<Integer, List<Integer>> map = rolePermissionService.loadMap(jsonRoleTick);
            RoleDao roleDao = new RoleDao();
            Roles roles = roleDao.getRoleById(roleId);
            System.out.println("map:" + map.toString());
            if (roles == null) {
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_BAD_REQUEST, "Không tìm thấy Role này trong hệ thống");
                return;
            } else {
                if (!roleName.equalsIgnoreCase(roles.getRoleName())) {
                    int update = roleDao.updateName(roleName, roles.getRoleID());
                    if (update != 1) {
                        ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_BAD_REQUEST, "Đã xảy ra lỗi trong quá trình thêm");
                        return;
                    }
                }
                RolePermissionDao rolePermissionDao = new RolePermissionDao();
                if(rolePermissionDao.deleteRolePermission(roles.getRoleID())>0){
                    if ( rolePermissionService.insertRolePermission(map, roleName) > 0) {
                        ResponseStatus.successResponse(response);
                        return;

                    } else {
                        ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi.");
                        return  ;
                    }
                }
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi 2.");

            }
        } catch (Exception e) {
            ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống");


        }
    }
}