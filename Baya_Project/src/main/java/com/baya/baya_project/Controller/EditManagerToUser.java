package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Model.PermissionCacheManager;
import com.baya.baya_project.service.LogService;
import com.baya.baya_project.service.ResponseStatus;
import com.baya.baya_project.service.UserRoleService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EditManagerToUser", value = "/admin/authorizations/update/editManagerToUser")
public class EditManagerToUser extends HttpServlet {
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
            UserDAO userDAO = new UserDAO();
            JSONObject jsonObject = new JSONObject();
            UserRoleService service = new UserRoleService();
            UserDAO userDao = new UserDAO();
            int deleted = userDao.deleteRolebyUserID(userID);
            if(deleted ==0){
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi trong quá trình thực hiện");
                return;
            }
            int count = userDAO.setAccountTypeToUser(userID);
            if (count == 0) {
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi trong quá trình thực hiện ");
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
            ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống");

        }



    }
}