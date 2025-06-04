package com.baya.baya_project.service;

import com.baya.baya_project.Dao.OrderDao;
import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Model.Order;
import com.baya.baya_project.Model.Product;

import java.util.List;

public class OverviewAdminService {
    ProductDao productDao;
    UserDAO userDAO;
    OrderDao orderDao;

    public OverviewAdminService() {
        productDao = new ProductDao();
        userDAO = new UserDAO();
        orderDao = new OrderDao();
    }

    public int getTotalProducts() {
        return productDao.getTotalProducts();
    }

    public int getTotalUsers() {
        return userDAO.getTotalUsers();
    }
    public int getTurnOverToday() {
        return orderDao.getTurnOverToday();
    }
    public int getTurnOverToMonth() {
        return orderDao.getTurnOverMonth();
    }

    public List<Order> getTop5rdersRecent() {
        return  orderDao.getTop5rdersRecent();
    }

    public List<Product> getTop5ProductSellest() {
        return  productDao.getTop5Sellest();
    }
    public static void main(String[] args) {
        System.out.println(new OverviewAdminService().getTop5rdersRecent());
    }




}
