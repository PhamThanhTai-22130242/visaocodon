<%--
  Created by IntelliJ IDEA.
  User: PHAMTAI
  Date: 1/5/2025
  Time: 9:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><%--
  Created by IntelliJ IDEA.
  User: PHAMTAI
  Date: 1/5/2025
  Time: 9:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

        <li class="sidebar-item ">
            <a href="/admin/dashboards/view/dashboards_view" class="sidebar-link d-flex gap-3">
                <i class="fa-solid fa-house"></i>
                <div>Tổng Quan</div>
            </a>
        </li>
        <li class="sidebar-item ">
            <a href="/admin/users/view" class="sidebar-link d-flex gap-3">
                <i class="fa-solid fa-person"></i>

                <div>Quản lí nguời dùng</div>

            </a>
        </li>
        <li class="sidebar-item">
            <a href="/admin/authorizations/view" class="sidebar-link d-flex gap-3">
                <i class="fa-solid fa-user-shield"></i>
                <div>Phân quyền người quản trị</div>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="/admin/permissions/view" class="sidebar-link d-flex gap-3">
                <i class="fa-solid fa-lock"></i>
                <div>Quản lí các quyền</div>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="/admin/products/view" class="sidebar-link d-flex gap-3 ">
                <i class="fa-solid fa-chair"></i>
                <div>Quản lí sản phẩm</div>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="/admin/orders/view/order_view" class="sidebar-link d-flex gap-3">
                <i class="fa-solid fa-file-invoice-dollar"></i>
                <div>Danh Sách Đơn Hàng</div>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="/admin/categories/view" class="sidebar-link d-flex gap-3">
                <i class="fa-solid fa-newspaper"></i>
                <div>Quản lí danh mục</div>
            </a>
        </li>

        <li class="sidebar-item">
            <a href="/admin/inventories/view/stock-receipt-admin" class="sidebar-link d-flex gap-3">
                <i class="fa-solid fa-file-import"></i>
                <div>Quản lí Nhập Kho</div>
            </a>
        </li>

        <li class="sidebar-item">
            <a href="/admin/dispatches/view/stock-issue-admin" class="sidebar-link d-flex gap-3">
                <i class="fa-solid fa-file-export"></i>
                <div>Quản lí Xuất kho</div>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="/admin/warehouseHistories/view/inventoryHistory" class="sidebar-link d-flex gap-3">
                <i class="fa-solid fa-clock-rotate-left"></i>
                <div>Lịch sử kho hàng</div>
            </a>
        </li>



        </li>
        <li class="sidebar-item">
            <a href="/admin/promotions/view/promotion_view" class="sidebar-link d-flex gap-3">
                <i class="fa-solid fa-gift"></i>
                <div>Danh Sách Khuyến Mãi</div>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="/admin/news/view" class="sidebar-link d-flex gap-3" >
                <i class="fa-solid fa-newspaper"></i>
                <div>Danh Sách Tin Tức</div>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="/admin/contacts/view" class="sidebar-link d-flex gap-3">
                <i class="fa-solid fa-envelope"></i>
                <div>Quản lí liên hệ</div>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="/admin/comments/view" class="sidebar-link d-flex gap-3">
                <i class="fa-solid fa-comments"></i>
                <div>Quản lí bình luận</div>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="/admin/logs/view" class="sidebar-link d-flex gap-3">
                <i class="fa-solid fa-clock-rotate-left"></i>
                <div>Nhật Ký Hoạt Động</div>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="/logoutAD" class="sidebar-link d-flex gap-3" id="btn-logout">
                <i class="fa-solid fa-right-from-bracket"></i>
                <div>Đăng Xuất</div>
            </a>
        </li>
    </ul>
</aside>