package com.baya.baya_project.Controller;
import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Dao.UserRoleDao;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.Model.UserRoleDTO;
import com.baya.baya_project.service.UserRoleService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadAllManagementUser", value = "/loadAllManagementUser")
public class LoadAllManagementUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDao = new UserDAO();
        UserRoleService userRoleService = new UserRoleService();
        List<UserRoleDTO> list = userRoleService.findAll();
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