package com.baya.baya_project.Model;

import java.text.DecimalFormat;

public class ProductAdminCateDTO {
    private Product product;
    private Category category;

    // Constructor
    public ProductAdminCateDTO(Product product, Category category) {
        this.product = product;
        this.category = category;
    }
    public ProductAdminCateDTO(){

    }

    // Getters and Setters
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "ProductWithCategory{" +
                "product=" + product +
                ", category=" + category +
                '}';
    }

}
