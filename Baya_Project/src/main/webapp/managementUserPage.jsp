<%@ page import="com.baya.baya_project.Model.UserPrincipal" %><%--
  Created by IntelliJ IDEA.
  User: PHAMTAI
  Date: 4/12/2025
  Time: 5:27 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

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
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet"/>
    <link rel="canonical" href="https://demo-basic.adminkit.io/"/>
    <%--    <link rel="stylesheet" href="assets/css/layout/styleAdmin.css">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Ladda/1.0.6/ladda-themeless.min.css"/>
    <title>AdminKit Demo - Bootstrap 5 Admin Template</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <link href="/assets/css/boostrap/app.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <link href="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.js"></script>
    <!-- Thêm SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.6/dist/sweetalert2.min.css">
    <!-- Thêm SweetAlert2 JS -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/@tarekraafat/autocomplete.js@10.2.9/dist/css/autoComplete.min.css">

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.6/dist/sweetalert2.min.js"></script>
    <%--    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">--%>
</head>
<style>
    body {
        font-family: "Arial", Helvetica, sans-serif;
        font-weight: normal;
        font-size: 16px;

    }

    .warning-box {
        font-size: 13px;
        margin: 3px 2px;
        display: inline-block;
        padding: 5px 10px;
        background-color: #ffc107;
        color: #212529;
        border-radius: 5px;
        font-family: sans-serif;
        text-align: center;
    }

    .input_recom-wrap {

        position: relative;
        flex: 1;
        width: 415px;
        margin: 0 25px;

    }

    .search_recom {

        z-index: 1000;
        top: 100%;
        left: 0;
        width: 100%;
        height: fit-content;
        position: absolute;
        background-color: #246fdf;
        display: block;
    }

    .autoComplete_highlighted {
        all: unset;
    }

    .header_search:focus-within .search_recom {
        display: block;
    }

    .recom_item {
        padding: 15px 20px;
        display: flex;

        height: 20%;
        background-color: #fff;
        color: #0e2238;

    }

    .recom_item p {
        color: #0e2238 !important;
    }

    .header_search {
        width: 100% !important;
        height: 100% !important;
        margin-left: 0 !important;
        margin-right: 0 !important;
    }

    .recom_item:hover {
        cursor: pointer;
        background-color: rgb(239, 239, 239);
        color: var(--main_bg);
    }


    .modal {
        align-items: center;
        justify-content: center;
    }

    .modal-dialog {
        max-width: 800px;
    }

    .modal-content {
        border-radius: 12px;
        padding: 20px;
    }

    .modal-header {
        text-align: center;
        border-bottom: none;
    }

    .modal-title {
        font-size: 20px;
        text-align: center;
        font-weight: bold;
        color: rgba(0, 0, 0, 0.88);
        width: 100%;
    }

    .mb-3 {
        margin-bottom: 15px;
    }

    .form-label {
        font-weight: 600;
        color: #616161;
        display: block;
    }

    .form-control {
        border-radius: 8px;
        padding: 10px;
        font-size: 14px;
        border: 1px solid #ccc;
    }

    .form-control:focus {
        border-color: #007bff;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
    }

    .btn-primary {
        background-color: #007bff;
        border-radius: 8px;
        padding: 10px;
        font-size: 16px;
        text-align: center;
        width: 100%;
    }

    .btn-close {
        position: absolute;
        right: 35px;
        top: 30px;
    }

    .small-popup {
        width: 320px !important;
        font-size: 14px !important;
        padding: 15px !important;
    }

    .rmh {
        margin-left: 10px;
        padding: 0;
        width: 100%;
    }

    .checkbox-container {
        display: flex;
        flex-wrap: wrap;

    }

    .checkbox-container label {
        width: 50%;
        box-sizing: border-box;
        padding: 4px 0;
    }

    .d-flex .btn-print {
        margin-top: -55px;
        display: flex;
        height: 33px;
        width: 60px;
        gap: 6px;
        align-items: center;
        justify-content: center;
        margin-left: 10px;
    }

    .fui-checkbox-toggle {
        cursor: pointer;
    }

    .fui-checkbox-toggle .toggle-input {
        display: none;
    }

    .fui-checkbox-toggle .toggle-input:checked + .toggle-bar {
        background-color: #1dc071;
    }

    .fui-checkbox-toggle .toggle-input:checked + .toggle-bar .toggle-spin {
        transform: translateX(25px);
    }

    .fui-checkbox-toggle .toggle-bar {
        width: 55px;
        height: 30px;
        background-color: #cbd5e1;
        border-radius: 5rem;
        padding: 5px;
        transition: background-color 0.2s linear;
    }

    .fui-checkbox-toggle .toggle-spin {
        width: 20px;
        height: 20px;
        border-radius: 100rem;
        background-color: #fff;
        transition: transform 0.2s linear;
    }


