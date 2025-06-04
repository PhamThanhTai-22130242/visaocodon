package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.Product;
import com.baya.baya_project.Model.SubCategory;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class SubCategoryDao implements DaoInterface<SubCategory>{
    Jdbi jdbi;
    public SubCategoryDao() {
        jdbi = JDBIConnector.getJdbi();
    }
    @Override
    public List<SubCategory> selectAll() {
        return jdbi.withHandle(ha ->{
            return ha.createQuery("\n" +
                    "SELECT subcategoryID, name,  thumbnail,    categoryID\n" +
                    "FROM subcategory\n"
            ).mapToBean(SubCategory.class).list();
        });
    }

    @Override
    public SubCategory selectById(String id) {
        return null;
    }

    @Override
    public SubCategory selectById(int id) {
        return null;
    }

    @Override
    public int insert(SubCategory subCategory) {
        return 0;
    }

    @Override
    public int update(SubCategory subCategory) {
        return 0;
    }

    @Override
    public int delete(String id) {
        return 0;
    }

//    public List<SubCategory> selectTop15(){
//        return jdbi.withHandle(ha ->{
//            return ha.createQuery("\n" +
//                    "SELECT subcategoryID, name,  thumbnail,    categoryID\n" +
//                    "FROM subcategory\n" +
//                    "LIMIT 15"
//            ).mapToBean(SubCategory.class).list();
//        });
//    }


    public static void main(String[] args) {
//        SubCategoryDao dao = new SubCategoryDao();
//
//
//        List<SubCategory> subCategories = dao.selectTop15();
//        System.out.println(subCategories);
    }
}
