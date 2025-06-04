package com.baya.baya_project.Model;

import java.util.List;

public class FeatureAction {
    private int featureID;
    private String featureName;
    private List<Integer> actionID;

    public FeatureAction(int featureID, String featureName, List<Integer> actionIDs) {
        this.featureID = featureID;
        this.featureName = featureName;
        this.actionID = actionIDs;
    }

    public int getFeatureID() {
        return featureID;
    }

    public void setFeatureID(int featureID) {
        this.featureID = featureID;
    }

    public String getFeatureName() {
        return featureName;
    }

    public void setFeatureName(String featureName) {
        this.featureName = featureName;
    }

    public List<Integer> getActionIDs() {
        return actionID;
    }

    public void setActionIDs(List<Integer> actionIDs) {
        this.actionID = actionIDs;
    }

    @Override
    public String toString() {
        return "FeatureAction{" +
                "featureID=" + featureID +
                ", featureName='" + featureName + '\'' +
                ", actionIDs=" + actionID +
                '}';
    }
}
