package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.User;
import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;
import java.util.List;

public class JDBIConnector {
    public static Jdbi jdbi;

    public static void connect() {
        MysqlDataSource dataSource = new MysqlDataSource();

        String url = "jdbc:mysql://103.163.118.95:3306/csdl_noithat";

        dataSource.setUrl(url);
        dataSource.setUser("root");
        dataSource.setPassword("123");
        jdbi = Jdbi.create(dataSource);
        try {
            dataSource.setAutoReconnect(true);
            dataSource.setUseCompression(true);


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static Jdbi getJdbi() {
        if (jdbi == null) {
            connect();
            System.out.println("Connected to database");
        }
        return jdbi;
    }

    public static void main(String[] args) {
        Jdbi jdbi = getJdbi();
        List<User> list = jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT userID, fullName, email, password, phoneNumber, roleID, createAt " +
                    "FROM users").mapToBean(User.class).list();
        });
//        List<User> list = jdbi.withHandle(ha -> {
//            return ha.createQuery("SELECT userID, fullName, email, password, phoneNumber, roleID, createAt " +
//                    "FROM users where fullName=?").bind(0, "Lâm ").mapToBean(User.class).list();
//        });
        System.out.println(list);
    }
}
