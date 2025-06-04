package com.baya.baya_project.Model;

public class Category {
    private String categoryID;
    private String name;
    private String thumbnail;

    public Category(String categoryID, String name, String thumbnail) {
        this.categoryID = categoryID;
        this.name = name;
        this.thumbnail = thumbnail;
    }
    public Category() {

    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getName() {
        return name;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }
    public String getThumbnail() {
        return thumbnail;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Category{" +
                "categoryID='" + categoryID + '\'' +
                ", name='" + name + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                '}';
    }

}
