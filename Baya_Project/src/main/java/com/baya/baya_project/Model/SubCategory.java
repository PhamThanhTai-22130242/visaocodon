package com.baya.baya_project.Model;

public class SubCategory {
    private String subCategoryID;
    private String name;
    private String thumbnail;

    private String categoryID;


    public SubCategory(String subCategoryID, String name, String thumbnail,  String categoryID) {

        this.subCategoryID = subCategoryID;
        this.name = name;
        this.thumbnail = thumbnail;

        this.categoryID = categoryID;
    }
    public SubCategory() {

    }

    public String getSubCategoryID() {
        return subCategoryID;
    }

    public void setSubCategoryID(String subCategoryID) {
        this.subCategoryID = subCategoryID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }



    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    @Override
    public String toString() {
        return "SubCategory{" +
                "subCategoryID=" + subCategoryID +
                ", name='" + name + '\'' +
                ", thumbnail='" + thumbnail + '\'' +

                ", categoryID='" + categoryID + '\'' +
                '}';
    }
}
