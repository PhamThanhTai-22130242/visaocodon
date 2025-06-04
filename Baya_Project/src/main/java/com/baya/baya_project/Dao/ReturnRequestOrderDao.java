package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.ReturnRequestOrder;
import org.jdbi.v3.core.Jdbi;


import java.util.List;

public  class ReturnRequestOrderDao implements DaoInterface<ReturnRequestOrder>{
    private Jdbi idbi;

    public ReturnRequestOrderDao() {
        idbi = JDBIConnector.getJdbi(); // đảm bảo đã có class JDBIConnector khởi tạo Jdbi
    }

    @Override
    public List<ReturnRequestOrder> selectAll() {
        return idbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM return_request_order")
                        .mapToBean(ReturnRequestOrder.class)
                        .list()
        );
    }

    @Override
    public ReturnRequestOrder selectById(String id) {
        return selectById(Integer.parseInt(id));
    }

    @Override
    public ReturnRequestOrder selectById(int id) {
        return idbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM return_request_order WHERE returnOrderID = :id")
                        .bind("id", id)
                        .mapToBean(ReturnRequestOrder.class)
                        .findOne()
                        .orElse(null)
        );
    }

    @Override
    public int insert(ReturnRequestOrder r) {
        return idbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO return_request_order (orderID, requestDate, reason, imagePath, status, adminNote) " +
                                "VALUES (:orderID, :requestDate, :reason, :imagePath, :status, :adminNote)")
                        .bindBean(r)
                        .execute()
        );
    }

    @Override
    public int update(ReturnRequestOrder r) {
        return idbi.withHandle(handle ->
                handle.createUpdate("UPDATE return_request_order SET orderID = :orderID, requestDate = :requestDate, reason = :reason, " +
                                "imagePath = :imagePath, status = :status, adminNote = :adminNote, responseDate = :responseDate " +
                                "WHERE returnOrderID = :returnOrderID")
                        .bindBean(r)
                        .execute()
        );
    }

    @Override
    public int delete(String id) {
        return idbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM return_request_order WHERE returnOrderID = :id")
                        .bind("id", Integer.parseInt(id))
                        .execute()
        );
    }


    public ReturnRequestOrder selectByOrderID(int orderId) {
        return idbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM return_request_order WHERE orderID = :id")
                        .bind("id", orderId)
                        .mapToBean(ReturnRequestOrder.class)
                        .findOne()
                        .orElse(null)
        );
    }
}
