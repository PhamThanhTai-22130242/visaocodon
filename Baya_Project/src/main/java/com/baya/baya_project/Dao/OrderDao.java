package com.baya.baya_project.Dao;

import com.baya.baya_project.Dao.mapper.OrderListRowMapper;
import com.baya.baya_project.Dao.mapper.OrderRowMapper;
import com.baya.baya_project.Model.Order;
import com.baya.baya_project.Model.OrderDetail;
import com.baya.baya_project.Model.OrderStatusSummary;
import com.baya.baya_project.Model.ProductBestSeller;
import org.jdbi.v3.core.Jdbi;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public class OrderDao implements DaoInterface<Order> {
    public Jdbi jdbi;

    public OrderDao() {
        jdbi = JDBIConnector.getJdbi();
    }

    @Override
    public List<Order> selectAll() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT \n" +
                                "    o.orderID,\n" +
                                "    o.userID,\n" +
                                "    o.fullname,\n" +
                                "    o.email,\n" +
                                "    o.phoneNumber,\n" +
                                "    o.address,\n" +
                                "    o.paymentID,\n" +
                                "    pm.paymentName,\n" +
                                "    os.orderStatusName,\n" +
                                "    o.orderStatusID,\n" +
                                "    o.totalPrice,\n" +
                                "    o.createAt,\n" +
                                "    o.deliveredDate,\n" +
                                "    o.note,\n" +
                                "    od.productID,\n" +
                                "    p.name,\n" +
                                "    p.price,\n" +
                                "    p.discountDefault,\n" +
                                "    p.thumbnail,\n" +
                                "    od.quantity,\n" +
                                "    o.fee,\n"+
                                "    o.discount,\n"+
                                "    od.totalPrice As totalPriceDetail\n" +
                                "FROM \n" +
                                "    orders o\n" +
                                "LEFT JOIN \n" +
                                "    order_detail od ON o.orderID = od.orderID\n" +
                                "LEFT JOIN \n" +
                                "    payment pm ON o.paymentID = pm.paymentID\n" +
                                "LEFT JOIN \n" +
                                "    order_status os ON o.orderStatusID = os.orderStatusID\n" +
                                "LEFT JOIN \n" +
                                "    products p ON p.productID = od.productID \n" +
                                "    \n" +
                                "ORDER BY \n" +
                                "    o.orderId, od.productId;\n")
                        .map(new OrderListRowMapper())
                        .findOne().orElse(null));

    }

    @Override
    public Order selectById(String id) {
        return null;
    }

    @Override
    public Order selectById(int id) {

        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT \n" +
                                "    o.orderID,\n" +
                                "    o.userID,\n" +
                                "    o.fullname,\n" +
                                "    o.email,\n" +
                                "    o.phoneNumber,\n" +
                                "    o.address,\n" +
                                "    o.paymentID,\n" +
                                "    pm.paymentName,\n" +
                                "    os.orderStatusName,\n" +
                                "    o.orderStatusID,\n" +
                                "    o.totalPrice,\n" +
                                "    o.createAt,\n" +
                                "    o.deliveredDate,\n" +
                                "    o.note,\n" +
                                "    od.productID,\n" +
                                "    p.name,\n" +
                                "    p.price,\n" +
                                "    p.discountDefault,\n" +
                                "    p.thumbnail,\n" +
                                "    od.quantity,\n" +
                                "    o.fee,\n"+
                                "    o.discount,\n"+
                                "    od.totalPrice As totalPriceDetail\n" +
                                "FROM \n" +
                                "    orders o\n" +
                                "LEFT JOIN \n" +
                                "order_detail od ON o.orderID = od.orderID\n" +
                                "LEFT JOIN \n" +
                                "    payment pm ON o.paymentID = pm.paymentID\n" +
                                "LEFT JOIN \n" +
                                "    order_status os ON o.orderStatusID = os.orderStatusID\n" +
                                "LEFT JOIN \n" +
                                "    products p ON p.productID = od.productID \n" +
                                "    \n" +
                                "    WHERE o.orderId = ?")
                        .bind(0,id)
                        .map(new OrderRowMapper())
                        .findFirst().orElse(null));
    }

    public List<Order> selectByUserId(int customerId) {

        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT \n" +
                                "    o.orderID,\n" +
                                "    o.userID,\n" +
                                "    o.fullname,\n" +
                                "    o.email,\n" +
                                "    o.phoneNumber,\n" +
                                "    o.address,\n" +
                                "    o.paymentID,\n" +
                                "    pm.paymentName,\n" +
                                "    os.orderStatusName,\n" +
                                "    o.orderStatusID,\n" +
                                "    o.totalPrice,\n" +
                                "    o.createAt,\n" +
                                "    o.deliveredDate,\n" +
                                "    o.note,\n" +
                                "    od.productID,\n" +
                                "    p.name,\n" +
                                "    p.price,\n" +
                                "    p.discountDefault,\n" +
                                "    p.thumbnail,\n" +
                                "    od.quantity,\n" +
                                "    o.fee,\n"+
                                "    o.discount,\n"+
                                "    od.totalPrice As totalPriceDetail\n" +
                                "FROM \n" +
                                "    orders o\n" +
                                "LEFT JOIN \n" +
                                "    order_detail od ON o.orderID = od.orderID\n" +
                                "LEFT JOIN \n" +
                                "    payment pm ON o.paymentID = pm.paymentID\n" +
                                "LEFT JOIN \n" +
                                "    order_status os ON o.orderStatusID = os.orderStatusID\n" +
                                "LEFT JOIN \n" +
                                "    products p ON p.productID = od.productID \n" +
                                "    \n" +
                                "    WHERE o.userID=?\n" +
                                "    \n" +
                                "ORDER BY \n" +
                                "    o.orderId, od.productId;\n")
                        .bind(0, customerId)
                        .map(new OrderListRowMapper())
                        .findOne().orElse(null));


    }

    @Override
    public int insert(Order order) {
        AtomicInteger orderID= new AtomicInteger();
        jdbi.useTransaction(handle -> {
            orderID.set(handle.createUpdate(
                            "INSERT INTO orders (userID,fullname, email, phoneNumber, address,paymentID, orderStatusID, totalPrice, createAt, deliveredDate,note,fee,discount) " +
                                    "VALUES (:userID,:fullname, :email, :phoneNumber, :address, :paymentID, :orderStatusID, :totalPrice, :createAt, :deliveredDate,:note,:fee,:discount)")
                    .bind("userID", order.getUserId())
                    .bind("fullname", order.getFullname())
                    .bind("email", order.getEmail())
                    .bind("phoneNumber", order.getPhoneNumber())
                    .bind("address", order.getAddress())
                    .bind("paymentID", order.getPaymentID())
                    .bind("orderStatusID", order.getOrderStatusID())
                    .bind("totalPrice", order.getTotalPrice())
                    .bind("createAt", order.getCreateAt())
                    .bind("deliveredDate", order.getDeliveredDate())
                    .bind("note", order.getNote())
                    .bind("fee", order.getFee())
                    .bind("discount", order.getDiscount())

                    .executeAndReturnGeneratedKeys("orderID")
                    .mapTo(Integer.class)
                    .one());

            for (OrderDetail detail : order.getItems()) {
                detail.setOrderID(orderID.get()); // Gán orderID cho từng chi tiết đơn hàng
                handle.createUpdate(
                                "INSERT INTO order_detail (orderID, productID,  quantity, totalPrice) " +
                                        "VALUES (:orderID, :productID, :quantity, :totalPrice)")
                        .bind("orderID", detail.getOrderID())
                        .bind("productID", detail.getProductID())
                        .bind("quantity", detail.getQuantity())
                        .bind("totalPrice", detail.getTotalPrice())
                        .execute();
            }
        });

        return orderID.get();
    }

    @Override
    public int update(Order order) {

       int rs =  jdbi.withHandle(handle -> {
           return handle.createUpdate(
                           "UPDATE orders \n" +
                                   "            SET fullname = ?,\n" +
                                   "                phoneNumber = ?,\n" +
                                   "                email = ?,\n" +
                                   "                address = ?,\n" +
                                   "                Note = ?,\n" +
                                   "                paymentID = ?,\n" +
                                   "                orderStatusID = ?\n" +
                                   "            WHERE orderId = ?")
                   .bind(0, order.getFullname())
                   .bind(1, order.getPhoneNumber())
                   .bind(2, order.getEmail())
                   .bind(3, order.getAddress())
                   .bind(4, order.getNote())
                   .bind(5, order.getPaymentID())
                   .bind(6, order.getOrderStatusID())
                   .bind(7, order.getOrderId())
                   .execute();
       });

       return rs;
    }

    @Override
    public int delete(String id) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE orders SET orderStatusID = :statusID WHERE orderID = :orderID")
                        .bind("statusID", 4)
                        .bind("orderID", id)
                        .execute()
        );
    }


    public List<Order> selectByStatus(int userID, int statusID) {
        System.out.println(statusID);
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT \n" +
                                "    o.orderID,\n" +
                                "    o.userID,\n" +
                                "    o.fullname,\n" +
                                "    o.email,\n" +
                                "    o.phoneNumber,\n" +
                                "    o.address,\n" +
                                "    o.paymentID,\n" +
                                "    pm.paymentName,\n" +
                                "    os.orderStatusName,\n" +
                                "    o.orderStatusID,\n" +
                                "    o.totalPrice,\n" +
                                "    o.createAt,\n" +
                                "    o.deliveredDate,\n" +
                                "    o.note,\n" +
                                "    od.productID,\n" +
                                "    p.name,\n" +
                                "    p.price,\n" +
                                "    p.discountDefault,\n" +
                                "    p.thumbnail,\n" +
                                "    od.quantity,\n" +
                                "    o.fee,\n"+
                                "    o.discount,\n"+
                                "    od.totalPrice As totalPriceDetail\n" +
                                "FROM \n" +
                                "    orders o\n" +
                                "LEFT JOIN \n" +
                                "    order_detail od ON o.orderID = od.orderID\n" +
                                "LEFT JOIN \n" +
                                "    payment pm ON o.paymentID = pm.paymentID\n" +
                                "LEFT JOIN \n" +
                                "    order_status os ON o.orderStatusID = os.orderStatusID\n" +
                                "LEFT JOIN \n" +
                                "    products p ON p.productID = od.productID \n" +
                                "    \n" +
                                "    WHERE o.userID = ? AND o.orderStatusID = ?" +
                                "    \n" +
                                "ORDER BY \n" +
                                "    o.orderId, od.productId;\n")
                        .bind(0,userID)
                        .bind(1,statusID)
                        .map(new OrderListRowMapper())
                        .findFirst().orElse(null));
    }


    public static void main(String[] args) {
        System.out.println(new OrderDao().selectById(1));
    }

    public boolean setStatusOrder(int id, int idStatus) {
        if(idStatus==3){
            boolean check = updateProductQuantities(id);
            if(!check) return false;
        }

        int rs =  jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE orders SET orderStatusID = ? WHERE orderID = ?")
                        .bind(0, idStatus)
                        .bind(1, id)
                        .execute()
        );
        return rs>0;
    }

    public int getTurnOverToday() {
        return jdbi.withHandle(hanlder ->{
            return hanlder.createQuery(
                    "select sum(o.totalPrice) as total from orders o where o.deliveredDate is not null and DATE(o.deliveredDate) = CURRENT_DATE").
                    mapTo(Integer.class).findOne().orElse(0);
        });
    }

    public int getTurnOverMonth() {
        return jdbi.withHandle(hanlder ->{
            return hanlder.createQuery(
                    "select sum(o.totalPrice) as total from orders o where o.deliveredDate is not null and MONTH(o.deliveredDate)= MONTH(CURRENT_DATE) " +
                    "and YEAR(o.deliveredDate)= YEAR(CURRENT_DATE)").
                    mapTo(Integer.class)
                    .findOne()
                    .orElse(0);
        });
    }

    public List<Order> getTop5rdersRecent() {

        return jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT \n" +
                            "    o.orderID,\n" +
                            "    o.userID,\n" +
                            "    o.fullname,\n" +
                            "    o.email,\n" +
                            "    o.phoneNumber,\n" +
                            "    o.address,\n" +
                            "    o.paymentID,\n" +
                            "    pm.paymentName,\n" +
                            "    os.orderStatusName,\n" +
                            "    o.orderStatusID,\n" +
                            "    o.totalPrice,\n" +
                            "    o.createAt,\n" +
                            "    o.deliveredDate,\n" +
                            "    o.note,\n" +
                            "    od.productID,\n" +
                            "    p.name,\n" +
                            "    p.price,\n" +
                            "    p.discountDefault,\n" +
                            "    p.thumbnail,\n" +
                            "    od.quantity,\n" +
                            "    o.fee,\n" +
                            "    o.discount,\n" +
                            "    od.totalPrice As totalPriceDetail\n" +
                            "FROM \n" +
                            "    orders o\n" +
                            "LEFT JOIN \n" +
                            "    order_detail od ON o.orderID = od.orderID\n" +
                            "LEFT JOIN \n" +
                            "    payment pm ON o.paymentID = pm.paymentID\n" +
                            "LEFT JOIN \n" +
                            "    order_status os ON o.orderStatusID = os.orderStatusID\n" +
                            "LEFT JOIN \n" +
                            "    products p ON p.productID = od.productID \n" +
                            "    \n" +
                            "Where o.deliveredDate is not null "+
                            "ORDER BY \n" +
                            "    o.deliveredDate  DESC" +
                            " Limit 5;\n")
                    .map(new OrderListRowMapper())
                    .findOne().orElse(null);
        });

    }

    private boolean updateProductQuantities(int orderId) {

        Order order = selectById(orderId);

        for (OrderDetail orderDetail : order.getItems()) {
            int quantity = orderDetail.getQuantity();
            String productId = orderDetail.getProductID();


            Integer currentStock = jdbi.withHandle(handle -> {
                return handle.createQuery(
                                "SELECT QuanlityStock FROM products WHERE productID = ?")
                        .bind(0, productId)
                        .mapTo(Integer.class)
                        .findOne()
                        .orElse(0);
            });

            if (currentStock < quantity) {

                return false;
            }

        }

        for (OrderDetail orderDetail : order.getItems()) {
            int quantity = orderDetail.getQuantity();
            String productId = orderDetail.getProductID();

                jdbi.withHandle(handle -> {
                    return handle.createUpdate(
                                    "UPDATE products SET QuanlityStock = QuanlityStock - ?, QuanlitySell = QuanlitySell + ? WHERE productID = ?")
                            .bind(0, quantity)
                            .bind(1, quantity)
                            .bind(2, productId)
                            .execute();
                });
        }


        return true;

    }

    public List<Order> selectByStatusAndMethodPayment(int userID, Integer statusID, int methodPaymentID) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT \n" +
                                "    o.orderID,\n" +
                                "    o.userID,\n" +
                                "    o.fullname,\n" +
                                "    o.email,\n" +
                                "    o.phoneNumber,\n" +
                                "    o.address,\n" +
                                "    o.paymentID,\n" +
                                "    pm.paymentName,\n" +
                                "    os.orderStatusName,\n" +
                                "    o.orderStatusID,\n" +
                                "    o.totalPrice,\n" +
                                "    o.createAt,\n" +
                                "    o.deliveredDate,\n" +
                                "    o.note,\n" +
                                "    od.productID,\n" +
                                "    p.name,\n" +
                                "    p.price,\n" +
                                "    p.discountDefault,\n" +
                                "    p.thumbnail,\n" +
                                "    od.quantity,\n" +
                                "    o.fee,\n" +
                                "    o.discount,\n" +
                                "    od.totalPrice AS totalPriceDetail\n" +
                                "FROM \n" +
                                "    orders o\n" +
                                "LEFT JOIN \n" +
                                "    order_detail od ON o.orderID = od.orderID\n" +
                                "LEFT JOIN \n" +
                                "    payment pm ON o.paymentID = pm.paymentID\n" +
                                "LEFT JOIN \n" +
                                "    order_status os ON o.orderStatusID = os.orderStatusID\n" +
                                "LEFT JOIN \n" +
                                "    products p ON p.productID = od.productID\n" +
                                "WHERE o.userID = :userID " +
                                "AND (:statusID IS NULL OR o.orderStatusID = :statusID) " +
                                "AND o.paymentID = :methodPaymentID " +
                                "ORDER BY o.orderId, od.productId;")
                        .bind("userID", userID)
                        .bind("statusID", statusID)
                        .bind("methodPaymentID", methodPaymentID)
                        .map(new OrderListRowMapper())
                        .findOne().orElse(new ArrayList<>()));
    }

    public List<Order> selectByStatusAndDate(int userID, Integer statusID, Date startdate, Date enddate) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT \n" +
                                "    o.orderID,\n" +
                                "    o.userID,\n" +
                                "    o.fullname,\n" +
                                "    o.email,\n" +
                                "    o.phoneNumber,\n" +
                                "    o.address,\n" +
                                "    o.paymentID,\n" +
                                "    pm.paymentName,\n" +
                                "    os.orderStatusName,\n" +
                                "    o.orderStatusID,\n" +
                                "    o.totalPrice,\n" +
                                "    o.createAt,\n" +
                                "    o.deliveredDate,\n" +
                                "    o.note,\n" +
                                "    od.productID,\n" +
                                "    p.name,\n" +
                                "    p.price,\n" +
                                "    p.discountDefault,\n" +
                                "    p.thumbnail,\n" +
                                "    od.quantity,\n" +
                                "    o.fee,\n" +
                                "    o.discount,\n" +
                                "    od.totalPrice AS totalPriceDetail\n" +
                                "FROM \n" +
                                "    orders o\n" +
                                "LEFT JOIN \n" +
                                "    order_detail od ON o.orderID = od.orderID\n" +
                                "LEFT JOIN \n" +
                                "    payment pm ON o.paymentID = pm.paymentID\n" +
                                "LEFT JOIN \n" +
                                "    order_status os ON o.orderStatusID = os.orderStatusID\n" +
                                "LEFT JOIN \n" +
                                "    products p ON p.productID = od.productID\n" +
                                "WHERE o.userID = :userID " +
                                "AND (:statusID IS NULL OR o.orderStatusID = :statusID) " +
                                "AND (o.createAt BETWEEN :startDate AND :endDate) " +
                                "ORDER BY o.orderId, od.productId;")
                        .bind("userID", userID)
                        .bind("statusID", statusID)
                        .bind("startDate", startdate)
                        .bind("endDate", enddate)
                        .map(new OrderListRowMapper())
                        .findOne().orElse(new ArrayList<>()));
    }

    public List<Order> selectByStatusDateAndMethodPayment(int userID, Integer statusID, Date startDate, Date endDate, int methodPaymentID) {
        System.out.println(userID+" "+statusID+" "+startDate.toString()+" "+endDate.toString()+" "+methodPaymentID);
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT \n" +
                                "    o.orderID,\n" +
                                "    o.userID,\n" +
                                "    o.fullname,\n" +
                                "    o.email,\n" +
                                "    o.phoneNumber,\n" +
                                "    o.address,\n" +
                                "    o.paymentID,\n" +
                                "    pm.paymentName,\n" +
                                "    os.orderStatusName,\n" +
                                "    o.orderStatusID,\n" +
                                "    o.totalPrice,\n" +
                                "    o.createAt,\n" +
                                "    o.deliveredDate,\n" +
                                "    o.note,\n" +
                                "    od.productID,\n" +
                                "    p.name,\n" +
                                "    p.price,\n" +
                                "    p.discountDefault,\n" +
                                "    p.thumbnail,\n" +
                                "    od.quantity,\n" +
                                "    o.fee,\n" +
                                "    o.discount,\n" +
                                "    od.totalPrice AS totalPriceDetail\n" +
                                "FROM \n" +
                                "    orders o\n" +
                                "LEFT JOIN \n" +
                                "    order_detail od ON o.orderID = od.orderID\n" +
                                "LEFT JOIN \n" +
                                "    payment pm ON o.paymentID = pm.paymentID\n" +
                                "LEFT JOIN \n" +
                                "    order_status os ON o.orderStatusID = os.orderStatusID\n" +
                                "LEFT JOIN \n" +
                                "    products p ON p.productID = od.productID\n" +
                                "WHERE o.userID = :userID " +
                                "AND (:statusID IS NULL OR o.orderStatusID = :statusID) " +
                                "AND (o.createAt BETWEEN :startDate AND :endDate) " +
                                "AND o.paymentID = :methodPaymentID " +
                                "ORDER BY o.orderId, od.productId;")
                        .bind("userID", userID)
                        .bind("statusID", statusID)
                        .bind("startDate", startDate)
                        .bind("endDate", endDate)
                        .bind("methodPaymentID", methodPaymentID)
                        .map(new OrderListRowMapper())
                        .findOne().orElse(new ArrayList<>()));
    }

    public List<ProductBestSeller> getTopProducts(Date startDate, Date endDate) {
        return jdbi.withHandle(handle -> handle.createQuery(
                        "SELECT " +
                                "p.productID AS productID, " +
                                "p.name AS name, " +
                                "SUM(od.quantity) AS totalSold " +
                                "FROM order_detail od " +
                                "JOIN products p ON od.productID = p.productID " +
                                "JOIN orders o ON od.orderID = o.orderID " +
                                "WHERE o.createAt BETWEEN :startDate AND :endDate " +
                                "GROUP BY p.productID, p.name " +
                                "ORDER BY totalSold DESC " +
                                "LIMIT 5"
                )
                .bind("startDate", new java.sql.Date(startDate.getTime()))
                .bind("endDate", new java.sql.Date(endDate.getTime()))
                .map((rs, ctx) -> new ProductBestSeller(
                        rs.getString("productID"),
                        rs.getString("name"),
                        rs.getInt("totalSold")
                ))
                .list());
    }
    public void updateOrderStatus(int orderId) {
        jdbi.useHandle(handle -> handle.createUpdate(
                        "UPDATE orders SET orderStatusID = 2 WHERE orderID = :orderId"
                )
                .bind("orderId", orderId)
                .execute());
    }
    public void updateReturnStatus(int orderId) {
        jdbi.useHandle(handle -> {
            handle.createUpdate(
                    "UPDATE return_request_order SET imported = 1  WHERE orderID = :orderId"
            ).bind("orderId", orderId).execute();

        });
    }

    public List<ProductBestSeller> getNonSellingProducts(Date startDate, Date endDate) {
        return jdbi.withHandle(handle -> handle.createQuery(
                        "SELECT p.productID, p.name, 0 AS totalSold " +
                                "FROM products p " +
                                "WHERE p.productID NOT IN (" +
                                "  SELECT DISTINCT od.productID " +
                                "  FROM order_detail od " +
                                "  JOIN orders o ON od.orderID = o.orderID " +
                                "  WHERE o.createAt BETWEEN :startDate AND :endDate" +
                                ")"
                )
                .bind("startDate", startDate)
                .bind("endDate", endDate)
                .map((rs, ctx) -> new ProductBestSeller(
                        rs.getString("productID"),
                        rs.getString("name"),
                        rs.getInt("totalSold")
                ))
                .list());
    }

    public List<OrderStatusSummary> getOrderStatusSummary(Date startDate, Date endDate) {
        return jdbi.withHandle(handle ->
                handle.createQuery(
                                "SELECT os.orderStatusName AS statusName, COUNT(*) AS count " +
                                        "FROM orders o " +
                                        "JOIN order_status os ON o.orderStatusID = os.orderStatusID " +
                                        "WHERE o.createAt BETWEEN :startDate AND :endDate " +
                                        "GROUP BY os.orderStatusName"
                        )
                        .bind("startDate", startDate)
                        .bind("endDate", endDate)
                        .map((rs, ctx) -> new OrderStatusSummary(
                                rs.getString("statusName"),
                                rs.getInt("count")
                        ))
                        .list()
        );
    }

    public List<Integer> getMonthlyRevenue() {
        return jdbi.withHandle(handle -> {
            List<Integer> revenues = new ArrayList<>(Collections.nCopies(12, 0));

            String query = "SELECT MONTH(deliveredDate) AS month, SUM(totalPrice) AS total_revenue " +
                    "FROM orders " +
                    "WHERE YEAR(deliveredDate) = YEAR(CURDATE()) AND orderStatusID = 3 " +
                    "GROUP BY MONTH(deliveredDate)";

            handle.createQuery(query)
                    .mapToMap()
                    .forEach(row -> {
                        int month = ((Number) row.get("month")).intValue() - 1;
                        BigDecimal totalRevenueBigDecimal = (BigDecimal) row.get("total_revenue");
                        int totalRevenue = totalRevenueBigDecimal.intValue();
                        revenues.set(month, totalRevenue);
                    });

            return revenues;
        });
    }
    public BigDecimal getTotalRevenueByDateRange(Date startDate, Date endDate) {
        return jdbi.withHandle(handle ->
                handle.createQuery(
                                "SELECT COALESCE(SUM(totalPrice), 0) AS totalRevenue " +
                                        "FROM orders " +
                                        "WHERE deliveredDate BETWEEN :startDate AND :endDate " +
                                        "AND orderStatusID = 3"
                        )
                        .bind("startDate", startDate)
                        .bind("endDate", endDate)
                        .mapTo(BigDecimal.class)
                        .one()
        );
    }

}


