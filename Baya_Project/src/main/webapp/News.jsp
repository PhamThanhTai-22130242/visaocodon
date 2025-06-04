<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PHAMTAI
  Date: 1/10/2025
  Time: 1:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tất cả bài viết</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="./assets/css/reset/reset.css">
    <link rel="stylesheet" href="./assets/fonts/stylesheet.css">
    <link rel="stylesheet" href="./assets/css/styles.css">
    <link rel="stylesheet" href="./assets/css/layout/modal.css">
    <link rel="stylesheet" href="./assets/css/layout/backToTop.css">
    <link rel="stylesheet" href="./assets/css/pages/home.css">
    <link rel="stylesheet" href="./assets/css/layout/header.css">
    <link rel="stylesheet" href="./assets/css/layout/footer.css">
    <link rel="shortcut icon" href="./assets/images/favicons/favicon_logo.png" type="image/x-icon">
    <link rel="stylesheet" href="./assets/css/layout/modal.css">
    <link rel="stylesheet" href="./assets/css/pages/article.css">
    <link rel="stylesheet" href="./assets/css/pages/productDetail.css">
    <link rel="stylesheet" href="./assets/css/pages/productSearch.css">
    <link rel="stylesheet" href="./assets/css/pages/news.css">
    <link rel="stylesheet" href="./assets/css/layout/breadcrumb.css">


    <style>
        .article_alpha {
            width: 100% !important;

        }

        .news-card {
            height: 350px !important;
        }

        .news-card img {
            height: 75%;
        }
    </style>
</head>


<body>
<jsp:include page="SharedViews/header.jsp"/>
<div class="body_home">
    <div class="main_container ">
        <div class="breadcrumb">
            <ul>
                <li> <a href="">Trang chủ</a> </li>
                <li>/</li>
                <li><a href="">Tất cả bài viết</a></li>
            </ul>
        </div>
        <div class="article_page">


            <div class="article_alpha bg-while">
                <ul class="news_list">
                    <c:forEach var="item" items="${news}">

                    <a class="news-card" href="/articleDetail?id=${item.newsID}">

                        <img src="${item.thumbnail}">
                        <p>${item.title}
                        </p>
                    </a>
                    </c:forEach>
                </ul>
                <div class="see_more-product">

                </div>
            </div>

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
                    Chí Minh </li>
                <li><i class="fa-solid fa-phone"></i> 1900 63 64 76</li>
                <li><i class="fa-solid fa-envelope"></i> webshop@baya.vn</li>
            </ul>
        </div>
        <div class="footer-column">
            <h3>VỀ BAYA</h3>
            <ul>
                <li><a href="introduce.html"><i class="fa-solid fa-circle icon-small"></i>Giới thiệu</a></li>
                <li><a href="contact.html"><i class="fa-solid fa-circle icon-small"></i>Liên hệ</a></li>
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
</body>
<script src="./assets/js/modal.js"></script>

</html>
