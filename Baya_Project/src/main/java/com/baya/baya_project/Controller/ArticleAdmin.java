package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.NewsDao;
import com.baya.baya_project.Model.News;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.service.LogService;
import com.baya.baya_project.service.ResponseStatus;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(name = "ArticleAdmin", value = "/article")
public class ArticleAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        User user = (User) request.getSession().getAttribute("user");

        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        try {
            LogService logService = new LogService();
            JSONObject json = new JSONObject(sb.toString());
            int id = json.getInt("id");

            NewsDao newsDao = new NewsDao();
            News news = newsDao.selectById(id);
            String url;
            if(news!=null){
//            logService.infor(user.getUserID(), "Trang quản lí tin tức", "Chưa vào trang xem chi tiết bài viết", "Vào thành công bài viết với tiêu đề: "+ news.getTitle() );
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("success", true);
                jsonObject.put("title",news.getTitle());
                jsonObject.put("content",news.getContent());
                jsonObject.put("img",news.getThumbnail());
                jsonObject.put("newsTypeID",news.getNewsTypeID());
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonObject.toString());
                response.setStatus(HttpServletResponse.SC_OK);
                System.out.println(jsonObject.toString());
            }
            else{
//            logService.warning(user.getUserID(), "Trang quản lí tin tức", "Chưa vào trang xem chi tiết bài viết", "Đã xảy ra lỗi với bài viết" );
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Không tìm thấy bài viết hợp lệ");

            }
        }catch (Exception e) {
            ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống: ");

        }
    }
}