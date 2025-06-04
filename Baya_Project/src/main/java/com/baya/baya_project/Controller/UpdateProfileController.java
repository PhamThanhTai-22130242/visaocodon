package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UpdateProfileController", value = "/updateProfile")
public class UpdateProfileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("error-404.jsp");
            return;
        }
        String fullName = request.getParameter("name");
        int phone;
        try{
            phone = Integer.parseInt(request.getParameter("phoneNumber"));
            user.setFullName(fullName);
//            user.setPhoneNumber(phone);
            String message;
            UserDAO dao = new UserDAO();
            if(dao.update(user) >=1 ){
                message = "Cập nhập thông tin thành công";

            }else{
                message = "Đã xảy ra lỗi";
            }
            request.setAttribute("message", message);
            RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
            rd.forward(request, response);
        }catch (Exception e){
            response.sendRedirect("error-404.jsp");
        }
    }
}