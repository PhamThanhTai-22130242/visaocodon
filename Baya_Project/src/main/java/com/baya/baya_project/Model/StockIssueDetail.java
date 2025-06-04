package com.baya.baya_project.Model;

public class StockIssueDetail {
    private int issueID;
    private String productID;
    private int quantity;
    private double unit_price;
    private String issue_type;

    public StockIssueDetail() {}

    public StockIssueDetail( String product_id, int quantity,double unit_price) {
        this.productID = product_id;
        this.quantity = quantity;
        this.unit_price = unit_price;
    }


    public StockIssueDetail( String product_id, int quantity) {
        this.productID = product_id;
        this.quantity = quantity;
    }

    public int getIssue_id() {
        return issueID;
    }

    public void setIssue_id(int issue_id) {
        this.issueID = issue_id;
    }

    public String getProduct_id() {
        return productID;
    }

    public void setProduct_id(String product_id) {
        this.productID   = product_id;
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

    public void setIssueID(int issueID) {
        this.issueID = issueID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public void setUnit_price(double unit_price) {
        this.unit_price = unit_price;
    }

    public String getIssue_type() {
        return issue_type;
    }

    public void setIssue_type(String issue_type) {
        this.issue_type = issue_type;
    }
}
