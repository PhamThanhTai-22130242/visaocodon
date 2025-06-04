package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.NewsDao;
import com.baya.baya_project.Model.News;
import com.baya.baya_project.Model.ProductListImg;
import com.baya.baya_project.service.ProductAdminService;
import com.baya.baya_project.service.UserAdminService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteProduct", value = "/deleteProduct")
public class DeleteProductAdmin extends HttpServlet {

}