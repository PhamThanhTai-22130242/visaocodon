package com.baya.baya_project.Dao.mapper;

import com.baya.baya_project.Model.ReviewProduct;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ReviewProductRowMapper implements RowMapper<ReviewProduct> {
    @Override
    public ReviewProduct map(ResultSet rs, StatementContext ctx) throws SQLException {
        ReviewProduct rp = new ReviewProduct();

        rp.setReviewID(rs.getInt("reviewID"));
        rp.setProductID(rs.getString("productID"));
        rp.setUserID(rs.getInt("userID"));
        rp.setCreatedAt(rs.getDate("createdAt"));
        rp.setComment(rs.getString("comment"));
        rp.setRating(rs.getInt("rating"));
        rp.setFullName(rs.getString("fullName"));
        rp.setName(rs.getString("name"));
        rp.setHidden(rs.getInt("hidden"));
        rp.setQuanlitySell(rs.getInt("quanlitySell"));



        return rp;

    }
}
