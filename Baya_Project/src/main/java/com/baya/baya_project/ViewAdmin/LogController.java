package com.baya.baya_project.ViewAdmin;

import com.baya.baya_project.Dao.LogDao;
import com.baya.baya_project.Model.Log;
import com.baya.baya_project.service.LogService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LogController", urlPatterns = {"/admin/logs/view"})
public class LogController extends HttpServlet {
    private LogDao logDao;
    @Override
    public void init() throws ServletException {
        logDao = new LogDao();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roleParam = request.getParameter("role");
        List<Log> logList;
        if (roleParam != null && !roleParam.equals("all")) {
            try {
                int roleID = Integer.parseInt(roleParam);
                logList = logDao.selectByRole(roleID);
            } catch (NumberFormatException e) {
                logList = logDao.selectAll();
            }
        } else {
            logList = logDao.selectAll();
        }

        request.setAttribute("logList", logList);
        request.setAttribute("selectedRole", roleParam);
        request.getRequestDispatcher("/activityLogAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LogService logService = new LogService();
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                logService.delete(id);
                request.setAttribute("message", "Xóa log thành công.");
            } catch (Exception e) {
                request.setAttribute("message", "Đã xảy ra lỗi khi xóa log: " + e.getMessage());
            }
        }
        doGet(request, response);
    }

}
