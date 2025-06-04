package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.OrderDetail;

import java.util.List;

public class OrderDetailDao implements DaoInterface<OrderDetail> {
    @Override
    public List<OrderDetail> selectAll() {
        return List.of();
    }

    @Override
    public OrderDetail selectById(String id) {
        return null;
    }

    @Override
    public OrderDetail selectById(int id) {
        return null;
    }

    @Override
    public int insert(OrderDetail orderDetail) {
        return 0;
    }

    @Override
    public int update(OrderDetail orderDetail) {
        return 0;
    }

    @Override
    public int delete(String id) {
        return 0;
    }
}
