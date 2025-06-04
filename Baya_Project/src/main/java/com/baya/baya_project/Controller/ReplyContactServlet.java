package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ContactDao;
import com.baya.baya_project.Model.JavaMail;
import com.baya.baya_project.Model.Contact;
import com.baya.baya_project.Model.UserPrincipal;
import com.baya.baya_project.service.LogService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/replyContact")
public class ReplyContactServlet extends HttpServlet {
    private LogService logService = new LogService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String contactId = request.getParameter("contactId");
        String email = request.getParameter("email");
        String replyMessage = request.getParameter("replyMessage");

        Contact contact = new Contact();
        contact.setContactID(Integer.parseInt(contactId));
        contact.setReplyMessage(replyMessage);
        contact.setStatus("replied");
        contact.setReplyTime(new java.sql.Timestamp(System.currentTimeMillis()));

//        JavaMail mailSender = new JavaMail();
//
//        mailSender.sendEmail(email, "Phản hồi từ BAYA", replyMessage);

        ContactDao contactDao = new ContactDao();
        int result = contactDao.update(contact);
        UserPrincipal user= (UserPrincipal) request.getSession().getAttribute("user");
        int userID = user.getUser().getUserID();

        if (result > 0) {
            logService.infor(userID, "Phản hồi liên hệ", "Chưa phản hồi: " + contactId, "Đã phản hồi cho liên hệ ID: " + contactId);
            response.getWriter().write("success");
        } else {
            logService.warning(userID, "Cập nhật thông tin phản hồi không thành công", "Chưa phản hồi: " + contactId, "Không thể cập nhật thông tin phản hồi cho liên hệ ID: " + contactId);
            response.getWriter().write("failure");
        }
    }
}