</style>
<body>

<% UserPrincipal us = (UserPrincipal) session.getAttribute("user");
    boolean canCreate = us.hasPermission("authorizations", "create");
    boolean canView = us.hasPermission("authorizations", "view");
    boolean canUpdate = us.hasPermission("authorizations", "update");
    boolean canDelete = us.hasPermission("authorizations", "delete");
    boolean exportExcel = us.hasPermission("authorizations", "exportExcel");
    boolean exportPDF = us.hasPermission("authorizations", "exportPDF");
    request.setAttribute("canCreate", canCreate);
    request.setAttribute("canView", canView);
    request.setAttribute("canUpdate", canUpdate);
    request.setAttribute("canDelete", canDelete);
    request.setAttribute("exportExcel", exportExcel);
    request.setAttribute("exportPDF", exportPDF);
%>
<script>
    var canview =  <%= canView %>;
    var canCreate =  <%= canCreate %>;
    var canUpdate = <%= canUpdate %>;
    var canDelete = <%= canDelete %>;
    var exportExcel = <%= exportExcel %>;
    var exportPDF = <%= exportPDF %>;
    console.log("canview:", canview);
    console.log("canCreate:", canCreate);
    console.log("canUpdate:", canUpdate);
    console.log("canDelete:", canDelete);
    console.log("exportExcel:", exportExcel);
    console.log("exportPDF:", exportPDF);
</script>

<div class="wrapper">

    <jsp:include page="/SharedViews/SideBarAdmin.jsp"/>
    <div class="container-fluid" style="margin: 0 !important; width: 100%">
        <div class="main">

            <main class="content">
                <div class="container-fluid p-0">

                    <h1 class="h3 mb-3"><strong>QUẢN LÍ THÀNH VIÊN</strong> QUẢN TRỊ</h1>
                    <div class="row">
                        <div class="col-lg-2 mb-2">




                            <c:choose>
                                <c:when test="${canCreate}">
                                    <button class="btn mb-1 btn-outline-info new-UserExist"><i class="fa-solid fa-plus"></i>
                                        Chưa tồn tại
                                    </button>
                                </c:when>
                                <c:otherwise></c:otherwise></c:choose>
                        </div>
                        <div class="col-lg-8 mb-2"></div>

                        <div class="col-lg-2 mb-2" style="padding-left:40px;   right: 0">

                            <c:choose>
                                <c:when test="${canCreate}">
                                    <button class="btn mb-1 btn-outline-info btn_newNotExist" style="justify-content: right"><i
                                            class="fa-solid fa-plus"></i> Đã tồn tại
                                    </button>
                                </c:when>
                                <c:otherwise></c:otherwise></c:choose>

                        </div>

                    </div>
                    <div class="row">
                        <div class="col-12 col-lg-12 col-xxl-12 d-flex">
                            <div class="card flex-fill">

                                <table class="table table-bordered table-striped dataTable no-footer" id="myTable"
                                       style="font-size: 14px">
                                    <thead class="table-dark">
                                    <tr>
                                        <th style="width: 5%">STT</th>
                                        <th class="d-none d-md-table-cell" style="width: 15%">Tên tài khoản</th>
                                        <th class="d-none d-md-table-cell" style="width: 20%">Email</th>
                                        <th class="d-none d-md-table-cell">Vai trò</th>
                                        <th style="width: 5%">Sửa</th>
                                        <th style="width: 5%">Xóa</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-start mt-3 gap-2">
                        <c:choose>
                            <c:when test="${exportPDF}">
                                <button class="btn btn-danger btn-print-pdf">
                                    <i class="fa-solid fa-file-pdf" aria-hidden="true"></i> PDF
                                </button>
                            </c:when>
                            <c:otherwise></c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${exportExcel}">
                                <button class="btn btn-success btn-export-excel">
                                    <i class="fa-solid fa-file-excel" aria-hidden="true"></i> Excel
                                </button>
                            </c:when>
                            <c:otherwise></c:otherwise>
                        </c:choose>


                    </div>


                </div>
            </main>


        </div>
    </div>
