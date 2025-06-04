package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.Category;
import com.baya.baya_project.Model.Inventory;
import com.baya.baya_project.Model.StockReceipt;
import com.baya.baya_project.Model.StockReceiptDetail;
import org.jdbi.v3.core.Jdbi;

import java.time.LocalDateTime;
import java.util.List;

public class StockReceiptDao implements  DaoInterface<StockReceipt>{

    private Jdbi jdbi;
    private InventoryDao dao;

    public StockReceiptDao() {
        jdbi = JDBIConnector.getJdbi();
        dao = new InventoryDao();
    }

    @Override
    public List<StockReceipt> selectAll() {
        return jdbi.withHandle(ha ->{
            return ha.createQuery("SELECT * FROM stock_receipts"
            ).mapToBean(StockReceipt.class).list();
        });
    }

    @Override
    public StockReceipt selectById(String id) {
      return null;
    }

    public StockReceipt selectById(int id) {
        return jdbi.withHandle(handle -> {
            StockReceipt receipt = handle.createQuery("SELECT * FROM stock_receipts WHERE id = :id")
                    .bind("id", id)
                    .mapToBean(StockReceipt.class)
                    .findFirst()
                    .orElse(null);

            if (receipt != null) {
                List<StockReceiptDetail> details = handle.createQuery("SELECT st.*, p.name FROM stock_receipt_details st \n" +
                                "JOIN products p ON st.productID = p.productID  \n" +
                                "WHERE st.receiptID = :id\n")
                        .bind("id", id)
                        .mapToBean(StockReceiptDetail.class)
                        .list();
                receipt.setItems(details);
            }
            return receipt;
        });
    }



    public int insert(StockReceipt stockReceipt) {
        return jdbi.inTransaction(handle -> {
            try{
                int receiptId = handle.createUpdate(
                                "INSERT INTO stock_receipts (userID, note, receipt_type) VALUES (:userID, :note, :type)"
                        )
                        .bind("userID", stockReceipt.getAdmin_id())
                        .bind("note", stockReceipt.getNote())
                        .bind("type", stockReceipt.getReceipt_type())
                        .executeAndReturnGeneratedKeys("receipt_id")
                        .mapTo(int.class)
                        .one();
                stockReceipt.setId(receiptId);

                for (StockReceiptDetail detail : stockReceipt.getItems()) {
                    detail.setReceipt_id(receiptId);

                    handle.createUpdate("INSERT INTO stock_receipt_details (receiptID, productID, quantity, unit_price, receipt_type)VALUES (:receiptID, :productID, :quantity, :unit_price, :receipt_type)")
                            .bind("receiptID", detail.getReceipt_id())
                            .bind("productID", detail.getProduct_id())
                            .bind("quantity", detail.getQuantity())
                            .bind("unit_price", detail.getUnit_price())
                            .bind("receipt_type", detail.getReceipt_type())
                            .execute();


                    int newQua = detail.getQuantity()+dao.selectById(detail.getProduct_id()).getQuantity();
                    dao.update(new Inventory(detail.getProduct_id(),newQua));

                    handle.createUpdate("INSERT INTO inventory_history (productID, change_type, related_id, quantity_change, new_quantity, changed_by, note) VALUES (:productID, 'receipt', :related_id, :quantity_change, :new_quantity, :changed_by, :note)")
                            .bind("productID", detail.getProduct_id())
                            .bind("related_id", receiptId)
                            .bind("quantity_change", detail.getQuantity())
                            .bind("new_quantity", newQua)
                            .bind("changed_by", stockReceipt.getAdmin_id())
                            .bind("note", stockReceipt.getNote())
                            .execute();
                }

                System.out.println("reid : " + receiptId);
                return receiptId;

            }catch(Exception e){
                handle.rollback();               throw e;
            }
        });

    }


    @Override
    public int update(StockReceipt stockReceipt) {
        System.out.println(stockReceipt);

        return jdbi.withHandle(handle ->
                handle.createUpdate(
                        "UPDATE stock_receipts SET " +
                                "userID = :userID, " +
                                "receipt_date = :receiptDate, " +
                                "note = :note " +
                                "receipt_type = :receipt_type " +
                                "WHERE id = :id")
                        .bind("userID", stockReceipt.getAdmin_id())
                        .bind("receiptDate", stockReceipt.getReceipt_date())
                        .bind("note", stockReceipt.getNote())
                        .bind("id", stockReceipt.getId())
                        .bind("receipt_type",stockReceipt.getReceipt_type())
                        .execute()
        );
    }

    @Override
    public int delete(String id) {
        return 0;
    }


    public int delete(int id) {
        return jdbi.withHandle(ha -> {
            return ha.createUpdate("DELETE FROM stock_receipts WHERE id = :id")
                    .bind("id", id).execute();
        });
    }

    public static void main(String[] args) {
        StockReceiptDao dao = new StockReceiptDao();

        System.out.println(dao.insert(new StockReceipt(3,"khách hàng trả về do hàng lỗi","trả từ khách hàng")));
    }
}
