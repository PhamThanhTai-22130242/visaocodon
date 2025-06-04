package com.baya.baya_project.Model;

public class Inventory {
    private String productID;
    private int quantity;

    public Inventory() {}

    public Inventory(String product_id, int quantity) {
        this.productID = product_id;
        this.quantity = quantity;
    }

    public String getProduct_id() {
        return productID;
    }

    public void setProduct_id(String product_id) {
        this.productID = product_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
