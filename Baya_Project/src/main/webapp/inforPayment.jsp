<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Baya Checkout</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <link rel="stylesheet" href="./assets/css/layout/basic.css">
    <link rel="stylesheet" href="./assets/css/reset/reset.css">
    <link rel="stylesheet" href="./assets/fonts/stylesheet.css">
    <link rel="stylesheet" href="./assets/css/pages/productDetail.css">
    <link rel="stylesheet" href="./assets/css/styles.css">
    <link rel="stylesheet" href="./assets/css/pages/form_checkout.css">
    <link rel="stylesheet" href="./assets/css/layout/header.css">
    <link rel="stylesheet" href="./assets/css/layout/breadcrumb.css">
    <link rel="stylesheet" href="./assets/css/pages/home.css">
    <link rel="stylesheet" href="./assets/css/layout/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="./assets/css/layout/modal.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>


</head>

<body>

<jsp:include page="SharedViews/header.jsp"/>


<div class="body_home">
    <div class="main_container">

        <div class="breadcrumb">
            <ul>
                <li><a href="">Giỏ hàng</a></li>
                <li>/</li>
                <li><a href="">Thông tin giao hàng </a></li>
            </ul>
        </div>
        <div class="">


            <div class="row bg-while">
                <div class="col-md-7 form-infor-checkout">
                    <h4 class="infor-delivery-label">Thông tin giao hàng</h4>

                    <form id="form-infor" method="post" action="method-payment">
                        <div class="input-group">
                            <label for="fullname">Họ và tên</label>
                            <input type="text" name="name" class="form-input-item" id="fullname" placeholder="Họ và tên"
                                   required>
                        </div>
                        <div class="row">
                            <div class="input-group col-md-6">
                                <label for="email">Email</label>
                                <input type="email" name="email" class="form-input-item" id="email" placeholder="Email"
                                       required
                                       onkeyup="checkErrorEmail()">
                                <span id="error_email"></span>
                            </div>
                            <div class="input-group col-md-6">
                                <label for="phone">Số điện thoại</label>
                                <input type="number" name="phone" class="form-input-item" id="phone"
                                       placeholder="Số điện thoại"
                                       onkeyup="checkErrorPhone()" required>
                                <span id="error_phone"></span>
                            </div>
                        </div>
                        <div class="input-group">
                            <label for="address-display">Địa chỉ</label>
                            <input type="text" id="address-display"  name="address" class="form-input-item" placeholder="Chọn vị trí trên bản đồ"  readonly required>
                            <span id="error_address"></span>
                            <button type="button" class="btn btn-primary mt-2" id="open-map-btn">
                                Chọn vị trí trên bản đồ
                            </button>
                        </div>

                        <div class=" note">
                            <label for="content-notes" class="bold">Ghi chú đơn hàng</label>
                            <textarea class="form-control" id="content-notes" rows="5"
                                      name="note-content" placeholder="Ghi chú đơn hàng..."></textarea>
                        </div>

                        <div class="container mt-4">
                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <label for="province" class="form-label">Tỉnh/Thành phố:</label>
                                    <select id="province" name="province" class="form-select">
                                        <option value="">Chọn Tỉnh/Thành phố</option>
                                    </select>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="district" name="district" class="form-label">Quận/Huyện:</label>
                                    <select id="district" class="form-select" disabled>
                                        <option value="">Chọn Quận/Huyện</option>
                                    </select>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="ward" class="form-label">Phường/Xã:</label>
                                    <select id="ward" class="form-select" name="ward" disabled>
                                        <option value="">Chọn Phường/Xã</option>
                                    </select>
                                </div>
                            </div>
                        </div>



                        <button type="button" class="btn-default" onclick="goToMethodPayment()">Tiếp tục đến
                            phương
                            thức thanh toán
                        </button>
                    </form>
                </div>


                <div class="col-md-5 order-summary">
                    <h4 class="bold">Giỏ hàng</h4>
                    <c:forEach var="c" items="${sessionScope.cart.itemCartIsChooseIncart()}">
                        <div class="product-item">

                            <img src="${c.thumbnail}" alt="Product Image">
                            <span class="des-name">${c.name}</span>

                            <span class="price"> <f:formatNumber value="${c.getPriceAfterDiscount()}" type="number"
                                                                 groupingUsed="true" maxFractionDigits="0"/> đ</span>
                            <p class="quality">${c.quantity}</p>

                        </div>
                    </c:forEach>


                    <div class="discount">
                       <span id="status-code" style="color: red;margin-top: 0.7rem;padding-left: 0.2rem">
                                <c:if test="${requestScope.status!=null}">
                                    ${requestScope.status}
                                </c:if></span>

                        <button class="btn-default" type="button" data-bs-toggle="modal" data-bs-target="#voucherModal">
                            Chọn voucher
                        </button>

                    </div>


                    <div class="summary">
                        <div class="summary-price">
                            <span>Tạm tính</span>
                            <span>
                                <f:formatNumber value="${sessionScope.cart.totalPriceCartItemInCart()}" type="number"
                                                groupingUsed="true" maxFractionDigits="0"/> đ
                                </span>
                        </div>
                        <div class="summary-ship">
                            <span>Phí vận chuyển</span>

                            <span id="feeValue">
                              <f:formatNumber value="${sessionScope.cart.getFee()}" type="number" groupingUsed="true"
                                              maxFractionDigits="0"/> đ
                            </span>
                        </div>

                        <div class="summary-ship">
                            <span>Giảm giá vận chuyển</span>

                            <span id="discount_shipping">
                              <f:formatNumber value="${sessionScope.cart.discountShipping}" type="number" groupingUsed="true"
                                              maxFractionDigits="0"/> đ
                            </span>
                        </div>

                        <div class="summary-ship">
                            <span>Giảm giá</span>
                            <span id="discount-value">
                               <f:formatNumber value="${sessionScope.cart.discount}" type="number" groupingUsed="true"
                                               maxFractionDigits="0"/> đ
                            </span>
                        </div>
                        <div class="summary-total">
                            <span>Tổng cộng</span>
                            <span class="price-detail">
                            <f:formatNumber value="${sessionScope.cart.totalPriceCartAddFee()}" type="number"
                                            groupingUsed="true" maxFractionDigits="0"/> đ
                            </span>
                        </div>


                    </div>


                </div>
                <!-- footer  -->

            </div>
        </div>


    </div>
    <div class="footer">
        <div class="footer-top">
            <div class="newsletter">
                <p>Đăng ký nhận tin</p>
                <div class="newsletter-input">
                    <input type="email" placeholder="Nhập email của bạn">
                    <button>ĐĂNG KÝ</button>
                </div>
            </div>
            <div class="social">
                <p>Kết nối với chúng tôi</p>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                </div>
                <hr>
            </div>
        </div>
        <div class="footer-content">
            <div class="footer-column">
                <h3>CÔNG TY NỘI THẤT BAYA</h3>
                <ul>

                    <li>Thương hiệu nội thất và trang trí hàng đầu Việt Nam, góp phần xây dựng thêm nhiều tổ ấm mỗi
                        ngày.
                    </li>
                    <li><i class="fa-solid fa-location-dot"></i> Tầng 08, Tòa nhà Pearl Plaza, Số 561A
                        Điện Biên
                        Phủ,
                        Phường 25, Quận Bình Thạnh, Thành phố Hồ
                        Chí Minh
                    </li>
                    <li><i class="fa-solid fa-phone"></i> 1900 63 64 76</li>
                    <li><i class="fa-solid fa-envelope"></i> webshop@baya.vn</li>
                </ul>
            </div>
            <div class="footer-column">
                <h3>VỀ BAYA</h3>
                <ul>
                    <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Giới thiệu</a></li>
                    <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Liên hệ</a></li>
                    <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Blog</a></li>
                    <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Hệ thống cửa hàng</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h3>HỖ TRỢ KHÁCH HÀNG</h3>
                <ul>
                    <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Câu hỏi thường gặp</a></li>
                    <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Hướng dẫn đặt hàng</a></li>
                    <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Mua hàng trả góp</a></li>
                    <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Hướng dẫn thanh toán VNPAY-QR</a>
                    </li>
                </ul>
            </div>
            <div class="footer-column">
                <h3>CHÍNH SÁCH</h3>
                <ul>
                    <li><a href="#"><i class="fa-solid fa-circle icon-small "></i>Chính sách bảo hành</a></li>
                    <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Chi phí vận chuyển</a></li>
                    <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Chính sách đổi trả và hoàn tiền</a>
                    </li>
                    <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Chính sách vận chuyển</a></li>
                    <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Các hình thức thanh toán</a></li>
                    <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Chính sách bảo mật thông tin</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <p>Copyright © 2024 Baya. Powered by Nhóm 1</p>
        </div>


    </div>
    <div class="modal" id="modal">
        <div class="modal_overlay" onclick="closeCategory()">

        </div>
        <div class="modal_body-category">
            <div class="top_menu">
                <ul>
                    <li>
                        <div class="menu_category" data-category="phong-lam-viec">
                            <p>Phòng làm việc</p>
                            <i class="fa-solid fa-chevron-right"></i>
                        </div>
                    </li>
                    <li>
                        <div class="menu_category" data-category="phong-khach">
                            <p>Phòng khách</p>
                            <i class="fa-solid fa-chevron-right"></i>
                        </div>
                    </li>
                    <li>
                        <div class="menu_category" data-category="phong-ngu">
                            <p>Phòng ngủ</p>
                            <i class="fa-solid fa-chevron-right"></i>
                        </div>
                    </li>
                    <li>
                        <div class="menu_category" data-category="tu-bep">
                            <p>Tủ bếp</p>
                            <i class="fa-solid fa-chevron-right"></i>
                        </div>
                    </li>
                    <li>
                        <div class="menu_category" data-category="phong-an">
                            <p>Phòng ăn</p>
                            <i class="fa-solid fa-chevron-right"></i>
                        </div>
                    </li>

                </ul>
            </div>

            <div class="sub_category_wrapper">
                <div class="category_list" id="phong-lam-viec">
                    <a class="category-item" href="productSearch.html">

                        <img src="https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bdc5094c1d0a4520b209c54ea88e10ba_master.jpg"
                             alt="img">
                        <p>Bàn làm việc</p>

                    </a>
                    <a class="category-item" href="productSearch.html">

                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG-buIdH3shs3NaAiqPwff0BSvhRDRVGKfaA&s"
                             alt="img">
                        <p>Ghế văn phòng</p>

                    </a>
                    <a class="category-item" href="productSearch.html">

                        <img src="https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bdc5094c1d0a4520b209c54ea88e10ba_master.jpg"
                             alt="img">
                        <p>Tủ-kệ</p>

                    </a>


                </div>
                <div class="category_list" id="phong-khach">
                    <a class="category-item" href="productSearch.html">

                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG-buIdH3shs3NaAiqPwff0BSvhRDRVGKfaA&s"
                             alt="img">
                        <p>Ghế Sofa</p>

                    </a>
                    <a class="category-item" href="productSearch.html">

                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG-buIdH3shs3NaAiqPwff0BSvhRDRVGKfaA&s"
                             alt="img">
                        <p>Bàn </p>

                    </a>
                </div>
                <div class="category_list" id="phong-ngu">

                </div>
                <div class="category_list" id="tu-bep">

                </div>
                <div class="category_list" id="phong-an">

                </div>
            </div>
        </div>
    </div>
