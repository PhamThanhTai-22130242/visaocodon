package com.baya.baya_project.filter;

import com.baya.baya_project.Dao.PermissionDao;
import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Model.PermissionCacheManager;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.Model.UserPrincipal;
import com.baya.baya_project.service.ResponseStatus;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Set;

@WebFilter("/admin/*")
public class AuthorizationFilter implements Filter {
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpSession session = ((HttpServletRequest) req).getSession();
        PermissionDao permissionDao = new PermissionDao();
        UserDAO dao = new UserDAO();
        User user = dao.getUserById(30);
        Set<String> permissions = permissionDao.getPermissionsByUserId(30);
        UserPrincipal principal = new UserPrincipal();
        principal.setUser(user);
        principal.setPermissions(permissions);
        System.out.println("USER PRINCICAL: " + principal);
        session.setAttribute("user", principal);
//        chain.doFilter(req, res);


        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
//        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("/login.jsp");
            return;
        }

//        UserPrincipal principal = (UserPrincipal) session.getAttribute("user");
        System.out.println("principal : " + principal);
        System.out.println("filter per");
        boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
        if (PermissionCacheManager.isUserInvalidated(principal.getUser().getUserID())) {
            if (isAjax) {
                session.invalidate();
                System.out.println("Qua ajax");
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.getWriter().write("{\"success\": false, \"message\": \"Session hết hạn hoặc quyền đã thay đổi.\"}");

            } else {
                System.out.println("Qua controler");
                session.invalidate();
                response.sendRedirect("/login.jsp");
            }
            return;
        }
        try {
            String uri = request.getRequestURI();

            if(uri.equalsIgnoreCase("/admin/welcome/view")){
                chain.doFilter(req, res);
                return;
            }

            System.out.println("URI: " + uri);
            String[] parts = uri.split("/");
            String feature = parts[2];
            String action = parts[3];
            System.out.println("action : " + action);
            System.out.println("feature : " + feature);
            String permissionKey = feature + ":" + action;
            System.out.println("permissionKey : " + permissionKey);
            System.out.println(permissionKey);

            if (principal.getPermissions().contains(permissionKey)) {
                System.out.println("Permission granted");
                chain.doFilter(req, res);
            } else {
                System.out.println("Permission denied");
//                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_FORBIDDEN, "Truy cập bị từ chối");
                 response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                return;
            }
       } catch (Exception e) {

            System.out.println("try catch");
            e.printStackTrace();

            if (!response.isCommitted()) {
                response.sendRedirect("/error-404.jsp");
            } else {
                // Ghi log nếu response đã commit để không bị mất thông tin
                System.err.println("Response has already been committed. Cannot redirect.");
            }
        }

    }
}
