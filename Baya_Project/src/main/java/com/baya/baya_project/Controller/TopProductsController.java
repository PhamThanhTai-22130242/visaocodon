package com.baya.baya_project.Controller;

import com.baya.baya_project.Model.ProductBestSeller;
import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import com.baya.baya_project.Dao.OrderDao;

@WebServlet("/top-products")
public class TopProductsController extends HttpServlet {

    private final OrderDao orderDao = new OrderDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String filter = request.getParameter("filter");
        String productType = request.getParameter("productType");
        System.out.println("Filter received: " + filter);
        System.out.println("Product Type received: " + productType);

        Calendar cal = Calendar.getInstance();
        java.util.Date endDateUtil = cal.getTime();
        java.util.Date startDateUtil = null;

        if ("non-seller".equals(productType)) {
            cal.add(Calendar.MONTH, -1);
            startDateUtil = cal.getTime();
        } else {
            switch (filter) {
                case "week":
                    cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());
                    cal.set(Calendar.HOUR_OF_DAY, 0);
                    cal.set(Calendar.MINUTE, 0);
                    cal.set(Calendar.SECOND, 0);
                    startDateUtil = cal.getTime();
                    break;
                case "month":
                    cal.set(Calendar.DAY_OF_MONTH, 1);
                    cal.set(Calendar.HOUR_OF_DAY, 0);
                    cal.set(Calendar.MINUTE, 0);
                    cal.set(Calendar.SECOND, 0);
                    startDateUtil = cal.getTime();
                    break;
                case "year":
                    cal.set(Calendar.DAY_OF_YEAR, 1);
                    cal.set(Calendar.HOUR_OF_DAY, 0);
                    cal.set(Calendar.MINUTE, 0);
                    cal.set(Calendar.SECOND, 0);
                    startDateUtil = cal.getTime();
                    break;
                default:
                    startDateUtil = new java.util.Date(0);
            }
        }

        Date startDate = new Date(startDateUtil.getTime());
        Date endDate = new Date(endDateUtil.getTime());

        List<ProductBestSeller> products;

        if ("non-seller".equals(productType)) {
            products = orderDao.getNonSellingProducts(startDate, endDate);
        } else {
            products = orderDao.getTopProducts(startDate, endDate);
        }

        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new Gson().toJson(products));
    }
}