</div>



<div class="modal fade" id="newUserExist" tabindex="-1" aria-labelledby="openModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <div class="modal-content">
            <h5 class="modal-title">Thêm mới người quản trị</h5>


            <div class="card-body">

                <p style="margin-bottom: 10px; padding: 0">Họ và tên:</p>

                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <!-- <label for="name">Name</label> --> <input class="form-control" type="text"
                                                                           placeholder="Họ và tên" id="inFullName">
                        </div>
                    </div>
                </div>
                <p style="margin-bottom: 10px; padding: 0">Email:</p>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <div class="input-group"><input class="form-control" type="email" placeholder="Email"
                                                            id="inEmail">
                            </div>
                        </div>
                    </div>
                </div>
                <p style="margin-bottom: 10px; padding: 0">Số điện thoại:</p>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <div class="input-group"><input class="form-control" type="text" placeholder="SDT"
                                                            id="inPhoneNumber"></div>
                        </div>
                    </div>
                </div>
                <p style="margin-bottom: 10px; padding: 0; font-weight: bold">Chọn vai trò</p>
                <div class="checkbox-container " style="padding-left: 20px;padding-right: 20px" id="checkbox_exists">

                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-danger" id="confirm">Đồng ý</button>
            </div>

        </div>

    </div>
</div>
<div class="modal fade" id="newUserNotExist" tabindex="-1" aria-labelledby="openModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <div class="modal-content  d-block">
            <h5 class="modal-title">Thêm mới người quản trị</h5>

            <div class="alert alert-danger" role="alert" id="alert_button" style="display: none">

            </div>
            <div class="card-body d-block justify-content-center">
                <input id="searchInput" style="width: 600px !important; " autocomplete="off"
                       class="autoComplete_highlighted ">

                <div id="block_content" style="display: none">
                    <div class="relative overflow-x-auto " style="margin: 30px 0">
                        <table class="w-full text-sm  px-2 py-2 text-gray-500 dark:text-gray-400">
                            <thead class="text-base text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                            <tr>

                                <th scope="col" class="px-2 py-2">
                                    Họ và tên
                                </th>
                                <th scope="col" class="px-2 py-2">
                                    Email
                                </th>
                                <th scope="col" class="px-2 py-2">
                                    Số điện thoại
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 border-gray-200">

                                <td class=" text-base px-2 py-2" id="name_user">

                                </td>
                                <td class="text-base px-2 py-2" id="email_user">

                                </td>
                                <td class="text-base px-2 py-2" id="phone_user">

                                </td>
                            </tr>


                            </tbody>
                        </table>
                    </div>

                    <p style="margin-bottom: 10px; padding: 0; font-weight: bold">Chọn vai trò</p>
                    <div class="checkbox-container " style="padding-left: 20px;padding-right: 20px" id="loadCheckbox">
                        <label><input type="checkbox" class="form-check-input mr-2" name="option1">
                            <p class="rmh">Option 1</p></label>
                        <label><input type="checkbox" class="form-check-input mr-2" name="option1"> Option 1</label>


                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-danger btn_new-roles">Đồng ý</button>
            </div>

        </div>

    </div>
</div>
<div class="modal fade" id="edit_btn" tabindex="-1" aria-labelledby="openModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <div class="modal-content  d-block">
            <h5 class="modal-title">Chỉnh sửa người quản trị</h5>

            <div class="alert alert-danger" role="alert" id="alert_edit" style="display: none">

            </div>
            <div class="card-body d-block justify-content-center">

                <div>
                    <div class="relative overflow-x-auto " style="margin: 30px 0">
                        <table class="w-full text-sm  px-2 py-2 text-gray-500 dark:text-gray-400">
                            <thead class="text-base text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                            <tr>

                                <th scope="col" class="px-2 py-2">
                                    Họ và tên
                                </th>
                                <th scope="col" class="px-2 py-2">
                                    Email
                                </th>

                            </tr>
                            </thead>
                            <tbody>
                            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 border-gray-200">

                                <td class=" text-base px-2 py-2" id="name_edit-user">

                                </td>
                                <td class="text-base px-2 py-2" id="email_edit-user">

                                </td>

                            </tr>


                            </tbody>
                        </table>
                    </div>
                    <div class="d-flex mb-2">
                        <p style="margin-bottom: 10px; padding: 0; font-weight: bold" class="mr-4 mt-1">Đưa về tài khoản
                            khách hàng:</p>
                        <input type="hidden" id="userID">
                        <label class="fui-checkbox-toggle">

                            <input type="checkbox" id="toggle-input" class="toggle-input" value="0"/>
                            <div class="toggle-bar">
                                <div class="toggle-spin"></div>
                            </div>
                        </label>
                    </div>
                    <div id="admin_block">
                        <p style="margin-bottom: 10px; padding: 0; font-weight: bold">Vai trò trong hệ thống: </p>

                        <div class="checkbox-container " style="padding-left: 20px;padding-right: 20px"
                             id="loadAllCheckbox">


                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-danger confirm-edit">Đồng ý</button>
            </div>
        </div>
    </div>
