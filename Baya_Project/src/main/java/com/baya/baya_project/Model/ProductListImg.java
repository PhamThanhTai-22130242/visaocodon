package com.baya.baya_project.Model;



import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.time.LocalDateTime;
import java.util.List;

public class ProductListImg {
    private String productID;
    private String name;
    private int price;
    private int discountDefault;
    private String description;
    private String categoryID;
    private int quanlityStock;
    private int quanlitySell;
    private String thumbnail;
    private double rating;
    private LocalDateTime createAt;
    private List<SubImage> subImageList;

    private Specification specification;


    public ProductListImg(String productID, String name, int price, String description, String categoryID, int quanlityStock, int quanlitySell, String thumbnail, LocalDateTime createAt,  List<SubImage> subImageList, Specification specification) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.discountDefault = 0;
        this.description = description;
        this.categoryID = categoryID;
        this.quanlityStock = quanlityStock;
        this.quanlitySell = quanlitySell;
        this.thumbnail = thumbnail;
        this.rating = 5;
        this.createAt = createAt;
        this.subImageList = subImageList;
        this.specification = specification;
    }
//    public ProductListImg(String productID, String name, int price, int discountDefault, String description, String categoryID, int quanlityStock, int quanlitySell, String thumbnail, double rating, LocalDateTime createAt,List<SubImage> subImageList) {
//        this.productID = productID;
//        this.name = name;
//        this.price = price;
//        this.discountDefault = discountDefault;
//        this.description = description;
//        this.categoryID = categoryID;
//        this.quanlityStock = quanlityStock;
//        this.quanlitySell = quanlitySell;
//        this.thumbnail = thumbnail;
//        this.rating = rating;
//        this.createAt = createAt;
//    }
    public ProductListImg() {

    }

    public String getProductID() {
        return productID;
    }

    public String getName() {
        return name;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public int getPrice() {
        return price;
    }

    public int getDiscountDefault() {
        return discountDefault;
    }

    public String getDescription() {
        return description;
    }


    public String getcategoryID() {
        return categoryID;
    }

    public int getQuanlityStock() {
        return quanlityStock;
    }

    public int getQuanlitySell() {
        return quanlitySell;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setDiscountDefault(int discountDefault) {
        this.discountDefault = discountDefault;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public void setcategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public void setQuanlityStock(int quanlityStock) {
        this.quanlityStock = quanlityStock;
    }

    public void setQuanlitySell(int quanlitySell) {
        this.quanlitySell = quanlitySell;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }

    public List<SubImage> getSubImageList() {
        return subImageList;
    }

    public void setSubImageList(List<SubImage> subImageList) {
        this.subImageList = subImageList;
    }

    public int getPriceAfterDiscount() {
        return (int) (price - (price * discountDefault / 100.0f));
    }

    public String formatPrice(int price) {
        DecimalFormatSymbols dec = new DecimalFormatSymbols();
        dec.setDecimalSeparator('.');

        DecimalFormat decimalFormat = new DecimalFormat("#,###", dec);
        return decimalFormat.format(price);


    }


    public void setSpecification(Specification specification) {
        this.specification = specification;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productID='" + productID + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", discountDefault=" + discountDefault +
                ", description='" + description + '\'' +

                ", categoryID='" + categoryID + '\'' +

                ", quanlityStock=" + quanlityStock +
                ", quanlitySell=" + quanlitySell +
                ", thumbnail='" + thumbnail + '\'' +
                ", createAt=" + createAt +
                '}';
    }

    public Specification getSpecification() {
        return specification;
    }
}