</div>



<!-- Modal -->
<div class="modal fade" id="voucherModal" tabindex="-1" aria-labelledby="voucherModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="voucherModalLabel">Chọn Voucher</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
            </div>
            <div class="modal-body">
                <form action="applyVoucher" method="post">
                    <div class="mb-3">
                        <strong>Voucher Giảm Giá:</strong>
                        <c:forEach var="v" items="${requestScope.vouchers}">
                            <c:if test="${v.category_voucher eq 'discount'}">
                                <div class="form-check2" >

                                    <label class="form-check-label" for="discountVoucher_${v.code}" style="min-width: 500px">
                                        <div class="voucher-card">
                                            <img style="border-radius: 10px" src="./assets/images/favicons/shopee_voucher.jpg" alt="">
                                            <div class="content-voucher">
                                                <p> Mã : <span class="bold">${v.code}</span></p>
                                                <p>${v.description}</p>
                                                <p>Tối đa : ${v.maximumValue} đ</p>
                                                <p>HSD : ${v.endDate}</p>
                                                <div class="progress-container">
                                                    <div class="progress-bar" style="width:${v.voucher_percentUsed()}%"></div>
                                                </div>
                                                <div class="progress-text">${v.voucher_percentUsed()} % đã được sử dụng</div>
                                            </div>
                                        </div>
                                    </label>

                                    <input  class="radio_class" type="radio" name="discountVoucher"
                                           id="discountVoucher_${v.code}" value="${v.code}" >
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="mb-3 mt-4" id="deliveryVoucherSection" style="display: none;">
                        <strong>Voucher Vận Chuyển:</strong>
                        <c:forEach var="v" items="${requestScope.vouchers}">
                            <c:if test="${v.category_voucher eq 'delivery'}">
                                <div class="form-check2">

                                    <label class="form-check-label" for="deliveryVoucher_${v.code}" style="min-width: 500px">
                                        <div class="voucher-card">
                                            <img style="border-radius: 10px" src="./assets/images/favicons/shoppe_voucher_shipping.jpg" alt="">
                                            <div class="content-voucher">
                                                <p> Mã : <span class="bold">${v.code}</span></p>
                                                <p>${v.description}</p>
                                                <p>Tối đa : ${v.maximumValue} đ</p>
                                                <p>HSD : ${v.endDate}</p>
                                                <div class="progress-container">
                                                    <div class="progress-bar" style="width:${v.voucher_percentUsed()}%"></div>
                                                </div>
                                                <div class="progress-text">${v.voucher_percentUsed()} % đã được sử dụng</div>
                                            </div>
                                        </div>
                                    </label>

                                    <input class="radio_class" type="radio" name="deliveryVoucher"
                                           id="deliveryVoucher_${v.code}" value="${v.code}">
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="modal-footer">
                        <button type="button" id="btn_apply" class="btn btn-success">Áp dụng</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="mapModal" tabindex="-1" aria-labelledby="mapModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="mapModalLabel">Chọn vị trí trên bản đồ</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
            </div>
            <div class="modal-body">
                <div id="leaflet-map" style="height: 400px;"></div>
                <p id="map-address-info" class="mt-3">📍 </p>
            </div>
            <div class="modal-footer">
                <button type="button" id="confirmLocationBtn" class="btn btn-success" >Xác nhận vị trí</button>
            </div>
        </div>
    </div>
