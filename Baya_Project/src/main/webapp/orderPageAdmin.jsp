<%@ page import="com.baya.baya_project.Model.UserPrincipal" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <!-- Cấu hình trang -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <title>Quản Trị Admin</title>

    <link rel="shortcut icon" href="/img/icons/icon-48x48.png"/>

    <!-- Bootstrap 5.3.2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <!-- Bootstrap Icons + LineIcons + FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/68512d5542.js" crossorigin="anonymous"></script>

    <!-- DataTables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

    <%--    <!-- SweetAlert2 -->--%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <%--    <!-- Export: Excel & PDF -->--%>
    <script src="https://cdn.sheetjs.com/xlsx-latest/package/dist/xlsx.full.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/exceljs/dist/exceljs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

    <!-- Giao diện tùy chỉnh -->

    <style>
        <jsp:include page="/SharedViews/block_error.jsp" />
    </style>

    <link rel="stylesheet" href="/assets/css/layout/styleAdmin.css">

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
    <jsp:include page="/SharedViews/SideBarAdmin.jsp"/>
    <div class="container" style="margin: 0 !important; width: 100%">
        <div class="main">
            <nav class="navbar navbar-expand navbar-light navbar-bg">
                <a class="sidebar-toggle js-sidebar-toggle">
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
                                    <!-- Các thông báo khác sẽ được thêm vào đây -->
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


            <main class="content">
                <div class="container-fluid p-0">

                    <h1 class="h3 mb-3"><strong>THỐNG KÊ</strong> TỔNG QUAN </h1>

                    <div class="row">
                        <div class="row">
                            <div class="col-xxl-8 d-flex">

                            </div>


                            <div  class="col-xl-4 col-xxl-4 d-flex align-items-start gap-2">
                                <% UserPrincipal user = (UserPrincipal) request.getSession().getAttribute("user");
                                    if(user.hasPermission("dashboards","exportExcel")){
                                %>
                                <button id="exportExcelBtn"
                                        class="btn btn-success export-btn d-flex align-items-center gap-2"
                                        data-bs-toggle="tooltip"
                                        data-bs-placement="top"
                                        title="Xuất dữ liệu ra Excel">
                                    <i class="bi bi-file-earmark-excel-fill fs-5"></i>
                                </button>

                                <% } %>
                                <select id="orderFilter" class="form-select filter-select">
                                    <option value="today">Hôm nay</option>
                                    <option value="week">Tuần này</option>
                                    <option value="month">Tháng này</option>
                                    <option value="year">Năm nay</option>
                                </select>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-xl-6 col-xxl-6 d-flex">
                                <div class="w-100">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col mt-0">
                                                            <h5 class="card-title">Người dùng mới</h5>
                                                        </div>
                                                        <div class="col-auto">
                                                            <div class="stat text-primary">
                                                                <i class="align-middle" data-feather="users"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <h1 class="mt-1 mb-3" id="newUsersCount">0</h1>
                                                    <div class="mb-0">
                                                        <span id="percentChangeUsers" class="text-success-user">0%</span>
                                                        <span class="text-muted-user" >So với cùng kì</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col mt-0">
                                                            <h5 class="card-title">Người</h5>
                                                        </div>

                                                        <div class="col-auto">
                                                            <div class="stat text-primary">
                                                                <i class="align-middle" data-feather="users"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <h1 class="mt-1 mb-3">14.212</h1>
                                                    <div class="mb-0">
                                                        <span class="text-success">5.25%</span>
                                                        <span class="text-muted">So với cùng kì</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col mt-0">
                                                            <h5 class="card-title">Tổng doanh thu</h5>
                                                        </div>

                                                        <div class="col-auto">
                                                            <div class="stat text-primary">
                                                                <i class="align-middle" data-feather="dollar-sign"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <h1 class="mt-1 mb-3" id="totalRevenue">0đ</h1>
                                                    <div class="mb-0">
                                                        <span class="text-success-total" id="percentChangeRevenue">0%</span>
                                                        <span class="text-muted-toltal">So với cùng kì</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col mt-0">
                                                            <h5 class="card-title mb-1">Tổng đơn hàng</h5>
                                                        </div>

                                                        <div class="col-auto d-flex align-items-start gap-2">
                                                            <div class="stat text-primary">
                                                                <i class="align-middle" data-feather="shopping-cart"></i>
                                                            </div>

                                                            <div class="info-icon position-relative">
                                                                <i class="align-middle text-muted" data-feather="info" style="cursor: pointer;"></i>

                                                                <div class="custom-tooltip">
                                                                    <div class="fw-bold mb-2">📋 Chi tiết đơn hàng</div>
                                                                    <div class="d-flex justify-content-between align-items-center mb-1">
                                                                        <span>🟡 Đang xử lý</span> <span class="badge bg-warning text-dark" id="processingCount">0</span>
                                                                    </div>
                                                                    <div class="d-flex justify-content-between align-items-center mb-1">
                                                                        <span>🚚 Đang vận chuyển</span> <span class="badge bg-info text-dark" id="shippingCount">0</span>
                                                                    </div>
                                                                    <div class="d-flex justify-content-between align-items-center mb-1">
                                                                        <span>✅ Hoàn thành</span> <span class="badge bg-success" id="completedCount">0</span>
                                                                    </div>
                                                                    <div class="d-flex justify-content-between align-items-center">
                                                                        <span>❌ Đã hủy</span> <span class="badge bg-danger" id="cancelledCount">0</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <h1 class="mt-1 mb-3" id="totalOrdersCount">0</h1>

                                                    <div class="mb-0">
                                                        <span class="text-success-order" id="percentChangeOrder">+0%</span>
                                                        <span class="text-muted-order">So với cùng kỳ</span>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-45 col-lg-6 col-xxl-6 d-flex ms-auto">
                                <div class="card flex-fill">
                                    <div class="card-header">
                                        <select id="stockProductSelect"
                                                class="form-select mb-3 fw-bold text-dark"
                                                onchange="loadStockProducts()">
                                            <option value="low-stock">Sản phẩm cần nhập kho</option>
                                            <option value="overstock">Sản phẩm cần xuất kho</option>
                                        </select>
                                    </div>
                                    <div class="table-responsive" style="max-height: 250px; overflow-y: auto;">
                                        <table class="table table-hover align-middle mb-0" style="font-size: 14px;">
                                            <thead class="table-light sticky-top" style="top: 0; z-index: 1;">
                                            <tr>
                                                <th style="width: 20%;">Mã SP</th>
                                                <th style="width: 45%;">Tên sản phẩm</th>
                                                <th class="d-none d-md-table-cell text-center" style="width: 20%;">Số lượng</th>
                                                <th style="width: 15%;">Ghi chú</th>
                                            </tr>
                                            </thead>
                                            <tbody id="stockSellingProducts">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>


                            <script>
                                function loadStockProducts() {
                                    var filter = document.getElementById('stockProductSelect').value;
                                    let url = '/manageStock?filter=' + filter;
                                    fetch(url)
                                        .then(response => {
                                            if (!response.ok) {
                                                // Tự ném lỗi để chuyển xuống .catch
                                                if (response.status === 401) {
                                                    // Redirect nếu 401
                                                    window.location.href = "/login.jsp";
                                                    throw new Error("Unauthorized"); // Dừng luôn flow
                                                } else {
                                                    throw new Error("HTTP error " + response.status);
                                                }
                                            }
                                            return response.json();
                                        })
                                        .then(data => {
                                            console.log('Fetched stock data:', data);
                                            var tableBody = document.getElementById('stockSellingProducts');
                                            tableBody.innerHTML = '';

                                            if (data.error) {
                                                tableBody.innerHTML = '<tr><td colspan="4" class="text-center text-danger">' + data.error + '</td></tr>';
                                                return;
                                            }

                                            if (Array.isArray(data) && data.length > 0) {
                                                data.forEach((item, index) => {
                                                    var row = document.createElement('tr');

                                                    // Mã SP
                                                    var cell1 = document.createElement('td');
                                                    cell1.textContent = item.productID;

                                                    // Tên sản phẩm
                                                    var cell2 = document.createElement('td');
                                                    cell2.textContent = item.name;

                                                    // Số lượng
                                                    var cell3 = document.createElement('td');
                                                    if (filter === 'low-stock') {
                                                        cell3.textContent = item.totalQuantity;
                                                    } else if (filter === 'overstock') {
                                                        cell3.textContent = item.quantityToExport;
                                                    } else {
                                                        cell3.textContent = '-';
                                                    }
                                                    cell3.classList.add('text-center');
                                                    var cell4 = document.createElement('td');
                                                    let note = item.note;  // ưu tiên backend gửi

                                                    if (!note || note.trim() === '') {  // nếu backend không có note, tự tính
                                                        if (item.quantityToImport > 0 && item.returnCount > 0) {
                                                            note = 'Trả hàng, Hết hàng';
                                                        } else if (item.returnCount > 0) {
                                                            note = 'Trả hàng từ DH' + item.returnOrderID;
                                                        } else if (item.quantityToImport > 0) {
                                                            note = 'Hết hàng';
                                                        } else {
                                                            note = '-';
                                                        }
                                                    }

                                                    cell4.textContent = note;


                                                    row.appendChild(cell1);
                                                    row.appendChild(cell2);
                                                    row.appendChild(cell3);
                                                    row.appendChild(cell4);

                                                    tableBody.appendChild(row);
                                                });

                                            } else {
                                                tableBody.innerHTML = '<tr><td colspan="4" class="text-center">Không có sản phẩm nào</td></tr>';
                                            }
                                        })
                                        .catch(error => {

                                            var tableBody = document.getElementById('stockSellingProducts');
                                            tableBody.innerHTML = '<tr><td colspan="4" class="text-center text-danger">Không thể tải dữ liệu</td></tr>';
                                        });
                                }
                                document.addEventListener('DOMContentLoaded', function () {
                                    loadStockProducts();
                                });
                                document.getElementById('exportExcelBtn').addEventListener('click', function () {
                                    const filter = document.getElementById('stockProductSelect').value;
                                    let title = '';
                                    switch (filter) {
                                        case 'low-stock':
                                            title = 'Sản phẩm cần nhập kho';
                                            break;
                                        case 'overstock':
                                            title = 'Sản phẩm cần xuất kho';
                                            break;
                                        default:
                                            title = 'Danh sách sản phẩm';
                                    }

                                    const table = document.getElementById('stockSellingProducts');
                                    const rows = table.querySelectorAll('tr');

                                    const data = [
                                        [title],
                                        ["Mã SP", "Tên sản phẩm", "Số lượng", "Ghi chú"]
                                    ];

                                    let hasData = false;

                                    rows.forEach(row => {
                                        const cells = row.querySelectorAll('td');
                                        if (cells.length === 4) {
                                            hasData = true;
                                            data.push([
                                                cells[0].innerText,
                                                cells[1].innerText,
                                                cells[2].innerText,
                                                cells[3].innerText
                                            ]);
                                        }
                                    });

                                    // Nếu không có dữ liệu thì hiển thị thông báo và dừng lại
                                    if (!hasData) {
                                        alert("Không có dữ liệu để xuất Excel.");
                                        return;
                                    }

                                    const ws = XLSX.utils.aoa_to_sheet(data);

                                    // === KẺ BẢNG (viền cho toàn bộ ô có dữ liệu) ===
                                    const range = XLSX.utils.decode_range(ws['!ref']);
                                    for (let R = range.s.r; R <= range.e.r; ++R) {
                                        for (let C = range.s.c; C <= range.e.c; ++C) {
                                            const cell_address = { c: C, r: R };
                                            const cell_ref = XLSX.utils.encode_cell(cell_address);
                                            if (!ws[cell_ref]) continue;

                                            ws[cell_ref].s = ws[cell_ref].s || {};
                                            ws[cell_ref].s.border = {
                                                top: { style: "thin", color: { auto: 1 } },
                                                bottom: { style: "thin", color: { auto: 1 } },
                                                left: { style: "thin", color: { auto: 1 } },
                                                right: { style: "thin", color: { auto: 1 } }
                                            };
                                        }
                                    }

                                    ws['!merges'] = [{ s: { r: 0, c: 0 }, e: { r: 0, c: 3 } }];

                                    const wb = XLSX.utils.book_new();
                                    XLSX.utils.book_append_sheet(wb, ws, "Danh sách SP");

                                    const safeFileName = toSafeFileName(title);
                                    XLSX.writeFile(wb, safeFileName + ".xlsx");
                                });

                                function toSafeFileName(str) {
                                    return str
                                        .normalize("NFD").replace(/[\u0300-\u036f]/g, "")
                                        .replace(/[^a-zA-Z0-9]/g, "_")
                                        .replace(/_+/g, "_")
                                        .replace(/^_|_$/g, "");
                                }


                            </script>


                        </div>

                    </div>
                    <div class="row">

                        <div class="row">
                            <div class="col-xxl-8 d-flex">

                            </div>

                            <div class="col-xl-4 col-xxl-4 d-flex gap-2" >
                                <%
                                    if(user.hasPermission("dashboards","exportExel")){
                                %>
                                <button id="exportExcelBtnn"
                                        class="btn btn-success export-btn d-flex align-items-center gap-2"
                                        data-bs-toggle="tooltip"
                                        data-bs-placement="top"
                                        title="Xuất dữ liệu ra Excel">
                                    <i class="bi bi-file-earmark-excel-fill fs-5"></i>
                                </button>
                                <% } %>
                                <select class="form-select mb-3" id="filterSelect">
                                    <option value="week">Tuần này</option>
                                    <option value="month">Tháng này</option>
                                    <option value="year">Năm nay</option>
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xl-8 col-xxl-8">
                                <div class="card flex-fill w-100">
                                    <div class="card-header">

                                        <h5 class="card-title mb-0" style="font-weight: bold; color: black;" >Doanh thu </h5>
                                    </div>
                                    <div class="card-body py-3">
                                        <div class="chart chart-sm">
                                            <canvas id="chartjs-dashboard-line" style="height: 350px !important;"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4 col-lg-4 col-xxl-4 d-flex">
                                <div class="card flex-fill">
                                    <div class="card-header">
                                        <select id="filterProductSelect" class="form-select mb-3" style="font-weight: bold; color: black;">
                                            <option value="top-seller">Sản phẩm bán chạy</option>
                                            <option value="non-seller">Sản phẩm không bán chạy</option>
                                        </select>
                                    </div>
                                    <div style="max-height: 350px; overflow-y: auto;">
                                        <table class="table table-hover my-0" style="font-size: 14px">
                                            <thead>
                                            <tr>
                                                <th style="width: 70%">Tên sản phẩm</th>
                                                <th class="d-none d-md-table-cell text-md-center">Đã bán</th>
                                            </tr>
                                            </thead>
                                            <tbody id="bestSellingProducts">
                                            </tbody>
                                        </table>
                                        <script>
                                            function loadProducts() {
                                                var filter = document.getElementById('filterSelect').value;
                                                var productType = document.getElementById('filterProductSelect').value;

                                                let url = '/top-products?productType=' + productType;

                                                if (productType === 'top-seller') {
                                                    url += '&filter=' + filter;
                                                }

                                                fetch(url)
                                                    .then(response => {
                                                        if (!response.ok) {
                                                            // Tự ném lỗi để chuyển xuống .catch
                                                            if (response.status === 401) {
                                                                // Redirect nếu 401
                                                                window.location.href = "/login.jsp";
                                                                throw new Error("Unauthorized"); // Dừng luôn flow
                                                            } else {
                                                                throw new Error("HTTP error " + response.status);
                                                            }
                                                        }
                                                        return response.json();
                                                    })
                                                    .then(data => {
                                                        console.log('Fetched data:', data);

                                                        var tableBody = document.getElementById('bestSellingProducts');
                                                        tableBody.innerHTML = '';

                                                        if (data && Array.isArray(data) && data.length > 0) {
                                                            data.forEach(item => {
                                                                var row = document.createElement('tr');

                                                                var cell1 = document.createElement('td');
                                                                cell1.textContent = item.name;

                                                                var cell2 = document.createElement('td');
                                                                cell2.textContent = item.totalSold;
                                                                cell2.classList.add('text-center');

                                                                row.appendChild(cell1);
                                                                row.appendChild(cell2);

                                                                tableBody.appendChild(row);
                                                            });
                                                        } else {
                                                            tableBody.innerHTML = '<tr><td colspan="2" class="text-center">Không có sản phẩm nào</td></tr>';
                                                        }
                                                    })
                                                    .catch(error => {
                                                        if (!response.ok) {
                                                            if (response.status === 401) {
                                                                window.location.href = "/login.jsp";
                                                                throw new Error("Unauthorized");
                                                            } else {
                                                                throw new Error("HTTP error " + response.status);
                                                            }
                                                        }
                                                        console.error('Error fetching data:', error);
                                                        var tableBody = document.getElementById('bestSellingProducts');
                                                        tableBody.innerHTML = '<tr><td colspan="2" class="text-center text-danger">Không thể tải dữ liệu</td></tr>';
                                                    });
                                            }

                                            document.getElementById('filterSelect').addEventListener('change', function () {
                                                loadProducts();
                                            });

                                            document.getElementById('exportExcelBtnn').addEventListener('click', function () {
                                                const productType = document.getElementById('filterProductSelect').value;
                                                const timeFilter = document.getElementById('filterSelect').value;

                                                let title = '';
                                                if (productType === 'non-seller') {
                                                    title = 'Danh sách sản phẩm không bán chạy trong một tháng';
                                                } else {
                                                    switch (timeFilter) {
                                                        case 'week':
                                                            title = 'Danh sách sản phẩm bán chạy trong tuần';
                                                            break;
                                                        case 'month':
                                                            title = 'Danh sách sản phẩm bán chạy trong tháng';
                                                            break;
                                                        case 'year':
                                                            title = 'Danh sách sản phẩm bán chạy trong năm';
                                                            break;
                                                        default:
                                                            title = 'Danh sách sản phẩm bán chạy';
                                                    }
                                                }

                                                const tableBody = document.getElementById('bestSellingProducts');
                                                const rows = tableBody.querySelectorAll('tr');

                                                const data = [
                                                    [title],
                                                    ["Tên sản phẩm", "Đã bán"]
                                                ];

                                                let hasData = false;

                                                rows.forEach(row => {
                                                    const cells = row.querySelectorAll('td');
                                                    if (cells.length === 2 && cells[0].textContent !== 'Không có sản phẩm nào') {
                                                        hasData = true;
                                                        data.push([
                                                            cells[0].textContent.trim(),
                                                            cells[1].textContent.trim()
                                                        ]);
                                                    }
                                                });

                                                if (!hasData) {
                                                    alert("Không có dữ liệu để xuất Excel.");
                                                    return;
                                                }

                                                const ws = XLSX.utils.aoa_to_sheet(data);

                                                ws['!merges'] = [{ s: { r: 0, c: 0 }, e: { r: 0, c: 1 } }];

                                                ws['A1'].s = {
                                                    font: { bold: true, sz: 14 },
                                                    alignment: { horizontal: "center", vertical: "center" }
                                                };

                                                // Kẻ viền cho toàn bộ dữ liệu
                                                const range = XLSX.utils.decode_range(ws['!ref']);
                                                for (let R = range.s.r; R <= range.e.r; ++R) {
                                                    for (let C = range.s.c; C <= range.e.c; ++C) {
                                                        const cell_address = { c: C, r: R };
                                                        const cell_ref = XLSX.utils.encode_cell(cell_address);
                                                        if (!ws[cell_ref]) continue;

                                                        ws[cell_ref].s = ws[cell_ref].s || {};
                                                        ws[cell_ref].s.border = {
                                                            top: { style: "thin", color: { auto: 1 } },
                                                            bottom: { style: "thin", color: { auto: 1 } },
                                                            left: { style: "thin", color: { auto: 1 } },
                                                            right: { style: "thin", color: { auto: 1 } }
                                                        };
                                                    }
                                                }

                                                const wb = XLSX.utils.book_new();
                                                XLSX.utils.book_append_sheet(wb, ws, "Top Sản Phẩm");

                                                const safeFileName = toSafeFileName(title);
                                                XLSX.writeFile(wb, safeFileName + ".xlsx");
                                            });

                                            function toSafeFileName(str) {
                                                return str
                                                    .normalize("NFD").replace(/[\u0300-\u036f]/g, "")
                                                    .replace(/[^a-zA-Z0-9]/g, "_")
                                                    .replace(/_+/g, "_")
                                                    .replace(/^_|_$/g, "");
                                            }

                                        </script>
                                    </div>
                                </div>
                            </div>

                        </div>


                    </div>


                </div>
            </main>


        </div>
    </div>