</div>
</div>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/spin.js/2.3.2/spin.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Ladda/1.0.6/ladda.min.js"></script>
<script src="/assets/js/app.js"></script>
<script>
    let valueUser = 0;

    function handleToggleChange() {
        const toggleInput = document.getElementById('toggle-input');
        const checkbox = document.getElementById('admin_block')

        toggleInput.addEventListener('change', function () {
            let value_toggle = this.checked ? 1 : 0;

            if (value_toggle === 1) {
                // removeCheckedCheckbox();
                checkbox.style.display = 'none'
                valueUser = 1
            } else {
                checkbox.style.display = 'block'
                valueUser = 0
                console.log("Đã tắt toggle - không thực hiện gì.");
            }
        });
    }

    document.addEventListener('DOMContentLoaded', handleToggleChange);


    // Nếu bạn muốn lưu giá trị này vào đâu đó:
    // document.getElementById('someHiddenInput').value = value;
    // hoặc gọi API, hoặc thay đổi UI khác tùy ý

    function getToggleValue() {
        return document.getElementById('toggle-input').checked ? 1 : 0;

    }

    function validateForm() {
        const fullName = $("#inFullName").val().trim();
        const emailInput = $("#inEmail").val().trim();
        const phoneNumber = $("#inPhoneNumber").val().trim();
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!fullName) {
            swal_error("Vui lòng nhập Họ và tên");
            return false;
        }
        if (fullName.length < 5) {
            swal_error("Họ tên phải có ít nhất 5 kí tự");
            return false;
        }

        if (!emailInput) {
            swal_error("Vui lòng nhập địa chỉ Email");
            return false;
        }
        if (!emailRegex.test(emailInput)) {
            swal_error("Email không đúng định dạng");
            return false;
        }

        if (!phoneNumber) {
            swal_error("Vui lòng nhập số điện thoại");
            return false;
        }

        if (!/^\d+$/.test(phoneNumber)) {
            swal_error("Số điện thoại chỉ được chứa các ký tự số");
            return false;
        }

        if (phoneNumber.length < 10 || phoneNumber.length > 11) {
            swal_error("Số điện thoại phải có từ 10 đến 11 chữ số");
            return false;
        }

        return true;
    }

    function loadAllRole(id) {
        loadingTimer = setTimeout(() => {
            openLoading();
        }, 1000);
        return new Promise(function (resolve, reject) {
            var block_resource = document.getElementById(id)
            fetch('/managementRoles', {
                method: 'POST',
                headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            })
                .then(function (response) {
                    return response.json();
                })
                .then(function (data) {
                    console.log('Dữ liệu nhận được:', data);
                    block_resource.innerHTML = ''
                    data.list.forEach(function (resource) {
                        var productHTML = '<label><input type="checkbox" class="form-check-input mr-2"value = "' + resource.roleID + '" name="' + resource.roleID + '">' +
                            ' <p class="rmh">' + resource.roleName + '</p></label>'
                        block_resource.insertAdjacentHTML('beforeend', productHTML);
                        console.log("item")
                    });
                    resolve()

                    clearTimeout(loadingTimer);
                    // Đóng loading nếu nó đã được hiển thị (vì dữ liệu đã về)
                    closeLoading();
                })

                .catch(function (error) {

                    console.error('Lỗi:', error);
                    alert('Đã xảy ra lỗi, vui lòng thử lại.');
                });
        })
    }

    function loadRoleByUser(id) {
        console.log("chay vao fay")
        var userID = {
            userID: id,
        }
        $.ajax({
            url: "/loadUserRole",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(userID),
            dataType: "json",
            success: function (response) {
                console.log(response)
                var lists = JSON.parse(response.lists)
                console.log("day la list", lists)
                const keys = Object.keys(lists);
                for (let i = 0; i < keys.length; i++) {
                    const key = keys[i];
                    const arr = lists[key];
                    console.log("arr", arr)
                    const checkbox = document.querySelector(`input[type="checkbox"][name="` + arr + `"][value="` + arr + `"]`);
                   console.log('checkbox ne: ', checkbox)
                    console.log(`input[type="checkbox"][name="` + arr + `"][value="` + arr + `"]`)
                    if (checkbox) {
                        console.log(' truong hop checked')
                        checkbox.checked = true;
                    } else {
                        console.log(`Checkbox not found for name="${arr}" and value="${arr}"`);
                    }

                }

            },
            error: function (xhr) {
                var res = JSON.parse(xhr.responseText);
                console.log(res)
                console.log(res.success)
                Swal.fire({
                    title: "Lỗi!",
                    text: res.message || "Có lỗi xảy ra!",
                    icon: "error",
                    confirmButtonText: "Thử lại"
                });
            }
        });
    }

