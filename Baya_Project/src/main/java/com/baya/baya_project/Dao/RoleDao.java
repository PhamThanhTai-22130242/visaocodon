package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.Roles;
import org.jdbi.v3.core.Jdbi;

import java.util.*;


public class RoleDao {
    public Jdbi jdbi;

    public RoleDao() {
        jdbi = JDBIConnector.getJdbi();
    }

    public int getRoleIdByName(String roleName) {
        return jdbi.withHandle(ha -> {

            return ha.createQuery("SELECT roleID\n" +
                    "FROM roles\n" +
                    "WHERE roleName like ?"
            ).bind(0, roleName).mapTo(Integer.class).findOne().orElse(-1);
        });
    }
    public String getRoleNameById(int roleId) {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT roleName\n" +
                    "FROM roles\n" +
                    "WHERE roleID = ?"
            ).bind(0, roleId).mapTo(String.class).findOne().orElse(null);
        });
    }

    public int insert(String roleName) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO roles (roleName) VALUES (?)")
                        .bind(0, roleName)

                        .execute()
        );
    }
    public int updateName(String roleName, int roleId) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE roles" +
                                " Set roleName = ? WHERE roleID = ?")
                        .bind(0, roleName) .bind(1, roleId)
                        .execute()
        );
    }

    public List<Roles> getAllRoles() {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT roleID, roleName\n" +
                    "FROM roles"
            ).mapToBean(Roles.class).list();
        });
    }

    public int deleteUserRoles(int roleID) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM user_role WHERE roleID = ?")
                        .bind(0, roleID)
                        .execute()
        );
    }

    public boolean checkExistRoleFromRoleUser(int roleID) {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT EXISTS (SELECT 1 FROM user_role WHERE roleID = ?)"
                    ).bind(0, roleID).mapTo(boolean.class)
                    .one();
        });

    }

    public boolean checkExist(String roleName) {
        int roleId = getRoleIdByName(roleName);
        System.out.println(roleId);
        return roleId != -1;
    }
    public Roles getRoleById(int roleId) {
        return jdbi.withHandle(ha -> {

            return ha.createQuery("SELECT roleID, roleName\n" +
                    "FROM roles\n" +
                    "WHERE roleID = ?"
            ).bind(0, roleId).mapToBean(Roles.class).findOne().orElse(null);
        });
    }

    public int deleteRole(int roleID) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM roles WHERE roleID = ?")
                        .bind(0, roleID)
                        .execute()
        );
    }

    public HashMap<Integer, List<Integer>> getFeatureAndAction(int roleID) {
        Map<Integer, List<Integer>> result = jdbi.withHandle(handle ->
                handle.createQuery(" SELECT featureID, actionID FROM roles r JOIN role_permission rp ON r.roleID = rp.roleID JOIN permissions p ON p.permissionID = rp.permissionID WHERE r.roleID = :roleID ")
                        .bind("roleID", roleID)
                        .reduceRows(new LinkedHashMap<>(), (map, rowView) -> {
                            Integer featureID = rowView.getColumn("featureID", Integer.class);
                            Integer actionID = rowView.getColumn("actionID", Integer.class);


                            map.computeIfAbsent(featureID, k -> new ArrayList<>()).add(actionID);
                            return map;
                        })
        );

        return new HashMap<>(result);
    }



    public static void main(String[] args) {
        RoleDao roleDao = new RoleDao();
//        System.out.println(roleDao.getRoleIdByName("admin"));
//        System.out.println(roleDao.checkExist("adminn"));
        System.out.println(roleDao.getFeatureAndAction(21));
        System.out.println(roleDao.updateName("QTV", 17));
    }

}
