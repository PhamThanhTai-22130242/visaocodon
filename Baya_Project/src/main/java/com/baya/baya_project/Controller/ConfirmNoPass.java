package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Model.HashPasswords;
import com.baya.baya_project.Model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ConfirmNoPass", value = "/confirmNoPass")
public class ConfirmNoPass extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try{
             String email = request.getParameter("email");
            String password = request.getParameter("password");
            UserDAO dao = new UserDAO();
            User user = dao.findUserByEmail(email);
            HashPasswords hashPasswords = new HashPasswords();
            String hash = dao.getPassword(user.getEmail());
            String url;
            String message;
            if (hashPasswords.checkPassword(password, hash)) {
                message = "Mật khẩu cũ và mật khẩu mới không được trùng nhau";
                url = "/ForgetPasswordC.jsp";
            } else {
                if (dao.updatePassword(user.getEmail(), hashPasswords.hashPassword(password)) > 0) {
                    message = "Thành công";
                    int type = 6;
                    request.setAttribute("type", type);
                    url = "/resultRegister.jsp";
                } else {
                    message = "Đã xảy ra lỗi";
                    url = "/ActivateNoPass.jsp";
                }
            }
            request.setAttribute("message", message);
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("/error-400.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}