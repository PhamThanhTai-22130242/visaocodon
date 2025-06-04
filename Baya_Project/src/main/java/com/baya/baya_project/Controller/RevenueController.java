package com.baya.baya_project.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.baya.baya_project.Dao.OrderDao;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;

@WebServlet("/revenueOrder")
public class RevenueController extends HttpServlet {
    private OrderDao orderDao = new OrderDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String filter = req.getParameter("filter");
        LocalDate today = LocalDate.now();

        Date currentStart = null, currentEnd = null;
        Date previousStart = null, previousEnd = null;

        switch (filter) {
            case "today":
                currentStart = currentEnd = Date.valueOf(today);
                previousStart = previousEnd = Date.valueOf(today.minusDays(1));
                break;
            case "week":
                LocalDate startOfWeek = today.with(DayOfWeek.MONDAY);
                LocalDate endOfWeek = today.with(DayOfWeek.SUNDAY);
                currentStart = Date.valueOf(startOfWeek);
                currentEnd = Date.valueOf(endOfWeek);
                previousStart = Date.valueOf(startOfWeek.minusWeeks(1));
                previousEnd = Date.valueOf(endOfWeek.minusWeeks(1));
                break;
            case "month":
                LocalDate startOfMonth = today.withDayOfMonth(1);
                LocalDate endOfMonth = today.withDayOfMonth(today.lengthOfMonth());
                currentStart = Date.valueOf(startOfMonth);
                currentEnd = Date.valueOf(endOfMonth);

                LocalDate prevMonth = today.minusMonths(1);
                previousStart = Date.valueOf(prevMonth.withDayOfMonth(1));
                previousEnd = Date.valueOf(prevMonth.withDayOfMonth(prevMonth.lengthOfMonth()));
                break;
            case "year":
                LocalDate startOfYear = today.withDayOfYear(1);
                LocalDate endOfYear = today.withDayOfYear(today.lengthOfYear());
                currentStart = Date.valueOf(startOfYear);
                currentEnd = Date.valueOf(endOfYear);

                LocalDate prevYear = today.minusYears(1);
                previousStart = Date.valueOf(prevYear.withDayOfYear(1));
                previousEnd = Date.valueOf(prevYear.withDayOfYear(prevYear.lengthOfYear()));
                break;
            default:
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                resp.getWriter().write("{\"error\": \"Tham số filter không hợp lệ\"}");
                return;
        }

        BigDecimal currentRevenue = orderDao.getTotalRevenueByDateRange(currentStart, currentEnd);
        BigDecimal previousRevenue = orderDao.getTotalRevenueByDateRange(previousStart, previousEnd);

        double percentChangeRevenue = 0;
        if (previousRevenue.compareTo(BigDecimal.ZERO) > 0) {
            percentChangeRevenue = currentRevenue.subtract(previousRevenue)
                    .divide(previousRevenue, 2, BigDecimal.ROUND_HALF_UP)
                    .multiply(BigDecimal.valueOf(100))
                    .doubleValue();
        }

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(
                String.format("{\"revenue\": %.2f, \"percentChangeRevenue\": %.2f, \"period\": \"%s\"}",
                        currentRevenue.doubleValue(),
                        percentChangeRevenue,
                        filter)
        );

    }
}

