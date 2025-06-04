package com.baya.baya_project.Model;

public class NewsType {
    private int newsTypeID;
    private String name;
    private String description;

    public NewsType(int newsTypeID, String name, String description) {
        this.newsTypeID = newsTypeID;
        this.name = name;
        this.description = description;
    }
    public NewsType() {

    }
    public int getNewsTypeID() {
        return newsTypeID;
    }

    public void setNewsTypeID(int newsTypeID) {
        this.newsTypeID = newsTypeID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "NewsType{" +
                "newsTypeID=" + newsTypeID +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
