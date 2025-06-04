

<%@ page import="com.baya.baya_project.Model.UserPrincipal" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản lí quyền</title>
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


    <link rel="shortcut icon" href="img/icons/icon-48x48.png"/>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet"/>
    <link rel="canonical" href="https://demo-basic.adminkit.io/"/>
    <%--    <link rel="stylesheet" href="assets/css/layout/styleAdmin.css">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Ladda/1.0.6/ladda-themeless.min.css"/>
    <title>AdminKit Demo - Bootstrap 5 Admin Template</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <link href="/assets/css/boostrap/app.css" rel="stylesheet">
<%--    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <!-- Thêm SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.6/dist/sweetalert2.min.css">
    <link rel="stylesheet" href="/assets/css/layout/styleAdmin.css">
    <!-- Thêm SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.6/dist/sweetalert2.min.js"></script>

    <%--    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">--%>
</head>
<style>


    body {
        font-family: "Arial", Helvetica, sans-serif;
        font-weight: normal;
        font-size: 16px;

    }

    .modal {
        align-items: center;
        justify-content: center;
    }

    .modal-dialog {
        max-width: 1200px;
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
</style>
<body>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<% UserPrincipal us = (UserPrincipal) session.getAttribute("user");
    boolean canCreate = us.hasPermission("permissions", "create");
    boolean canView = us.hasPermission("permissions", "view");
    boolean canUpdate = us.hasPermission("permissions", "update");

    boolean canDelete = us.hasPermission("permissions", "delete");

    boolean exportExcel = us.hasPermission("permissions", "exportExcel");

    boolean exportPDF = us.hasPermission("permissions", "exportPDF");
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

    <jsp:include page="SharedViews/SideBarAdmin.jsp"/>
    <div class="container-fluid " style="margin: 0 !important; width: 100%">
        <div class="main">
            <main class="content">

                <div class="container-fluid p-0">

                    <h1 class="h3 mb-3"><strong>QUẢN LÍ NHÓM TÀI NGUYÊN</strong></h1>
                    <div class="row">

                            <c:choose>
                                <c:when test="${canCreate}">
                                <div class="col-lg-2 mb-2">
                                    <button class="btn mb-1 btn-outline-info btn_new"><i class="fa-solid fa-plus"></i> Thêm mới
                                    </button>
                                </div>
                                </c:when>
                                <c:otherwise></c:otherwise></c:choose>

                    </div>
                    <div class="row">
                        <div class="col-12 col-lg-12 col-xxl-12 d-flex">
                            <div class="card flex-fill">

                                <table class="table table-bordered table-striped dataTable no-footer"
                                       style="font-size: 14px" id="myTable">
                                    <thead class="table-dark">
                                    <tr>
                                        <th style="width: 10%">STT</th>
                                        <th class="d-none d-md-table-cell">Tên quyền</th>

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
<%--                        <c:choose>--%>
<%--                            <c:when test="${exportPDF}">--%>
<%--                                <button class="btn btn-danger btn-print-pdf">--%>
<%--                                    <i class="fa-solid fa-file-pdf" aria-hidden="true"></i> PDF--%>
<%--                                </button>--%>
<%--                            </c:when>--%>
<%--                            <c:otherwise></c:otherwise>--%>
<%--                        </c:choose>--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${exportExcel}">--%>
<%--                                <button class="btn btn-success btn-export-excel">--%>
<%--                                    <i class="fa-solid fa-file-excel" aria-hidden="true"></i> Excel--%>
<%--                                </button>--%>
<%--                            </c:when>--%>
<%--                            <c:otherwise></c:otherwise>--%>
<%--                        </c:choose>--%>


                    </div>


                </div>
            </main>
        </div>
    </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="openModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <div class="modal-content">
            <h5 class="modal-title">Chỉnh sửa thông tin quyền quản trị</h5>
            <div class="form-group row pt-2 pb-2 ">
                <label class="col-sm-2 col-form-label fw-semibold">Tên quyền: </label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="inputRoleName">
                    <input type="hidden" class="form-control" id="inputRoleID">
                </div>

                <div class="block_resource" id="edit_resource">

                </div>

            </div>


            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-danger btn_confirm-edit">Đồng ý</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade " id="newModal" tabindex="-1" aria-labelledby="openModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <div class="modal-content">
            <h5 class="modal-title">Thêm mới quyền</h5>
            <div class="form-group row pt-2 pb-2 ">
                <label class="col-sm-2 col-form-label fw-semibold">Tên quyền: </label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="newNameRole">
                </div>

                <div class="block_resource" id="block_resource">
                    <div class="row align-items-center pt-2 pb-2"><div class="col-4 fw-semibold">Quản lí bình luận:</div><div class="col form-check ms-4"><input class="form-check-input" type="checkbox" name="6" value="1"><label class="form-check-label">Xem</label></div><div class="col form-check ms-4"><input class="form-check-input" type="checkbox" name="6" value="2"><label class="form-check-label">Thêm</label></div><div class="col form-check ms-4"><input class="form-check-input" type="checkbox" name="6" value="3"><label class="form-check-label">Sửa</label></div><div class="col form-check ms-4"><input class="form-check-input" type="checkbox" name="6" value="4"><label class="form-check-label">Xóa</label></div><div class="col form-check ms-4"><input class="form-check-input" type="checkbox" name="6" value="6"><label class="form-check-label">Xuất Excel</label></div><div class="col form-check ms-4"><input class="form-check-input" type="checkbox" name="6" value="7"><label class="form-check-label">Xuất PDF</label></div></div>

                </div>


            </div>


            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-danger btn_new-roles">Đồng ý</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="openModal" tabindex="-1" aria-labelledby="openModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <input type="hidden" id="remove_role-id">
            <h5 class="modal-title  text-danger" id="openModalLabel">Cảnh báo</h5>

            <div class="modal-body">
              Quyền này sẽ bị xóa và áp dụng đến tất cả User đang có?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-danger btn_remove-role" id="confirm-open">Đồng ý</button>
            </div>
        </div>
    </div>
</div>
<template id="my-template">
    <swal-title>
        Các user này đang có quyền này đều sẽ được thay đổi?
    </swal-title>
    <swal-icon type="warning" color="red"></swal-icon>

    <swal-button type="cancel">
        Hủy
    </swal-button>
    <swal-button  type="confirm" style="background-color: rgb(220, 53, 69) !important;">
        Đồng ý
    </swal-button>
    <swal-param name="allowEscapeKey" value="false" />
    <swal-param
            name="customClass"
            value='{ "popup": "my-popup" }' />
    <swal-function-param
            name="didOpen"
            value="popup => console.log(popup)" />
</template>
<script>
    const actionLabels = {
        1: "Xem",
        2: "Thêm",
        8: "Ẩn",
        3: "Sửa",
        4: "Xóa",
        5: "Phản hồi",
        6: "Xuất Excel",
        7: "Xuất PDF",
        9: "Cấm bình luận",

    }
    $(document).ready(function () {
        $("#btn-edit").click(function () {

            $("#editUserModal").modal("show");
        });
    });
    $(document).ready(function () {
        $("#btn-delete").click(function () {

            $("#openModal").modal("show");
        });
    });
    function loadAllResource(id){
        return new Promise(function (resolve, reject) {
        var block_resource = document.getElementById(id)

        fetch('/loadAllResource', {
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

                    var productHTML = '<div class="row align-items-center pt-2 pb-2">';

                    productHTML = productHTML + '<div class="col-2 fw-semibold">' + resource.featureName + ':</div>';

                    resource.actionIDs.forEach(function(actionID) {
                        var actionLabel = actionLabels[actionID] || 'Unknown Action';
                        if (actionLabel==="Xuất Excel" || actionLabel==="Nhập Excel" || actionLabel==="Xuất PDF" ){
                            productHTML = productHTML +
                                '<div class="col-2 form-check ms-2">' +
                                '<input class="form-check-input" type="checkbox" name="' + resource.featureID + '" value="' + actionID + '">' +
                                '<label class="form-check-label fw-normal ">' + actionLabel + '</label>' +
                                '</div>';
                        }
                        else{
                            productHTML = productHTML +
                                '<div class="col form-check ms-2">' +
                                '<input class="form-check-input" type="checkbox" name="' + resource.featureID + '" value="' + actionID + '">' +
                                '<label class="form-check-label fw-normal ">' + actionLabel + '</label>' +
                                '</div>';
                        }

                    });

                    // Close the row div
                    productHTML = productHTML + '</div>';



                    block_resource.insertAdjacentHTML('beforeend', productHTML);

                });
                resolve()

            })

        .catch(function (error) {

                console.error('Lỗi:', error);
                alert('Đã xảy ra lỗi, vui lòng thử lại.');
            });
        })
    }
    // them moi
    $(document).ready(function () {
        $(".btn_new").click(function () {
            $("#newNameRole").val("")
            removeCheckedCheckbox()
            loadAllResource("block_resource")

            $("#newModal").modal("show");
        });
    });

    function swal_error() {
        Swal.fire({
            title: "Lỗi!",
            text: "Đã xảy ra lỗi",
            icon: "error",
            confirmButtonText: "Thử lại"
        });
    }
    function swal_success(message) {
        Swal.fire({
            title: "Thành công",
            text: message,
            icon: "success",
            draggable: true,
            confirmButtonText: "Quay về",

        });
    }
    function warning_edit(id){
        Swal.fire({
            template: "#my-template"
        }).then((result) => {
                if (result.isConfirmed) {
                    const grouped = loadCheckbox()
                    const groupLength = Object.keys(grouped).length;
                    if ($("#inputRoleName").val().length == 0) {
                        error_swal("Không được bỏ trống tên quyền.")
                    } else if (groupLength == 0) {
                        error_swal("Chưa có CHECKBOX nào được chọn!")
                    } else {
                        roles = {
                            "roleID": $("#inputRoleID").val(),
                            "roleName": $("#inputRoleName").val(),
                            "roleTick": JSON.stringify(grouped)
                        }
                        console.log(roles)
                        openLoading()
                        $.ajax({
                            url: "/admin/permissions/update/confirmEditRole",
                            type: "POST",
                            contentType: "application/json",
                            data: JSON.stringify(roles),
                            dataType: "json",
                            success: function (response) {
                                if (response.success) {
                                    $("#editModal").modal("hide");
                                    closeLoading()
                                    swal_success("Thay đổi thành công");
                                    fetch('/managementRoles')
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
    }


</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    //managementRoles
</script>


<script>
    function openLoading() {
        Swal.fire({
            allowEscapeKey: false,
            allowOutsideClick: false,
            didOpen: () => {
                Swal.showLoading();
            },

        })
    }

    function closeLoading() {
        Swal.close();
    }
    function loadCheckbox(){
        const grouped = {}
         $('input[type="checkbox"]:checked').each(function () {
            const name = $(this).attr('name');
            const value = $(this).val();

            if (!grouped[name]) {
                grouped[name] = [];
            }

            grouped[name].push(value);
        });
        return grouped

    }

    $('.btn_new-roles').on('click', function () {
        const grouped = loadCheckbox()

        const groupLength = Object.keys(grouped).length;
        if ($("#newNameRole").val().length == 0) {
            error_swal("Không được bỏ trống tên quyền.")
        } else if (groupLength == 0) {
            error_swal("Chưa có CHECKBOX nào được chọn!")
        } else {
            roles = {
                "roleName": $("#newNameRole").val(),
                "roleTick": JSON.stringify(grouped)
            }
            openLoading()
            $.ajax({
                url: "/admin/permissions/create/newRole",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(roles),
                dataType: "json",
                success: function (response) {
                    if (response.success) {
                        $("#newModal").modal("hide");
                        closeLoading()
                        swal_success("Tạo mới thành công");
                        fetch('/managementRoles')
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
    });


</script>
<script>
    function error_swal(message) {
        Swal.fire({
            title: "Lỗi!",
            text: message,
            icon: "error",
            confirmButtonText: "Quay lại"
        });
    }
</script>
<!-- jQuery -->


<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script>
    let table
    $(document).ready(function () {

        fetch('/managementRoles')
            .then(response => response.json())
            .then(data => {
                console.log(data)


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
                        {data: 'roleName'},
                        {
                            data: 'roleID',

                            render: function (data, type, row) {
                                if (!canUpdate) return '';
                                console.log('data:', data);
                                console.log('type:', type);
                                console.log('row:', row);
                                return `
                <button class="btn btn-outline-warning btn-edit" onclick="edit_btn(` + data + `)" data-toggle="modal" data-id="` + data + `">
                  <i class="fa-solid fa-pen-to-square"></i>
                </button>`;
                            }
                        },
                        {

                            data: 'roleID',
                            title: 'Xóa',
                            className: 'd-none d-md-table-cell text-center',
                            render: function (data, type, row) {
                                if (!canDelete) return '';
                                return `
                <button class="btn btn-outline-danger btn-delete" onclick="remove_btn(` + data + `)" >
                  <i class="fa-solid fa-trash" aria-hidden="true"></i>
                </button>`;
                            }
                        }

                    ]
                });
            })
    });
</script>
<script>
    //xoa
    function remove_btn(data){
        $("#remove_role-id").val(data)

        $("#openModal").modal("show")
    }

    $(document).ready(function () {
        $(document).on("click", ".btn_confirm-edit", function () {
                console.log("chay vao function")
                warning_edit($("#inputRoleID").val())


        })
    });
    $(document).ready(function () {
        $(document).on("click", ".btn_remove-role", function () {
            console.log("da chay vao function")
            console.log( "id:" +document.getElementById("remove_role-id").value)
            var role = {
                roleID:  $("#remove_role-id").val(),
            }
            console.log(role)
            $.ajax({
                url: "/admin/permissions/delete/removeRole",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(role),
                dataType: "json",
                success: function (response) {
                    if (response.success) {
                        $("#openModal").modal("hide");
                        swal_success("Đã xóa thành công");
                        fetch('/managementRoles')
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

        })
    })
    function edit_btn(id){

        loadAllResource("edit_resource")
            .then(function () {
                removeCheckedCheckbox()
                loadRole(id);
            });

        $("#editModal").modal("show")


    }
    function loadRole(id){
        console.log("chay vao fay")
        var role = {
            roleID: id,
        }
        var v =JSON.stringify(role)

        $.ajax({
            url: "/loadRole",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(role),
            dataType: "json",
            success: function (response) {
                console.log(response)
              var lists = JSON.parse(response.lists)
                // const keys = Object.keys(lists);
                // console.log(keys)
                console.log("day la list", lists)
                $("#inputRoleName").val(response.roleName)
                $("#inputRoleID").val(response.roleID)

                const keys = Object.keys(lists);
                for (let i = 0; i < keys.length; i++) {
                    const key = keys[i];
                    const arr = lists[key];

                    for (let j = 0; j < arr.length; j++) {
                        console.log("key", key )
                        console.log("value",arr[j]);
                        const checkbox = document.querySelector(`input[type="checkbox"][name="`+key+`"][value="`+arr[j]+`"]`);
                        console.log(`input[type="checkbox"][name="`+key+`"][value="`+arr[j]+`"]`)
                        if (checkbox) {
                            checkbox.checked = true;
                        } else {
                            console.log(`Checkbox not found for name="${key}" and value="${arr[j]}"`);
                        }
                    }
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
    function removeCheckedCheckbox(){
        const checkboxes = document.querySelectorAll('input[type="checkbox"]');

        for (let i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = false;
        }

    }


</script>
<!-- Thêm html2canvas từ CDN -->
<script src="https://cdn.jsdelivr.net/npm/html2canvas@1.4.1/dist/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/exceljs@4.3.0/dist/exceljs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>

<script>
    $(document).ready(function () {

        $(".btn-print-pdf").click(function () {
            table.page.len(-1).draw();
            $("#list th:nth-child(6), #list td:nth-child(6)").hide();
            setTimeout(function () {
                html2canvas(document.querySelector("#myTable"), {
                    scale: 2,
                    useCORS: true
                }).then(canvas => {
                    const imgData = canvas.toDataURL("image/png");
                    const {jsPDF} = window.jspdf;
                    let pdf = new jsPDF('l', 'mm', 'a4');
                    let imgWidth = 290;
                    let imgHeight = (canvas.height * imgWidth) / canvas.width;
                    pdf.addImage(imgData, 'PNG', 10, 10, imgWidth, imgHeight);
                    pdf.save("DanhSachTinTuc.pdf");
                    $("#list th:nth-child(6), #list td:nth-child(6)").show();
                    table.page.len(10).draw();
                });
            }, 500);
        });
        $(".btn-export-excel").click(async function () {
            let originalLength = table.page.len();
            let originalPage = table.page();

            table.page.len(-1).draw();

            setTimeout(async () => {
                const table = document.getElementById('myTable');

                const workbook = new ExcelJS.Workbook();
                const sheet = workbook.addWorksheet("Danh sách");

                const colCount = table.rows[0].cells.length;

                const exportColIndexes = [];
                for (let i = 0; i < colCount; i++) {
                    if (i !== 4) { // Bỏ cột "Chức năng"
                        exportColIndexes.push(i);
                    }
                }

                sheet.mergeCells(1, 1, 1, exportColIndexes.length);
                const titleCell = sheet.getCell('A1');
                titleCell.value = "Danh Sách";
                titleCell.alignment = {vertical: 'middle', horizontal: 'center'};
                titleCell.font = {bold: true, size: 16};

                let headerRow = [];
                exportColIndexes.forEach(i => {
                    headerRow.push(table.tHead.rows[0].cells[i].innerText.trim());
                });
                const header = sheet.addRow(headerRow);

                const borderStyle = {
                    top: {style: 'thin', color: {argb: 'FF000000'}},
                    left: {style: 'thin', color: {argb: 'FF000000'}},
                    bottom: {style: 'thin', color: {argb: 'FF000000'}},
                    right: {style: 'thin', color: {argb: 'FF000000'}}
                };

                header.alignment = {vertical: 'middle', horizontal: 'center'};
                header.font = {bold: true};
                header.eachCell(cell => {
                    cell.border = borderStyle;
                    cell.fill = {
                        type: 'pattern',
                        pattern: 'solid',
                        fgColor: {argb: 'FFD9E1F2'}
                    };
                });

                for (let i = 0; i < table.tBodies[0].rows.length; i++) {
                    const row = table.tBodies[0].rows[i];
                    let rowData = [];
                    exportColIndexes.forEach(j => {
                        rowData.push(row.cells[j].innerText.trim());
                    });
                    let excelRow = sheet.addRow(rowData);
                    excelRow.alignment = {vertical: 'middle', horizontal: 'center', wrapText: true};
                    excelRow.eachCell(cell => {
                        cell.border = borderStyle;
                    });
                }

                exportColIndexes.forEach((_, index) => {
                    sheet.getColumn(index + 1).width = 20;
                });

                const buffer = await workbook.xlsx.writeBuffer();
                saveAs(new Blob([buffer]), "DanhSach.xlsx");

                table.page.len(originalLength).draw();
                table.page(originalPage).draw('page');
            }, 500);
        });
    });
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/spin.js/2.3.2/spin.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Ladda/1.0.6/ladda.min.js"></script>
<script src="/assets/js/app.js"></script>
<div class="loader"></div>
<script src="/assets/js/scriptAdmin.js"></script>
</body>

</html>

</body>
</html>