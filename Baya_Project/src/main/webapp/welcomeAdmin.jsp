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






<style>

</style>

<div class="wrapper">
    <jsp:include page="/SharedViews/SideBarAdmin.jsp"/>

    <script>
        // Lấy phần tử có id là 'sidebar'
        var sidebar = document.getElementById('sidebar');

        // Thêm class 'expand'
        sidebar.classList.add('expand');
    </script>
    <div class="container" style="margin: 0 !important; width: 100%">
        <div class="main">
            <nav class="navbar navbar-expand navbar-light navbar-bg">
                <a class="sidebar-toggle js-sidebar-toggle">
                    <i class="hamburger align-self-center"></i>
                </a>

                <div class="navbar-collapse collapse ms-0">

                    <ul class="navbar-nav navbar-align">



                    </ul>
                </div>
            </nav>

            <h1 class="h3 mb-3"><strong>CHÀO MỪNG ĐẾN TRANG</strong> QUẢN TRỊ HỆ THỐNG</h1>

            <main class="content">


                <div   class="container-fluid p-0 " style="display: flex; height: 100%" >



                    <img style="width: 50%; height: 50%; margin:auto; margin-top: 10%; margin-bottom: 20% " src="https://timetap.com/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fgyc8zs33%2Fproduction%2F1c5bf359f10eef47804cc19cb246d685cd35217d-800x520.png%3Frect%3D0%2C35%2C800%2C450%26w%3D1200%26h%3D675%26auto%3Dformat&w=3840&q=75" alt="Welcome Image" />

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
            .then(response => response.json())
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