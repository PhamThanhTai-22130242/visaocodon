package com.baya.baya_project.Model;

import java.util.ArrayList;
import java.util.List;

public class ProductExcel {
    private String name;
    private String mainCategory;
    private String code;
    private String description;
    private String standard;
    private String material;
    private String size;
    private String origin;
    private int stock;
    private double price;
    private String image;
    private List<String> relatedImages;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMainCategory() {
        return mainCategory;
    }

    public void setMainCategory(String mainCategory) {
        this.mainCategory = mainCategory;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStandard() {
        return standard;
    }

    public void setStandard(String standard) {
        this.standard = standard;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public List<String> getRelatedImages() {
        return relatedImages;
    }

    public void setRelatedImages(List<String> relatedImages) {
        this.relatedImages = relatedImages;
    }

    // Phương thức trả về danh sách các URL ảnh liên quan
    public List<String> getRelatedImageLinks() {
        return relatedImages != null ? relatedImages : new ArrayList<>();
    }

    @Override
    public String toString() {
        return "ProductExcel{" +
                "productID='" + code + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", stock=" + stock +
                ", description='" + description + '\'' +
                ", standard='" + standard + '\'' +
                ", material='" + material + '\'' +
                ", size='" + size + '\'' +
                ", origin='" + origin + '\'' +
                ", thumbnail='" + image + '\'' +
                ", relatedImages=" + relatedImages +
                '}';
    }
}
