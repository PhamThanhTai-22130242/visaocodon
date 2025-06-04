package com.baya.baya_project.Model;

import com.baya.baya_project.Dao.PermissionDao;
import com.baya.baya_project.Dao.UserDAO;

import java.util.HashSet;
import java.util.Set;

public class UserPrincipal {
    private User user;
    private Set<String> permissions;
    public UserPrincipal() {

        this.permissions = new HashSet<>();;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set<String> getPermissions() {
        return permissions;
    }

    public void setPermissions(Set<String> permissions) {
        this.permissions = permissions;
    }

    public boolean hasPermission(String feature, String action) {
        return permissions.contains(feature + ":" + action);
    }

    @Override
    public String toString() {
        return "UserPrincipal{" +
                "user=" + user +
                ", permissions=" + permissions +
                '}';
    }

    public static void main(String[] args) {
        PermissionDao permissionDao = new PermissionDao();
        UserDAO dao = new UserDAO();
        User user = dao.getUserById(30);
        Set<String> permissions = permissionDao.getPermissionsByUserId(30);
        UserPrincipal userPrincipal = new UserPrincipal();
        userPrincipal.setUser(user);
        userPrincipal.setPermissions(permissions);
        System.out.println("USER PRINCICAL: " + userPrincipal);
        System.out.println(userPrincipal.hasPermission("news", "exportExcel"));
    }
}
