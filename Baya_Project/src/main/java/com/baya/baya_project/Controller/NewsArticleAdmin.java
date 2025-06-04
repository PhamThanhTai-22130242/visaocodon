package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.NewsTypeDao;
import com.baya.baya_project.Model.News;
import com.baya.baya_project.Model.NewsType;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "NewsArticle", value = "/newsArticle")
public class NewsArticleAdmin extends HttpServlet {
    private static final Logger log = LoggerFactory.getLogger(NewsArticleAdmin.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        NewsTypeDao dao = new NewsTypeDao();
        News news =(News) request.getAttribute("news");
        List<NewsType> list = dao.selectAll();
        request.setAttribute("listType", list);
        String url ;
        if(news != null){
            url = "editArticlePage.jsp";
        }
        else{
            url ="addNewPage.jsp";
        }

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}