package com.baya.baya_project.Model;

public class Specification {
    private String specificationID;
    private String dimensions;
    private String material;
    private String original;
    private String standard;

    public Specification(String specificationID, String dimensions, String material, String original, String standard) {
        this.specificationID = specificationID;
        this.dimensions = dimensions;
        this.material = material;
        this.original = original;
        this.standard = standard;
    }

    public Specification() {

    }

    public String getSpecificationID() {
        return specificationID;
    }

    public void setSpecificationID(String specificationID) {
        this.specificationID = specificationID;
    }

    public String getDimensions() {
        return dimensions;
    }

    public void setDimensions(String dimensions) {
        this.dimensions = dimensions;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getOriginal() {
        return original;
    }

    public void setOriginal(String original) {
        this.original = original;
    }

    public String getStandard() {
        return standard;
    }

    public void setStandard(String standard) {
        this.standard = standard;
    }

    @Override
    public String toString() {
        return "Specification{" +
                "specificationID='" + specificationID + '\'' +
                ", dimensions='" + dimensions + '\'' +
                ", material='" + material + '\'' +
                ", original='" + original + '\'' +
                ", standard='" + standard + '\'' +
                '}';
    }
}
