package com.baya.baya_project.Model;

public class Roles {
    int roleID;
    String roleName;

    public Roles(int roleID, String roleName) {
        this.roleID = roleID;
        this.roleName = roleName;
    }
    public Roles() {}

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Override
    public String toString() {
        return "Roles{" +
                "roleID=" + roleID +
                ", roleName='" + roleName + '\'' +
                '}';
    }
}
