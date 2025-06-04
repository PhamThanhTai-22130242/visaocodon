<%@ page import="com.baya.baya_project.Model.UserPrincipal" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% UserPrincipal user = (UserPrincipal) session.getAttribute("user");
    boolean dashboards = user.hasPermission("dashboards", "view");
    boolean users = user.hasPermission("users", "view");
    boolean warehouseHistories = user.hasPermission("warehouseHistories", "view");
    boolean news = user.hasPermission("news", "view");
    boolean contacts = user.hasPermission("contacts", "view");
    boolean comments = user.hasPermission("comments", "view");
    boolean logs = user.hasPermission("logs", "view");
    boolean authorizations = user.hasPermission("authorizations", "view");
    boolean permissions = user.hasPermission("permissions", "view");
    boolean products = user.hasPermission("products", "view");
    boolean orders = user.hasPermission("orders", "view");
    boolean categories = user.hasPermission("categories", "view");
    boolean inventories = user.hasPermission("inventories", "view");
    boolean dispatches = user.hasPermission("dispatches", "view");
    boolean promotions = user.hasPermission("promotions", "view");

    request.setAttribute("dashboards", dashboards);
    request.setAttribute("users", users);
    request.setAttribute("warehouseHistories", warehouseHistories);
    request.setAttribute("news", news);
    request.setAttribute("contacts", contacts);
    request.setAttribute("comments", comments);
    request.setAttribute("logs", logs);
    request.setAttribute("authorizations", authorizations);
    request.setAttribute("permissions", permissions);
    request.setAttribute("products", products);
    request.setAttribute("orders", orders);
    request.setAttribute("categories", categories);
    request.setAttribute("inventories", inventories);
    request.setAttribute("dispatches", dispatches);
    request.setAttribute("promotions", promotions);
%>
<aside id="sidebar">
    <div class="d-flex">
        <button class="toggle-btn" type="button">
            <i class="fa-solid fa-border-all fa-lg"></i>
        </button>
        <div class="sidebar-logo">
            <a href="/admin/welcome/view">Admin </a>
        </div>
    </div>
    <ul class="sidebar-nav">
        <c:choose>
            <c:when test="${dashboards}">
                <li class="sidebar-item ">
                    <a href="/admin/dashboards/view/dashboards_view" class="sidebar-link d-flex gap-3">
                        <i class="fa-solid fa-house"></i>
                        <div>Tổng Quan</div>
                    </a>
                </li>
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${users}">
                <li class="sidebar-item ">
                    <a href="/admin/users/view" class="sidebar-link d-flex gap-3">
                        <i class="fa-solid fa-person"></i>

                        <div>Quản lí người dùng</div>

                    </a>
                </li>
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${authorizations}">
                <li class="sidebar-item">
                    <a href="/admin/authorizations/view" class="sidebar-link d-flex gap-3">
                        <i class="fa-solid fa-user-shield"></i>
                        <div>Phân quyền người quản trị</div>
                    </a>
                </li>
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${permissions}">
                <li class="sidebar-item">
                    <a href="/admin/permissions/view" class="sidebar-link d-flex gap-3">
                        <i class="fa-solid fa-lock"></i>
                        <div>Quản lí các quyền</div>
                    </a>
                </li>
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${products}">
                <li class="sidebar-item">
                    <a href="/admin/products/view" class="sidebar-link d-flex gap-3 ">
                        <i class="fa-solid fa-chair"></i>
                        <div>Quản lí sản phẩm</div>
                    </a>
                </li>
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${orders}">
                <li class="sidebar-item">
                    <a href="/admin/orders/view/order_view" class="sidebar-link d-flex gap-3">
                        <i class="fa-solid fa-file-invoice-dollar"></i>
                        <div>Danh Sách Đơn Hàng</div>
                    </a>
                </li>
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${categories}">
                <li class="sidebar-item">
                    <a href="/admin/categories/view" class="sidebar-link d-flex gap-3">
                        <i class="fa-solid fa-newspaper"></i>
                        <div>Quản lí danh mục</div>
                    </a>
                </li>
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>







        <c:choose>
            <c:when test="${inventories}">
                <li class="sidebar-item">
                    <a href="/admin/inventories/view/stock-receipt-admin" class="sidebar-link d-flex gap-3">
                        <i class="fa-solid fa-file-import"></i>
                        <div>Quản lí Nhập Kho</div>
                    </a>
                </li>
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${dispatches}">
                <li class="sidebar-item">
                    <a href="/admin/dispatches/view/stock-issue-admin" class="sidebar-link d-flex gap-3">
                        <i class="fa-solid fa-file-export"></i>
                        <div>Quản lí Xuất kho</div>
                    </a>
                </li>
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${warehouseHistories}">
                <li class="sidebar-item">
                    <a href="/admin/warehouseHistories/view/inventoryHistory" class="sidebar-link d-flex gap-3">
                        <i class="fa-solid fa-clock-rotate-left"></i>
                        <div>Lịch sử kho hàng</div>
                    </a>
                </li>
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${warehouseHistories}">
                <li class="sidebar-item">
                    <a href="/admin/warehouseHistories/view/inventoryHistory" class="sidebar-link d-flex gap-3">
                        <i class="fa-solid fa-clock-rotate-left"></i>
                        <div>Lịch sử kho hàng</div>
                    </a>
                </li>
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${promotions}">
                <li class="sidebar-item">
                    <a href="/admin/promotions/view/promotion_view" class="sidebar-link d-flex gap-3">
                        <i class="fa-solid fa-gift"></i>
                        <div>Danh Sách Khuyến Mãi</div>
                    </a>
                </li>
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>


        <c:choose>
            <c:when test="${news}">
                <li class="sidebar-item">
                    <a href="/admin/news/view" class="sidebar-link d-flex gap-3" >
                        <i class="fa-solid fa-newspaper"></i>
                        <div>Danh Sách Tin Tức</div>
                    </a>
                </li>
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${contacts}">
                <li class="sidebar-item">
                    <a href="/admin/contacts/view" class="sidebar-link d-flex gap-3">
                        <i class="fa-solid fa-envelope"></i>
                        <div>Quản lí liên hệ</div>
                    </a>
                </li>
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${comments}">

                <li class="sidebar-item">
                    <a href="/admin/comments/view/comments" class="sidebar-link d-flex gap-3">
                        <i class="fa-solid fa-comments"></i>
                        <div>Quản lí bình luận</div>
                    </a>
                </li>
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${comments}">

                <li class="sidebar-item">
                    <a href="/admin/logs/view" class="sidebar-link d-flex gap-3">
                        <i class="fa-solid fa-clock-rotate-left"></i>
                        <div>Nhật Ký Hoạt Động</div>
                    </a>
                </li>
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>


        <li class="sidebar-item">
            <a href="/logoutAD" class="sidebar-link d-flex gap-3" id="btn-logout">
                <i class="fa-solid fa-right-from-bracket"></i>
                <div>Đăng Xuất</div>
            </a>
        </li>
    </ul>
</aside>