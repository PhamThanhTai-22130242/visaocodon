package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.FeatureActionDao;
import com.baya.baya_project.Dao.ResourceDao;
import com.baya.baya_project.Model.FeatureAction;
import com.baya.baya_project.Model.Resource;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LoadAllResource", value = "/loadAllResource")
public class LoadAllResource extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResourceDao resourceDao = new ResourceDao();
        List<Resource> list = resourceDao.selectAllResource();
        FeatureActionDao featureActionDao = new FeatureActionDao();
        List<FeatureAction> list1 = featureActionDao.getFeaturesWithActions();
        System.out.println(list1);

        System.out.println(list.toString());
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list",list1.toArray());

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonObject.toString());
        System.out.println(jsonObject.toString());
    }
}