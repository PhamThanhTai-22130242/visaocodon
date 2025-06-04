package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Model.HashPasswords;
import com.baya.baya_project.Model.User;
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

@WebServlet(name = "ConfirmPasswordManager", value = "/confirmPasswordManager")
public class ConfirmPasswordManager extends HttpServlet {
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
            HttpSession session = request.getSession();
            session.removeAttribute("email");
            LogService logService = new LogService();
            JSONObject json = new JSONObject(sb.toString());
            String password = json.getString("password");
            String email = json.getString("email");
            UserDAO dao = new UserDAO();

            User user = dao.findUserByEmail(email);
            if (user == null) {
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy tài khoản");
                return;
            }
            if(dao.checkStatus(email)==1){
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_NOT_FOUND, "Tài khoản đã được kích hoạt");
                return;
            }
            HashPasswords hashPasswords = new HashPasswords();
            if (dao.updatePassword(user.getEmail(), hashPasswords.hashPassword(password) ) > 0 && dao.updateStatus(user.getEmail(), 1)>0) {
                ResponseStatus.successResponse(response);

            } else {
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi trong quá trình thêm vào hệ thống");

            }

        } catch (Exception e) {
            ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống: ");

        }



    }
}