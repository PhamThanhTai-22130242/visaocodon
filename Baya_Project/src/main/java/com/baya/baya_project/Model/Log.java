package com.baya.baya_project.Model;

import java.time.LocalDateTime;

public class Log {
    private Integer logID;
    private String label;
    private Integer userID;
    private LocalDateTime time;
    private String location;
    private String beforeData;
    private String afterData;

    public Log() {

    }

    public Log(Integer logID, String label, Integer userID, LocalDateTime time, String location, String beforeData, String afterData) {
        this.logID = logID;
        this.label = label;
        this.userID = userID;
        this.time = time;
        this.location = location;
        this.beforeData = beforeData;
        this.afterData = afterData;
    }


    public Log(String label, Integer userID, LocalDateTime time, String location, String beforeData, String afterData) {
        this.label = label;
        this.userID = userID;
        this.time = time;
        this.location = location;
        this.beforeData = beforeData;
        this.afterData = afterData;
    }

    public Integer getLogID() {
        return logID;
    }

    public void setLogID(Integer logID) {
        this.logID = logID;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getBeforeData() {
        return beforeData;
    }

    public void setBeforeData(String beforeData) {
        this.beforeData = beforeData;
    }

    public String getAfterData() {
        return afterData;
    }

    public void setAfterData(String afterData) {
        this.afterData = afterData;
    }
    @Override
    public String toString() {
        return "Log{" +
                "logID=" + logID +
                ", label='" + label + '\'' +
                ", userID=" + userID +
                ", location='" + location + '\'' +
                ", beforeData='" + beforeData + '\'' +
                ", afterData='" + afterData + '\'' +
                '}';
    }

}
