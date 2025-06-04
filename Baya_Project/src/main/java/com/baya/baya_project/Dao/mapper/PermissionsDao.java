package com.baya.baya_project.Dao.mapper;

import com.baya.baya_project.Dao.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

public class PermissionsDao {
    public Jdbi jdbi;

    public PermissionsDao() {
        jdbi = JDBIConnector.getJdbi();
    }
    public int getPermissionID(int featureID, int actionID) {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT permissionID\n" +
                    "FROM permissions\n" +
                    "WHERE featureID = ? and actionID = ?"
            ).bind(0, featureID).bind(1, actionID).mapTo(Integer.class).findOne().orElse(-1);
        });


    }
    public int insert(int featureID, int actionID){
        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO permissions (featureID, actionID) VALUES (?, ?)")
                        .bind(0,featureID)
                        .bind(1,actionID)

                        .execute()
        );
    }
    public int delete(int featureID){
        return jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM permissions WHERE featureID = ?")
                        .bind(0, featureID)
                        .execute()
        );
    }

    public static void main(String[] args) {
        PermissionsDao dao = new PermissionsDao();

        System.out.println(dao.delete(20));
    }
}