</div>
<script src="/assets/js/app.js"></script>
<style>
    .custom-tooltip {
        position: absolute;
        top: 100%;
        left: 0;
        z-index: 10;
        background: white;
        border: 1px solid #dee2e6;
        padding: 10px;
        border-radius: 6px;
        box-shadow: 0 5px 10px rgba(0,0,0,0.1);
        display: none;
        min-width: 250px;
    }

    .info-icon:hover .custom-tooltip {
        display: block;
    }
</style>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        var ctx = document.getElementById("chartjs-dashboard-line").getContext("2d");
        var gradient = ctx.createLinearGradient(0, 0, 0, 225);
        gradient.addColorStop(0, "rgba(215, 227, 244, 1)");
        gradient.addColorStop(1, "rgba(215, 227, 244, 0)");

        fetch('/revenue')
            .then(response => {
                if (!response.ok) {
                    if (response.status === 401) {
                        window.location.href = "/login.jsp";
                        throw new Error("Unauthorized"); // Dừng luôn flow
                    } else {
                        throw new Error("HTTP error " + response.status);
                    }
                }
                return response.json();
            })
            .then(data => {
                new Chart(ctx, {
                    type: "line",
                    data: {
                        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                        datasets: [{
                            label: "Doanh thu ($)",
                            fill: true,
                            backgroundColor: gradient,
                            borderColor: window.theme.primary || "#4e73df",
                            data: data,
                            borderWidth: 2,
                            tension: 0.4
                        }]
                    },
                    options: {
                        maintainAspectRatio: false,
                        responsive: true,
                        legend: {display: false},
                        tooltips: {intersect: false},
                        scales: {
                            x: {reverse: false, grid: {display: false}},
                            y: {
                                ticks: {
                                    stepSize: 500,
                                    beginAtZero: true,
                                    callback: function (value) {
                                        return '$' + value.toLocaleString();
                                    }
                                },
                                grid: {color: "rgba(0,0,0,0.1)"}
                            }
                        }
                    }
                });
            })
            .catch(error => console.error('Error fetching revenue data:', error));
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Pie chart
        new Chart(document.getElementById("chartjs-dashboard-pie"), {
            type: "pie",
            data: {
                labels: ["Chrome", "Firefox", "IE"],
                datasets: [{
                    data: [4306, 3801, 1689],
                    backgroundColor: [
                        window.theme.primary,
                        window.theme.warning,
                        window.theme.danger
                    ],
                    borderWidth: 5
                }]
            },
            options: {
                responsive: !window.MSInputMethodContext,
                maintainAspectRatio: false,
                legend: {
                    display: false
                },
                cutoutPercentage: 75
            }
        });
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Bar chart
        new Chart(document.getElementById("chartjs-dashboard-bar"), {
            type: "bar",
            data: {
                labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                datasets: [{
                    label: "This year",
                    backgroundColor: window.theme.primary,
                    borderColor: window.theme.primary,
                    hoverBackgroundColor: window.theme.primary,
                    hoverBorderColor: window.theme.primary,
                    data: [54, 67, 41, 55, 62, 45, 55, 73, 60, 76, 48, 79],
                    barPercentage: .75,
                    categoryPercentage: .5
                }]
            },
            options: {
                maintainAspectRatio: false,
                legend: {
                    display: false
                },
                scales: {
                    yAxes: [{
                        gridLines: {
                            display: false
                        },
                        stacked: false,
                        ticks: {
                            stepSize: 20
                        }
                    }],
                    xAxes: [{
                        stacked: false,
                        gridLines: {
                            color: "transparent"
                        }
                    }]
                }
            }
        });
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var markers = [{
            coords: [31.230391, 121.473701],
            name: "Shanghai"
        },
            {
                coords: [28.704060, 77.102493],
                name: "Delhi"
            },
            {
                coords: [6.524379, 3.379206],
                name: "Lagos"
            },
            {
                coords: [35.689487, 139.691711],
                name: "Tokyo"
            },
            {
                coords: [23.129110, 113.264381],
                name: "Guangzhou"
            },
            {
                coords: [40.7127837, -74.0059413],
                name: "New York"
            },
            {
                coords: [34.052235, -118.243683],
                name: "Los Angeles"
            },
            {
                coords: [41.878113, -87.629799],
                name: "Chicago"
            },
            {
                coords: [51.507351, -0.127758],
                name: "London"
            },
            {
                coords: [40.416775, -3.703790],
                name: "Madrid "
            }
        ];
        var map = new jsVectorMap({
            map: "world",
            selector: "#world_map",
            zoomButtons: true,
            markers: markers,
            markerStyle: {
                initial: {
                    r: 9,
                    strokeWidth: 7,
                    stokeOpacity: .4,
                    fill: window.theme.primary
                },
                hover: {
                    fill: window.theme.primary,
                    stroke: window.theme.primary
                }
            },
            zoomOnScroll: false
        });
        window.addEventListener("resize", () => {
            map.updateSize();
        });
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var date = new Date(Date.now() - 5 * 24 * 60 * 60 * 1000);
        var defaultDate = date.getUTCFullYear() + "-" + (date.getUTCMonth() + 1) + "-" + date.getUTCDate();
        document.getElementById("datetimepicker-dashboard").flatpickr({
            inline: true,
            prevArrow: "<span title=\"Previous month\">&laquo;</span>",
            nextArrow: "<span title=\"Next month\">&raquo;</span>",
            defaultDate: defaultDate
        });
    });
