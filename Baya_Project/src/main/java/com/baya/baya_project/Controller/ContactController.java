package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.NewsDao;
import com.baya.baya_project.Model.Contact;
import com.baya.baya_project.Model.News;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.Model.UserPrincipal;
import com.baya.baya_project.service.ContactService;
import com.baya.baya_project.service.LogService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;

@WebServlet(name = "Contact", value = "/contact")
public class ContactController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        User user = (User) request.getSession().getAttribute("user");
//
//        if(user == null) {
//            response.sendRedirect("login");
//            return;
//        }
        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        User user = (User) request.getSession().getAttribute("user");
//
//
//        if(user == null) {
//            response.sendRedirect("login");
//            return;
//        }
        JSONObject jsonResponse = new JSONObject();

        LogService logService = new LogService();
        String beforeData= "UserId : "+30+" đang thực hiện bình luận " ;
        String location ="Liên hệ";
        String afterData="";

        String email = request.getParameter("email_contact");
        String phone = request.getParameter("phone_contact");
        String fullname = request.getParameter("fullname_contact");
        String content = request.getParameter("content_contact");

        UserPrincipal user= (UserPrincipal) request.getSession().getAttribute("user");
        int userID = user.getUser().getUserID();

        ContactService  service = new ContactService();
        boolean isSuccess = service.insertContact(new Contact(fullname,Long.valueOf(phone),
                email,content,30));
        if(isSuccess) {
            afterData ="phản hồi thành công với nội dung "+ content;
            jsonResponse.put("success",true);
        }else{
            afterData ="bình luận thất bại";
            jsonResponse.put("success",false);
        }
        logService.alert(30 ,location,beforeData,afterData);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
    }
}