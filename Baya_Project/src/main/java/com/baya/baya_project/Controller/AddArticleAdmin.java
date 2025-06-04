package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.NewsDao;
import com.baya.baya_project.Model.News;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.Model.UserPrincipal;
import com.baya.baya_project.service.LogService;
import com.baya.baya_project.service.ResponseStatus;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

@WebServlet(name = "AddArticle", value = "/admin/news/create/addArticle")
@MultipartConfig
public class AddArticleAdmin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain;charset=UTF-8");
        HttpSession session = request.getSession();

        try {
//            UserPrincipal principal = (UserPrincipal) session.getAttribute("user");
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String typeIDStr = request.getParameter("newsTypeID");
            int newsTypeID = Integer.parseInt(typeIDStr);
            Part thumbnailPart = request.getPart("thumbnail");
            String thumbnailBase64 = "";
            if (thumbnailPart != null && thumbnailPart.getSize() > 0) {
                thumbnailBase64 = convertToBase64(thumbnailPart);
            }
            News news = new News();
            news.setTitle(title);
            news.setContent(content);
            news.setThumbnail(thumbnailBase64);
            news.setNewsTypeID(newsTypeID);

            NewsDao newsDao = new NewsDao();
            int insert = newsDao.insert(news);

            if (insert >= 1) {
                String location = "Admin - Thêm Tin Tức";
                String afterData = "Tiêu đề: " + title + ", Loại tin: " + newsTypeID;
                LogService logService = new LogService();
                logService.infor(30, location, "Đang thực hiện thêm tin tức", afterData);
                response.setContentType("application/json");
                response.getWriter().write("{\"success\": true}");
            } else {
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                        "Đã xảy ra lỗi trong quá trình thêm, vui lòng thử lại.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Lỗi hệ thống: " + e.getMessage());
        }
    }

    private String convertToBase64(Part part) throws IOException {
        try (InputStream inputStream = part.getInputStream()) {
            byte[] bytes = inputStream.readAllBytes();
            return "data:" + part.getContentType() + ";base64," + Base64.getEncoder().encodeToString(bytes);
        }
    }
}