</div>

</body>


<script src="./assets/js/check-valid-form-checkout.js"></script>
<script src="./assets/js/modal.js"></script>
<script src="./assets/js/check-valid.js"></script>
<script src="./assets/js/handlerReloadForm.js"></script>


<script>

    function checkValidCode() {


        var discountCode = $('#discount-code').val();
        var error = $('#status-code');
        var discountValue = $('#discount-value');
        var priceTotal = $('.price-detail');


        if (discountCode == '') {
            error.text("Vui lòng nhập mã giảm giá");
            return;
        }


        fetch('/voucher?code=' + discountCode, {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        })
            .then(response => {
                return response.json();
            })
            .then(data => {
                error.text(data.status);
                discountValue.text(
                    new Intl.NumberFormat('vi-VN').format(data.discount) + " đ");
                priceTotal.text(
                    new Intl.NumberFormat('vi-VN').format(data.totalPrice) + " đ");


            })
            .catch(error => console.error('Error:', error));

    }

    function isValidTelephone(telephone){
        return telephone.length>=8
    }


    function checkErrorEmail() {
        var email = document.getElementById("email");
        var error_email = document.getElementById("error_email");
        if (!email.checkValidity()) {

            error_email.innerHTML = `<p style="color:red;margin-top :0.5rem"> Nhập đúng định dạng email </p>`;
            return false;
        } else {

            error_email.innerHTML = "";
            return true;

        }
    }

    function checkErrorPhone() {
        var phone = document.getElementById("phone");
        var phone_email = document.getElementById("error_phone");

        if (!isValidTelephone(phone.value)) {
            phone_email.innerHTML = `<p style="color:red;margin-top :0.5rem">  Nhập số điện thoại trên 8 số </p>`;
            return false;
        } else {

            phone_email.innerHTML = "";
            return true;
        }
    }

    function checkErrorAddress(){
        var address = document.getElementById("address-display");
        var err = document.getElementById("error_address");
        var province = document.getElementById("province").value;
        var district = document.getElementById("district").value;
        var ward = document.getElementById("ward").value;

        if(address.value== '' || province == '' || district == '' || ward == '' ){
            err.innerHTML = `<p style="color:red;margin-top :0.5rem">  Vui lòng nhập đầy đủ địa chỉ </p>`;
            return false;
        }
        err.innerHTML = "";
        return true;
    }


    function goToMethodPayment() {
        if (checkErrorEmail() && checkErrorPhone() && checkErrorAddress()) {
            document.getElementById("form-infor").submit();
        }
    }

