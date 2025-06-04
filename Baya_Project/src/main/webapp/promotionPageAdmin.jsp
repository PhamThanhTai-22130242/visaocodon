<%@ page import="com.baya.baya_project.Model.UserPrincipal" %>
<!DOCTYPE html>
<html lang="vi">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ADMIN</title>
        <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
       
        <script src="https://kit.fontawesome.com/68512d5542.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="/assets/css/layout/styleAdmin.css">


        <!-- Thêm Datatable-->
        <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/3.0.3/css/responsive.dataTables.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/4.0.1/css/fixedHeader.dataTables.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/buttons/3.2.0/css/buttons.dataTables.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/select/2.1.0/css/select.dataTables.css">

        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
        <script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/responsive/3.0.3/js/dataTables.responsive.js"></script>
        <script src="https://cdn.datatables.net/responsive/3.0.3/js/responsive.dataTables.js"></script>
        <script src="https://cdn.datatables.net/fixedheader/4.0.1/js/dataTables.fixedHeader.js"></script>
        <script src="https://cdn.datatables.net/fixedheader/4.0.1/js/fixedHeader.dataTables.js"></script>
        <script src="https://cdn.datatables.net/buttons/3.2.0/js/dataTables.buttons.js"></script>
        <script src="https://cdn.datatables.net/buttons/3.2.0/js/buttons.dataTables.js"></script>
        <script src="https://cdn.datatables.net/buttons/3.2.0/js/buttons.colVis.min.js"></script>
        <script src="https://cdn.datatables.net/select/2.1.0/js/dataTables.select.js"></script>
        <script src="https://cdn.datatables.net/select/2.1.0/js/select.dataTables.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/jquery-ui.min.js" integrity="sha512-MSOo1aY+3pXCOCdGAYoBZ6YGI0aragoQsg1mKKBHXCYPIWxamwOE7Drh+N5CPgGI5SA9IEKJiPjdfqWFWmZtRA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/themes/base/jquery-ui.min.css" integrity="sha512-TFee0335YRJoyiqz8hA8KV3P0tXa5CpRBSoM0Wnkn7JoJx1kaq1yXL/rb8YFpWXkMOjRcv5txv+C6UluttluCQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.14.1/themes/base/theme.min.css" integrity="sha512-lfR3NT1DltR5o7HyoeYWngQbo6Ec4ITaZuIw6oAxIiCNYu22U5kpwHy9wAaN0vvBj3U6Uy2NNtAfiaKcDxfhTg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <script src="https://cdn.jsdelivr.net/npm/micromodal/dist/micromodal.min.js"></script>
        <link rel="stylesheet" href="/assets/css/micromodal.css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">

    </head>
    

<body>
    <div class="wrapper">
        <jsp:include page="SharedViews/SideBarAdmin.jsp" />

        <!-- Phần chính -->
        <div class="container promotions-container">
            <div class="row">
                <nav aria-label="breadcrumb" class="promotionspage-breadcrumb">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="adminPage.html"><i class="fa-solid fa-house" style="margin:2px;"></i>Tổng Quan</a></li>
                        <li class="breadcrumb-item active" aria-current="page"><i class="fa-solid fa-gift" style="margin:2px;"></i>Danh Sách Khuyến Mãi</li>
                    </ul>
                </nav>
            </div>

            <!-- Header -->


            <!-- Nút thêm và xem khuyến mãi đã xóa -->
            <div class="row button-center-container">
                <% UserPrincipal user = (UserPrincipal) request.getSession().getAttribute("user");
                    if(user.hasPermission("promotions","create")){
                %>
                <div class="col-md-6 button-left">
                    <button class="btn btn-light btn-primary" id="btn-add"><a href="createPromotionPage.jsp" style="color: #fff;">Tạo Khuyến Mãi</a></button>
                </div>

                <% }%>
            </div>

            <!-- Bảng danh sách khuyến mãi -->
            <div class="row table-container">
                <div class="col-12">

<%--                    <table class="table table-bordered table-striped">--%>
<%--                        <thead class="table-dark">--%>
<%--                            <tr>--%>

<%--                                <th>Mã Khuyến Mãi</th>--%>
<%--                                <th>Tên Khuyến Mãi</th>--%>
<%--                                <th>Mô Tả</th> <!-- Thêm cột Mô Tả -->--%>
<%--                                <th>Ngày Bắt Đầu</th>--%>
<%--                                <th>Ngày Kết Thúc</th>--%>
<%--                                <th>Giảm Giá</th>--%>
<%--                            </tr>--%>
<%--                        </thead>--%>
<%--                    </table>--%>
                    <table id="voucher" class="display compact" style="width:100%">
                        <thead>
                        <tr>
                            <th>Mã Khuyến Mãi</th>
                            <th>Tên Khuyến Mãi</th>
                            <th>Mô Tả</th>
                            <th> Phần trăm giảm giá</th>
                            <th>Giảm trực tiếp</th>
                            <th>Ngày Bắt Đầu</th>
                            <th>Ngày Kết Thúc</th>
                        </tr>

                    
                        </thead>
                    </table>
                </div>
            </div>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#list').DataTable();
        });
    </script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="/assets/js/scriptAdmin.js"></script>
<script>
    var table = new DataTable('#voucher', {
        ajax: {
            url: '/getSetVoucher',
            dataSrc: 'voucher'
        },
        fixedHeader: true,
        layout: {
            topStart: {
                buttons: [
                    'colvis',
                ]
            },
        },
        select: true,
        columnDefs: [
            {
                targets: 0, // Cột hình ảnh
                data: 'code',
                className: 'dt-center'
            },
            {
                targets: 1,
                data: 'name',
                className: 'dt-center'
            },
            {
                targets: 2, // Cột giá
                data: 'description',
                className: 'dt-center  dt-nowrap'
            },
            {
                targets: 3, // Cột số lượng
                data: 'voucherPercent',
                render: function (data) {
                    const realData = data === 0 ? "__" : data;
                    return realData;
                },
                className: 'dt-center'
            },
            {
                targets: 4,
                data: 'voucherCash',
                render: function (data) {
                    const realData = data === 0 ? "__" : data;
                    return realData;
                },
                className: 'dt-center'
            },
            {
                target: 5,
                data: 'startDate',
                className: 'dt-center'
            },
            {
                target: 6,
                data: 'endDate',
                className: 'dt-center'
            },

        ],
        'autoWidth': false,
        language: {
            lengthMenu: "Hiển thị _MENU_ mục mỗi trang",
            zeroRecords: "Không tìm thấy kết quả",
            info: "Hiển thị trang _PAGE_ của _PAGES_",
            infoEmpty: "Không có dữ liệu",
            infoFiltered: "(lọc từ _MAX_ tổng mục)"
        },

        createdRow: function (row, data, dataIndex) {
            // Thêm lớp CSS để căn giữa các ô
            $('td', row).css({
                'text-align': 'center',
                'vertical-align': 'middle'
            });
        }
    });


    $('table th').resizable({
        handles: 'e',
        stop: function(e, ui) {
            $(this).width(ui.size.width);
        }
    });

</script>
</body>

</html>
