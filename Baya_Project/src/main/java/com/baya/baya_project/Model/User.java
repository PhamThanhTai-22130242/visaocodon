package com.baya.baya_project.Model;

import org.jdbi.v3.core.mapper.reflect.ColumnName;

import java.io.Serializable;
import java.time.LocalDateTime;


public class User implements Serializable {
    @ColumnName("userID")
    private int userID;
    @ColumnName("fullName")
    private String fullName;
    @ColumnName("email")
    private String email;
    @ColumnName("password")
    private String password;
    @ColumnName("phoneNumber")
    private String phoneNumber;
    @ColumnName("accountType")
    private Integer accountType;
    @ColumnName("createAt")
    private LocalDateTime createAt;

    @ColumnName("statusID")
    private int statusID;

    @ColumnName("description")
    private String description;

    @ColumnName("banned")
    private String banned;

    public User(int userID, String fullName, String email, String password, String phoneNumber, int accountType, LocalDateTime createAt,int statusID,String description,int banned) {
        this.userID = userID;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.accountType = accountType;
        this.createAt = createAt;
        this.statusID = statusID;

    }

    public User() {

    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Integer getAccountType() {
        return accountType;
    }

    public void setAccountType(Integer accountType) {
        this.accountType = accountType;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    public String getBanned() {
        return banned;
    }

    public void setBanned(String banned) {
        this.banned = banned;
    }
    @Override
    public String toString() {
        return "User{" +
                "userID=" + userID +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", accountType=" + accountType +
                ", createAt=" + createAt +
                ", statusID=" + statusID +
                '}';
    }

    public static void main(String[] args) {
        LocalDateTime before = LocalDateTime.of(2020, 1, 1, 0, 0);
        LocalDateTime time = LocalDateTime.now();


        System.out.println(time.compareTo(before));

    }


}