</script>


<script>
    const apiToken = 'db44e853-cc14-11ef-b1ed-769685acafa5';
    const baseURL = 'https://dev-online-gateway.ghn.vn';
    checkFirst =true;
    checkChooseLocation = false;

    function loadProvinces() {

        fetch(baseURL+'/shiip/public-api/master-data/province', {
            method: 'GET',
            headers: { 'Token': apiToken }
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json();
            })
            .then(data => {
                const provinceSelect = document.getElementById('province');
                data.data.forEach(province => {
                    const option = document.createElement('option');
                    option.value = province.ProvinceID;
                    option.name = province.ProvinceID;
                    option.textContent = province.ProvinceName;
                    provinceSelect.appendChild(option);
                });
            })
            .catch(error => console.error('Error loading provinces:', error));
    }

    function loadDistricts(provinceID) {
        fetch(baseURL+`/shiip/public-api/master-data/district`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Token': apiToken
            },
            body: JSON.stringify({ province_id: parseInt(provinceID, 10) })
        })
            .then(response => {
                if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
                return response.json();
            })
            .then(data => {
                const districtSelect = document.getElementById('district');
                districtSelect.innerHTML = '<option value="">Chọn Quận/Huyện</option>';
                data.data.forEach(district => {
                    const option = document.createElement('option');
                    option.value = district.DistrictID;
                    option.textContent = district.DistrictName;
                    option.name = province.DistrictID;

                    districtSelect.appendChild(option);
                    console.log(district.DistrictID+' ' + district.DistrictName)
                });
                districtSelect.disabled = false;
                checkChooseLocation = false;
            })
            .catch(error => console.error('Error loading districts:', error));
    }

    function loadWards(districtID) {
        fetch(baseURL+`/shiip/public-api/master-data/ward`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Token': apiToken
            },
            body: JSON.stringify({ district_id: parseInt(districtID, 10) })
        })
            .then(response => {
                if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
                return response.json();
            })
            .then(data => {
                const wardSelect = document.getElementById('ward');
                wardSelect.innerHTML = '<option value="">Chọn Phường/Xã</option>';
                data.data.forEach(ward => {
                    const option = document.createElement('option');
                    option.value = ward.WardCode;
                    option.textContent = ward.WardName;
                    option.name = province.WardName;

                    wardSelect.appendChild(option);
                    console.log(ward.WardCode+' '+ward.WardName)
                });
                wardSelect.disabled = false;
                checkChooseLocation = false;


            })
            .catch(error => console.error('Error loading wards:', error));
    }
    function getShippingFee() {
        const toDistrictID = document.getElementById('district').value;
        const toWardID = document.getElementById('ward').value;
        const weight = 25000;

        if (!toDistrictID || !toWardID || !weight) {
            alert('Vui lòng nhập đầy đủ thông tin!');
            return;
        }

        fetch(baseURL+`/shiip/public-api/v2/shipping-order/fee`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Token': apiToken
            },
            body: JSON.stringify({
                from_district_id: 3695,
                from_ward_code: "90735",
                to_district_id: parseInt(toDistrictID, 10),
                to_ward_code: toWardID,
                weight: parseInt(weight, 10),
                service_type_id: 2,
                shop_id: 2509459
            })
        })
            .then(response => {
                if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
                return response.json();
            })
            .then(data => {
                updateFeeInCart(data.data.total);
            })
            .catch(error => {
                console.error('Error fetching shipping fee:', error);
            });
    }

    document.getElementById('province').addEventListener('change', function () {
        const provinceSelect = document.getElementById('province');
        const districtSelect = document.getElementById('district');
        const wardSelect = document.getElementById('ward');

        if(this.value == ''){

            districtSelect.innerHTML = '<option value="">Chọn Quận/Huyện</option>';
            districtSelect.disabled = true;

            wardSelect.innerHTML = '<option value="">Chọn Phường/Xã</option>';
            wardSelect.disabled = true;

        }else{
            loadDistricts(this.value);
        }
    });

    document.getElementById('district').addEventListener('change', function () {

        loadWards(this.value);

    });

    document.getElementById('ward').addEventListener('change', function () {
        getShippingFee();

    });
    loadProvinces();

    function updateFeeInCart(fee){


        fetch('/update-fee', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ fee: fee })
        })
            .then(response => {
                if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
                return response.json();
            })
            .then (data =>{
                if(data.success){
                    $('#feeValue').text(fee.toLocaleString()+" đ")  ;
                    $('.price-detail').text(data.totalPrice.toLocaleString()+ "đ")
                    $('#discount_shipping').text(new Intl.NumberFormat('vi-VN').format(0) + " đ");

                    checkChooseLocation = true
                }

            })
            .catch(error => {
                console.error('Error updating session fee:', error);
            });
    }
    $('#btn_apply').on('click',function(){

        let discountCode = $("input[name='discountVoucher']:checked").val();
        let deliveryCode = $("input[name='deliveryVoucher']:checked").val();

        fetch('/voucher', {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: 'discountCode=' + discountCode + '&deliveryCode=' + deliveryCode
        })
            .then(response => {
                return response.json();
            })
            .then(data => {
                console.log(data)



                $('#discount_shipping').text(new Intl.NumberFormat('vi-VN').format(data.discountShipping) + " đ");
                $('#discount-value').text(new Intl.NumberFormat('vi-VN').format(data.discount) + " đ");
                $('.price-detail').text(new Intl.NumberFormat('vi-VN').format(data.totalPrice) + " đ")

                $('#voucherModal').modal('hide')
            })
            .catch(error => console.error('Error:', error));
    })



    $('#voucherModal').on('shown.bs.modal', function () {
        if (checkChooseLocation === true) {
            $('#deliveryVoucherSection').show();
        } else {
            $('#deliveryVoucherSection').hide();
        }
    });

