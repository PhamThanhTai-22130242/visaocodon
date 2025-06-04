package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ResourceDao;
import com.baya.baya_project.Model.Resource;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ManagementResourceAdmin", value = "/managementResource")
public class ManagementResourceAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResourceDao resourceDao = new ResourceDao();
        List<Resource> list = resourceDao.selectAllResource();
        System.out.println(list.toString());
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list",list.toArray());
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonObject.toString());
        System.out.println(jsonObject.toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}