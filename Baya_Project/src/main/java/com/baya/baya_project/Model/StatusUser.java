package com.baya.baya_project.Model;

public class StatusUser {

    private int statusID;
    private String nameStatus;

    public StatusUser() {

    }

    public StatusUser(int statusID, String nameStatus) {
        this.statusID = statusID;
        this.nameStatus = nameStatus;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    public String getNameStatus() {
        return nameStatus;
    }

    public void setNameStatus(String nameStatus) {
        this.nameStatus = nameStatus;
    }

    @Override
    public String toString() {
        return "StatusUser{" +
                "statusID=" + statusID +
                ", nameStatus='" + nameStatus + '\'' +
                '}';
    }
}
