package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.NewsDao;
import com.baya.baya_project.Model.News;
import com.baya.baya_project.Model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "NewsPageAdmin", value = "/newsPage")
public class NewsPageAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        NewsDao dao = new NewsDao();
        List<News> listNews = dao.selectAll();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list",listNews.toArray());

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonObject.toString());
        System.out.println(jsonObject.toString());

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}