<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PHAMTAI
  Date: 12/14/2024
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/layout/basic.css">
    <link rel="stylesheet" href="./assets/css/reset/reset.css">
    <link rel="stylesheet" href="./assets/fonts/stylesheet.css">
    <link rel="stylesheet" href="./assets/css/pages/login.css">
    <link rel="stylesheet" href="./assets/css/styles.css">
    <link rel="stylesheet" href="./assets/css/pages/login.css">
    <link rel="stylesheet" href="./assets/css/pages/order-history.css">
    <link rel="stylesheet" href="./assets/css/pages/profile.css">
    <link rel="stylesheet" href="./assets/css/pages/home.css">
    <link rel="stylesheet" href="./assets/css/layout/header.css">
    <link rel="stylesheet" href="./assets/css/layout/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <style>

    <jsp:include page="SharedViews/block_error.jsp" />

    </style>


</head>


<body>
<div class="body_home">
    <jsp:include page="SharedViews/header.jsp" />
    <div class="grid bg-while">
        <div class="row">
            <div class="col-md-3 sidebar">
                <h4 class="username">${user.fullName}</h4>
                <a class="order" href="order-history"> <i class="fa-solid fa-money-bill-1-wave icon"
                                                               style="color: #63E6BE;"></i>
                    Lịch sử đơn hàng</a>
                <p class="infor-account"><i class="fa-solid fa-address-card icon" style="cursor: pointer; color: #74C0FC;"></i>
                    Thông tin tài khoản</p>


                <a class="order" href="contact"> <i class="fa-solid fa-money-bill-1-wave icon"
                                                    style="color: #63E6BE;"></i> Liên hệ</a>


                <c:choose>
                    <c:when test="${user != null}">

                        <div style="color: rgb(42, 131, 233);  margin-top: 20px; margin-bottom: 20px; border-radius: 5px; height: 40px; width: 100%; text-align: center; align-content: center; border:1px solid rgb(42, 131, 233); right: 0; top: 0; cursor: pointer; ">
                            <a type="submit"   href="/forget" style="  background-color: #fff; color: rgb(42, 131, 233)">Thay đổi mật khẩu</a>


                        </div>
                    </c:when>
                    <c:otherwise>

                    </c:otherwise>
                </c:choose>

                <a href="/logout">

                <button class="btn-default signout" >Đăng Xuất</button></a>

            </div>

            <!-- Content -->

            <div class="col-md-9 content">

                <h3>Thông tin tài khoản</h3>
                <div class="profile-info" style="display: block">
                    <h5 class="bold">THÔNG TIN CÁ NHÂN</h5>
                    <c:choose>
                        <c:when test="${message!= null}">
                            <p style="color: #1dc071; display: block; margin-bottom: 10px">Đã cập nhập thông tin thành công</p>
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                    <form class="" action="/updateProfile" method="post">

                        <div class="row">

                            <div class="col-md-6">
                                <label for="name" class="form-label-profile">Họ & Tên</label>
                                <input type="text" class="form-input-profile" name="name" id="name" value="${user.fullName}"
                                       placeholder="Nhập họ và tên">
                            </div>
                            <div class="col-md-6">
                                <label for="phone" class="form-label-profile">Số điện thoại</label>
                                <input type="number" class="form-input-profile" name="phoneNumber" id="phone" value="${user.phoneNumber}"
                                       placeholder="Nhập Số điện thoại">
                            </div>
                        </div>

                        <div class="btn-option">
                            <button type="submit" class="btn-default save" >Cập nhập thông tin</button>


                        </div>
                    </form>


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

                <li>Thương hiệu nội thất và trang trí hàng đầu Việt Nam, góp phần xây dựng thêm nhiều tổ
                    ấm mỗi
                    ngày.
                </li>
                <li><i class="fa-solid fa-location-dot"></i> Tầng 08, Tòa nhà Pearl Plaza, Số 561A
                    Điện Biên
                    Phủ,
                    Phường 25, Quận Bình Thạnh, Thành phố Hồ
                    Chí Minh </li>
                <li><i class="fa-solid fa-phone"></i> 1900 63 64 76</li>
                <li><i class="fa-solid fa-envelope"></i> webshop@baya.vn</li>
            </ul>
        </div>
        <div class="footer-column">
            <h3>VỀ BAYA</h3>
            <ul>
                <li><a href="introduce.html"><i class="fa-solid fa-circle icon-small"></i>Giới thiệu</a></li>
                <li><a href="contact"><i class="fa-solid fa-circle icon-small"></i>Liên hệ</a></li>
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
                <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Hướng dẫn thanh toán
                    VNPAY-QR</a>
                </li>
            </ul>
        </div>
        <div class="footer-column">
            <h3>CHÍNH SÁCH</h3>
            <ul>
                <li><a href="#"><i class="fa-solid fa-circle icon-small "></i>Chính sách bảo hành</a>
                </li>
                <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Chi phí vận chuyển</a></li>
                <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Chính sách đổi trả và hoàn
                    tiền</a>
                </li>
                <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Chính sách vận chuyển</a>
                </li>
                <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Các hình thức thanh
                    toán</a></li>
                <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Chính sách bảo mật thông
                    tin</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="footer-bottom">
        <p>Copyright © 2024 Baya. Powered by Nhóm 1</p>
    </div>
</div>

<script>

    function goToOrderHistory() {
        var url = "order-history.html";
        window.location.href = url;
    }
</script>
</body>

</html>