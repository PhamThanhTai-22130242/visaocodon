<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ADMIN</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/fontawesome.min.js">
    <script src="https://kit.fontawesome.com/68512d5542.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="assets/css/layout/styleAdmin.css">
</head>

<body>
    <div class="wrapper">
        <jsp:include page="SharedViews/SideBarAdmin.jsp" />

        <!-- phần main -->
        <div class="container adduser-container">
            <div class="row">
                <nav aria-label="breadcrumb">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Dashboardadmin.jsp"><i class="fa-solid fa-house"
                                                                                    style="margin:2px ;"></i>Tổng Quan</a></li>
                        <li class="breadcrumb-item"><a href="orderPageAdmin.jsp"> <i class="fa-solid fa-person"
                                                                                     style="margin:2px ;"></i>Danh Sách Hóa Đơn</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Chi Tiết Hóa Đơn</li>
                    </ul>
                </nav>
            </div>
            <div class="row header-detailorder">
                <div class="col-12">
                    <div class="title-detailorder">
                        <p class="" style="font-weight: bold; font-size: 1.5rem; color: white;">Chi Tiết Hóa Đơn</p>
                        <h4 class="id-detailorder">#HD001</h4>
                    </div>
                </div>
            </div>
            <div class="row main-detailorder mt-3 d-flex">
                <div class="col-12 col-md-6 detailorder-left">
                    <div class="list-detailorder col-12">
                        <div class="col-12 mt-3">
                            <h4 class="mt-3" style="font-weight: bold;">Danh Sách Đơn Hàng</h4>
                            <table class="table table-bordered table-striped">
                                <thead class="table-dark">
                                    <tr>
                                        <th scope="col">STT</th>
                                        <th scope="col"> Ảnh </th>
                                        <th scope="col">Tên Sản Phẩm</th>
                                        <th scope="col">Ghi Chú</th>
                                        <th scope="col">Số Lượng</th>
                                        <th scope="col" style="width: 100px;">Đơn Giá</th>
                                        <th scope="col" style="width: 100px;">Tổng Tiền</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Dòng 1 -->
                                    <tr>
                                        <td>1</td>
                                        <td><img src="https://via.placeholder.com/50" alt="Sản phẩm 1"></td>
                                        <td>Sản Phẩm A</td>
                                        <td>Ghi chú sản phẩm A</td>
                                        <td>2</td>
                                        <td>100.000 đ</td>
                                        <td>200.000 đ</td>
                                    </tr>
                                    <!-- Dòng 2 -->
                                    <tr>
                                        <td>2</td>
                                        <td><img src="https://via.placeholder.com/50" alt="Sản phẩm 2"></td>
                                        <td>Sản Phẩm B</td>
                                        <td>Ghi chú sản phẩm B</td>
                                        <td>5</td>
                                        <td>50.000 đ</td>
                                        <td>250.000 đ</td>
                                    </tr>
                                    <!-- Dòng 3 -->
                                    <tr>
                                        <td>3</td>
                                        <td><img src="https://via.placeholder.com/50" alt="Sản phẩm 3"></td>
                                        <td>Sản Phẩm C</td>
                                        <td>Ghi chú sản phẩm C</td>
                                        <td>3</td>
                                        <td>75.000 đ</td>
                                        <td>225.000 đ</td>
                                    </tr>
                                    <!-- Dòng 4 -->
                                    <tr>
                                        <td>4</td>
                                        <td><img src="https://via.placeholder.com/50" alt="Sản phẩm 4"></td>
                                        <td>Sản Phẩm D</td>
                                        <td>Ghi chú sản phẩm D</td>
                                        <td>1</td>
                                        <td>200.000 đ</td>
                                        <td>200.000 đ</td>
                                    </tr>
                                    <!-- Dòng 5 -->
                                    <tr>
                                        <td>5</td>
                                        <td><img src="https://via.placeholder.com/50" alt="Sản phẩm 5"></td>
                                        <td>Sản Phẩm E</td>
                                        <td>Ghi chú sản phẩm E</td>
                                        <td>4</td>
                                        <td>120.000 đ</td>
                                        <td>480.000 đ</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-12 infor-customer mb-3">
                        <h4 class="mt-3 " style="font-weight: bold;">Thông Tin Khách Hàng</h4>
                        <div class="mb-3 d-flex">
                            <strong>Người nhận:</strong>
                            <div class="padding-left">Nguyễn Văn A</div>
                        </div>
                        <div class="mb-3 d-flex">
                            <strong>SĐT người nhận:</strong>
                            <div class="padding-left">0123456789 </div>
                        </div>
                        <div class="mb-3 d-flex">
                            <strong>Email người nhận:</strong>
                            <div class="padding-left">nguyen.nam@example.com</div>
                        </div>

                    </div>
                </div>
                <div class="col-12 col-md-6 detailorder-right">
                    <div class="col-12 infor-customer">
                        <h4 class="mt-3" style="font-weight: bold;">Tóm Tắt Đơn Hàng</h4>
                        <div class="mb-3 d-flex">
                            <strong>Ngày đặt hàng</strong>
                            <div class="padding-left"> 28/11/2024 10:30</div>
                        </div>
                        <div class="mb-3 d-flex">
                            <strong>Ghi chú: </strong>
                            <div class="padding-left">Giao hàng nhanh cho tôi</div>
                        </div>
                        <div class="mb-3 d-flex">
                            <strong>Trạng Thái:</strong>
                            <div class="padding-left"> Chờ giao hàng</div>

                        </div>
                        <div class="mb-3 d-flex">
                            <strong>Địa Chỉ Giao:</strong>
                            <div class="padding-left">123 Đường ABC, Phường 5, Quận 3, TP.HCM</div>
                        </div>


                    </div>
                    <div class="col-12">
                        <div class="mt-3 mb-3  d-flex totalprice-customer ">
                            <strong style="font-size: 1.2rem;">Thành Tiền:</strong>
                            <div class="padding-left " style="font-size: 1.5rem;  color: #FFA500; padding-left: 50%;">
                                2.500.000 đ</div>
                        </div>
                    </div>

                    <div class="col-12 mb-3 mt-3 btn-print-ordercustomer ">
                        <button type="button" class="btn btn-primary btn-light " id="addproduct-in-createorder"
                            style=" color: white; ">IN HÓA ĐƠN</button>

                    </div>
                </div>
            </div>
            <div class="row footer-adduser">

            </div>
        </div>
        <!-- end adduser-container -->

    </div>

    <!-- Phần modal popup thông báo xác nhận thêm người dùng -->
    <div class="modal fade" id="add-modal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addModalLabel">Xác Nhận Thêm</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn có chắc chắn muốn thêm người dùng này không?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button type="button" class="btn btn-success" id="confirmDeleteBtn">Đồng Ý</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/scriptAdmin.js"></script>
</body>

</html>