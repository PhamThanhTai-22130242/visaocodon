package com.baya.baya_project.Model;

import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.service.UserRoleService;

import javax.management.relation.Role;
import java.util.List;

public class UserRoleDTO {
    private int userID;
    String fullName;
    String email;
    List<Roles> roles;
    public UserRoleDTO() {

    }
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<Roles> getRoles() {
        return roles;
    }

    public void setRoles(List<Roles> roles) {
        this.roles = roles;
    }

    @Override
    public String toString() {
        return "UserRoleDTO{" +
                "userID=" + userID +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", roles=" + roles +
                '}';
    }

    public static void main(String[] args) {
        UserDAO userDao = new UserDAO();
        UserRoleService userRoleService = new UserRoleService();
        List<UserRoleDTO> list = userRoleService.findAll();
        System.out.println(list);
    }
}
