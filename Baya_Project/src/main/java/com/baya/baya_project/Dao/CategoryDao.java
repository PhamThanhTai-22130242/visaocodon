package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.Category;
import com.baya.baya_project.Model.Product;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class CategoryDao implements DaoInterface<Category> {

    private Jdbi jdbi;
    public CategoryDao() {
        jdbi = JDBIConnector.getJdbi();
    }


    @Override
    public List<Category> selectAll() {
        return jdbi.withHandle(ha ->
                ha.createQuery("SELECT categoryID , name, thumbnail FROM category")
                        .mapToBean(Category.class)
                        .list()
        );
    }


    @Override
    public Category selectById(String id) {
        return jdbi.withHandle(ha ->{
            return ha.createQuery("\n" +
                    "select categoryID,  NAME, thumbnail\n" +
                    "FROM category " +
                            "where categoryID = ? "
            )
                    .bind(0, id).mapToBean(Category.class).findFirst().orElse(null);
        });
    }
    @Override
    public Category selectById(int id) {
        return null;
    }

    @Override
    public int insert(Category category) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO category (categoryID, name, thumbnail) VALUES (?, ?, ?)")
                        .bind(0, category.getCategoryID())
                        .bind(1, category.getName())
                        .bind(2, category.getThumbnail())
                        .execute()
        );
    }

    @Override
    public int update(Category category) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE category SET name = ?, thumbnail = ? WHERE categoryID = ?")
                        .bind(0, category.getName())
                        .bind(1, category.getThumbnail())
                        .bind(2, category.getCategoryID())
                        .execute()
        );
    }

    @Override
    public int delete(String id) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM Category WHERE categoryID = ?")
                        .bind(0, id)
                        .execute()
        );
    }
    public boolean checkID(String id) {
        return jdbi.withHandle(ha ->{
            return ha.createQuery("\n" +
                    "select categoryID,  NAME\n FROM category " +
                    "where categoryID = ?"
            )
                    .bind(0, id).mapToBean(Category.class).findFirst().orElse(null);
        })!= null;
    }
    public boolean checkName(String name) {
        return jdbi.withHandle(ha ->{
            return ha.createQuery("\n" +
                            "select categoryID,  NAME\n FROM category " +
                            "where name = ?"
                    )
                    .bind(0, name).mapToBean(Category.class).findFirst().orElse(null);
        })!= null;
    }
    public static void main(String[] args) {
        CategoryDao dao = new CategoryDao();
        Category category = new Category("B", "okê", "");
       int check=   dao.update(category);
        System.out.println(check);
    }
}
