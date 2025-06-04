package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.Product;
import com.baya.baya_project.Model.SubImage;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class SubImageDao implements DaoInterface<SubImageDao> {
    Jdbi jdbi;

    public SubImageDao() {
        jdbi = jdbi = JDBIConnector.getJdbi();
        ;
    }

    @Override
    public List<SubImageDao> selectAll() {
        return List.of();
    }

    @Override
    public SubImageDao selectById(String id) {
        return null;
    }

    @Override
    public SubImageDao selectById(int id) {
        return null;
    }


    public List<SubImage> selectByProductID(String idProduct) {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT subImagesID,  image,  createDate,  productID\n" +
                    "FROM subimages\n" +
                    "WHERE productID = ?"
            ).bind(0, idProduct).mapToBean(SubImage.class).list();
        });
    }

    @Override
    public int insert(SubImageDao subImageDao) {
        return 0;
    }

    @Override
    public int update(SubImageDao subImageDao) {
        return 0;
    }

    @Override
    public int delete(String id) {
        return 0;
    }


    public static void main(String[] args) {
        SubImageDao subImageDao = new SubImageDao();
        System.out.println(subImageDao.selectByProductID("MFBSCBD01.B06"));
        subImageDao.selectByProductID("MFBSCBD01.B06");
        List<SubImage> listImg = subImageDao.selectByProductID("MFBSCBD01.B06");


    }
}
