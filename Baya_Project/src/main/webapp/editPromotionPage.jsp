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
        <div class="container addproduct-container createorder-container editpromotion-container">
            <div class="row">
                <nav aria-label="breadcrumb">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="adminPage.html"><i class="fa-solid fa-house "
                                    style="margin:2px ;"></i>Tổng Quan</a></li>
                        <li class="breadcrumb-item"><a href="promotionPageAdmin.jsp"> <i class="fa-solid fa-gift"
                                                                                         style="margin:2px;"></i> Danh Sách Khuyến Mãi</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Chỉnh Sửa Khuyến Mãi</li>
                    </ul>
                </nav>
            </div>
            <div class="row header-createorder">
                <div class="col-12">
                    <div class="title-createorder">
                        Chỉnh Sửa Khuyến Mãi
                    </div>
                </div>
            </div>
            <div class="row  main-createpromotion ">
                <form action="#" method="POST">
                    <div class="container-formcreateorder">
                        <!-- Tên Khuyến Mãi -->
                        <div class="mb-3 row">
                            <label for="promo-name" class="form-label bold-text">Tên Khuyến Mãi</label>
                            <input type="text" class="form-control input-size-promotion color-input" id="promo-name"
                                name="promo-name" required placeholder="Nhập tên khuyến mãi" value="Giảm giá 10%">
                        </div>

                        <!-- Mã Khuyến Mãi -->
                        <div class="mb-3 row ">
                            <label for="promo-code" class="form-label bold-text">Mã Khuyến Mãi</label>
                            <input type="text" class="form-control input-size-promotion color-input" id="promo-code"
                                name="promo-code" required placeholder="Nhập mã khuyến mãi" value="DISC10">
                        </div>
                        <!-- mô tả -->
                        <div class="mb-3 row ">
                            <label for="promo-code" class="form-label bold-text">Mô Tả Khuyến Mãi</label>
                            <textarea type="text" class="form-control input-size-promotion color-input"
                                style="height: 100px;" id="promo-code" name="promo-code" required
                                placeholder="Nhập Mô Tả khuyến mãi">Mã khuyến mãi cực hấp dẫn cho mùa xuân</textarea>
                        </div>

                        <div class="horizontal-line"></div>

                        <!-- Loại Khuyến Mãi -->
                        <div class="mb-3  row">
                            <label class="form-label bold-text">Loại Khuyến Mãi</label>
                            <div class="radio-group">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="promo-type" id="percentage"
                                        value="percentage" checked>
                                    <label class="form-check-label" for="percentage">Theo phần trăm</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="promo-type" id="amount"
                                        value="amount">
                                    <label class="form-check-label" for="amount">Theo giá tiền</label>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3 row ">
                            <label for="promo-name" class="form-label bold-text">Giá Trị</label>
                            <input type="text" class="form-control input-size-promotion color-input " id="promo-name"
                                name="promo-name" required placeholder=" Nhập mã giá trị khuyến mãi % hoặc tiền mặt"
                                style=" ">

                        </div>
                        <!-- Áp dụng cho -->
                        <!-- <div class="mb-3 ml-1 row">
                            <label class="form-label bold-text">Áp dụng cho</label>
                            <div class="radio-group">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="apply-to" id="all-products" value="all-products" checked>
                                    <label class="form-check-label" for="all-products">Tất cả sản phẩm</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="apply-to" id="category" value="category">
                                    <label class="form-check-label" for="category">Danh mục</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="apply-to" id="product" value="product">
                                    <label class="form-check-label" for="product">Sản phẩm</label>
                                </div>
                            </div>
                        </div>
                 -->
                        <div class="horizontal-line"></div>

                        <!-- Chọn Danh Mục hoặc Sản Phẩm -->
                        <div class="mb-3 row">
                            <div class="col-md-6">
                                <label for="category-select" class="form-label bold-text">Chọn Danh Mục</label>
                                <select class="form-select input-size-promotion" id="category-select"
                                    name="category-select">
                                    <option value="">Chọn danh mục</option>
                                    <option value="category1" selected>Danh mục 1</option>
                                    <option value="category2">Danh mục 2</option>
                                    <option value="category3">Danh mục 3</option>
                                </select>
                            </div>
                            <!-- <div class="col-md-6 ">
                                <div class="custom-dropdown-editorder"
                                    style="width: 400px; height: 25px; margin-top: 20px;">
                                    <button id="dropdownMenuButton" class="btn btn-outline-primary bg-primary btn-sm ">
                                        Chọn sản phẩm <i class="fa-solid fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu-editorder" id="dropdownMenu">
                                        <label class="dropdown-item-editorder">
                                            <input type="checkbox" id="product1-checkbox" checked>
                                            <img src="https://via.placeholder.com/50" alt="Sản phẩm 1"
                                                class="product-img-editorder">
                                            <div class="product-info-editorder">
                                                <h5>Ghế sắt</h5>
                                                <span class="quantity">Số lượng: 10</span>
                                            </div>
                                        </label>
                                        <label class="dropdown-item-editorder">
                                            <input type="checkbox" id="product2-checkbox">
                                            <img src="https://via.placeholder.com/50" alt="Sản phẩm 2"
                                                class="product-img-editorder">
                                            <div class="product-info-editorder">
                                                <h5>Bàn</h5>
                                                <span class="quantity">Số lượng: 15</span>
                                            </div>
                                        </label>
                                        <label class="dropdown-item-editorder">
                                            <input type="checkbox" id="product3-checkbox">
                                            <img src="https://via.placeholder.com/50" alt="Sản phẩm 3"
                                                class="product-img-editorder">
                                            <div class="product-info-editorder">
                                                <h5>Đèn Ngủ</h5>
                                                <span class="quantity">Số lượng: 8</span>
                                            </div>
                                        </label>
                                        <label class="dropdown-item-editorder">
                                            <input type="checkbox" id="product4-checkbox">
                                            <img src="https://via.placeholder.com/50" alt="Sản phẩm 4"
                                                class="product-img-editorder">
                                            <div class="product-info-editorder">
                                                <h5>Đèn treo tường</h5>
                                                <span class="quantity">Số lượng: 20</span>
                                            </div>
                                        </label>
                                        <label class="dropdown-item-editorder">
                                            <input type="checkbox" id="product5-checkbox">
                                            <img src="https://via.placeholder.com/50" alt="Sản phẩm 5"
                                                class="product-img-editorder">
                                            <div class="product-info-editorder">
                                                <h5>Thảm nhựa</h5>
                                                <span class="quantity">Số lượng: 5</span>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                            </div> -->
                        </div>

                        <!-- Thời gian bắt đầu và kết thúc -->
                        <div class="mb-3 row">
                            <div class="col">
                                <label for="start-date" class="form-label bold-text">Ngày Bắt Đầu</label>
                                <input type="date" class="form-control" id="start-date" name="start-date" required
                                    value="2024-12-01">
                            </div>
                            <div class="col">
                                <label for="end-date" class="form-label bold-text">Ngày Kết Thúc</label>
                                <input type="date" class="form-control" id="end-date" name="end-date" required
                                    value="2024-12-31">
                            </div>
                        </div>
                    </div>

                    <!-- Nút Gửi -->
                    <div class="row justify-content-end mt-3 mb-3 container-button-createpromotion  ">
                        <div class="col-md-6"><button type="submit" class="btn btn-success" id="btn-createpromotion">Lưu
                                Thay Đổi</button></div>
                    </div>

                </form>

            </div>

            <div class="row footer-addproduct">
            </div>
        </div>
        <!-- end addproduct-container -->

    </div>
    <!-- Phần modal popup thông báo thêm -->
    <!-- Modal Thêm sản phẩm-->
    <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addProductModalLabel">Thêm Sản Phẩm</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="msp" class="form-label">Mã Sản Phẩm</label>
                        <input type="text" class="form-control" id="msp" name="msp" required
                            placeholder="Vui lòng nhập mã sản phẩm">
                    </div>
                    <div class="mb-3">
                        <label for="productName" class="form-label">Tên Sản Phẩm</label>
                        <input type="text" class="form-control" id="productName" name="productName" required
                            placeholder="Tên sản phẩm">
                    </div>
                    <div class="mb-3">
                        <label for="slg" class="form-label">Số Lượng</label>
                        <input type="number" class="form-control" id="slg" name="slg" value="1" min="1" required>
                    </div>
                    <div class="mb-3">
                        <label for="productNote" class="form-label">Ghi Chú</label>
                        <input type="text" class="form-control" id="productNote" name="productNote"
                            placeholder="Lời chúc, yêu cầu thêm...">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-primary" id="addProductBtn">Thêm Sản Phẩm</button>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/scriptAdmin.js"></script>
</body>

</html>