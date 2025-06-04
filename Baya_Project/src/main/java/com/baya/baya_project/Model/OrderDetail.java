package com.baya.baya_project.Model;

public class OrderDetail {

    private int orderID;
    private String productID;
    String name;
    int price;
    int discountDefault;
    String thumbnail;
    private int quantity;
    private int totalPrice;

    public OrderDetail(int orderId, String productId, String name, int price, int discountDefault, String thumbnail, int quantity, int totalPrice) {
        this.orderID = orderId;
        this.productID = productId;
        this.name = name;
        this.price = price;
        this.discountDefault = discountDefault;
        this.thumbnail = thumbnail;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
    }

    public OrderDetail() {

    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDiscountDefault() {
        return discountDefault;
    }

    public void setDiscountDefault(int discountDefault) {
        this.discountDefault = discountDefault;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int totalPriceCartItem() {
        int discountedPrice = (int) (price * (1 - discountDefault / 100.0));
        return discountedPrice * quantity;
    }


    public int getPriceAfterDiscount() {
        return (int) (price - (price * discountDefault / 100.0f));
    }


    @Override
    public String toString() {
        return "OrderDetail{" +
                "orderID=" + orderID +
                ", productID='" + productID + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", discountDefault=" + discountDefault +
                ", thumbnail='" + thumbnail + '\'' +
                ", quantity=" + quantity +
                ", totalPrice=" + totalPrice +
                '}';
    }
}
