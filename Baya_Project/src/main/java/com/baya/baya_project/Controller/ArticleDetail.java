package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.NewsDao;
import com.baya.baya_project.Model.News;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ArticleDetail", value = "/articleDetail")
public class ArticleDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            int id = Integer.parseInt(request.getParameter("id"));
        NewsDao newsDao = new NewsDao();
        News news = newsDao.selectById(id);
        String url;
        if(news == null) {
            url = "error-404.jsp";

        }else{
            url = "Article.jsp";
            List<News> newsList = newsDao.selectTop4();
            request.setAttribute("newsList", newsList);
            request.setAttribute("news", news);
        }

        RequestDispatcher rd = request.getRequestDispatcher(url);
       rd.forward(request, response);



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}