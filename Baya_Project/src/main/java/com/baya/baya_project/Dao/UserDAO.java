package com.baya.baya_project.Dao;

import com.baya.baya_project.DTO.UserDTO;
import com.baya.baya_project.Model.User;
import org.jdbi.v3.core.Jdbi;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

public class UserDAO implements DaoInterface<User> {
    Jdbi idbi;

    public UserDAO() {
        idbi = JDBIConnector.getJdbi();
    }

    @Override
    public List<User> selectAll() {
        return idbi.withHandle(handle ->
                handle.createQuery("SELECT u.userID, u.fullName, u.email, u.password, u.phoneNumber, u.accountType, u.createAt, u.statusID " +
                                "FROM users u " +
                                "JOIN status_user s ON u.statusID = s.statusID")
                        .mapToBean(User.class)
                        .list()
        );
    }
    public List<User> selectAll1() {
        return idbi.withHandle(handle ->
                handle.createQuery("SELECT u.userID, u.banned, u.fullName, u.email, u.password, u.phoneNumber, u.accountType, u.createAt, u.statusID, s.description " +
                                "FROM users u JOIN status_user s ON u.statusID = s.statusID"
                        )
                        .mapToBean(User.class)
                        .list()
        );
    }

    public List<User> selectDistinctAdmin() {
        return idbi.withHandle(handle ->
                handle.createQuery(" SELECT DISTINCT userID, fullName, email, password, phoneNumber, accountType, createAt\n" +
                                "    FROM users\n" +
                                "    WHERE statusID =1  and accountType =1 and userID in (SELECT DISTINCT userID\n" +
                                "FROM user_role) ")
                        .mapToBean(User.class)
                        .list()
        );
    }public List<String> userByRole(int userID) {
        return idbi.withHandle(handle ->
                handle.createQuery(
                                "SELECT r.roleName " +
                                        "FROM user_role ur " +
                                        "JOIN roles r ON ur.roleID = r.roleID " +
                                        "WHERE ur.userID = ?"
                        )
                        .bind(0, userID)
                        .mapTo(String.class)
                        .list()
        );
    }

    public int countAdmin(){
        return idbi.withHandle(handle ->
                handle.createQuery(" SELECT COUNT(*)\n" +
                                "FROM user_role ur\n" +
                                "JOIN roles r ON ur.roleID = r.roleID\n" +
                                "JOIN users u ON u.userID = ur.userID\n" +
                                "WHERE roleName LIKE 'Quản trị viên' AND u.statusID =1")
                        .mapTo(Integer.class).one()

        );
    }
    @Override
    public User selectById(String id) {
        return null;
    }

    @Override
    public User selectById(int id) {
        return null;
    }


