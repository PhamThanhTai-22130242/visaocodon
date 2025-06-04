package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.NewsDao;
import com.baya.baya_project.Model.News;
import com.baya.baya_project.service.LogService;
import com.baya.baya_project.service.ResponseStatus;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

@WebServlet(name = "EditArticlePage", value = "/admin/news/update/editArticle")
@MultipartConfig
public class EditArticlePage extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain;charset=UTF-8");

        try {
            String newsIDStr = request.getParameter("newsID");
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String typeIDStr = request.getParameter("newsTypeID");


            if (newsIDStr == null || title == null || content == null || typeIDStr == null) {
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_BAD_REQUEST, "Thiếu dữ liệu.");
                return;
            }

            int newsID = Integer.parseInt(newsIDStr);
            int newsTypeID = Integer.parseInt(typeIDStr);

            NewsDao newsDao = new NewsDao();
            News oldNews = newsDao.selectById(newsID);
            if (oldNews == null) {
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_NOT_FOUND, "Bài viết không tồn tại.");
                return;
            }

            Part filePart = request.getPart("thumbnail");
            String thumbnailBase64;
            if (filePart != null && filePart.getSize() > 0) {
                thumbnailBase64 = convertToBase64(filePart);
            } else {
                thumbnailBase64 = oldNews.getThumbnail();
            }

            News updatedNews = new News();
            updatedNews.setNewsID(newsID);
            updatedNews.setTitle(title);
            updatedNews.setContent(content);
            updatedNews.setThumbnail(thumbnailBase64);
            updatedNews.setNewsTypeID(newsTypeID);

            int result = newsDao.update(updatedNews);

            if (result > 0) {
                String location = "Admin - Chỉnh sửa Tin Tức";
                String afterData = "Tiêu đề: " + title + ", Loại tin: " + newsTypeID;
                LogService logService = new LogService();
                logService.infor(30, location, "Đang thực hiện chỉnh sửa tin tức", afterData);

                response.setContentType("application/json");
                response.getWriter().write("{\"success\": true}");
            } else {
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                        "Cập nhật thất bại, vui lòng thử lại.");
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
