package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.UserDAO;
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

@WebServlet(name = "newUserRole", value = "/admin/authorizations/create/newUserRole")
public class newUserRole extends HttpServlet {
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
            String email = json.getString("email");
            String roleTickString = json.getString("roleTick");

            JSONArray roleArray = new JSONArray(roleTickString);
            List<Integer> roleTickList = new ArrayList<>();
            for (int i = 0; i < roleArray.length(); i++) {
                roleTickList.add(Integer.parseInt(roleArray.getString(i)));
            }
            System.out.println(roleTickList);
            System.out.println("Email: " + email);
            System.out.println("Roles: " + roleTickList);
            UserDAO userDAO = new UserDAO();
            int userID = userDAO.findUserByEmail(email).getUserID();
            System.out.println("UserID: " + userID);
            JSONObject jsonObject = new JSONObject();
            UserRoleService service = new UserRoleService();
            int count = service.insert(userID, roleTickList);
            System.out.println(count + " rows inserted");
           int countUpdate = userDAO.updateAccountTypeAdmin(userID);
            System.out.println(countUpdate + " rows updated");
            if (count == -1 && countUpdate==0) {
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi trong quá trình thêm vào hệ thống ");
                return;
            } else {
                jsonObject.put("success", true);
                jsonObject.put("message", "Đã thêm thành công");
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonObject.toString());
            response.setStatus(HttpServletResponse.SC_OK);
            System.out.println(jsonObject.toString());


        } catch (Exception e) {
            ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống ");

        }

    }
}