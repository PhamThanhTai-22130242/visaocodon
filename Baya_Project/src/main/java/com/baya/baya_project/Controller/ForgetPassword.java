package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Model.HashTokens;
import com.baya.baya_project.Model.JavaMail;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.config.Server;
import com.baya.baya_project.service.ActiveAccount;
import com.baya.baya_project.service.MailForgetPassword;
import com.baya.baya_project.service.RandomTokens;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ForgetPassword", value = "/forgetPassword")
public class ForgetPassword extends HttpServlet {
    Server server = new Server();
    public static String paramURL(String email, String tokens){
        return "/actiPasswNoEmail?tokens="+tokens+ "&email="+email+"&type=0";
    }

    public String resultURL(String para){
        StringBuilder builder = new StringBuilder();
        builder.append(server.getServerName());
        builder.append(para);
        System.out.println(builder.toString());
        return builder.toString();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
//        User user = (User) session.getAttribute("user");
        UserDAO userDAO = new UserDAO();
        String email = request.getParameter("email");
        request.setAttribute("email", email);
        User user = userDAO.findUserByEmail(email);
        String tokens = new RandomTokens().generateToken();
        String hashTokens =  HashTokens.hashTokens(tokens);
        userDAO.updateActiveMail(email, hashTokens);
         new JavaMail().sendEmail(email, "XÁC MINH CẬP NHẬP MẬT KHẨU TỪ BAYA-STORE",new ActiveAccount().sendEmailForgetPass(email,user.getFullName(),  resultURL(   paramURL(email,tokens)) ));

        int type = 5;
        request.setAttribute("type", type);
        request.getRequestDispatcher("/resultRegister.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}