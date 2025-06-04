package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.Roles;
import org.jdbi.v3.core.Jdbi;

import java.util.ArrayList;
import java.util.List;

public class UserRoleDao {
    Jdbi idbi;

    public UserRoleDao() {
        idbi = JDBIConnector.getJdbi();
    }
    public int insert(int userID, int roleID){
        return idbi.withHandle(handle ->
                        handle.createUpdate("INSERT INTO user_role (userID, roleID) VALUE(\n" +
                                        " ?, ?)")
                                .bind(0, userID)
                                .bind(1,roleID)

                                .execute()

        );
    }

    public List<Roles> listRolesByUser(int userID){
        return idbi.withHandle(handle ->
                handle.createQuery(" SELECT r.roleID, r.roleName\n" +
                                "    FROM roles r JOIN user_role ur\n" +
                                "    ON r.roleID = ur.roleID\n" +
                                "    WHERE ur.userID = ?"
                        ).bind(0, userID)
                        .mapToBean(Roles.class)
                        .list()
        );
    }
    public List<Integer> listRoles(int userID){
        return idbi.withHandle(handle ->
                handle.createQuery(" SELECT roleID\n" +
                                "FROM user_role\n" +
                                "WHERE userID = ?"
                        ).bind(0, userID)
                        .mapTo(Integer.class)
                        .list()
        );
    }
    public int deleteRoles(int userID, int roleID){
        return idbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM user_role WHERE userID = ?")
                        .bind(0, userID)
                        .execute()
        );
    }


    public static void main(String[] args) {
        UserRoleDao dao = new UserRoleDao();
//        System.out.println(dao.insert(1, 24));
        System.out.println(dao.listRoles(30));
    }
}
