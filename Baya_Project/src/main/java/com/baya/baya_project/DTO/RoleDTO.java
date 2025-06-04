package com.baya.baya_project.DTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RoleDTO {
    private int roleID;
    private String roleName;
    private Map<Integer, List<Integer>> listCheckboxes = new HashMap<Integer,  List<Integer>>();

    public RoleDTO(int roleID, String roleName, Map<Integer, List<Integer>> listCheckboxes) {
        this.roleID = roleID;
        this.roleName = roleName;
        this.listCheckboxes = listCheckboxes;
    }
    public RoleDTO() {}

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

    public Map<Integer, List<Integer>> getListCheckboxes() {
        return listCheckboxes;
    }

    public void setListCheckboxes(Map<Integer, List<Integer>> listCheckboxes) {
        this.listCheckboxes = listCheckboxes;
    }
    @Override
    public String toString() {
        return "RoleDTO{" +
                "roleID='" + roleID + '\'' +
                ", roleName='" + roleName + '\'' +
                ", listCheckboxes=" + listCheckboxes +
                '}';
    }
}
