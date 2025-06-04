package com.baya.baya_project.service;

import com.baya.baya_project.Dao.LogDao;
import com.baya.baya_project.Model.Log;
import java.time.LocalDateTime;
import static com.baya.baya_project.Dao.JDBIConnector.jdbi;

public class LogService {
    LogDao logDao;

    public LogService() {
        logDao = new LogDao();
    }
    public void alert(Integer userID, String location, String beforeData, String afterData) {
        Log log = new Log("alert", userID, LocalDateTime.now(), location, beforeData, afterData);
        logDao.insert(log);
    }
    public void infor(Integer userID, String location, String beforeData, String afterData) {
        Log log = new Log("infor", userID, LocalDateTime.now(), location, beforeData, afterData);
        logDao.insert(log);
    }

    public void warning(Integer userID, String location, String beforeData, String afterData) {
        Log log = new Log("warning", userID, LocalDateTime.now(), location, beforeData, afterData);
        logDao.insert(log);
    }
    public void danger(Integer userID, String location, String beforeData, String afterData) {
        Log log = new Log("danger", userID, LocalDateTime.now(), location, beforeData, afterData);
        logDao.insert(log);
    }
    public int delete(int id) {
        return jdbi.withHandle(handle -> {
            return handle.createUpdate("DELETE FROM logs WHERE logID = ?")
                    .bind(0, id)
                    .execute();
        });
    }

}
