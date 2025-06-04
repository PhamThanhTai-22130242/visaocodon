package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ResourceDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "editResource", value = "/editResource")
public class EditResource extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String featureID = request.getParameter("featureID");
        String featureName = request.getParameter("featureName");
        ResourceDao resourceDao = new ResourceDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}