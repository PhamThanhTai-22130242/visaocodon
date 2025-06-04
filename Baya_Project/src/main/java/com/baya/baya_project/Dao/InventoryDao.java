package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.Category;
import com.baya.baya_project.Model.Inventory;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class InventoryDao implements DaoInterface<Inventory>
{

    private Jdbi jdbi;
    public InventoryDao() {
        jdbi = JDBIConnector.getJdbi();
    }
    @Override
    public List<Inventory> selectAll() {
        return List.of();
    }

    @Override
    public Inventory selectById(String id) {
        return jdbi.withHandle(ha ->{
            return ha.createQuery("\n" +
                            "select * "+
                            "FROM inventory " +
                            "where productID = ? "
                    )
                    .bind(0, id).mapToBean(Inventory.class).findFirst().orElse(null);
        });    }

    @Override
    public Inventory selectById(int id) {
        return null;
    }

    @Override
    public int insert(Inventory inventory) {
        return 0;
    }

    @Override
    public int update(Inventory inventory) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE inventory SET quantity = ?" +
                                " WHERE productID = ?")
                        .bind(0, inventory.getQuantity())
                        .bind(1, inventory.getProduct_id())
                        .execute()
        );
    }

    @Override
    public int delete(String id) {
        return 0;
    }
}
