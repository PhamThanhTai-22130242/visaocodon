package com.baya.baya_project.Model;

import java.math.BigDecimal;

public class StockReceiptDetail {
    private int receiptID;
    private String productID;
    private String name;
    private int quantity;
    private double unit_price;
    private String receipt_type;

    public StockReceiptDetail() {}

    public StockReceiptDetail(int receipt_id, String product_id, int quantity, double unit_price) {
        this.receiptID = receipt_id;
        this.productID = product_id;
        this.quantity = quantity;
        this.unit_price = unit_price;
    }

    public StockReceiptDetail( String product_id, int quantity, double unit_price) {
        this.productID = product_id;
        this.quantity = quantity;
        this.unit_price = unit_price;
    }



    public int getReceipt_id() {
        return receiptID;
    }

    public void setReceipt_id(int receipt_id) {
        this.receiptID = receipt_id;
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

    public double getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(double unit_price) {
        this.unit_price = unit_price;
    }

    public int getReceiptID() {
        return receiptID;
    }

    public void setReceiptID(int receiptID) {
        this.receiptID = receiptID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getReceipt_type() {
        return receipt_type;
    }

    public void setReceipt_type(String receipt_type) {
        this.receipt_type = receipt_type;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
