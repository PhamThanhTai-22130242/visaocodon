package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ResourceDao;
import com.baya.baya_project.Dao.RoleDao;
import com.baya.baya_project.Dao.RolePermissionDao;
import com.baya.baya_project.Dao.mapper.PermissionsDao;
import com.baya.baya_project.service.ResponseStatus;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(name = "RemoveRoleAdmin", value = "/admin/permissions/delete/removeRole")
public class RemoveRoleAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doPost");
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        try{
            System.out.println(sb.toString());
            String jsonString = sb.toString();
            JSONObject json = new JSONObject(jsonString);
            RolePermissionDao rolePermissionDao = new RolePermissionDao();
            int roleID = json.getInt("roleID");
            System.out.println(roleID);
            RoleDao dao = new RoleDao();
            PermissionsDao permissionsDao = new PermissionsDao();
            if(dao.checkExistRoleFromRoleUser(roleID)){
                if(dao.deleteUserRoles(roleID) >0 && rolePermissionDao.deleteRolePermission(roleID) >0 && dao.deleteRole(roleID) >0 ){
                    ResponseStatus.successResponse(response);
                    return;
                }
            }
            else{
                if(  rolePermissionDao.deleteRolePermission(roleID) >0 && dao.deleteRole(roleID) >0 ){
                    ResponseStatus.successResponse(response);
                    return;
                }
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi trong quá trình xóa");

            }


        }catch (Exception e){
            ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi trong quá trình xóa");

        }
    }
}