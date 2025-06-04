package com.baya.baya_project.Dao.mapper;

import com.baya.baya_project.Model.Order;
import com.baya.baya_project.Model.OrderDetail;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class OrderListRowMapper implements RowMapper<List<Order>> {
    Map<Integer, Order> orderMap = new HashMap<>();
    @Override
    public List<Order> map(ResultSet rs, StatementContext ctx) throws SQLException {

        while (rs.next()) {

            int orderId = rs.getInt("orderID");
            Order order = orderMap.get(orderId);

            if (order == null) {

                order = new Order(
                        orderId,
                        rs.getInt("userID"),
                        rs.getString("fullname"),
                        rs.getString("email"),
                        rs.getInt("phoneNumber"),
                        rs.getString("address"),
                        rs.getInt("paymentID"),
                        rs.getString("paymentName"),
                        rs.getString("orderStatusName"),
                        rs.getInt("orderStatusID"),
                        rs.getInt("totalPrice"),
                        rs.getDate("createAt"),
                        rs.getDate("deliveredDate"),
                        new ArrayList<>(),
                        rs.getString("note"),
                        rs.getInt("fee"),
                        rs.getInt("discount"));
                        orderMap.put(orderId, order);
            }


            System.out.println(orderId);

            // Tạo OrderDetail
            OrderDetail orderDetail = new OrderDetail(
                    orderId,
                    rs.getString("productID"),
                    rs.getString("name"),
                    rs.getInt("price"),
                    rs.getInt("discountDefault"),
                    rs.getString("thumbnail"),
                    rs.getInt("quantity"),
                    rs.getInt("totalPriceDetail")
            );
            order.getItems().add(orderDetail);
        }

        return new ArrayList<>(orderMap.values());
    }
}
