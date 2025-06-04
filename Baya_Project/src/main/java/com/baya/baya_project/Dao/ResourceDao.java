package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.Category;
import com.baya.baya_project.Model.Product;
import com.baya.baya_project.Model.Resource;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class ResourceDao {
    public Jdbi jdbi;

    public ResourceDao() {
        jdbi = JDBIConnector.getJdbi();
    }
    public List<Resource> selectAllResource() {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT featureID, featureName\n" +
                    "FROM features"
            ).mapToBean(Resource.class).list();
        });
    }
    public int insert(String name) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO features (featureName) VALUES (?)")
                        .bind(0,name)
                        .execute()
        );
    }
    public Resource selectResourceById(int id) {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT featureID,featureName\n" +
                    "FROM features\n" +
                    "WHERE featureID = ?"
            ).bind(0, id).mapToBean(Resource.class).findOne().orElse(null);
        });
    }
    public int delete(int id) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM features WHERE featureID = ?")
                        .bind(0, id)
                        .execute()
        );
    }



    public Resource selectResourceByName(String name) {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT featureID,featureName\n" +
                    "FROM features\n" +
                    "WHERE featureName = ?"
            ).bind(0, name).mapToBean(Resource.class).findOne().orElse(null);
        });
    }
    public int updateResource(Resource resource) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE features SET featureName = ? WHERE featureID = ?")
                        .bind(0, resource.getFeatureName())
                        .bind(1, resource.getFeatureID())
                        .execute()
        );
    }


    public static void main(String[] args) {
        ResourceDao dao = new ResourceDao();
        System.out.println(dao.delete(8));

    }



}
