package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Model.*;
import com.baya.baya_project.service.LogService;
import com.baya.baya_project.service.OrderService;
import com.baya.baya_project.service.ReviewProductService;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "WriteReviewProduct", value = "/write-review-product")
public class WriteReviewProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("oke review");
        String reviewText = request.getParameter("content");
        String productId = request.getParameter("id");
        String rating = request.getParameter("rating")==null?"5":request.getParameter("rating");

        System.out.println(reviewText+" "+productId+" "+rating);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession(true).getAttribute("user");

        JSONObject json = new JSONObject();

        String reviewText = request.getParameter("content");
        String productId = request.getParameter("id");
        String rating = request.getParameter("rating")==null?"5":request.getParameter("rating");
        ReviewProductService service = new ReviewProductService();
        LogService logService = new LogService();



        if(user == null ) {
            json.put("error", true);
            json.put("success",false);
            json.put("message", "Vui lòng đăng nhập để bình luận");
            response.getWriter().write(json.toString());
            return;
        }

        String beforeData= "UserId : "+ user.getUserID()+" đang thực hiện thực bình luận với productId "+productId ;
        String location ="Bình luận";
        String afterData="";



        if(!service.checkUserPurchasedProduct(productId,user.getUserID())){
            json.put("error", true);
            json.put("success",false);
            json.put("message", "Vui lòng mua sản phẩm để bình luận");
            afterData="bình luận thất bại do user chưa mua sản phẩm";
            logService.infor(user.getUserID(), location,beforeData,afterData);
            response.getWriter().write(json.toString());
            return;
        }
        ReviewProduct rp = service.insertReviewComment(productId,user.getUserID(),rating,reviewText);

        if(rp!=null){
            json.put("success",true);
            json.put("rating",rp.getRating());
            json.put("comment",rp.getComment());
            json.put("fullName",user.getFullName());
            json.put("createAt",rp.formatCreateAt());
            afterData = " bình luận thành công  "+ productId+" với nội dung "+ reviewText;
        }else{
            json.put("success",false);
        }


        logService.infor(user.getUserID(), location,beforeData,afterData);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json.toString());
    }


}