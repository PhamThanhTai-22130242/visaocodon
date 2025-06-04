package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Dao.UserRoleDao;
import com.baya.baya_project.service.ResponseStatus;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteAccountAdmin", value = "/admin/authorizations/delete/deleteAccount")
public class DeleteAccountAdmin extends HttpServlet {
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
        try{
            System.out.println(sb.toString());
            String jsonString = sb.toString();
            JSONObject json = new JSONObject(jsonString);
            int userID = json.getInt("userID");
            UserRoleDao userRoleDao = new UserRoleDao();
            UserDAO userDao = new UserDAO();
            List<String> lis = userDao.userByRole(userID);
            System.out.println(lis.toString());
            if(lis.contains("Quản trị viên") && userDao.countAdmin()==1){
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Không thể xóa khi đây là Quản trị viên cuối cùng của hệ thống");
            return;
            }
            System.out.println(userID);
            UserDAO dao = new UserDAO();
            if(dao.deleteUser(userID) >0){
                ResponseStatus.successResponse(response);
            }
            else{
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi khi xóa.");

            }

        }catch (Exception e){
            ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi trong quá trình xóa");
        }




    }
}