<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.baya.baya_project.Model.User" %>
<%
    HttpSession sessionv = request.getSession();
    User admin = (User) sessionv.getAttribute("user");

    if (admin == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
    <meta name="author" content="AdminKit">
    <meta name="keywords"
          content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

    <%--    <link rel="preconnect" href="https://fonts.gstatic.com">--%>
    <link rel="shortcut icon" href="img/icons/icon-48x48.png"/>

    <link rel="canonical" href="https://demo-basic.adminkit.io/"/>
    <%--    <link rel="stylesheet" href="assets/css/layout/styleAdmin.css">--%>
    <title>AdminKit Demo - Bootstrap 5 Admin Template</title>

    <link href="./assets/css/boostrap/app.css" rel="stylesheet">

<%--    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">--%>
    <style>
        <jsp:include page="SharedViews/block_error.jsp" />
    </style>
</head>
<style>
    body {
        font-family: "Arial", Helvetica, sans-serif;
        font-weight: normal;
        font-size: 16px;


    }
</style>
<body>

<div class="wrapper">
    <jsp:include page="SharedViews/SideBarAdmin.jsp"/>
    <div class="container" style="margin: 0 !important; width: 100%">
        <div class="main">
            <nav class="navbar navbar-expand navbar-light navbar-bg">
                <a class="sidebar-toggle js-sidebar-toggle" href="Dashboardadmin.jsp">
                    <i class="hamburger align-self-center"></i>
                </a>
                <div class="navbar-collapse collapse ms-0">

                    <ul class="navbar-nav navbar-align">
                        <li class="nav-item dropdown">
                            <a class="nav-icon dropdown-toggle" href="#" id="alertsDropdown" data-bs-toggle="dropdown">
                                <div class="position-relative">
                                    <i class="align-middle" data-feather="bell"></i>
                                    <span class="indicator">4</span>
                                </div>
                            </a>
                            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0" aria-labelledby="alertsDropdown">
                                <div class="dropdown-menu-header">
                                    4 New Notifications
                                </div>
                                <div class="list-group">
                                </div>
                                <div class="dropdown-menu-footer">
                                    <a href="#" class="text-muted">Show all notifications</a>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                                <i class="align-middle" data-feather="user" style="font-size: 100px"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end">
                                <a class="dropdown-item" href="profileAdmin.jsp"><i class="align-middle me-1" data-feather="user"></i> Profile</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="logoutAD">Log out</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="card mt-3 shadow-sm user-info-card">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0 user-info-title" style="color: #FFFFFF">Thông Tin Cá Nhân</h5>
                </div>
                <div class="card-body">
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label info-label">Họ và Tên:</label>
                        <div class="col-sm-10">
                            <p><%= admin != null ? admin.getFullName() : "Chưa đăng nhập" %></p>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label info-label">Email:</label>
                        <div class="col-sm-10">
                            <p><%= admin != null ? admin.getEmail() : "Chưa đăng nhập" %></p>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label info-label">Số điện thoại:</label>
                        <div class="col-sm-10">
                            <p><%= admin != null ? admin.getPhoneNumber() : "Chưa đăng nhập" %></p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script src="./assets/js/app.js"></script>
</body>

</html>