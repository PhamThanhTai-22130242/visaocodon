package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.OrderDao;
import com.baya.baya_project.Model.OrderStatusSummary;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;

@WebServlet("/order-status-summary")
public class OrderController extends HttpServlet {

    private final OrderDao orderDao = new OrderDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String filter = request.getParameter("filter");

        if (filter == null || filter.isEmpty()) {
            System.out.println("Missing filter parameter");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing filter parameter");
            return;
        }

        Calendar cal = Calendar.getInstance();
        java.util.Date endDateUtil = cal.getTime();
        java.util.Date startDateUtil;
        java.util.Date prevStartDateUtil;
        java.util.Date prevEndDateUtil;

        // Xử lý các khoảng thời gian: hôm nay, tuần trước, tháng trước, năm trước
        switch (filter) {
            case "today":
                cal.set(Calendar.HOUR_OF_DAY, 0);
                cal.set(Calendar.MINUTE, 0);
                cal.set(Calendar.SECOND, 0);
                startDateUtil = cal.getTime();
                prevStartDateUtil = getPreviousDay(startDateUtil);  // Hôm qua
                prevEndDateUtil = prevStartDateUtil;
                break;
            case "week":
                cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());
                cal.set(Calendar.HOUR_OF_DAY, 0);
                cal.set(Calendar.MINUTE, 0);
                cal.set(Calendar.SECOND, 0);
                startDateUtil = cal.getTime();
                prevStartDateUtil = getPreviousWeek(startDateUtil); // Tuần trước
                prevEndDateUtil = getPreviousWeekEnd(startDateUtil);
                break;
            case "month":
                cal.set(Calendar.DAY_OF_MONTH, 1);
                cal.set(Calendar.HOUR_OF_DAY, 0);
                cal.set(Calendar.MINUTE, 0);
                cal.set(Calendar.SECOND, 0);
                startDateUtil = cal.getTime();
                prevStartDateUtil = getPreviousMonth(startDateUtil); // Tháng trước
                prevEndDateUtil = getPreviousMonthEnd(startDateUtil);
                break;
            case "year":
                cal.set(Calendar.DAY_OF_YEAR, 1);
                cal.set(Calendar.HOUR_OF_DAY, 0);
                cal.set(Calendar.MINUTE, 0);
                cal.set(Calendar.SECOND, 0);
                startDateUtil = cal.getTime();
                prevStartDateUtil = getPreviousYear(startDateUtil); // Năm trước
                prevEndDateUtil = getPreviousYearEnd(startDateUtil);
                break;
            default:
                startDateUtil = new java.util.Date(0);
                prevStartDateUtil = startDateUtil;
                prevEndDateUtil = startDateUtil;
        }

        // Chuyển đổi sang định dạng `Date` để truy vấn database
        Date startDate = new Date(startDateUtil.getTime());
        Date endDate = new Date(endDateUtil.getTime());
        Date prevStartDate = new Date(prevStartDateUtil.getTime());
        Date prevEndDate = new Date(prevEndDateUtil.getTime());

        // Lấy dữ liệu tổng đơn hàng hiện tại và tổng đơn hàng kỳ trước
        List<OrderStatusSummary> summaryList = orderDao.getOrderStatusSummary(startDate, endDate);
        List<OrderStatusSummary> prevSummaryList = orderDao.getOrderStatusSummary(prevStartDate, prevEndDate);

        // Tính toán tổng số đơn hàng của kỳ hiện tại và kỳ trước
        int currentTotal = summaryList.stream().mapToInt(OrderStatusSummary::getCount).sum();
        int previousTotal = prevSummaryList.stream().mapToInt(OrderStatusSummary::getCount).sum();

        // Tính phần trăm thay đổi
        double percentChange = calculatePercentChange(previousTotal, currentTotal);

        // Log the values to console
        System.out.println("Current Total: " + currentTotal);
        System.out.println("Previous Total: " + previousTotal);
        System.out.println("Percent Change: " + percentChange);

        // Tạo JSON trả về, bao gồm tổng đơn hàng kỳ hiện tại, kỳ trước và phần trăm thay đổi
        JsonObject responseJson = new JsonObject();
        responseJson.add("current", new Gson().toJsonTree(summaryList));
        responseJson.addProperty("currentTotal", currentTotal);
        responseJson.addProperty("previousTotal", previousTotal);
        responseJson.addProperty("percentChange", percentChange);

        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(responseJson.toString());
    }

    private double calculatePercentChange(int previousTotal, int currentTotal) {
        if (previousTotal == 0) return 0; // Tránh chia cho 0
        return ((double)(currentTotal - previousTotal) / previousTotal) * 100;
    }

    // Các hàm phụ trợ để tính toán ngày trước, tuần trước, tháng trước, năm trước...
    private java.util.Date getPreviousDay(java.util.Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, -1);
        return cal.getTime();
    }

    private java.util.Date getPreviousWeek(java.util.Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.WEEK_OF_YEAR, -1);
        return cal.getTime();
    }

    private java.util.Date getPreviousWeekEnd(java.util.Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.WEEK_OF_YEAR, -1);
        cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
        return cal.getTime();
    }

    private java.util.Date getPreviousMonth(java.util.Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.MONTH, -1);
        return cal.getTime();
    }

    private java.util.Date getPreviousMonthEnd(java.util.Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.MONTH, -1);
        cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
        return cal.getTime();
    }

    private java.util.Date getPreviousYear(java.util.Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.YEAR, -1);
        return cal.getTime();
    }

    private java.util.Date getPreviousYearEnd(java.util.Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.YEAR, -1);
        cal.set(Calendar.MONTH, Calendar.DECEMBER);
        cal.set(Calendar.DAY_OF_MONTH, 31);
        return cal.getTime();
    }
}
