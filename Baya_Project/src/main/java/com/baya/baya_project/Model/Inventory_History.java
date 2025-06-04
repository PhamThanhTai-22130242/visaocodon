package com.baya.baya_project.Model;

import java.time.LocalDateTime;

public class Inventory_History {

    private int id;
    private String productID;
    private String changeType;
    private int relatedId;
    private int quantityChange;
    private int oldQuantity;
    private int newQuantity;
    private LocalDateTime changeDate;
    private int changedBy;
    private String note;

    public Inventory_History() {
    }

    public Inventory_History(int id, String productID, String changeType, int relatedId,
                             int quantityChange, int oldQuantity, int newQuantity,
                             LocalDateTime changeDate, int changedBy, String note) {
        this.id = id;
        this.productID = productID;
        this.changeType = changeType;
        this.relatedId = relatedId;
        this.quantityChange = quantityChange;
        this.oldQuantity = oldQuantity;
        this.newQuantity = newQuantity;
        this.changeDate = changeDate;
        this.changedBy = changedBy;
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getChangeType() {
        return changeType;
    }

    public void setChangeType(String changeType) {
        this.changeType = changeType;
    }

    public int getRelatedId() {
        return relatedId;
    }

    public void setRelatedId(int relatedId) {
        this.relatedId = relatedId;
    }

    public int getQuantityChange() {
        return quantityChange;
    }

    public void setQuantityChange(int quantityChange) {
        this.quantityChange = quantityChange;
    }

    public int getOldQuantity() {
        return oldQuantity;
    }

    public void setOldQuantity(int oldQuantity) {
        this.oldQuantity = oldQuantity;
    }

    public int getNewQuantity() {
        return newQuantity;
    }

    public void setNewQuantity(int newQuantity) {
        this.newQuantity = newQuantity;
    }

    public LocalDateTime getChangeDate() {
        return changeDate;
    }

    public void setChangeDate(LocalDateTime changeDate) {
        this.changeDate = changeDate;
    }

    public int getChangedBy() {
        return changedBy;
    }

    public void setChangedBy(int changedBy) {
        this.changedBy = changedBy;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
