package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.UserDAO;

import com.baya.baya_project.Model.HashPasswords;
import com.baya.baya_project.Model.HashTokens;
import com.baya.baya_project.Model.JavaMail;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.service.ActiveAccount;
import com.baya.baya_project.service.CongratulationMail;
import com.baya.baya_project.service.RandomTokens;
import com.baya.baya_project.service.VetifyAccount;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "SignUp", value = "/signUp")
public class SignUp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phoneNumber = (request.getParameter("phoneNumber"));
        User user = new User();
        UserDAO userDAO = new UserDAO();
        String url;
        String message;
        if(userDAO.checkEmail(email) && userDAO.checkStatus(email)!= 4) {
            message = "Email đã tồn tại, vui lòng nhập email khác";
            url ="signUp.jsp";
        }
        else{
            user.setFullName(fullName);
            user.setEmail(email);
            user.setPassword(HashPasswords.hashPassword(password));
            user.setPhoneNumber(phoneNumber);
            user.setCreateAt(LocalDateTime.now());
            user.setStatusID(3);
            user.setAccountType(0);
            if(  userDAO.insert(user) >=1){
                String tokens = new RandomTokens().generateToken();
                String hashTokens =  HashTokens.hashTokens(tokens);
                userDAO.updateActiveMail(email, hashTokens);
                message = "Vui lòng kiểm tra email để kích hoạt tài khoản";
                url ="login.jsp";
//                new JavaMail().sendEmail(email, new VetifyAccount().getSubject(), new VetifyAccount(tokens, email).getContent());
                new JavaMail().sendEmail(email, "KÍCH HOẠT TÀI KHOẢN VỚI BAYA-STORE", new ActiveAccount().sendEmailUserActive(email,user.getFullName(), tokens));
//                new JavaMail().sendEmail("thanhtaip0308200@gmail.com", "KÍCH HOẠT TÀI KHOẢN VỚI BAYA-STORE", new ActiveAccount().sendEmailUserActive("22130242@st.hcmuaf.edu.vn", "Tài pham", "123"));

            }
            else{
                message = "Đã xảy ra lỗi, vui lòng thử lại";
                url = "signUp.jsp";

            }


        }
        request.setAttribute("message", message);
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }
}