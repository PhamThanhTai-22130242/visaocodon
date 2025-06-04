package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.RoleDao;
import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Dao.UserRoleDao;
import com.baya.baya_project.Model.PermissionCacheManager;
import com.baya.baya_project.Model.Roles;
import com.baya.baya_project.service.LogService;
import com.baya.baya_project.service.ResponseStatus;
import com.baya.baya_project.service.UserRoleService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.management.relation.Role;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EditRoleManager", value = "/admin/authorizations/update/editRoleManager")
public class EditRoleManager extends HttpServlet {
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
            LogService logService = new LogService();
            JSONObject json = new JSONObject(sb.toString());
            int userID = Integer.parseInt(json.getString("userID"));
            String roleTickString = json.getString("roleTick");
            JSONArray roleArray = new JSONArray(roleTickString);
            List<Integer> roleTickList = new ArrayList<>();
            for (int i = 0; i < roleArray.length(); i++) {
                roleTickList.add(Integer.parseInt(roleArray.getString(i)));
            }
            System.out.println("usẻ id: " + userID);
            System.out.println("Roles: " + roleTickList);
            UserDAO userDAO = new UserDAO();

            JSONObject jsonObject = new JSONObject();
            UserRoleService service = new UserRoleService();
            UserDAO userDao = new UserDAO();
            int deleted = userDao.deleteRolebyUserID(userID);
            if(deleted ==0){
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi trong quá trình thêm vào hệ thống ");
                return;
            }
            int count = service.insert(userID, roleTickList);
            if (count == -1) {
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi trong quá trình thêm vào hệ thống ");
                return;
            } else {

                PermissionCacheManager.invalidateUser(userID);
                jsonObject.put("success", true);
                jsonObject.put("message", "Đã thêm thành công");
            }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonObject.toString());
            response.setStatus(HttpServletResponse.SC_OK);
            System.out.println(jsonObject.toString());


        } catch (Exception e) {
            ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống: ");

        }


    }
}