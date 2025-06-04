package com.baya.baya_project.Model;

import java.util.Date;
import java.util.concurrent.TimeUnit;

public class ReviewProduct {
    int reviewID;
    String productID;
    String name;
    int quanlitySell;
    int userID;
    String fullName;
    int rating;
    String comment;
    Date createdAt;
    String formatCreatedAt;
    int hidden;

    public ReviewProduct(int reviewID, String productID, String name, int quanlitySell,
                         int userID, String fullName, int rating, String comment,
                         Date createdAt, int hidden) {
        this.reviewID = reviewID;
        this.productID = productID;
        this.name = name;
        this.quanlitySell = quanlitySell;
        this.userID = userID;
        this.fullName = fullName;
        this.rating = rating;
        this.comment = comment;
        this.createdAt = createdAt;
        this.hidden = hidden;
        this.formatCreatedAt = this.formatCreateAt();
    }

    public ReviewProduct(String productID, int userID, Date createdAt, String comment, int rating) {
        this.productID = productID;
        this.userID = userID;
        this.createdAt = createdAt;
        this.comment = comment;
        this.rating = rating;
        this.formatCreatedAt = this.formatCreateAt();
    }

    public ReviewProduct() {
    }

    public int getReviewID() {
        return reviewID;
    }

    public void setReviewID(int reviewID) {
        this.reviewID = reviewID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuanlitySell() {
        return quanlitySell;
    }

    public void setQuanlitySell(int quanlitySell) {
        this.quanlitySell = quanlitySell;
    }

    public String getFormatCreatedAt() {
        return formatCreatedAt;
    }

    public void setFormatCreatedAt(String formatCreatedAt) {
        this.formatCreatedAt = formatCreatedAt;
    }

    public int getHidden() {
        return hidden;
    }

    public void setHidden(int hidden) {
        this.hidden = hidden;
    }

    public String formatCreateAt() {
        Date currentDate = new Date();
        long diffInMillies = currentDate.getTime() - createdAt.getTime();
        long daysDiff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);

        if (daysDiff == 0) {
            return "hôm nay";
        } else {
            return daysDiff + " ngày trước";
        }
    }

    @Override
    public String toString() {
        return "ReviewProduct{" +
                "reviewID=" + reviewID +
                ", productID='" + productID + '\'' +
                ", name='" + name + '\'' +
                ", quanlitySell=" + quanlitySell +
                ", userID=" + userID +
                ", fullName='" + fullName + '\'' +
                ", rating=" + rating +
                ", comment='" + comment + '\'' +
                ", createdAt=" + createdAt +
                ", hidden=" + hidden +
                '}';
    }
}
