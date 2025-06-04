package com.baya.baya_project.Model;

public class Actions {
    private int actionID;
    private String actionName;

    public Actions(int actionID, String actionName) {
        this.actionID = actionID;
        this.actionName = actionName;
    }
    public Actions() {}
    public int getActionID() {
        return actionID;
    }

    public void setActionID(int actionID) {
        this.actionID = actionID;
    }

    public String getActionName() {
        return actionName;
    }

    public void setActionName(String actionName) {
        this.actionName = actionName;
    }

    @Override
    public String toString() {
        return "Actions{" +
                "actionID=" + actionID +
                ", actionName='" + actionName + '\'' +
                '}';
    }
}
