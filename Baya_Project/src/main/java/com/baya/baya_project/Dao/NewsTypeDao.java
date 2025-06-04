package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.News;
import com.baya.baya_project.Model.NewsType;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class NewsTypeDao implements DaoInterface<NewsType>{
    @Override
    public List<NewsType> selectAll() {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT newsTypeID, NAME, DESCRIPTION\n" +
                    "FROM newsType"
            ).mapToBean(NewsType.class).list();
        });
    }

    @Override
    public NewsType selectById(String id) {
        return null;
    }

    @Override
    public NewsType selectById(int id) {
        return null;
    }

    @Override
    public int insert(NewsType newsType) {
        return 0;
    }

    @Override
    public int update(NewsType newsType) {
        return 0;
    }

    @Override
    public int delete(String id) {
        return 0;
    }

    Jdbi jdbi;
    public NewsTypeDao() {
        jdbi = JDBIConnector.getJdbi();

    }

    public static void main(String[] args) {
        NewsTypeDao dao = new NewsTypeDao();
        List<NewsType> list = dao.selectAll();
        for (NewsType newsType : list) {
            System.out.println(newsType);
        }
    }
}
