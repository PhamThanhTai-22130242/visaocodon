package com.baya.baya_project.Dao;

import com.baya.baya_project.Dao.mapper.ReviewProductRowMapper;
import com.baya.baya_project.Model.ReviewProduct;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class ReviewProductDao implements DaoInterface <ReviewProduct>{

    public Jdbi jdbi;

    public ReviewProductDao() {
        jdbi = JDBIConnector.getJdbi();
    }

    @Override
    public List<ReviewProduct> selectAll() {
        return jdbi.withHandle(ha -> {
            return ha.createQuery(
                    "SELECT p.reviewID, p.productID, p.hidden, u.userID, u.fullName, p.rating, p.comment, p.createdAt, pr.name, pr.quanlitySell " +
                            "FROM product_reviews p " +
                            "JOIN users u ON p.userID = u.userID " +
                            "JOIN products pr ON pr.productID = p.productID"
            ).map(new ReviewProductRowMapper()).list();
        });
    }

    @Override
    public ReviewProduct selectById(String id) {
        return null;
    }

    @Override
    public ReviewProduct selectById(int id) {

        return jdbi.withHandle(handle -> {
            return handle.createQuery(
                            "SELECT pr.reviewID,pr.productID,pr.userID,pr.hidden,pr.`comment`,pr.createdAt,pr.rating,u.fullName,p.name,p.quanlitySell from product_reviews pr JOIN users u ON PR.userID=U.userID JOIN products p ON p.productID=pr.productID\n" +
                                    "WHERE pr.productID = ?"
                    ).
                    bind(0, id).
                    map(new ReviewProductRowMapper()).findOne().orElse(null);
        });

    }

    @Override
    public int insert(ReviewProduct reviewProduct) {
        return jdbi.withHandle(handle -> {
            return handle.createUpdate("INSERT INTO product_reviews (productID, userID, createdAt, comment, rating) " + "VALUES (:productID, :userID, :createdAt, :comment, :rating)")
                    .bind("productID", reviewProduct.getProductID())
                    .bind("userID", reviewProduct.getUserID())
                    .bind("createdAt", reviewProduct.getCreatedAt())
                    .bind("comment", reviewProduct.getComment())
                    .bind("rating", reviewProduct.getRating())
                    .execute();
        });

    }




    @Override
    public int update(ReviewProduct reviewProduct) {
        return 0;
    }

    @Override
    public int delete(String id) {
        return 0;
    }

    public List<ReviewProduct> selectByProductId(String productId) {

        return jdbi.withHandle(handle -> {
            return handle.createQuery(
                    "SELECT pr.reviewID, pr.productID, pr.hidden, pr.userID, pr.comment, pr.createdAt, pr.rating, " +
                            "u.fullName, p.name, p.quanlitySell " +
                            "FROM product_reviews pr " +
                            "JOIN users u ON pr.userID = u.userID " +
                            "JOIN products p ON p.productID = pr.productID " +
                            "WHERE pr.productID = ? AND pr.hidden = 0"
            ).
            bind(0, productId).
        map(new ReviewProductRowMapper()).list();
        });
    }

    public static void main(String[] args) {
        System.out.println(new ReviewProductDao().selectByProductId("MFBNCB801.B16"));
    }


    public List<ReviewProduct> selectByStar(String productId, int rating) {
        return jdbi.withHandle(handle -> {
            return handle.createQuery(
                            "SELECT pr.reviewID, pr.productID, pr.hidden, pr.userID, pr.comment, pr.createdAt, pr.rating, " +
                                    "u.fullName, p.name, p.quanlitySell " +
                                    "FROM product_reviews pr " +
                                    "JOIN users u ON pr.userID = u.userID " +
                                    "JOIN products p ON p.productID = pr.productID " +
                                    "WHERE pr.productID = ? AND rating = ? AND pr.hidden = 0"
                    ).
                    bind(0, productId).
                    bind(1, rating).
                    map(new ReviewProductRowMapper()).list();
        });
    }

    public boolean checkUserPurchasedProduct(String productId, int userID) {
        int result =  jdbi.withHandle(handle -> {
            return handle.createQuery(
                            "SELECT Count(*) from users u join orders o on u.userID=o.userID join " +
                                    "order_detail od on o.orderID =od.orderID\n" +
                            "\n" +
                            "where u.userID=? AND od.productID =?"
                    ).
                    bind(0, userID).
                    bind(1, productId).mapTo(Integer.class).findOne().orElse(-1);
        });

        return result > 0;
    }
}
