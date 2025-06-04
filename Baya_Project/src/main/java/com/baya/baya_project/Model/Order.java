package com.baya.baya_project.Model;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class Order {

    private int orderId;
    private int userId;
    private String fullname;
    private String email;
    private int phoneNumber;
    private String address;

    private int paymentID;

    private String paymentName;
    private String orderStatusName;
    private int orderStatusID;

    private int totalPrice;
    private Date createAt;
    private Date deliveredDate;
    private List<OrderDetail> items;
    String note;
    int fee;
    int discount;

    public Order(int orderId, int userId, String fullname, String email, int phoneNumber, String address, int paymentID, String paymentName, String orderStatusName, int orderStatusID, int totalPrice, Date createAt, Date deliveredDate, List<OrderDetail> items, String note) {
        this.orderId = orderId;
        this.userId = userId;
        this.fullname = fullname;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.paymentID = paymentID;
        this.paymentName = paymentName;
        this.orderStatusName = orderStatusName;
        this.orderStatusID = orderStatusID;
        this.totalPrice = totalPrice;
        this.createAt = createAt;
        this.deliveredDate = deliveredDate;
        this.items = items;
        this.note = note;
    }


    public Order(int orderId, int userId, String fullname, String email, int phoneNumber, String address, int paymentID, String paymentName, String orderStatusName, int orderStatusID, int totalPrice, Date createAt, Date deliveredDate, List<OrderDetail> items, String note, int fee, int discount) {
        this.orderId = orderId;
        this.userId = userId;
        this.fullname = fullname;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.paymentID = paymentID;
        this.paymentName = paymentName;
        this.orderStatusName = orderStatusName;
        this.orderStatusID = orderStatusID;
        this.totalPrice = totalPrice;
        this.createAt = createAt;
        this.deliveredDate = deliveredDate;
        this.items = items;
        this.note = note;
        this.fee = fee;
        this.discount = discount;
    }

    public Order() {}

    public Order(String orderId, String fullname, String email, String phoneNumber, String address, String paymentMethod, String status, String note) {
        this.orderId = Integer.parseInt(orderId);
        this.fullname = fullname;
        this.email = email;
        this.phoneNumber = Integer.parseInt(phoneNumber);
        this.address = address;
        this.paymentName = paymentMethod;
        this.orderStatusID = Integer.parseInt(status);
        this.note = note;
    }



    public int getOrderId() {
        return orderId;
    }

    public int getUserId() {
        return userId;
    }

    public String getFullname() {
        return fullname;
    }

    public String getEmail() {
        return email;
    }

    public int getPhoneNumber() {
        return phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public String getPaymentName() {
        return paymentName;
    }

    public String getOrderStatusName() {
        return orderStatusName;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public Date getDeliveredDate() {
        return deliveredDate;
    }

    public List<OrderDetail> getItems() {
        return items;
    }

    public String getNote() {
        return note;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPaymentName(String paymentName) {
        this.paymentName = paymentName;
    }

    public void setOrderStatusName(String orderStatusName) {
        this.orderStatusName = orderStatusName;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public void setDeliveredDate(Date deliveredDate) {
        this.deliveredDate = deliveredDate;
    }

    public void setItems(List<OrderDetail> items) {
        this.items = items;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getOrderStatusID() {
        return orderStatusID;
    }

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public void setOrderStatusID(int orderStatusID) {
        this.orderStatusID = orderStatusID;
    }

    public int getDiscount() {
        return discount;
    }

    public int getFee() {
        return fee;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }


    public String getFormattedDate() {
        SimpleDateFormat formatter = new SimpleDateFormat("'Ngày' dd 'tháng' MM 'năm' yyyy");
        return formatter.format(createAt);
    }
    public String getFormattedDateDeliver() {
        SimpleDateFormat formatter = new SimpleDateFormat("'Ngày' dd 'tháng' MM 'năm' yyyy");
        return formatter.format(deliveredDate);
    }
    public String getFormattedDateSimple() {

        SimpleDateFormat formatter = new SimpleDateFormat(" dd '/' MM '/' yyyy");
        return formatter.format(createAt);

    }

    public String getFormattedDateSimple2() {

        SimpleDateFormat formatter = new SimpleDateFormat(" dd '/' MM '/' yyyy");
        return formatter.format(deliveredDate);

    }



    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", userId=" + userId +
                ", fullname='" + fullname + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber=" + phoneNumber +
                ", address='" + address + '\'' +
                ", paymentID=" + paymentID +
                ", paymentName='" + paymentName + '\'' +
                ", orderStatusName='" + orderStatusName + '\'' +
                ", orderStatusID=" + orderStatusID +
                ", totalPrice=" + totalPrice +
                ", createAt=" + createAt +
                ", deliveredDate=" + deliveredDate +
                ", items=" + items +
                ", note='" + note + '\'' +
                ", fee=" + fee +
                ", discount=" + discount +
                '}';
    }

    public String formatPrice(int price) {
        DecimalFormatSymbols dec = new DecimalFormatSymbols();
        dec.setDecimalSeparator('.');

        DecimalFormat decimalFormat = new DecimalFormat("#,###", dec);
        return decimalFormat.format(price);


    }

    public int totalPriceAfterFeeAndDiscount(){
        return totalPrice - discount +fee;
    }

    public boolean before3Day() {
        if (orderStatusID != 3 || deliveredDate == null) {
            return false;
        }
        long diffMilies = new Date().getTime() - deliveredDate.getTime();
        long diffDays = TimeUnit.MILLISECONDS.toDays(diffMilies);
        return diffDays <= 3;
    }
}