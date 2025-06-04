package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.NewsDao;
import com.baya.baya_project.service.LogService;
import com.baya.baya_project.service.ResponseStatus;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(name = "RemoveArticle", value = "/admin/news/delete/removeArticle")
public class RemoveArticle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        try{
            System.out.println(sb.toString());
            String jsonString = sb.toString();
            JSONObject json = new JSONObject(jsonString);
            String id = json.getString("id").toString();

            NewsDao dao = new NewsDao();
            int remove = dao.delete(id);
            String url =null;
            LogService logService = new LogService();
            if(remove >0 ){
                String location = "Admin - Xóa Tin Tức";
                logService.infor(30, location, "Đang thực hiện xóa tin tức", "Đã xóa thành công");
                ResponseStatus.successResponse(response);
            }

            else{
                logService.infor(30,  "Admin - Xóa Tin Tức", "Đang thực hiện xóa tin tức", "Xảy ra lỗi khi xóa");

                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi khi xóa");
            }
        }catch (Exception e){
            ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi trong quá trình xóa");

        }
    }
}