</script>

<div class="loader"></div>
<div class="modal fade" id="openModal" tabindex="-1" aria-labelledby="openModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <input type="hidden" id="hidden_remove">
                <h5 class="modal-title" id="openModalLabel">Xác nhận xóa </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Bạn có chắc chắn xóa người quản trị này khỏi hệ thống?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-danger" id="confirm-open">Đồng ý</button>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    let table


    function clearTable() {
        $("#name_user").text('')
        $("#phone_user").text('')
        $("#email_user").text('')
    }
    function validateTable() {
        const name = $('#name_user').text().length
        const phone = $('#phone_user').text().length
        const email = $('#email_user').text().length

        if (name == 0 || phone == 0 || email == 0) {
            error_swal("Lỗi chưa chọn người dùng")
            console.log('truong hop sai')
            return false
        }
        console.log('truong hop dung')
        return true

    }

    function insertTable(user) {

        $("#name_user").text(`` + user.fullName + ``);
        $("#phone_user").text(`` + user.phoneNumber + ``);
        $("#email_user").text(`` + user.email + ``);
    }

    function checkTable() {
        if ($("#block_content").is(":hidden")) {

            error_swal("Vui lòng tìm kiếm người dùng")
            return false
        }

        return true
    }

    function removeCheckedCheckbox() {
        const checkboxes = document.querySelectorAll('input[type="checkbox"]');

        for (let i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = false;
        }
    }

    function loadCheckbox() {
        const grouped = []
        $('input[type="checkbox"]:checked').each(function () {
            const name = $(this).attr('name');
             if (name) {
                 grouped.push(name);
             }
        });
        return grouped
    }

    $(document).ready(function () {
        $("#btn-edit").click(function () {
            removeCheckedCheckbox()
            $("#editUserModal").modal("show");
        });
    });


    function remove_btn(id) {
        $("#openModal").modal("show");
        $("#hidden_remove").val(id);
    }

    $(document).ready(function () {
        $(document).on("click", "#confirm-open", function () {
            console.log("da chay vao function")
            var userID = {
                userID: $("#hidden_remove").val(),
            }
            openLoading()
            $.ajax({
                url: "/admin/authorizations/delete/deleteAccount",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(userID),
                dataType: "json",
                success: function (response) {
                    closeLoading()
                    if (response.success) {
                        $("#openModal").modal("hide");
                        swal_success("Đã xóa thành công");
                        fetch('/loadAllManagementUser')
                            .then(response => response.json())
                            .then(data => {
                                table.clear();
                                table.rows.add(data.list);
                                table.draw();
                            });
                    } else {
                        swal_error();
                    }
                },
                error: function (xhr) {
                    if (xhr.status === 401) {
                        window.location.href = "/login.jsp";
                        return
                    }
                    var res = JSON.parse(xhr.responseText);

                    Swal.fire({
                        title: "Lỗi!",
                        text: res.message || "Có lỗi xảy ra!",
                        icon: "error",
                        confirmButtonText: "Quay lại"
                    });
                }
            });

        })
    })

    function openLoading() {
        Swal.fire({
            allowEscapeKey: false,
            allowOutsideClick: false,
            didOpen: () => {
                Swal.showLoading();
            },
        });

    }

    function closeLoading() {
        Swal.close();
    }

    function swal_success(message) {
        Swal.fire({
            title: "Thành công",
            text: message,
            icon: "success",
            draggable: true,
            confirmButtonText: "Quay về",
            timer: 1500

        });
    }
    function swal_error() {
        Swal.fire({
            title: "Lỗi!",
            text: "Đã xảy ra lỗi",
            icon: "error",
            confirmButtonText: "Thử lại"
        });
    }

    function swal_error(message) {
        Swal.fire({
            title: "Lỗi!",
            text: message,
            icon: "error",
            confirmButtonText: "Thử lại"
        });
    }

    $('.btn_new-roles').on('click', function () {
        const isValid = checkTable()
        console.log('gia tri isvalid', isValid)
        if (!isValid) {
            return false
        }
        const grouped = loadCheckbox()
        console.log(grouped)
        const groupLength = Object.keys(grouped).length;
        if ($("#searchInput").val().length == 0) {
            error_swal("Input chưa chọn người dùng")
        } else if (groupLength == 0) {
            error_swal("Chưa có CHECKBOX nào được chọn!")
        } else {
            roles = {
                "email": $("#searchInput").val(),
                "roleTick": JSON.stringify(grouped)
            }
            console.log(roles)
            openLoading()
            $.ajax({
                url: "/admin/authorizations/create/newUserRole",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(roles),
                dataType: "json",
                success: function (response) {
                    closeLoading()
                    if (response.success) {
                        if (response.message != null) {
                            $("#newUserNotExist").modal("hide");
                            closeLoading()
                            swal_success("Tạo mới thành công");
                            fetch('/loadAllManagementUser')
                                .then(response => response.json())
                                .then(data => {
                                    table.clear();
                                    table.rows.add(data.list);
                                    table.draw();
                                });
                        }
                    } else {
                        swal_error();
                    }

                },
                error: function (xhr) {
                    if (xhr.status === 401) {
                        window.location.href = "/login.jsp";
                        return
                    }
                    var res = JSON.parse(xhr.responseText);

                    Swal.fire({
                        title: "Lỗi!",
                        text: res.message || "Có lỗi xảy ra!",
                        icon: "error",
                        confirmButtonText: "Quay lại"
                    });
                }
            });

        }
        console.log("Kết quả nhóm theo name:", grouped);
    });

