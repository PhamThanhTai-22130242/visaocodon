package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ReviewProductDao;
import com.baya.baya_project.Model.ReviewProduct;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.Model.UserPrincipal;
import com.baya.baya_project.service.ReviewProductService;
import com.baya.baya_project.service.LogService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CommentController", value="/admin/comments/view/comments")
public class CommentController extends HttpServlet {
    private ReviewProductDao reviewProductDao;
    private LogService logService = new LogService();

    @Override
    public void init() throws ServletException {
        reviewProductDao = new ReviewProductDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<ReviewProduct> comlist = reviewProductDao.selectAll();
        request.setAttribute("comlist", comlist);
        request.getRequestDispatcher("/commentAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ReviewProductService reviewProductService = new ReviewProductService();
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        UserPrincipal admin = (UserPrincipal) session.getAttribute("user");

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            if ("delete".equals(action)) {
                reviewProductService.delete(id);
                request.setAttribute("message", "Xóa review thành công.");

                logService.infor(admin.getUser().getUserID(), "Xóa review", "Review ID: " + id, "Đã xóa review với ID: " + id);

            } else if ("hide".equals(action)) {
                reviewProductService.hide(id);
                request.setAttribute("message", "Đã ẩn review thành công.");

                logService.infor(admin.getUser().getUserID(), "Ẩn review", "Review ID: " + id, "Đã ẩn review với ID: " + id);

            } else if ("unhide".equals(action)) {
                reviewProductService.unhide(id);
                request.setAttribute("message", "Đã phục hồi review thành công.");

                logService.infor(admin.getUser().getUserID(), "Phục hồi review", "Review ID: " + id, "Đã phục hồi review với ID: " + id);

            } else {
                request.setAttribute("message", "Hành động không hợp lệ.");
            }
        } catch (Exception e) {
            request.setAttribute("message", "Đã xảy ra lỗi: " + e.getMessage());

            logService.warning(admin.getUser().getUserID(), "Lỗi trong xử lý review", "", "Lỗi: " + e.getMessage());
        }

        doGet(request, response);
    }
}
