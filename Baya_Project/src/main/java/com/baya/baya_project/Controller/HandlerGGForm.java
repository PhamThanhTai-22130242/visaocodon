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

@WebServlet(name = "HandlerGGForm", value = "/handlerGGForm")
public class HandlerGGForm extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String name = request.getParameter("fullName");
        String phoneNumber =request.getParameter("phoneNumber");
        String password = request.getParameter("password");
        AccountGoogle acc = (AccountGoogle) session.getAttribute("acc");

        System.out.println(acc);
        UserDAO dao = new UserDAO();
        User user = new User();
        user.setFullName(acc.getName());
        user.setPhoneNumber(phoneNumber);
        user.setEmail(acc.getEmail());
        user.setStatusID(1);

        //
        user.setPassword( new HashPasswords().hashPassword(password));
        user.setAccountType(1);
        user.setCreateAt(LocalDateTime.now());
        String url;
        String message;
        if(dao.insert(user) >=1){
            message = "Đăng ki thành công";
            session.setAttribute("user", user);
            new JavaMail().sendEmail(user.getEmail(), new CongratulationMail().getSubject(),  new CongratulationMail().getContent());
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