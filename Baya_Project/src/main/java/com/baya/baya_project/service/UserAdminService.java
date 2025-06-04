package com.baya.baya_project.service;

import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Model.Roles;
import com.baya.baya_project.Model.User;
import java.util.List;

import static com.baya.baya_project.Dao.JDBIConnector.jdbi;

public class UserAdminService {
    private static final UserDAO userDAO = new UserDAO();

    public static User selectByID(int id) {
        User user = jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT userID, fullName, email, password, phoneNumber, accountType, createAt " +
                            "FROM users WHERE userID = ?")  // Câu truy vấn với tham số
                    .bind(0, id)  // Liên kết tham số đầu tiên (userID) với giá trị id
                    .mapToBean(User.class)
                    .findOnly();  // Chỉ lấy một bản ghi duy nhất
        });
        return user;
    }
    public static List<Roles> selectByRoleName(){
        return jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT accountType, name, description " +
                            "FROM role").
                            mapToBean(Roles.class).list();
        });
    }
    public static User getUserById(int userId) {
        return userDAO.getUserById(userId);
    }
    public static List<User> selectAll() {

        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT userID, fullName, email, password, phoneNumber, accountType, createAt " +
                    "FROM users").mapToBean(User.class).list();
        });
    }

    public int banned(int userID) {
        return jdbi.withHandle(handle -> {
            return handle.createUpdate("UPDATE users SET banned = 1 WHERE userID = ?")
                    .bind(0, userID)
                    .execute();
        });
    }
    public int Unbanned(int userID) {
        return jdbi.withHandle(handle -> {
            return handle.createUpdate("UPDATE users SET banned = 0 WHERE userID = ?")
                    .bind(0, userID)
                    .execute();
        });
    }
    public static int insertUser(User user) {
        return jdbi.withHandle(handle -> {
            return handle.createUpdate("INSERT INTO users (userID, fullName, email, password, phoneNumber, accountType, createAt) " +
                            "VALUES (:userID, :fullName, :email, :password, :phoneNumber, :accountType, :createAt)")
                    .bind("userID", user.getUserID())
                    .bind("fullName", user.getFullName())
                    .bind("email", user.getEmail())
                    .bind("password", user.getPassword())
                    .bind("phoneNumber", user.getPhoneNumber())
                    .bind("accountType", user.getAccountType())
                    .bind("createAt", user.getCreateAt())
                    .execute();
        });
    }
    public User deleteUser(int userID) {
        return jdbi.withHandle(handle -> {
            User userToDelete = handle.createQuery("SELECT * FROM users WHERE userID = :userID")
                    .bind("userID", userID)
                    .mapToBean(User.class)
                    .findOne()
                    .orElse(null);
            if (userToDelete != null) {
                handle.createUpdate("UPDATE users SET statusID = 4 WHERE userID = :userID")
                        .bind("userID", userID)
                        .execute();
            }

            return userToDelete;
        });
    }



    public static void updateRole(Roles roles) {
        jdbi.withHandle(handle -> {
            return handle.createUpdate("UPDATE roles SET name = :name, description = :description WHERE accountType = :accountType")
                    .bindBean(roles)  // Sử dụng bean roles để bind các giá trị từ roles vào câu lệnh
                    .execute();  // Thực thi câu lệnh update
        });
    }

    public static void updateUser(User user) {
        jdbi.withHandle(handle -> {
            return handle.createUpdate("UPDATE users SET fullName = :fullName, email = :email, " +
                            "phoneNumber = :phoneNumber, accountType = :accountType WHERE userID = :userID")
                    .bind("userID", user.getUserID())
                    .bind("fullName", user.getFullName())
                    .bind("email", user.getEmail())
                    .bind("phoneNumber", user.getPhoneNumber())
                    .bind("accountType", user.getAccountType())
                    .execute();
        });
    }
    public static void updateUserAndRoleWithTransaction(User user, Roles roles) {
        jdbi.useHandle(handle -> {
            handle.begin();  // Bắt đầu transaction
            try {
                // Cập nhật Roles
                updateRole(roles);
                // Cập nhật User
                updateUser(user);
                // Commit transaction nếu mọi thứ đều ổn
                handle.commit();
            } catch (Exception e) {
                // Nếu có lỗi, rollback tất cả thay đổi
                handle.rollback();
                // Ném ngoại lệ để xử lý ở nơi gọi
                throw new RuntimeException("Update failed", e);
            }
        });
    }




}
