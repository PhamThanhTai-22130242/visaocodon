package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.Product;
import com.baya.baya_project.Model.Specification;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class SpecificationDao implements DaoInterface<Specification> {
    Jdbi jdbi;

    public SpecificationDao() {
        jdbi = JDBIConnector.getJdbi();

    }

    @Override
    public List<Specification> selectAll() {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("\n" +
                    "SELECT specificationID,  dimensions,  material,  original,  standard\n" +
                    "FROM specifications"
            ).mapToBean(Specification.class).list();
        });
    }
    public String originalByID(String id) {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT original\n" +
                    "FROM specifications\n" +
                    "WHERE specificationID = ?"
            ).bind(0, id).mapTo(String.class).findOne().orElse(null);
        });
    }

    @Override
    public Specification selectById(String id) {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT specificationID,  dimensions,  material,  original,  standard\n" +
                    "FROM specifications\n" +
                    "WHERE specificationID = ?"
            ).bind(0, id).mapToBean(Specification.class).findFirst().orElse(null);
        });
    }

    @Override
    public Specification selectById(int id) {
        return null;
    }

    @Override
    public int insert(Specification specification) {
        return 0;
    }

    @Override
    public int update(Specification specification) {
        return 0;
    }

    @Override
    public int delete(String id) {
        return 0;
    }

    public static void main(String[] args) {
        SpecificationDao dao = new SpecificationDao();
        String id = dao.originalByID("MKGSCCDD04.M15");
        System.out.println(id);
//        List<Specification> specifications = dao.selectAll();
//        Specification spe = dao.selectById("MFBNCBD01.B16");
//        System.out.println(spe);
    }
}
