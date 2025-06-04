package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.Actions;
import com.baya.baya_project.Model.Resource;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class ActionsDao {
    public Jdbi jdbi;

    public ActionsDao() {
        jdbi = JDBIConnector.getJdbi();
    }
    public List<Actions> selectAll() {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT actionID, actionName\n" +
                    "FROM actions"
            ).mapToBean(Actions.class).list();
        });
    }

}
