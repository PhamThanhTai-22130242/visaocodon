package com.baya.baya_project.Model;

public class OrderStatusSummary {
    private String statusName;
    private int count;

    public OrderStatusSummary() {}

    public OrderStatusSummary(String statusName, int count) {
        this.statusName = statusName;
        this.count = count;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
