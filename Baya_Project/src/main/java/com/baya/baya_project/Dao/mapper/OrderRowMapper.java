package com.baya.baya_project.Dao.mapper;

import com.baya.baya_project.Model.Order;
import com.baya.baya_project.Model.OrderDetail;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderRowMapper implements RowMapper<Order> {
    @Override
    public Order map(ResultSet rs, StatementContext ctx) throws SQLException {

        Order order = new Order();
        order.setOrderId(rs.getInt("orderID"));
        order.setUserId(rs.getInt("userID"));
        order.setFullname(rs.getString("fullname"));
        order.setEmail(rs.getString("email"));
        order.setPhoneNumber(rs.getInt("phoneNumber"));
        order.setAddress(rs.getString("address"));
        order.setPaymentName(rs.getString("paymentName"));
        order.setOrderStatusName(rs.getString("orderStatusName"));
        order.setOrderStatusID(rs.getInt("orderStatusID"));
        order.setPaymentID(rs.getInt("paymentID"));
        order.setTotalPrice(rs.getInt("totalPrice"));
        order.setCreateAt(rs.getDate("createAt"));
        order.setDeliveredDate(rs.getDate("deliveredDate"));
        order.setNote(rs.getString("note"));
        order.setFee(rs.getInt("fee"));
        order.setDiscount(rs.getInt("discount"));

        List<OrderDetail> items = new ArrayList<>();
        do {
            OrderDetail item = new OrderDetail();
            item.setOrderID(rs.getInt("orderID"));
            item.setProductID(rs.getString("productID"));
            item.setQuantity(rs.getInt("quantity"));
            item.setTotalPrice(rs.getInt("totalPrice"));
            item.setName(rs.getString("name"));
            item.setPrice(rs.getInt("price"));
            item.setThumbnail(rs.getString("thumbnail"));
            item.setDiscountDefault(rs.getInt("discountDefault"));
            items.add(item);
        } while (rs.next());

        order.setItems(items);
        return order;
    }
}
