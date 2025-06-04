package com.baya.baya_project.Model;

import java.text.SimpleDateFormat;

public class Resource {
    private int featureID;
    private String featureName;

    public Resource(int featureID, String featureName) {
        this.featureID = featureID;
        this.featureName = featureName;
    }
    public Resource() {}

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


    @Override
    public String toString() {
        return "Resource{" +
                "featureID=" + featureID +
                ", featureName='" + featureName + '\'' +
                '}';
    }
}
