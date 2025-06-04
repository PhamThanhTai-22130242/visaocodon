package com.baya.baya_project.service;

import com.baya.baya_project.Dao.StockIssueDao;
import com.baya.baya_project.Dao.StockReceiptDao;
import com.baya.baya_project.Model.StockIssue;
import com.baya.baya_project.Model.StockReceipt;

import java.util.List;

public class StockService {

    StockReceiptDao dao;
    StockIssueDao stockIssueDao;
    public StockService() {
        dao = new StockReceiptDao();
        stockIssueDao = new StockIssueDao();
    }

    public boolean addStockReceipt(StockReceipt stockReceipt) {
            return dao.insert(stockReceipt) != 0;
    }

    public List<StockReceipt> getAll() {
        return dao.selectAll();
    }

    public List<StockIssue> getAllStockIssue() {
        return stockIssueDao.selectAll();
    }

    public StockReceipt getById(int id) {
        return dao.selectById(id);
    }

    public boolean addStockIssue(StockIssue stockReceipt) {
        try{
            return stockIssueDao.insert(stockReceipt) != 0;
        }catch(Exception e){
            return false;
        }
    }

    public StockIssue getByIssueId(int id) {

        return stockIssueDao.selectById(id);
    }
}
