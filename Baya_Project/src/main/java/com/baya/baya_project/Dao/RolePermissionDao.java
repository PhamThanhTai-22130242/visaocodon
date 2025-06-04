package com.baya.baya_project.Dao;

import org.jdbi.v3.core.Jdbi;

public class RolePermissionDao {
    public Jdbi jdbi;

    public RolePermissionDao() {
        jdbi = JDBIConnector.getJdbi();
    }

    public int insert(int roleID, int permissionID) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO role_permission (roleID,permissionID ) VALUES (?, ?)")
                        .bind(0,roleID) .bind(1,permissionID)
                        .execute()
        );
    }
    public int deleteRolePermission(int roleID) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM role_permission WHERE roleID = ?")
                        .bind(0, roleID)
                        .execute()
        );
    }

    public static void main(String[] args) {
        RolePermissionDao dao = new RolePermissionDao();
        System.out.println(dao.insert(1,22));
    }



}
