package com.baya.baya_project.Dao;

import org.jdbi.v3.core.Jdbi;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class PermissionDao {
    Jdbi idbi;

    public PermissionDao() {
        idbi = JDBIConnector.getJdbi();
    }
    public Set<String> getPermissionsByUserId(int userId) {
        String sql = """
           SELECT CONCAT(f.featureURL, ':', a.actionName) AS permission
                                             FROM user_role ur
                                             JOIN role_permission rp ON ur.roleID = rp.roleID
                                             JOIN permissions p ON rp.permissionID = p.permissionID
                                             JOIN features f ON p.featureID = f.featureID
                                             JOIN actions a ON p.actionID = a.actionID
                                             WHERE ur.userID = :userId
        """;

        List<String> permissionList = idbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("userId", userId)
                        .mapTo(String.class)
                        .list()
        );

        return new HashSet<>(permissionList);
    }

    public static void main(String[] args) {
        PermissionDao dao = new PermissionDao();
        System.out.println(dao.getPermissionsByUserId(30));
    }

}
