package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.CategoryDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "RemoveCategory", value = "/removeCategory")
public class RemoveCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryDao category = new CategoryDao();
        String id = request.getParameter("id");
        if(id == null ||!category.checkID(id)) {
            response.sendRedirect("error-404.jsp");
            return;
        }
        String message = null;
        int delete = category.delete(id);
        if(delete >0){
            message = "Đã xóa thành công";
        }
        request.setAttribute("message", message);
        RequestDispatcher rd = request.getRequestDispatcher("/categoryAdmin");
        rd.forward(request, response);



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}