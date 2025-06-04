package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.service.ResponseStatus;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(name = "InfoUser", value = "/infoUser")
public class InfoUser extends HttpServlet {
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

            String email = json.getString("email");
            UserDAO userDAO = new UserDAO();
            User user =  userDAO.findUserByEmail(email);
            System.out.println(user);

            if(user!=null){
//            logService.infor(user.getUserID(), "Trang quản lí tin tức", "Chưa vào trang xem chi tiết bài viết", "Vào thành công bài viết với tiêu đề: "+ news.getTitle() );
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("success", true);
                jsonObject.put("userID", user.getUserID());
                jsonObject.put("fullName", user.getFullName());
                jsonObject.put("email", user.getEmail());
                jsonObject.put("phoneNumber", user.getPhoneNumber());

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonObject.toString());
                response.setStatus(HttpServletResponse.SC_OK);
                System.out.println(jsonObject.toString());
            }
            else{
//            logService.warning(user.getUserID(), "Trang quản lí tin tức", "Chưa vào trang xem chi tiết bài viết", "Đã xảy ra lỗi với bài viết" );
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Không tìm thấy bài viết hợp lệ");

            }

        }catch (Exception e) {
            ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống");

        }





    }
}