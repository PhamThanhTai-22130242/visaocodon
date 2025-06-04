package com.baya.baya_project.service;

import com.baya.baya_project.Dao.ReviewProductDao;
import com.baya.baya_project.Model.ReviewProduct;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import static com.baya.baya_project.Dao.JDBIConnector.jdbi;

public class ReviewProductService {

    ReviewProductDao dao;
    public ReviewProductService() {
        dao = new ReviewProductDao();
    }

    public List<ReviewProduct> getReviewProductByProductId(String productId) {

        if(dao.selectByProductId(productId)==null && dao.selectByProductId(productId).isEmpty()){
            return new ArrayList<ReviewProduct>();
        }

        return dao.selectByProductId(productId);
    }

    public double averageRating(List<ReviewProduct> list) {
        if(list==null || list.isEmpty()) return 0;
        double total = list.stream().mapToDouble(ReviewProduct::getRating).sum();

        double average = total / (double) list.size();

        DecimalFormat df = new DecimalFormat("#.0");
        return Double.parseDouble(df.format(average));
    }


    public ReviewProduct insertReviewComment(String productId, int userID, String rating, String reviewText) {
        LocalDateTime currentDateTime = LocalDateTime.now();
        Date date = Date.from(currentDateTime.atZone(ZoneId.systemDefault()).toInstant());

        ReviewProduct reviewProduct = new ReviewProduct(productId,userID,date,reviewText,Integer.parseInt(rating));


        return dao.insert(reviewProduct) > 0 ? reviewProduct : null;
    }
    public int delete(int reviewId) {
        return jdbi.withHandle(handle -> {
            return handle.createUpdate("DELETE FROM product_reviews WHERE reviewID = ?")
                    .bind(0, reviewId)
                    .execute();
        });
    }
    public int hide(int reviewId) {
        return jdbi.withHandle(handle -> {
            return handle.createUpdate("UPDATE product_reviews SET hidden = 1 WHERE reviewID = ?")
                    .bind(0, reviewId)
                    .execute();
        });
    }
    public int unhide(int reviewId) {
        return jdbi.withHandle(handle -> {
            return handle.createUpdate("UPDATE product_reviews SET hidden = 0 WHERE reviewID = ?")
                    .bind(0, reviewId)
                    .execute();
        });
    }


    public static void main(String[] args) {
        System.out.println(new ReviewProductService().checkUserPurchasedProduct("MHCBCDD02.BK5",11));
    }


    public List<ReviewProduct> getReviewProductByStar(String productId, int rating) {
        List<ReviewProduct> list;
        if(rating==0){
            list = dao.selectByProductId(productId);
        }else{
            list = dao.selectByStar(productId,rating);

        }

        return list == null ? new ArrayList<ReviewProduct>() : list;
    }

    public boolean checkUserPurchasedProduct(String productId, int userID) {
        return dao.checkUserPurchasedProduct(productId,userID);
    }


}
