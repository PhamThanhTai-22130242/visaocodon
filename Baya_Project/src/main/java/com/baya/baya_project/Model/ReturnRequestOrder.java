package com.baya.baya_project.Model;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class ReturnRequestOrder {
    private int returnOrderID;
    private int orderID;
    private LocalDateTime requestDate;
    private LocalDateTime responseDate;
    private String reason;
    private String imagePath;
    private String status;
    private String adminNote;
    private int imported;

    public ReturnRequestOrder() {
    }

    public ReturnRequestOrder(int orderID,String reason,
                              String imagePath, String status, String adminNote) {
        this.orderID = orderID;
        this.reason = reason;
        this.imagePath = imagePath;
        this.status = status;
        this.adminNote = adminNote;
        this.responseDate =null;
        this.imported = 0;
    }


    public int getReturnID() {
        return returnOrderID;
    }

    public void setReturnID(int returnID) {
        this.returnOrderID = returnID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public LocalDateTime getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(LocalDateTime requestDate) {
        this.requestDate = requestDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAdminNote() {
        return adminNote;
    }

    public void setAdminNote(String adminNote) {
        this.adminNote = adminNote;
    }

    public LocalDateTime getResponseDate() {
        return responseDate;
    }

    public int getReturnOrderID() {
        return returnOrderID;
    }

    public void setReturnOrderID(int returnOrderID) {
        this.returnOrderID = returnOrderID;
    }

    public void setResponseDate(LocalDateTime responseDate) {
        this.responseDate = responseDate;
    }
    public String getFormattedDateResponse() {
        if (responseDate == null) return "Chưa phản hồi";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("'Ngày' dd 'tháng' MM 'năm' yyyy");
        return responseDate.format(formatter);
    }
    public String getFormattedDateRequest() {
        if (responseDate == null) return "Chưa phản hồi";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("'Ngày' dd 'tháng' MM 'năm' yyyy");
        return requestDate.format(formatter);
    }

    public int getImported() {
        return imported;
    }

    public void setImported(int imported) {
        this.imported = imported;
    }


}
