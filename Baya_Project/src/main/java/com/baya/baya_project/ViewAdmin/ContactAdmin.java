package com.baya.baya_project.ViewAdmin;

import com.baya.baya_project.Dao.ContactDao;
import com.baya.baya_project.Model.Contact;
import com.baya.baya_project.service.ContactService;
import com.baya.baya_project.service.LogService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContactAdmin", urlPatterns = {"/admin/contacts/view"})
public class ContactAdmin extends HttpServlet {
    private ContactDao contactDao = new ContactDao();
    private LogService logService = new LogService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
//        User admin = (session != null) ? (User) session.getAttribute("user") : null;
//        if (admin == null) {
//            response.sendRedirect("login.jsp");
//            return;
//        }
        List<Contact> contactList = contactDao.selectAll();
        request.setAttribute("contactList", contactList);
        request.getRequestDispatcher("/contactAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ContactService contactService = new ContactService();
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                Contact contact = contactDao.selectById(id);
                contactService.delete(id);

                int userID = (int) request.getSession().getAttribute("userID");
                logService.infor(userID, "Xóa phản hồi", "Thông tin trước khi xóa: " + contact.toString(), "Đã xóa phản hồi với ID: " + id);

                request.setAttribute("message", "Xóa thông tin phản hồi thành công.");
            } catch (Exception e) {
                int userID = (int) request.getSession().getAttribute("userID");
                logService.warning(userID, "Lỗi khi xóa phản hồi", "", "Lỗi: " + e.getMessage());

                request.setAttribute("message", "Đã xảy ra lỗi khi xóa thông tin phản hồi: " + e.getMessage());
            }
        }
        doGet(request, response);
    }
}
