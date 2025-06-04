package com.baya.baya_project.Model;

import java.time.LocalDateTime;

public class SubImage {
    String subImagesID;
    String image;
    LocalDateTime createDate;
    String productID;

    public SubImage(String subImagesID, String image, LocalDateTime createDate, String productID) {
        this.subImagesID = subImagesID;
        this.image = image;
        this.createDate = createDate;
        this.productID = productID;
    }

    public SubImage() {

    }

    public String getSubImagesID() {
        return subImagesID;
    }

    public void setSubImagesID(String subImagesID) {
        this.subImagesID = subImagesID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public LocalDateTime getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDateTime createDate) {
        this.createDate = createDate;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    @Override
    public String toString() {
        return "SubImage{" +
                "subImagesID='" + subImagesID + '\'' +
                ", image='" + image + '\'' +
                ", createDate=" + createDate +
                ", productID='" + productID + '\'' +
                '}';
    }

    public String getImgPath() {
        return null;
    }
}
