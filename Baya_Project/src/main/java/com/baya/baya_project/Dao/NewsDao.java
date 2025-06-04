package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.News;
import com.baya.baya_project.Model.Product;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class NewsDao implements DaoInterface<News>{
    Jdbi jdbi;
    public NewsDao() {
        jdbi = JDBIConnector.getJdbi();
    }

    @Override
    public List<News> selectAll() {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT newsID, title, content, createAt, thumbnail, newsTypeID\n" +
                    "FROM news"
            ).mapToBean(News.class).list();
        });
    }
    public List<News> selectTop4() {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT newsID, title, content, createAt, thumbnail, newsTypeID\n" +
                    "FROM news limit 4"
            ).mapToBean(News.class).list();
        });
    }


    @Override
    public News selectById(String id) {
          return null;
    }

    @Override
    public News selectById(int id) {

        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT newsID, title, content, createAt, thumbnail, newsTypeID\n" +
                    "FROM news where newsID = ?"
            ).bind(0, id).mapToBean(News.class).findOne().orElse(null);
        });
    }
    @Override
    public int insert(News news) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO news (title, content, thumbnail, newsTypeID) VALUES (?, ?, ?, ?)")
                        .bind(0, news.getTitle())
                        .bind(1, news.getContent())
                        .bind(2, news.getThumbnail())
                        .bind(3, news.getNewsTypeID())
                        .execute()
        );
    }
    @Override
    public int update(News news) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE news\n" +
                                "SET title = ?, content =?, thumbnail =?\n" +
                                "WHERE newsID =?")  // Câu truy vấn với dấu ?
                        .bind(0, news.getTitle())   // Gắn tham số name vào vị trí 0
                        .bind(1, news.getContent())  // Gắn tham số email vào vị trí 1
                        .bind(2, news.getThumbnail())
                        .bind(3, news.getNewsID())// Gắn tham số id vào vị trí 2
                        .execute()       // Thực thi câu lệnh update
        );
    }

    @Override
    public int delete(String id) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM news WHERE newsID = ? ")
                        .bind(0, id)
                        .execute() // Thực thi câu lệnh DELETE
        );
    }

    public static void main(String[] args) {
        NewsDao dao = new NewsDao();
//        News news = new News(7, "dâybsđá", "content", null,"thumbnail", 1 );
//        News newssss = dao.selectById(34);
        System.out.println(dao.delete("49"));
    }
}