</script>
<script>


    $(document).ready(function () {
        $("#confirm").click(function () {
            console.log("da chay vao conf")
            const validate = validateForm()
            if (validate) {
                const grouped = loadCheckbox()
                console.log(grouped)
                const groupLength = Object.keys(grouped).length;
                if (groupLength == 0) {
                    error_swal("Chưa có CHECKBOX nào được chọn!")
                } else {
                    user = {
                        "fullName": $("#inFullName").val(),
                        "email": $("#inEmail").val(),
                        "phoneNumber": $("#inPhoneNumber").val(),
                        "roleTick": JSON.stringify(grouped)
                    }

                    openLoading()
                    $.ajax({
                        url: "/admin/authorizations/create/newManagerNotExits",
                        type: "POST",
                        contentType: "application/json",
                        data: JSON.stringify(user),
                        dataType: "json",
                        success: function (response) {
                            openLoading()
                            if (response.success) {
                                if (response.message != null) {
                                    $("#newUserExist").modal("hide");
                                    closeLoading()
                                    swal_success("Đã gửi email kích hoạt tài khoản");
                                    fetch('/loadAllManagementUser')
                                        .then(response => response.json())
                                        .then(data => {
                                            table.clear();
                                            table.rows.add(data.list);
                                            table.draw();
                                        });

                                }
                                if (response.exists && response.exists.length > 0) {
                                    $("#alert_button").show()
                                    $("#alert_button").html("User đã đã bị trùng các Role: " + response.exists.join(", "));

                                }
                            } else {
                                swal_error();
                            }
                            console.log(response)
                        },
                        error: function (xhr) {
                            if (xhr.status === 401) {
                                window.location.href = "/login.jsp";
                                return;
                            }
                            var res = JSON.parse(xhr.responseText);
                            console.log(res)
                            console.log(res.success)
                            Swal.fire({
                                title: "Lỗi!",
                                text: res.message || "Có lỗi xảy ra!",
                                icon: "error",
                                confirmButtonText: "Quay lại"
                            });
                        }
                    });

                }
                console.log("Kết quả nhóm theo name:", grouped);

            }

        });
    });

    $(document).ready(function () {
        $(".new-UserExist").click(function () {
            console.log("da chay vao")
            removeCheckedCheckbox()
            loadAllRole("checkbox_exists")
            $("#newUserExist").modal("show");
        });
    });
    $(document).ready(function () {
        $(".confirm-edit").click(function () {
            console.log("da chay vao")
            console.log(valueUser, 'valueuser')
            const grouped = loadCheckbox()
            console.log(grouped)


            if (valueUser == 1) {
                const val = {
                    "userID": $("#userID").val()
                }
                $.ajax({
                    url: "/admin/authorizations/update/editManagerToUser",
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify(val),
                    dataType: "json",
                    success: function (response) {
                        if (response.success) {
                            if (response.message != null) {
                                closeLoading()
                                swal_success("Đã đưa về tài khoản khách hàng");
                                $("#edit_btn").modal("hide")
                                fetch('/loadAllManagementUser')
                                    .then(response => response.json())
                                    .then(data => {
                                        table.clear();
                                        table.rows.add(data.list);
                                        table.draw();
                                    });

                            }

                        } else {
                            swal_error();
                        }
                        console.log(response)
                    },
                    error: function (xhr) {
                        if (xhr.status === 401) {
                            window.location.href = "/login.jsp";
                            return
                        }
                        var res = JSON.parse(xhr.responseText);
                        console.log(res)
                        console.log(res.success)
                        Swal.fire({
                            title: "Lỗi!",
                            text: res.message || "Có lỗi xảy ra!",
                            icon: "error",
                            confirmButtonText: "Quay lại"
                        });
                    }
                });




            } else {
                const groupLength = Object.keys(grouped).length;
                if (groupLength == 0) {
                    error_swal("Chưa có CHECKBOX nào được chọn!")
                } else {
                    console.log(groupLength)
                    const userID = $("#userID").val()
                    const val = {
                        "userID": $("#userID").val(),
                        "roleTick": JSON.stringify(grouped)
                    }
                    openLoading()
                    $.ajax({
                        url: "/admin/authorizations/update/editRoleManager",
                        type: "POST",
                        contentType: "application/json",
                        data: JSON.stringify(val),
                        dataType: "json",
                        success: function (response) {

                            if (response.success) {
                                if (response.message != null) {
                                    closeLoading()
                                    swal_success("Chỉnh sửa thành công");
                                    $("#edit_btn").modal("hide")
                                    fetch('/loadAllManagementUser')
                                        .then(response => response.json())
                                        .then(data => {
                                            table.clear();
                                            table.rows.add(data.list);
                                            table.draw();
                                        });

                                }

                            } else {
                                swal_error();
                            }
                            console.log(response)
                        },
                        error: function (xhr) {
                            if (xhr.status === 401) {
                                window.location.href = "/login.jsp";
                                return;
                            }
                            var res = JSON.parse(xhr.responseText);
                            console.log(res)
                            console.log(res.success)
                            Swal.fire({
                                title: "Lỗi!",
                                text: res.message || "Có lỗi xảy ra!",
                                icon: "error",
                                confirmButtonText: "Quay lại"
                            });
                        }
                    });
                }
            }


        });
    });


    $(document).ready(function () {
        $(".btn_newNotExist").click(function () {
            $("#alert_button").hide()
            $("#block_content").hide();

            $("#searchInput").val("")

            console.log("da chay vao")
            loadAllRole("loadCheckbox")
            $("#newUserNotExist").modal("show");
        });
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/@tarekraafat/autocomplete.js@10.2.9/dist/autoComplete.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

<script>
    let loadingTimer = null

    function edit_btn(id, fullname, email) {
        document.getElementById("admin_block").style.display = 'block'
        removeCheckedCheckbox()
        $("#id").text(id)
        $("#userID").val(id)
        $("#name_edit-user").text(fullname)
        $("#email_edit-user").text(email)
        loadAllRole("loadAllCheckbox")
            .then(function () {
                loadRoleByUser(id)
            });
        $("#edit_btn").modal("show")

    }

    function error_swal(message) {
        Swal.fire({
            title: "Lỗi!",
            text: message,
            icon: "error",
            confirmButtonText: "Quay lại"
        });
    }

    $(document).ready(function () {

        fetch('/loadAllManagementUser')
            .then(response => response.json())
            .then(data => {
                table = $('#myTable').DataTable({

                    data: data.list,

                    columns: [
                        {
                            title: "STT",
                            data: null,
                            render: function (data, type, row, meta) {
                                return meta.row + 1;
                            },
                        },
                        {data: 'fullName'},
                        {data: 'email'},
                        {
                            data: 'roles',
                            render: function (data, type, row) {
                                // data là mảng các role

                                return data.map(role => `
               <div class="warning-box">
                                               ` + role.roleName + `
                                            </div>
            `).join('');

                            }
                        },
                        {
                            ///â
                            data: 'userID',

                            render: function (data, type, row) {
                                console.log("data ", data)
                                console.log("type", type)
                                console.log("row", row)
                                return `
                <button class="btn btn-outline-warning btn-edit" onclick="edit_btn('` + data + `', '` + row.fullName + `', '` + row.email + `')" data-toggle="modal" data-id="` + data + `">
                  <i class="fa-solid fa-pen-to-square"></i>
                </button>`;
                            }
                        },

                        {
                            data: 'userID',
                            title: 'Xóa',
                            className: 'd-none d-md-table-cell text-center',
                            render: function (data, type, row) {
                                return `
                <button class="btn btn-outline-danger btn-delete" onclick="remove_btn(` + data + `)" data-userid="${data}">
                  <i class="fa-solid fa-trash" aria-hidden="true"></i>
                </button>`;
                            }
                        }
                    ]
                });
            })

    });

    let selectedEmail = "";
    const autoCompleteJS = new autoComplete({
        selector: "#searchInput",
        placeHolder: "Tìm kiếm theo Email...",
        data: {
            src: async (query) => {
                if (!query) return [];
                try {
                    const response = await fetch("/searchByEmail?keyword=" + query, {
                        method: 'GET',
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                    });
                    const result = await response.json();
                    return result.list || [];
                } catch (error) {
                    console.error("Lỗi khi fetch dữ liệu:", error);
                    return [];
                }
            },
            keys: ["email"],
            cache: false,
        },
        resultItem: {
            highlight: true
        },
        resultsList: {
            noResults: true,
            element: (list, data) => {
                if (!data.results.length) {
                    const message = document.createElement("div");
                    message.setAttribute("class", "no_result");
                    message.innerHTML = `<span>Không tìm thấy kết quả</span>`;
                    list.appendChild(message);
                }
            }
        },
        events: {
            input: {
                selection(event) {
                    const selection = event.detail.selection.value;
                    document.querySelector("#searchInput").value = selection.email;

                }
            }
        }
    });

    function getInfoUser(email) {
        var user = {
            "email": email,
        }

        $.ajax({
            url: "/infoUser",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(user),
            dataType: "json",
            success: function (response) {
                if (response.success) {

                    clearTable()
                    insertTable(response)
                } else {
                    swal_error();
                }
            },
            error: function (xhr) {
                if (xhr.status === 401) {
                    window.location.href = "/login.jsp";
                    return;
                }
                var res = JSON.parse(xhr.responseText);
                console.log(res)
                console.log(res.success)
                Swal.fire({
                    title: "Lỗi!",
                    text: res.message || "Có lỗi xảy ra!",
                    icon: "error",
                    confirmButtonText: "Thử lại"
                });
            }
        });
    }

    document.querySelector("#searchInput").addEventListener("keydown", function (event) {
        if (event.key === "Enter") {
            event.preventDefault();
            const value = this.value.trim();
            // Nếu có selectedEmail, ưu tiên dùng
            const emailToUse = selectedEmail || value;
            if (emailToUse) {
                console.log("Email được dùng để xử lý:", emailToUse);
                removeCheckedCheckbox()
                getInfoUser(emailToUse)
                if ($("#block_content").is(":hidden")) {
                    $("#block_content").show(); // Chỉ hiển thị nếu đang ẩn
                }

            }
        }
    });

</script>

<script src="/assets/js/scriptAdmin.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>

</html>

</body>
</html>
