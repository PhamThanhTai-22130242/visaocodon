package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.RoleDao;
import com.baya.baya_project.Model.Roles;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ManagementRolesAdmin", value = "/managementRoles")
public class ManagementRolesAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RoleDao roleDao = new RoleDao();
        List<Roles> list = roleDao.getAllRoles();
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
      doGet(request, response);
    }
}