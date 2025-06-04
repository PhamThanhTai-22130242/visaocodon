package com.baya.baya_project.Model;

public class CartItem {

    String productId;
    String name;
    int price;
    int discountDefault;
    String thumbnail;
    int quantity;
    int quatityStock;

    boolean isChoose = false;

    public CartItem(String productId, String name, int price, int discountDefault, String thumbnail, int quantity,int quatityStock) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.discountDefault = discountDefault;
        this.thumbnail = thumbnail;
        this.quantity = quantity;
        isChoose = false;
        this.quatityStock = quatityStock;

    }

    public int totalPriceCartItem() {
        int discountedPrice = (int) (price * (1 - discountDefault / 100.0));
        return discountedPrice * quantity;
    }


    public int getPriceAfterDiscount() {
        return (int) (price - (price * discountDefault / 100.0f));
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
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

    public boolean isChoose() {
        return isChoose;
    }

    public void setChoose(boolean choose) {
        isChoose = choose;
    }

    public int getQuatityStock() {
        return quatityStock;
    }

    public void setQuatityStock(int quatityStock) {
        this.quatityStock = quatityStock;
    }
}