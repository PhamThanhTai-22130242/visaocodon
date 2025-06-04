package com.baya.baya_project.Controller;

import com.baya.baya_project.DTO.UserDTO;
import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Dao.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "searchByEmail", value = "/searchByEmail")
public class searchByEmail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        System.out.println("chay vao searchByEmail" + keyword);
        UserDAO userDAO = new UserDAO();
        List<UserDTO> listKeyword = userDAO.getListUserDTO(keyword);
        System.out.println("du lieu tra ve"+listKeyword.toString());
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list",listKeyword.toArray());
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonObject.toString());
        System.out.println("da chuyen qua "+jsonObject.toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}