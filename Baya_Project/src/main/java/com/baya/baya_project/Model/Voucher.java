package com.baya.baya_project.Model;


public class Voucher {


    private int voucherID;
    private String code;
    private String name;
    private String description;
    private int typeID;
    private int voucherPercent;
    private int voucherCash;
    private int maximumValue;

    private int minOrderValue;

    private String startDate;
    private String endDate;
    private String category_voucher;
    private int quantity;
    private int quantity_used;



    public Voucher() {
    }

    public Voucher(int voucherID, String code, String name, String description, int typeID, int voucherPercent, int voucherCash, int maximumValue, int minOrderValue, String startDate, String endDate) {
        this.voucherID = voucherID;
        this.code = code;
        this.name = name;
        this.description = description;
        this.typeID = typeID;
        this.voucherPercent = voucherPercent;
        this.voucherCash = voucherCash;
        this.maximumValue = maximumValue;
        this.minOrderValue = minOrderValue;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getVoucherID() {
        return voucherID;
    }

    public void setVoucherID(int voucherID) {
        this.voucherID = voucherID;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getTypeID() {
        return typeID;
    }

    public void setTypeID(int typeID) {
        this.typeID = typeID;
    }

    public int getVoucherPercent() {
        return voucherPercent;
    }

    public void setVoucherPercent(int voucherPercent) {
        this.voucherPercent = voucherPercent;
    }

    public int getVoucherCash() {
        return voucherCash;
    }

    public void setVoucherCash(int voucherCash) {
        this.voucherCash = voucherCash;
    }

    public int getMaximumValue() {
        return maximumValue;
    }

    public void setMaximumValue(int maximumValue) {
        this.maximumValue = maximumValue;
    }


    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public int getMinOrderValue() {
        return minOrderValue;
    }

    public void setMinOrderValue(int minOrderValue) {
        this.minOrderValue = minOrderValue;
    }



    @Override
    public String toString() {
        return "Voucher{" +
                "voucherID=" + voucherID +
                ", code='" + code + '\'' +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", typeID=" + typeID +
                ", voucherPercent=" + voucherPercent +
                ", voucherCash=" + voucherCash +
                ", maximumValue=" + maximumValue +
                ", minOrderValue=" + minOrderValue +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                '}';
    }


    public int getQuantity() {
        return quantity;
    }

    public String getCategory_voucher() {
        return category_voucher;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setCategory_voucher(String category_voucher) {
        this.category_voucher = category_voucher;
    }

    public int getQuantity_used() {
        return quantity_used;
    }

    public void setQuantity_used(int quantity_used) {
        this.quantity_used = quantity_used;
    }

    public int voucher_percentUsed(){
        return (quantity_used*100)/quantity;
    }

}