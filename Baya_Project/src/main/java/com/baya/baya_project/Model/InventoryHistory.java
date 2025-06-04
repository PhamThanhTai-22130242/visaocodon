package com.baya.baya_project.Model;

import java.time.LocalDateTime;

public class InventoryHistory {
    private int id;
    private int productID;
    private String change_type;
    private int related_id;
    private int quantity_change;
    private int new_quantity;
    private LocalDateTime change_date;
    private int changed_by;
    private String note;

    public InventoryHistory() {}

    public InventoryHistory(int id, int product_id, String change_type, int related_id, int quantity_change,
                            int new_quantity, LocalDateTime change_date, int changed_by, String note) {
        this.id = id;
        this.productID = product_id;
        this.change_type = change_type;
        this.related_id = related_id;
        this.quantity_change = quantity_change;
        this.new_quantity = new_quantity;
        this.change_date = change_date;
        this.changed_by = changed_by;
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProduct_id() {
        return productID;
    }

    public void setProduct_id(int product_id) {
        this.productID = product_id;
    }

    public String getChange_type() {
        return change_type;
    }

    public void setChange_type(String change_type) {
        this.change_type = change_type;
    }

    public int getRelated_id() {
        return related_id;
    }

    public void setRelated_id(int related_id) {
        this.related_id = related_id;
    }

    public int getQuantity_change() {
        return quantity_change;
    }

    public void setQuantity_change(int quantity_change) {
        this.quantity_change = quantity_change;
    }

    public int getNew_quantity() {
        return new_quantity;
    }

    public void setNew_quantity(int new_quantity) {
        this.new_quantity = new_quantity;
    }

    public LocalDateTime getChange_date() {
        return change_date;
    }

    public void setChange_date(LocalDateTime change_date) {
        this.change_date = change_date;
    }

    public int getChanged_by() {
        return changed_by;
    }

    public void setChanged_by(int changed_by) {
        this.changed_by = changed_by;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
