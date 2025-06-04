package com.baya.baya_project.DTO;

import org.jdbi.v3.core.mapper.reflect.ColumnName;

import java.time.LocalDateTime;

public class UserDTO {
    @ColumnName("userID")
    private int userID;
    @ColumnName("fullName")
    private String fullName;
    @ColumnName("email")
    private String email;
    @ColumnName("phoneNumber")
    private String phoneNumber;


    private LocalDateTime createAt;

    @ColumnName("statusID")
    private int statusID;
    @ColumnName("accountType")
    private int accountType;

    public UserDTO(int userID, String fullName, String email,String phoneNumber, LocalDateTime createAt, int statusID, int accountType) {
        this.userID = userID;
        this.fullName = fullName;
        this.email = email;

        this.phoneNumber = phoneNumber;

        this.createAt = createAt;
        this.statusID = statusID;
        this.accountType = accountType;
    }
    public UserDTO() {

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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
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

    public int getAccountType() {
        return accountType;
    }

    public void setAccountType(int accountType) {
        this.accountType = accountType;
    }

    @Override
    public String toString() {
        return "UserDTO{" +
                "userID=" + userID +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +

                ", phoneNumber='" + phoneNumber + '\'' +

                ", createAt=" + createAt +
                ", statusID=" + statusID +
                ", accountType=" + accountType +
                '}';
    }
}