</script>

<script src="/assets/js/scriptAdmin.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const selectFilter = document.querySelector('#orderFilter');
        const totalOrderElement = document.querySelector('#totalOrdersCount');
        const totalRevenueElement = document.querySelector('#totalRevenue');
        const cardTitle = document.querySelector('.card-title');
        const changeRateElement = document.querySelector('#percentChangeOrder');
        const changeRateElementRevenue = document.querySelector('#percentChangeRevenue');
        const changeRateElementUser = document.querySelector('#percentChangeUsers');
        const comparisonTextElement_1 = document.querySelector('.text-muted-order');
        const comparisonTextElement_2 = document.querySelector('.text-muted-toltal');
        const comparisonTextElement_3 = document.querySelector('.text-muted-user');
        const newUsersCountElement = document.querySelector('#newUsersCount');

        selectFilter.addEventListener('change', function () {
            const selectedFilter = this.value;
            if (!["today", "week", "month", "year"].includes(selectedFilter)) {
                console.warn("Invalid filter selected.");
                return;
            }
            fetchOrderData(selectedFilter);
        });

        function fetchOrderData(selectedFilter) {
            const orderUrl = "/order-status-summary?filter=" + selectedFilter;
            const revenueUrl = "/revenueOrder?filter=" + selectedFilter;
            const userUrl = "/newUsersStats?filter=" + selectedFilter;

            Promise.all([
                fetch(orderUrl).then(response => response.json()),
                fetch(userUrl).then(response => response.json()),
                fetch(revenueUrl).then(response => response.json())
            ])
                .then(([orderData, userData, revenueData]) => {
                    const totalOrders = orderData.current.reduce((acc, item) => acc + item.count, 0);
                    const percentChangeOrder = parseFloat(orderData.percentChange);

                    const totalRevenue = revenueData.revenue;
                    const percentChangeRevenue = parseFloat(revenueData.percentChangeRevenue);

                    const newUsers = userData.newUsers;
                    const percentChangeUsers = userData.percentChangeUsers;

                    updateUI(orderData, totalOrders, percentChangeOrder, totalRevenue, percentChangeRevenue, newUsers, percentChangeUsers, selectedFilter);
                })
                .catch(err => console.error("Error fetching order data:", err));
        }

        function updateUI(orderData, totalOrders, percentChangeOrder, totalRevenue, percentChangeRevenue, newUsers, percentChangeUsers, selectedFilter) {
            if (totalOrderElement) {
                totalOrderElement.textContent = totalOrders;
            }

            if (totalRevenueElement) {
                const formattedRevenue = parseFloat(totalRevenue).toLocaleString("vi-VN", {
                    style: "currency",
                    currency: "VND"
                });
                totalRevenueElement.textContent = formattedRevenue;
            }

            let percentTextOrder = '0%';
            if (typeof percentChangeOrder === 'number' && !isNaN(percentChangeOrder)) {
                const formattedOrder = Math.abs(percentChangeOrder).toFixed(2);
                if (percentChangeOrder > 0) {
                    changeRateElement.classList.remove('text-danger');
                    changeRateElement.classList.add('text-success');
                    percentTextOrder = `+` + formattedOrder + `%`;
                } else if (percentChangeOrder < 0) {
                    changeRateElement.classList.remove('text-success');
                    changeRateElement.classList.add('text-danger');
                    percentTextOrder = `-` + formattedOrder + `%`;
                } else {
                    changeRateElement.classList.remove('text-success', 'text-danger');
                }
            }

            if (changeRateElement) {
                changeRateElement.textContent = percentTextOrder;
            }

            let percentTextRevenue = '0%';
            if (typeof percentChangeRevenue === 'number' && !isNaN(percentChangeRevenue)) {
                const formattedRevenue = Math.abs(percentChangeRevenue).toFixed(2);
                if (percentChangeRevenue > 0) {
                    changeRateElementRevenue.classList.remove('text-danger');
                    changeRateElementRevenue.classList.add('text-success');
                    percentTextRevenue = `+` + formattedRevenue + `%`;
                } else if (percentChangeRevenue < 0) {
                    changeRateElementRevenue.classList.remove('text-success');
                    changeRateElementRevenue.classList.add('text-danger');
                    percentTextRevenue = `-` + formattedRevenue + `%`;
                } else {
                    changeRateElementRevenue.classList.remove('text-success', 'text-danger');
                }
            }

            if (changeRateElementRevenue) {
                changeRateElementRevenue.textContent = percentTextRevenue;
            }

            // Update new users data
            if (newUsersCountElement) {
                newUsersCountElement.textContent = newUsers;
            }

            let percentTextUsers = '0%';
            if (typeof percentChangeUsers === 'number' && !isNaN(percentChangeUsers)) {
                const formattedUsers = Math.abs(percentChangeUsers).toFixed(2);
                if (percentChangeUsers > 0) {
                    changeRateElementUser.classList.remove('text-danger');
                    changeRateElementUser.classList.add('text-success');
                    percentTextUsers = `+` + formattedUsers + `%`;
                } else if (percentChangeUsers < 0) {
                    changeRateElementUser.classList.remove('text-success');
                    changeRateElementUser.classList.add('text-danger');
                    percentTextUsers = `-` + formattedUsers + `%`;
                } else {
                    changeRateElementUser.classList.remove('text-success', 'text-danger');
                }
            }

            if (changeRateElementUser) {
                changeRateElementUser.textContent = percentTextUsers;
            }

            const statusIds = {
                "processingCount": 0,
                "shippingCount": 0,
                "completedCount": 0,
                "cancelledCount": 0
            };
            for (const id in statusIds) {
                const el = document.getElementById(id);
                if (el) el.textContent = 0;
            }

            const statusMap = {
                "Đang xử lí": "processingCount",
                "Đang vận chuyển": "shippingCount",
                "Hoàn thành": "completedCount",
                "Đã hủy": "cancelledCount"
            };

            orderData.current.forEach(item => {
                const elementId = statusMap[item.statusName];
                if (elementId) {
                    const el = document.getElementById(elementId);
                    if (el) el.textContent = item.count;
                }
            });

            if (comparisonTextElement_1 && comparisonTextElement_2 && comparisonTextElement_2) {
                let textCompare = "So với cùng kỳ";
                switch (selectedFilter) {
                    case 'today':
                        textCompare = 'So với hôm qua';
                        break;
                    case 'week':
                        textCompare = 'So với tuần trước';
                        break;
                    case 'month':
                        textCompare = 'So với tháng trước';
                        break;
                    case 'year':
                        textCompare = 'So với năm trước';
                        break;
                }
                comparisonTextElement_1.textContent = textCompare;
                comparisonTextElement_2.textContent = textCompare;
                comparisonTextElement_3.textContent = textCompare;
            }
        }
    });

</script>

</body>

</html>