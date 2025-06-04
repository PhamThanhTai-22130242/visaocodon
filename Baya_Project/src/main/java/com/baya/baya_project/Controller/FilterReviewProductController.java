package com.baya.baya_project.Controller;

import com.baya.baya_project.Model.*;
import com.baya.baya_project.service.ReviewProductService;
import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FilterComment", value = "/filter-review-product")
public class FilterReviewProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String productId = request.getParameter("id");
        String rating = request.getParameter("rating")==null?"5":request.getParameter("rating");

        ReviewProductService service = new ReviewProductService();
        List<ReviewProduct> list =  service.getReviewProductByStar(productId,Integer.parseInt(rating));
//fgrthy
//


        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        Gson gson = new Gson();
        response.getWriter().write(gson.toJson(list));


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession(true).getAttribute("user");

        JSONObject json = new JSONObject();

        if(user == null) {
            json.put("islogin", false);
            json.put("message", "Vui lòng đăng nhập để bình luận");
            response.getWriter().write(json.toString());
            return;
        }


        json.put("islogin", true);

        System.out.println("oke review");
        String reviewText = request.getParameter("content");
        String productId = request.getParameter("id");
        String rating = request.getParameter("rating")==null?"5":request.getParameter("rating");

        System.out.println(reviewText+" "+productId+" "+rating);

        ReviewProductService service = new ReviewProductService();
        ReviewProduct rp = service.insertReviewComment(productId,user.getUserID(),rating,reviewText);


        if(rp!=null){
            json.put("success",true);
            json.put("rating",rp.getRating());
            json.put("comment",rp.getComment());
            json.put("fullName",user.getFullName());
            json.put("createAt",rp.formatCreateAt());
        }else{
            json.put("success",false);
        }


        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json.toString());

    }


}