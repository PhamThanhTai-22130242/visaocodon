package com.baya.baya_project.Model;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.time.LocalDateTime;

public class Product {
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
    private double monthlySales;
    private int quantityToImport;
    private int quantityToExport;
    private int processingQuantity;
    private String note;
    private int totalQuantity;
    private int returnCount;
    private Integer returnOrderID;
    private int quantity;

public Product() {}

    public Product(String productID, String name, int price, int discountDefault, String description, String categoryID,
                   int quanlityStock, int quanlitySell, String thumbnail, double rating, LocalDateTime createAt) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.discountDefault = discountDefault;
        this.description = description;
        this.categoryID = categoryID;
        this.quanlityStock = quanlityStock;
        this.quanlitySell = quanlitySell;
        this.thumbnail = thumbnail;
        this.rating = rating;
        this.createAt = createAt;
        this.totalQuantity = quanlityStock + quantityToImport + quantityToExport;  // Tính totalQuantity
        this.returnCount = 0; // Mặc định là 0 khi khởi tạo
    }

    // Getter & Setter cho returnCount
    public int getReturnCount() {
        return returnCount;
    }

    public void setReturnCount(int returnCount) {
        this.returnCount = returnCount;
    }

    // Getter & Setter cho totalQuantity
    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    // Các Getter & Setter khác
    public String getProductID() { return productID; }
    public void setProductID(String productID) { this.productID = productID; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }
    public int getDiscountDefault() { return discountDefault; }
    public void setDiscountDefault(int discountDefault) { this.discountDefault = discountDefault; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getcategoryID() { return categoryID; }
    public void setcategoryID(String categoryID) { this.categoryID = categoryID; }

    public int getQuanlityStock() { return quanlityStock; }
    public void setQuanlityStock(int quanlityStock) { this.quanlityStock = quanlityStock; }
    public int getQuanlitySell() { return quanlitySell; }
    public void setQuanlitySell(int quanlitySell) { this.quanlitySell = quanlitySell; }
    public String getThumbnail() { return thumbnail; }
    public void setThumbnail(String thumbnail) { this.thumbnail = thumbnail; }
    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }
    public LocalDateTime getCreateAt() { return createAt; }
    public void setCreateAt(LocalDateTime createAt) { this.createAt = createAt; }
    public int getQuantityToImport() { return quantityToImport; }
    public void setQuantityToImport(int quantityToImport) { this.quantityToImport = quantityToImport; }
    public int getQuantityToExport() { return quantityToExport; }
    public void setQuantityToExport(int quantityToExport) { this.quantityToExport = quantityToExport; }
    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getPriceAfterDiscount() {
        return (int) (price - (price * discountDefault / 100.0f));
    }

    public String formatPrice(int price) {
        DecimalFormatSymbols symbols = new DecimalFormatSymbols();
        symbols.setGroupingSeparator('.');
        DecimalFormat decimalFormat = new DecimalFormat("#,###", symbols);
        return decimalFormat.format(price);
    }

    public double getFinalPrice() {
        return price - (discountDefault / 100.0) * price;
    }


    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public Integer getReturnOrderID() {
        return returnOrderID;
    }

    public void setReturnOrderID(Integer returnOrderID) {
        this.returnOrderID = returnOrderID;
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
                ", rating=" + rating +
                ", createAt=" + createAt +
                ", quantityToImport=" + quantityToImport +
                ", quantityToExport=" + quantityToExport +
                ", returnCount=" + returnCount +
                ", returnOrderID=" + returnOrderID +// In ra returnCount
                ", totalQuantity=" + totalQuantity +
                ", note='" + note + '\'' +
                '}';
    }
}
