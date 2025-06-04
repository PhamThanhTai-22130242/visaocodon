<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
    <link rel="stylesheet" href="/assets/css/layout/styleAdmin.css">
    <%--    <link rel="stylesheet" href="assets/css/layout/styleAdmin.css">--%>
    <title>AdminKit Demo - Bootstrap 5 Admin Template</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <link href="./assets/css/boostrap/app.css" rel="stylesheet">
    <%--    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>--%>
    <%--    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>--%>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <!-- Thêm SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.6/dist/sweetalert2.min.css">

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
        display: flex;
        max-width: 800px;
    }

    .modal-content {
        margin: auto;
        width: 600px;
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

<div class="wrapper">

    <jsp:include page="/SharedViews/SideBarAdmin.jsp"/>
    <div class="container  users-container" style="margin: 0 !important; width: 100%">
        <div class="main">

            <nav class="navbar navbar-expand navbar-light navbar-bg">
                <a class="sidebar-toggle js-sidebar-toggle">
                    <i class="hamburger align-self-center"></i>
                </a>

                <div class="navbar-collapse collapse">
                    <ul class="navbar-nav navbar-align">
                        <li class="nav-item dropdown">
                            <a class="nav-icon dropdown-toggle" href="#" id="alertsDropdown" data-bs-toggle="dropdown">
                                <div class="position-relative">
                                    <i class="align-middle" data-feather="bell"></i>
                                    <span class="indicator">4</span>
                                </div>
                            </a>
                            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0"
                                 aria-labelledby="alertsDropdown">
                                <div class="dropdown-menu-header">
                                    4 New Notifications
                                </div>
                                <div class="list-group">
                                    <a href="#" class="list-group-item">
                                        <div class="row g-0 align-items-center">
                                            <div class="col-2">
                                                <i class="text-danger" data-feather="alert-circle"></i>
                                            </div>
                                            <div class="col-10">
                                                <div class="text-dark">Update completed</div>
                                                <div class="text-muted small mt-1">Restart server 12 to complete the
                                                    update.
                                                </div>
                                                <div class="text-muted small mt-1">30m ago</div>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row g-0 align-items-center">
                                            <div class="col-2">
                                                <i class="text-warning" data-feather="bell"></i>
                                            </div>
                                            <div class="col-10">
                                                <div class="text-dark">Lorem ipsum</div>
                                                <div class="text-muted small mt-1">Aliquam ex eros, imperdiet vulputate
                                                    hendrerit et.
                                                </div>
                                                <div class="text-muted small mt-1">2h ago</div>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row g-0 align-items-center">
                                            <div class="col-2">
                                                <i class="text-primary" data-feather="home"></i>
                                            </div>
                                            <div class="col-10">
                                                <div class="text-dark">Login from 192.186.1.8</div>
                                                <div class="text-muted small mt-1">5h ago</div>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row g-0 align-items-center">
                                            <div class="col-2">
                                                <i class="text-success" data-feather="user-plus"></i>
                                            </div>
                                            <div class="col-10">
                                                <div class="text-dark">New connection</div>
                                                <div class="text-muted small mt-1">Christina accepted your request.
                                                </div>
                                                <div class="text-muted small mt-1">14h ago</div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="dropdown-menu-footer">
                                    <a href="#" class="text-muted">Show all notifications</a>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-icon dropdown-toggle" href="#" id="messagesDropdown"
                               data-bs-toggle="dropdown">
                                <div class="position-relative">
                                    <i class="align-middle" data-feather="message-square"></i>
                                </div>
                            </a>
                            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0"
                                 aria-labelledby="messagesDropdown">
                                <div class="dropdown-menu-header">
                                    <div class="position-relative">
                                        4 New Messages
                                    </div>
                                </div>
                                <div class="list-group">
                                    <a href="#" class="list-group-item">
                                        <div class="row g-0 align-items-center">
                                            <div class="col-2">
                                                <img src="img/avatars/avatar-5.jpg"
                                                     class="avatar img-fluid rounded-circle" alt="Vanessa Tucker">
                                            </div>
                                            <div class="col-10 ps-2">
                                                <div class="text-dark">Vanessa Tucker</div>
                                                <div class="text-muted small mt-1">Nam pretium turpis et arcu. Duis arcu
                                                    tortor.
                                                </div>
                                                <div class="text-muted small mt-1">15m ago</div>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row g-0 align-items-center">
                                            <div class="col-2">
                                                <img src="img/avatars/avatar-2.jpg"
                                                     class="avatar img-fluid rounded-circle" alt="William Harris">
                                            </div>
                                            <div class="col-10 ps-2">
                                                <div class="text-dark">William Harris</div>
                                                <div class="text-muted small mt-1">Curabitur ligula sapien euismod
                                                    vitae.
                                                </div>
                                                <div class="text-muted small mt-1">2h ago</div>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row g-0 align-items-center">
                                            <div class="col-2">
                                                <img src="img/avatars/avatar-4.jpg"
                                                     class="avatar img-fluid rounded-circle" alt="Christina Mason">
                                            </div>
                                            <div class="col-10 ps-2">
                                                <div class="text-dark">Christina Mason</div>
                                                <div class="text-muted small mt-1">Pellentesque auctor neque nec urna.
                                                </div>
                                                <div class="text-muted small mt-1">4h ago</div>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row g-0 align-items-center">
                                            <div class="col-2">
                                                <img src="img/avatars/avatar-3.jpg"
                                                     class="avatar img-fluid rounded-circle" alt="Sharon Lessman">
                                            </div>
                                            <div class="col-10 ps-2">
                                                <div class="text-dark">Sharon Lessman</div>
                                                <div class="text-muted small mt-1">Aenean tellus metus, bibendum sed,
                                                    posuere ac, mattis non.
                                                </div>
                                                <div class="text-muted small mt-1">5h ago</div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="dropdown-menu-footer">
                                    <a href="#" class="text-muted">Show all messages</a>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#"
                               data-bs-toggle="dropdown">
                                <i class="align-middle" data-feather="settings"></i>
                            </a>

                            <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#"
                               data-bs-toggle="dropdown">
                                <img src="img/avatars/avatar.jpg" class="avatar img-fluid rounded me-1"
                                     alt="Charles Hall"/> <span class="text-dark">Charles Hall</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end">
                                <a class="dropdown-item" href="pages-profile.html"><i class="align-middle me-1"
                                                                                      data-feather="user"></i>
                                    Profile</a>
                                <a class="dropdown-item" href="#"><i class="align-middle me-1"
                                                                     data-feather="pie-chart"></i> Analytics</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="index.html"><i class="align-middle me-1"
                                                                              data-feather="settings"></i> Settings &
                                    Privacy</a>
                                <a class="dropdown-item" href="#"><i class="align-middle me-1"
                                                                     data-feather="help-circle"></i> Help Center</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Log out</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>

            <main class="content">
                <div class="container-fluid p-0">

                    <h1 class="h3 mb-3"><strong>QUẢN LÍ Resource</strong></h1>
                    <div class="row">
                        <div class="col-lg-2 mb-2">

                            <button class="btn mb-1 btn-outline-info btn_new-resource"><i class="fa-solid fa-plus"></i>
                                Thêm mới
                            </button>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-12 col-lg-12 col-xxl-12 d-flex">
                            <div class="card flex-fill">

                                <table class="table table-hover pt-2 mt-3 table-bordered table-striped"
                                       style="font-size: 14px" id="myTable">
                                    <thead class="table-dark">
                                    <tr>
                                        <th style="width: 10%">STT</th>
                                        <th class="d-none d-md-table-cell">Tên Resource</th>

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

                </div>
            </main>
        </div>
    </div>
</div>


<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="openModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <div class="modal-content" action="/editResource" method="post">
            <input type="hidden" id="featureID">
            <h5 class="modal-title">Chỉnh sửa thông tin</h5>
            <div class="form-group row pt-3 pb-3 ">
                <label class="col-sm-6 col-form-label fw-semibold">Tên Resource: </label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="featureName">
                </div>

            </div>


            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-danger btn_submit-edit">Đồng ý</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="newModal" tabindex="-1" aria-labelledby="openModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <div class="modal-content" method="post">

            <h5 class="modal-title">Thêm mới</h5>
            <div class="form-group row pt-3 pb-3 ">
                <label class="col-sm-6 col-form-label fw-semibold">Tên Resource: </label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="newFeatureName">
                </div>

            </div>


            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-danger btn_submit-new">Đồng ý</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="openModal" tabindex="-1" aria-labelledby="openModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <input type="hidden" id="featureID_remove">
            <h5 class="modal-title" id="openModalLabel">Xác nhận xóa</h5>
            <div class="modal-body">
                Bạn có chắc chắn xóa Resource này?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="submit" class="btn btn-danger confirm_remove-btn" id="confirm-open">Đồng ý</button>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script>
    let table
    $(document).ready(function () {

        fetch('/managementResource')
            .then(response => response.json())
            .then(data => {
                console.log(data)


                table = $('#myTable').DataTable({

                    data: data.list,

                    columns: [
                        {data: 'featureID'},
                        {data: 'featureName'},
                        {
                            data: 'featureID',

                            render: function (data, type, row) {
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
                            data: 'featureID',
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
</script>

<script>

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

    function remove_btn(featureID) {
        console.log("chay vao remove")
        $("#openModal").modal("show");
        $("#featureID_remove").val(featureID)
        console.log("hihi")
        id = document.getElementById("featureID_remove").value
        console.log("da chon voi" + id)

    }

    function edit_btn(featureID) {
        console.log(featureID)
        $.ajax({
            url: "/getResourceByID",
            type: "GET",
            data: {featureID: featureID},
            dataType: "json",
            success: function (response) {
                $("#featureID").val(response.featureID);
                $("#featureName").val(response.featureName);


            },
            error: function () {
                Swal.fire({
                    title: "Lỗi!",
                    text: "Đã xảy ra lỗi!",
                    icon: "error",
                    confirmButtonText: "Thử lại"
                });
            }
        });
        $("#editModal").modal("show");
    }
</script>
<script>
    $(document).ready(function () {
        $(document).on("click", ".btn_new-resource", function () {
            $("#newModal").modal("show");
            $("#newFeatureName").val("")
        })
    })
    //xóa
    $(document).ready(function () {
        $(document).on("click", ".confirm_remove-btn", function () {
            console.log("da chay vao function")
            var feature = {
                featureID: $("#featureID_remove").val(),
            }
            $.ajax({
                url: "/removeResource",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(feature),
                dataType: "json",
                success: function (response) {
                    if (response.success) {
                        $("#openModal").modal("hide");
                        swal_success("Đã xóa thành công");
                        fetch('/managementResource')
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

            });

        })
    })
    //thêm mới nhấn đồng ý
    $(document).ready(function () {
        $(document).on("click", ".btn_submit-new", function () {
            var feature = {
                featureName: $("#newFeatureName").val()

            }
            if (feature.featureName.length == 0) {

                Swal.fire({
                    title: "Lỗi!",
                    text: "Trường thông tin không được bỏ trống!",
                    icon: "error",
                    confirmButtonText: "Thử lại"
                });

            } else {
                $.ajax({
                    url: "/newResource",
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify(feature),
                    dataType: "json",
                    success: function (response) {
                        if (response.success) {
                            $("#newModal").modal("hide");
                            swal_success("Tạo mới thành công");
                            fetch('/managementResource')
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
        })
    })
    //sửa

    $(document).ready(function () {
        $(document).on("click", ".btn_submit-edit", function () {

            var feature = {
                featureID: $("#featureID").val(),
                featureName: $("#featureName").val()

            }


            if (feature.featureName.length == 0) {

                Swal.fire({
                    title: "Lỗi!",
                    text: "Trường thông tin không được bỏ trống!",
                    icon: "error",
                    confirmButtonText: "Thử lại"
                });

            } else {
                $.ajax({
                    url: "/editNameResource",
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify(feature),
                    dataType: "json",
                    success: function (response) {
                        if (response.success) {
                            $("#editModal").modal("hide");
                            swal_success("Dữ liệu đã cập nhập thành công");
                            fetch('/managementResource')
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
                        var res = JSON.parse(xhr.responseText);
                        Swal.fire({
                            title: "Lỗi!",
                            text: res.message || "Có lỗi xảy ra!",
                            icon: "error",
                            confirmButtonText: "Thử lại"
                        });
                    }
                });
            }


        })
    });
</script>


<script src="./assets/js/app.js"></script>

<script src="/assets/js/scriptAdmin.js"></script>
</body>

</html>

</body>
</html>