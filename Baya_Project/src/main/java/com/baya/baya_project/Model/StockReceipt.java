package com.baya.baya_project.Model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class StockReceipt {
    private int id;
    private int userID;
    private LocalDateTime receipt_date;
    private String note;
    private String receipt_type;
    private List<StockReceiptDetail> items = new ArrayList<>();


    public StockReceipt() {}

    public StockReceipt(int id, int userID, String note, String receipt_type) {
        this.id = id;
        this.userID = userID;
        this.note = note;
        this.receipt_type = receipt_type;
    }

    public StockReceipt(int userID, LocalDateTime receipt_date, String note, String receipt_type) {
        this.userID = userID;
        this.receipt_date = receipt_date;
        this.note = note;
        this.receipt_type = receipt_type;
    }

    public StockReceipt(int userID, String note, String receipt_type) {
        this.userID = userID;
        this.receipt_date = LocalDateTime.now();
        this.note = note;
        this.receipt_type = receipt_type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAdmin_id() {
        return userID;
    }

    public void setAdmin_id(int admin_id) {
        this.userID = admin_id;
    }

    public LocalDateTime getReceipt_date() {
        return receipt_date;
    }

    public void setReceipt_date(LocalDateTime receipt_date) {
        this.receipt_date = receipt_date;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getReceipt_type() {
        return receipt_type;
    }

    public void setReceipt_type(String receipt_type) {
        this.receipt_type = receipt_type;
    }


    public List<StockReceiptDetail> getItems() {
        return items;
    }

    public void setItems(List<StockReceiptDetail> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return "StockReceipt{" +
                "id=" + id +
                ", userID=" + userID +
                ", receipt_date=" + receipt_date +
                ", note='" + note + '\'' +
                ", type='" + receipt_type + '\'' +

                '}';
    }

    public void setItems(List<StockReceiptDetail> details, String receiptType) {
        this.items=details;
        for (StockReceiptDetail detail : details) {
            detail.setReceipt_type(receiptType);
        }
    }
}

