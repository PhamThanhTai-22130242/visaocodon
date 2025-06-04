package com.baya.baya_project.service;

import com.baya.baya_project.Dao.JDBIConnector;
import com.baya.baya_project.Dao.RoleDao;
import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Dao.UserRoleDao;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.Model.UserRoleDTO;
import org.jdbi.v3.core.Jdbi;

import java.util.ArrayList;
import java.util.List;

public class UserRoleService {
    UserDAO userDAO = new UserDAO();
    UserRoleDao userRoleDAO = new UserRoleDao();

    public UserRoleService() {

    }

    public List<Integer> checkExist(int userID, List<Integer> roles) {
        List<Integer> result = new ArrayList<Integer>();
        List<Integer> listRole = userDAO.listRoleByUserId(userID);
        for (Integer role : roles) {
            if (listRole.contains(role)) {
                result.add(role);
            }
        }
        return result;
    }

    public List<String> getRoleName(List<Integer> roles) {
        RoleDao roleDAO = new RoleDao();
        List<String> result = new ArrayList<>();
        for (Integer role : roles) {

            result.add(roleDAO.getRoleNameById(role));
        }
        return result;
    }
    public int insert(int userID, List<Integer> roles) {
        int result = 0;
        for (Integer role : roles) {
            int insert = userRoleDAO.insert(userID, role);
            if (insert == 0) {
                return -1;
            }
            result += insert;
        }
        return result;
    }
    public List<UserRoleDTO> findAll() {
        UserRoleDao userRoleDao = new UserRoleDao();
        List<UserRoleDTO> result = new ArrayList<>();
        UserDAO userDao = new UserDAO();
        List<User> distinceUser = userDao.selectDistinctAdmin();
        for (User user : distinceUser) {
            UserRoleDTO dto = new UserRoleDTO();
            dto.setUserID(user.getUserID());
            dto.setFullName(user.getFullName());
            dto.setRoles(userRoleDao.listRolesByUser(user.getUserID()));
            dto.setEmail(user.getEmail());
            result.add(dto);
        }
        return result;
    }

    public static void main(String[] args) {
        UserRoleService userRoleService = new UserRoleService();
        List<Integer> listRol = new ArrayList<>();
        listRol.add(24);
        listRol.add(90);
        listRol.add(89);
//        List<UserRoleDTO>  list =userRoleService.findAll();
        System.out.println(userRoleService.getRoleName(listRol).toString());
//        UserDAO userDao = new UserDAO();
//        List<User> distinceUser = userDao.selectDistinctUser();
//        System.out.println(distinceUser);
    }
}
