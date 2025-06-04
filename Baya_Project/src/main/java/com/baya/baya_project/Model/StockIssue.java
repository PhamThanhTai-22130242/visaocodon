package com.baya.baya_project.Model;

import java.time.LocalDateTime;
import java.util.List;

public class StockIssue {
    private int id;
    private int userID;
    private Integer orderID;
    private LocalDateTime issue_date;
    private String note;
    private String issue_type;
    private List<StockIssueDetail> items;


    public StockIssue() {}

    public StockIssue(int id, int admin_id, Integer order_id, String note, String issue_type) {
        this.id = id;
        this.userID = admin_id;
        this.orderID = order_id;
        this.issue_date = LocalDateTime.now();
        this.note = note;
        this.issue_type = issue_type;
    }


    public StockIssue(int admin_id, Integer order_id, String note, String issue_type) {
        this.userID = admin_id;
        this.orderID = order_id;
        this.note = note;
        this.issue_type = issue_type;
    }

    public StockIssue(int userID, String note, String receiptType) {
        this.userID = userID;
        this.note = note;
        this.issue_type = receiptType;
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

    public Integer getOrder_id() {
        return orderID;
    }

    public void setOrder_id(Integer order_id) {
        this.orderID = order_id;
    }

    public LocalDateTime getIssue_date() {
        return issue_date;
    }

    public void setIssue_date(LocalDateTime issue_date) {
        this.issue_date = issue_date;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getIssue_type() {
        return issue_type;
    }

    public int getUserID() {
        return userID;
    }

    public List<StockIssueDetail> getItems() {
        return items;
    }

    public void setItems(List<StockIssueDetail> items) {
        this.items = items;
    }

    public void setIssue_type(String issue_type) {
        this.issue_type = issue_type;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Integer getOrderID() {
        return orderID;
    }

    public void setOrderID(Integer orderID) {
        this.orderID = orderID;
    }

    public void setItems(List<StockIssueDetail> details, String issueType) {
        this.items = details;
        for (StockIssueDetail detail : details) {
            detail.setIssue_type(issueType);
        }
    }
}
