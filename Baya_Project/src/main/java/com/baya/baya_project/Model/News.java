package com.baya.baya_project.Model;

import java.sql.Timestamp;
public class News {
    private int newsID;
    private String title;
    private String content;
    private Timestamp createAt;
    private String thumbnail;
    private int newsTypeID;

    public News(int newsID, String title, String content, Timestamp createAt, String thumbnail, int newsTypeID) {
        this.newsID = newsID;
        this.title = title;
        this.content = content;
        this.createAt = createAt;
        this.thumbnail = thumbnail;
        this.newsTypeID = newsTypeID;
    }
    public News() {

    }

    public int getNewsID() {
        return newsID;
    }

    public void setNewsID(int newsID) {
        this.newsID = newsID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getNewsTypeID() {
        return newsTypeID;
    }

    public void setNewsTypeID(int newsTypeID) {
        this.newsTypeID = newsTypeID;
    }

    @Override
    public String toString() {
        return "News{" +
                "newsID=" + newsID +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", createdAt=" + createAt +
                ", thumbnail='" + thumbnail + '\'' +
                ", newsTypeID=" + newsTypeID +
                '}';
    }
}
