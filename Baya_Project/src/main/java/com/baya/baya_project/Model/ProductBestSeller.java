package com.baya.baya_project.Model;

public class ProductBestSeller {
    private String productID;
    private String name;
    private int totalSold;

    public ProductBestSeller(String productID, String name, int totalSold) {
        this.productID = productID;
        this.name = name;
        this.totalSold = totalSold;
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

    public int getTotalSold() {
        return totalSold;
    }

    public void setTotalSold(int totalSold) {
        this.totalSold = totalSold;
    }
}