    public User selectByID(int id) {
        User user = JDBIConnector.jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT userID, fullName, email, password, phoneNumber, accountType, createAt " +
                    "FROM users where fullName=?").mapToBean(User.class).one();
        });
        return user;
    }

    public List<Integer> listRoleByUserId(int userId) {
        return idbi.withHandle(handle ->
                handle.createQuery("SELECT roleID " +
                                "FROM user_role where userID=? "
                        ).bind(0, userId)
                        .mapTo(Integer.class)
                        .list()
        );
    }

    @Override
    public int insert(User user) {
        return idbi.withHandle(handle ->
                        handle.createUpdate("INSERT INTO users (fullName, email, password, phoneNumber, createAt, statusID, accountType) VALUE(\n" +
                                        " ?, ?,?, ?, ?, ?, ?)")
                                .bind(0, user.getFullName())
                                .bind(1, user.getEmail())
                                .bind(2, user.getPassword())
                                .bind(3, user.getPhoneNumber())
                                .bind(4, user.getCreateAt())
                                .bind(5, user.getStatusID())
                                .bind(6, user.getAccountType())
                                .execute()

        );
    }
    public int insertManager(User user) {
        return idbi.withHandle(handle ->
                        handle.createUpdate("INSERT INTO users (fullName, email, phoneNumber, createAt, statusID, accountType) VALUE(\n" +
                                        " ?, ?,?, ?, ?, ?)")
                                .bind(0, user.getFullName())
                                .bind(1, user.getEmail())

                                .bind(2, user.getPhoneNumber())
                                .bind(3, user.getCreateAt())
                                .bind(4, user.getStatusID())
                                .bind(5, user.getAccountType())
                                .execute()
                // Thực thi câu lệnh update
        );
    }

    public int updateProfile(User user) {

        return 1;

    }


    public int updateNameUser(User user) {
        String name = user.getFullName();
        return idbi.withHandle(handle ->
                handle.createUpdate("UPDATE USERs\n" +
                                "SET fullName = ? \n" +
                                "WHERE userID = ?")
                        .bind(0, name)
                        .bind(1, user.getUserID())

                        .execute()
        );

    }
    public int updateAccountTypeAdmin(int userID) {
        return idbi.withHandle(handle ->
                handle.createUpdate("UPDATE users\n" +
                                "SET accountType = 1 \n" +
                                "WHERE userID = ?")
                        .bind(0, userID)


                        .execute()
        );

    }

    public List<UserDTO> getListUserDTO(String email) {
        return JDBIConnector.jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT userID, fullName, email, phoneNumber " +
                    "FROM users where email like ? and statusID = 1 and accountType = 0 ").bind(0, "%" + email + "%").mapToBean(UserDTO.class).list();
        });
    }

    public int updatePhoneNumber(User user) {
        return idbi.withHandle(handle ->
                        handle.createUpdate("UPDATE USERs\n" +
                                        "SET phoneNumber = ? \n" +
                                        "WHERE userID = ?")
                                .bind(0, user.getPhoneNumber())
                                .bind(1, user.getUserID())

                                .execute()
                // Thực thi câu lệnh update
        );
    }
    public int deleteUser(int userID) {
        return idbi.withHandle(handle ->
                        handle.createUpdate("UPDATE users\n" +
                                        "SET statusID = 4 \n" +
                                        "WHERE userID = ?")
                                .bind(0,userID)
                                .execute()
                // Thực thi câu lệnh update
        );
    }


    public boolean checkEmail(String email) {
        User user = JDBIConnector.jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT userID, fullName, email, password, phoneNumber, accountType, createAt " +
                            "FROM users where email=?").bind(0, email).mapToBean(User.class).findFirst()   // Trả về Optional
                    .orElse(null);
        });
        return user != null;
    }
    public boolean checkEmailRegister(String email) {
        User user = JDBIConnector.jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT userID, fullName, email, password, phoneNumber, accountType, createAt " +
                            "FROM users where email=? and statusID =1").bind(0, email).mapToBean(User.class).findFirst()   // Trả về Optional
                    .orElse(null);
        });
        return user != null;
    }

    public int checkStatus(String email) {
        return JDBIConnector.jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT statusID\n" +
                            "FROM users\n" +
                            "WHERE email = ?").bind(0, email).mapTo(Integer.class).findFirst()   // Trả về Optional
                    .orElse(-1);
        });
    }

    public User findUser(String email, String password) {
        List<User> list = selectAll();
        for (User user : list) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                return user;
            }
        }
        return null;
    }

    public int updateStatus(String email, int status) {
        return idbi.withHandle(handle ->
                        handle.createUpdate("UPDATE users\n" +
                                        "SET statusID = ? \n" +
                                        "WHERE email = ?")
                                .bind(0, status)
                                .bind(1, email)

                                .execute()
                // Thực thi câu lệnh update
        );
    }
    public int deleteByID(int userID) {
        return idbi.withHandle(handle ->
                        handle.createUpdate("UPDATE users\n" +
                                        "SET statusID = 4 \n" +
                                        "WHERE userID = ?")
                                .bind(0, userID)

                                .execute()
                // Thực thi câu lệnh update
        );
    }
    public int setAccountTypeToUser(int userID) {
        return idbi.withHandle(handle ->
                        handle.createUpdate("UPDATE users\n" +
                                        "SET accountType = 0 \n" +
                                        "WHERE userID = ?")
                                .bind(0, userID)

                                .execute()
        );
    }
    @Override
    public int update(User user) {

        if (updatePhoneNumber(user) >= 1 && updateNameUser(user) >= 1) {
            return 1;
        }
        return 0;
    }

    public User findUserByEmail(String email) {
        return JDBIConnector.jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT userID, fullName, email, statusID,  password, phoneNumber, accountType, createAt " +
                            "FROM users where email=? ").bind(0, email).mapToBean(User.class).findFirst()   // Trả về Optional
                    .orElse(null);
        });
    }

    public int updateFailPassword(String email, int failPassword) {
        return idbi.withHandle(handle ->
                        handle.createUpdate("UPDATE users\n" +
                                        "SET failPassword = ? \n" +
                                        "WHERE email = ?")
                                .bind(0, failPassword)
                                .bind(1, email)

                                .execute()
                // Thực thi câu lệnh update
        );
    }
    public int updateLock(String email) {
        return idbi.withHandle(handle ->
                        handle.createUpdate("UPDATE users\n" +
                                        "SET lockUntil = ? \n" +
                                        "WHERE email = ?")
                                .bindNull(0,  java.sql.Types.TIMESTAMP)
                                .bind(1, email)
                                .execute()
        );
    }

    public int failPassword(String email) {
        return JDBIConnector.jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT failPassword\n" +
                            "FROM users\n" +
                            "WHERE email = ?").bind(0, email).mapTo(Integer.class).findFirst()   // Trả về Optional
                    .orElse(null);
        });
    }

    public LocalDateTime lockUntil(String email) {
        return JDBIConnector.jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT lockUntil\n" +
                            "FROM users\n" +
                            "WHERE email = ?").bind(0, email).mapTo(LocalDateTime.class).findFirst()   // Trả về Optional
                    .orElse(null);
        });
    }

    public String getPassword(String email) {
        return JDBIConnector.jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT password\n" +
                            "FROM users\n" +
                            "WHERE email = ?").bind(0, email).mapTo(String.class).findFirst()   // Trả về Optional
                    .orElse(null);
        });
    }

    public int updateLockUntil(LocalDateTime time, String email) {
        return idbi.withHandle(handle ->
                        handle.createUpdate("UPDATE users\n" +
                                        "SET lockUntil = ? \n" +
                                        "WHERE email = ?")
                                .bind(0, time)
                                .bind(1, email)
                                .execute()
        );
    }


    public int updateCreateAt(LocalDateTime time, String email) {
        return idbi.withHandle(handle ->
                        handle.createUpdate("UPDATE users\n" +
                                        "SET createAt = ? \n" +
                                        "WHERE email = ?")
                                .bind(0, time)
                                .bind(1, email)

                                .execute()
                // Thực thi câu lệnh update
        );
    }

    public int updatePassword(String email, String password) {
        return idbi.withHandle(handle ->
                        handle.createUpdate("UPDATE users\n" +
                                        "SET PASSWORD = ? \n" +
                                        "WHERE email = ?")
                                .bind(0, password)
                                .bind(1, email)

                                .execute()
                // Thực thi câu lệnh update
        );

    }

    @Override
    public int delete(String id) {
        return 0;
    }

    public int deleteRolebyUserID(int userID) {
        return idbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM user_role WHERE userID = ?")
                        .bind(0, userID)
                        .execute()
        );
    }
    public int deleteUserID(int userID) {
        return idbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM users WHERE userID = ?")
                        .bind(0, userID)
                        .execute()
        );
    }

    public int updateActiveMail(String email, String code) {
        return idbi.withHandle(handle ->
                        handle.createUpdate("UPDATE users\n" +
                                        "SET activateCode = ? \n" +
                                        "WHERE email = ?")
                                .bind(0, code)
                                .bind(1, email)

                                .execute()
                // Thực thi câu lệnh update
        );

    }
    public String getActiveCode(String email) {
        return JDBIConnector.jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT activateCode\n" +
                            "FROM users\n" +
                            "WHERE email = ?").bind(0, email).mapTo(String.class).findFirst()   // Trả về Optional
                    .orElse(null);
        });
    }

    public LocalDateTime getTimeActiveMail(String email) {
        return JDBIConnector.jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT createAt\n" +
                            "FROM users\n" +
                            "WHERE email = ?").bind(0, email).mapTo(LocalDateTime.class).findFirst()   // Trả về Optional
                    .orElse(null);
        });
    }

    public User getUserById(int userId) {
        return idbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM users WHERE userID = ?")
                        .bind(0, userId)
                        .mapToBean(User.class)
                        .findOne()
                        .orElse(null)
        );
    }

    public int getNewUsersCountByDateRange(Date startDate, Date endDate) {
        return idbi.withHandle(handle ->
                handle.createQuery(
                                "SELECT COUNT(*) " +
                                        "FROM users " +
                                        "WHERE createAt >= :startDate AND createAt < :endDate " +
                                        "AND statusID = 1"
                        )
                        .bind("startDate", startDate)
                        .bind("endDate", endDate)
                        .mapTo(Integer.class)
                        .one()
        );
    }
    public int getTotalUsers() {

        return idbi.withHandle(hanlder -> {
            return hanlder.createQuery("SELECT COUNT(*) as total from users").mapTo(Integer.class).findOne().orElse(0);
        });
    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
//        System.out.println(userDAO.updateLockUntil(LocalDateTime.now().plusMinutes(15),"tailam164@gmail.com"));
        System.out.println(userDAO.countAdmin());
    }



}
