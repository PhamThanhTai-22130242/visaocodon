package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Handle.AccountGoogle;
import com.baya.baya_project.Model.HashPasswords;
import com.baya.baya_project.Model.JavaMail;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.service.CongratulationMail;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "HandlerFBForm", value = "/handlerFBForm")
public class HandlerFBForm extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String name = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phoneNumber =request.getParameter("phoneNumber");
        String password = request.getParameter("password");
        UserDAO dao = new UserDAO();
        String url;
        String message;
        if(dao.checkEmail(email) ) {
            if(dao.checkStatus(email)!= 4){
                message = "Email đã tồn tại trong hệ thống vui lòng chọn email khác";
                request.setAttribute("message", message);
                RequestDispatcher rd = request.getRequestDispatcher("/FormLoginFBHandler.jsp");
                rd.forward(request, response);
                return;
            }
            if(dao.checkStatus(email)== 4){
                dao.updateStatus(email, 1);
                User us = dao.findUserByEmail(email);
                int count = dao.updateStatus(email, 1);

                session.setAttribute("user", us);
                url = "/";

            }
        }
        User user = new User();
        user.setFullName(name);
        user.setPhoneNumber(phoneNumber);
        user.setEmail(email);
        user.setAccountType(0);
        user.setPassword( new HashPasswords().hashPassword(password));
        user.setAccountType(1);
        user.setCreateAt(LocalDateTime.now());
        user.setStatusID(1);

        if(dao.insert(user) >=1){
            message = "Đăng kí thành công";
            session.setAttribute("user", user);
            url = "/";
        }
        else{
            message = "Đã xảy ra lỗi";
            request.setAttribute("message", message);
            url = "/login.jsp";
        }
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}