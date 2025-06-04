package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.Log;
import com.baya.baya_project.Model.News;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class LogDao implements DaoInterface<Log>{

    Jdbi jdbi;

    public LogDao() {
        jdbi = JDBIConnector.getJdbi();
    }
    @Override
    public List<Log> selectAll() {
        return jdbi.withHandle(handle -> {
                    return handle.createQuery("SELECT * FROM logs ")
                            .mapToBean(Log.class).list();
                }
        );
    }
    public List<Log> selectByRole(int roleID) {
        return jdbi.withHandle(handle ->
                handle.createQuery(
                                "SELECT l.* " +
                                        "FROM logs l " +
                                        "JOIN users u ON l.userID = u.userID " +
                                        "WHERE u.roleID = :roleID"
                        )
                        .bind("roleID", roleID)
                        .mapToBean(Log.class)
                        .list()
        );
    }


    @Override
    public Log selectById(String id) {
        return null;
    }
    @Override
    public Log selectById(int id) {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT * FROM logs where logID = ?").
                    bind(0, id).mapToBean(Log.class).findOne().
                    orElse(null);
        });
    }
    @Override
    public int insert(Log log) {
        return jdbi.withHandle(
                handler ->{
                    return  handler.createUpdate("Insert Into logs(label,userID,time,location,beforeData,afterData)values(?,?,?,?,?,?)")
                            .bind(0,log.getLabel())
                            .bind(1,log.getUserID() == null ? 0 : log.getUserID())
                            .bind(2,log.getTime())
                            .bind(3,log.getLocation())
                            .bind(4,log.getBeforeData())
                            .bind(5,log.getAfterData())
                            .execute();
                }
        );
    }

    @Override
    public int update(Log log) {
        return jdbi.withHandle(handle -> {
            return handle.createUpdate("UPDATE logs SET label = :label, userID = :userID,  " +
                            "location = :location, beforeData = :beforeData, afterData = :afterData " +
                            "WHERE logID = :logID")
                    .bind("logID", log.getLogID())
                    .bind("label", log.getLabel())
                    .bind("userID", log.getUserID())
                    .bind("location", log.getLocation())
                    .bind("beforeData", log.getBeforeData())
                    .bind("afterData", log.getAfterData())
                    .execute();
        });
    }

    public int delete(String id) {
        return jdbi.withHandle(handle -> {
            return handle.createUpdate("DELETE FROM logs WHERE logID = ?")
                    .bind(0, id)
                    .execute();
        });
    }
}
