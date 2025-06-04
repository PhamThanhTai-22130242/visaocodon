package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.Inventory;
import com.baya.baya_project.Model.StockIssue;
import com.baya.baya_project.Model.StockIssueDetail;
import com.baya.baya_project.Model.StockReceiptDetail;
import org.jdbi.v3.core.Jdbi;

import java.time.LocalDateTime;
import java.util.List;

public class StockIssueDao implements DaoInterface<StockIssue>
{

    private Jdbi jdbi;
    private InventoryDao dao;

    public StockIssueDao () {

        jdbi = JDBIConnector.getJdbi();
        dao = new InventoryDao();
    }

    @Override
    public List<StockIssue> selectAll() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM stock_issues")
                        .mapToBean(StockIssue.class)
                        .list()
        );    }

    @Override
    public StockIssue selectById(String id) {
        return selectById(Integer.parseInt(id));

    }

    @Override
    public StockIssue selectById(int id) {
        return jdbi.withHandle(handle -> {

            StockIssue issue = handle.createQuery("SELECT * FROM stock_issues WHERE id = :id")
                    .bind("id", id)
                    .mapToBean(StockIssue.class)
                    .findOne()
                    .orElse(null);


            if (issue != null) {
                List<StockIssueDetail> details = handle.createQuery("SELECT * FROM stock_issue_details WHERE issueID = :id")
                        .bind("id", id)
                        .mapToBean(StockIssueDetail.class)
                        .list();
                issue.setItems(details,issue.getIssue_type());
            }

            return issue;
        });

    }


    @Override
    public int insert(StockIssue stockIssue) {

        return jdbi.inTransaction(handle -> {
            try{
                int Id = handle.createUpdate(
                                "INSERT INTO stock_issues (userID, note, issue_type) VALUES (:userID, :note, :type)"
                        )
                        .bind("userID", stockIssue.getAdmin_id())
                        .bind("note", stockIssue.getNote())
                        .bind("type", stockIssue.getIssue_type())
                        .executeAndReturnGeneratedKeys("id")
                        .mapTo(int.class)
                        .one();

                stockIssue.setId(Id);

                for (StockIssueDetail detail : stockIssue.getItems()) {
                    detail.setIssue_id(Id);

                    handle.createUpdate("INSERT INTO stock_issue_details (issueID, productID, quantity, unit_price)VALUES (:issueID, :productID, :quantity, :unit_price)")
                            .bind("issueID", detail.getIssue_id())
                            .bind("productID", detail.getProduct_id())
                            .bind("quantity", detail.getQuantity())
                            .bind("unit_price", detail.getUnit_price())
                            .execute();

                    int newQua =  dao.selectById(detail.getProduct_id()).getQuantity() - detail.getQuantity() ;
                    dao.update(new Inventory(detail.getProduct_id(),newQua));

                    handle.createUpdate("INSERT INTO inventory_history (productID, change_type, related_id, quantity_change, new_quantity, changed_by, note) VALUES (:productID, 'issue', :related_id, :quantity_change, :new_quantity, :changed_by, :note)")
                            .bind("productID", detail.getProduct_id())
                            .bind("related_id", Id)
                            .bind("quantity_change", detail.getQuantity())
                            .bind("new_quantity", newQua)
                            .bind("changed_by", stockIssue.getAdmin_id())
                            .bind("note", stockIssue.getNote())
                            .execute();
                }


                return Id;

            }catch(Exception e){
                handle.rollback();
                throw e;
            }
        });

    }

    @Override
    public int update(StockIssue stockIssue) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE stock_issues SET userID = :userID, orderID = :orderID, " +
                                "issue_date = :issueDate, note = :note , issue_type= :issue_type" +
                                " WHERE id = :id")
                        .bind("userID", stockIssue.getAdmin_id())
                        .bind("orderID", stockIssue.getOrder_id())
                        .bind("issueDate", stockIssue.getIssue_date() == null ? LocalDateTime.now() : stockIssue.getIssue_date())
                        .bind("note", stockIssue.getNote())
                        .bind("issue_type",stockIssue.getIssue_type())
                        .bind("id", stockIssue.getId())
                        .execute()
        );
    }

    @Override
    public int delete(String id) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM stock_issues WHERE id = :id")
                        .bind("id", Integer.parseInt(id))
                        .execute()
        );
    }

    public static void main(String[] args) {
        StockIssueDao dao = new StockIssueDao();
        System.out.println(dao.selectAll());
    }
}