</script>
</script>


<script>
    let map, marker;
    const notyf = new Notyf();
    let address='';

        $('#open-map-btn').on('click', function () {
            const province = $('#province').val();
            const district = $('#district').val();
            const ward = $('#ward').val();

            console.log(province+' '+district+' '+ ward)

            if (!province || !district || !ward) {
                console.log('ok')

                notyf.error('Vui lòng chọn đầy đủ Tỉnh, Huyện, Xã trước khi mở bản đồ.');
                return false;
            }else{
                $('#mapModal').modal('show');
            }
        });

        $('#mapModal').on('shown.bs.modal', function () {
            const province = $('#province option:selected').text();
            const district = $('#district option:selected').text();
            const ward = $('#ward option:selected').text();



            const fullAddress = ward + ' ' + district + ' ' + province;
            console.log(fullAddress)

            if (!map) {
                map = L.map('leaflet-map').setView([10.8700, 106.8032], 16);
                L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; OpenStreetMap contributors'
                }).addTo(map);

                geocodeAndInitMap(fullAddress);

                map.on('click', async function (e) {
                    const lat = e.latlng.lat.toFixed(6);
                    const lng = e.latlng.lng.toFixed(6);

                    if (marker) map.removeLayer(marker);
                    marker = L.marker([lat, lng]).addTo(map);

                    try {
                        const url = 'https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=' + lat + '&lon=' + lng;
                        const res = await fetch(url);
                        const data = await res.json();
                        address = data.display_name || "Không tìm thấy địa chỉ";

                        $('#map-address-info').html('<b>Địa chỉ gần nhất:</b> ' + address);
                    } catch (error) {
                        console.error("Lỗi khi reverse geocode:", error);
                    }
                });
            } else {
                setTimeout(() => {
                    map.invalidateSize();
                    geocodeAndInitMap(fullAddress);
                }, 100);
            }

            $('#confirmLocationBtn').on('click',function(){

                const province = $('#province option:selected').text().trim();
                const district = $('#district option:selected').text().trim();
                const ward = $('#ward option:selected').text().trim();

                if (address.includes(province) && address.includes(district) && address.includes(ward)) {
                    $('#address-display').val(address);
                    $('#mapModal').modal('hide');
                } else {
                    notyf.error("Địa chỉ không đầy đủ. Vui lòng chọn tỉnh/thành, quận/huyện, phường/xã.");
                }

            })
        });

        async function geocodeAndInitMap(address) {
            const url = 'https://nominatim.openstreetmap.org/search?q=' + encodeURIComponent(address) + '&format=json';
            try {
                const res = await fetch(url);
                const data = await res.json();
                if (data.length === 0) {
                    alert("Không tìm thấy địa chỉ: " + address);
                } else {
                    const lat = parseFloat(data[0].lat);
                    const lon = parseFloat(data[0].lon);

                    map.setView([lat, lon], 16);

                    if (marker) map.removeLayer(marker);
                    marker = L.marker([lat, lon]).addTo(map).bindPopup(address).openPopup();
                    $('#map-address-info').text('📍 ' + address);
                }
            } catch (error) {
                alert("Lỗi khi tìm địa chỉ: " + address);
            }
        }

        async function reverseGeocode(lat, lng) {
            const url = 'https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=' + lat + '&lon=' + lng;

            try {
                const response = await fetch(url);
                const data = await response.json();

                const address = data.display_name || "Không xác định địa chỉ";

                $('#address-display').val(address);
                $('#address').val(address);
                $('#map-address-info').text('📍 ' + address);

                console.log("Địa chỉ lấy được:", address);
            } catch (error) {
                console.error("Lỗi reverseGeocode:", error);
                alert("Lỗi khi lấy địa chỉ từ tọa độ");
            }
        }


</script>





</html>
