package com.baya.baya_project.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.baya.baya_project.Dao.UserDAO;

import java.io.IOException;
import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;

@WebServlet("/newUsersStats")
public class NewUsersController extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String filter = req.getParameter("filter");
        LocalDate today = LocalDate.now();

        Date currentStart = null, currentEnd = null;
        Date previousStart = null, previousEnd = null;

        switch (filter) {
            case "today":
                currentStart = Date.valueOf(today);
                currentEnd = Date.valueOf(today.plusDays(1));
                previousStart = Date.valueOf(today.minusDays(1));
                previousEnd = Date.valueOf(today);
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
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                resp.getWriter().write("{\"error\": \"Tham số filter không hợp lệ\"}");
                return;
        }

        int currentCount = userDAO.getNewUsersCountByDateRange(currentStart, currentEnd);
        int previousCount = userDAO.getNewUsersCountByDateRange(previousStart, previousEnd);

        double percentChangeUsers = 0;
        if (previousCount > 0) {
            percentChangeUsers = ((double) (currentCount - previousCount) / previousCount) * 100;
        } else if (currentCount > 0) {
            percentChangeUsers = 100.0;
        }

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(
                String.format("{\"newUsers\": %d, \"percentChangeUsers\": %.2f, \"period\": \"%s\"}",
                        currentCount,
                        percentChangeUsers,
                        filter)
        );
    }
}
