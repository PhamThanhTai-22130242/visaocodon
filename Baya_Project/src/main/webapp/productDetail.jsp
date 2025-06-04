<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: PHAMTAI
  Date: 12/14/2024
  Time: 10:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/reset/reset.css">
    <link rel="stylesheet" href="assets/fonts/stylesheet.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/pages/home.css">

    <link rel="stylesheet" href="assets/css/layout/modal.css">
    <link rel="stylesheet" href="assets/css/pages/productDetail.css">
    <link rel="stylesheet" href="assets/css/layout/header.css">
    <link rel="stylesheet" href="assets/css/layout/footer.css">
    <link rel="stylesheet" href="assets/css/layout/breadcrumb.css">
    <link rel="shortcut icon" href="assets/images/favicons/favicon_logo.png" type="image/x-icon">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
    <title>Chi tiết sản phẩm</title>

    <style>

        .disabled{
            opacity: 0.5;
            cursor: not-allowed;
            pointer-events: none;
        }

    <jsp:include page="SharedViews/block_error.jsp" />
        <jsp:include page="SharedViews/Recom_Header.jsp" />
    </style>
</head>

<body>
<div class="container">

    <jsp:include page="SharedViews/header.jsp"/>
    <!-- end header  -->


    <div class="body_home">
        <div class="main_container">
            <div class="breadcrumb">
                <ul>
                    <li><a href="">Ghế</a></li>
                    <li>/</li>
                    <li><a href="">Ghế Sofa</a></li>
                </ul>
            </div>

            <div class="product_name">
                <h1>${product.name}</h1>

            </div>
            <div class="product_name_rating">
                <ul>
                    <li>
                        <p>Đã bán:
                        <p>${product.quanlitySell}</p>
                    </li>
                    <li>
                        <p><i class="fa-solid fa-star"></i></p>
                        <p>4.5</p>

                    </li>
                    <li>
                        <p><i><i class="fa-solid fa-ruler "></i></i></p>

                        <p>Thông số</p>

                    </li>
                </ul>


            </div>
            <div class="product_detail">
                <div class="
                    left">

                    <div class="img_slider  bg-while alpha">
                        <div class="img_slider-main">


                            <div class="img_control-previous">
                                <i class="fa-solid fa-chevron-right"></i>
                            </div>
                            <div class="img_control-next">
                                <i class="fa-solid fa-chevron-right"></i>

                            </div>

                            <img class="img-feature"
                                 src="${product.thumbnail}"
                                 alt="img">
                        </div>
                        <div class="list_img list_img-center">

                            <c:forEach var="item" begin="1" end="${listImg.size()}" items="${requestScope.listImg}">
                                <div><img
                                        src="${item.image}"
                                        alt="img">
                                </div>
                            </c:forEach>

                        </div>

                    </div>

                    <div class="policy alpha bg-while">
                        <div class="policy_title">
                            <h2>Baya cam kết</h2>
                        </div>
                        <div class="policy_list">
                            <div class="policy_detail">
                                <img src="https://cdnv2.tgdd.vn/pim/cdn/images/202411/icon%20bao%20hanh173451.png"
                                     alt="">
                                <p>Đảm bảo nguồn gốc xuất xứ rõ ràng, chất liệu an toàn, bền đẹp.</p>
                            </div>
                            <div class="policy_detail">
                                <img src="https://cdnv2.tgdd.vn/pim/cdn/images/202410/icon%20lap%20dat140848.png"
                                     alt="">
                                <p>Lắp đặt miễn phí lúc nhận hàng</p>
                            </div>
                            <div class="policy_detail">
                                <img src="https://cdnv2.tgdd.vn/pim/cdn/images/202410/Exchange150303.png" alt="">
                                <p>Quy trình đổi trả nhanh chóng, minh bạch.</p>
                            </div>

                        </div>
                    </div>
                    <div class="product_content alpha bg-while">

                        <div class="content_name ">
                            <h3 onclick="showContent(1)">Thông số kĩ thuật</h3>
                            <h3 onclick="showContent(2)">Bài viết đánh giá</h3>


                        </div>
                        <div class="content_blog " id="content_blog">

                            <div class="content_blog-item">


                                <button class="item-name" onclick="clickContentItem()">
                                    <h3>Tổng quan</h3> <i class="fa-solid fa-chevron-right fa-rotate-90"></i>
                                </button>
                                <div class="item-main">
                                    <ul>
                                        <li>
                                            <h3>Mã sản phẩm: </h3>
                                            <p>${product.productID}</p>
                                        </li>
                                        <li>
                                            <h3>Kích thước: </h3>
                                            <p>${specification.dimensions !=null? specification.dimensions :"20x20x50"}</p>
                                        </li>
                                        <li>
                                            <h3>Chất liệu: </h3>
                                            <p>${specification.material !=null? specification.material :"Gỗ cao cấp"}</p>
                                        </li>
                                        <li>
                                            <h3>Xuất xứ: </h3>
                                            <p>${specification.original !=null? specification.original :"Trung Quốc"}</p>
                                        </li>
                                        <li>
                                            <h3>Tiêu chuẩn: </h3>
                                            <p>California Air Resources Board xuất khẩu Mỹ.</p>
                                        </li>
                                    </ul>
                                </div>


                            </div>

                        </div>
                        <div class="content_blog-rating remove" id="content_blog-rating">
                            <p>
                                ${product.productID}
                                <c:choose>
                                    <c:when test="${product.description!= null}">
                                        ${product.description!= null}
                                    </c:when>
                                    <c:otherwise>
                                        Hãy biến không gian sống của bạn trở nên đẳng cấp hơn với Sofa Góc Hiện Đại - Oslo,
                                        mẫu sofa được thiết kế dành riêng cho những ai yêu thích sự tinh tế và tiện lợi. Với
                                        phong cách hiện đại, Oslo không chỉ là một món nội thất, mà còn là điểm nhấn hoàn
                                        hảo cho phòng khách của bạn.

                                        Sản phẩm này được chế tác từ các vật liệu cao cấp nhằm đảm bảo sự thoải mái và độ
                                        bền dài lâu. Đệm ngồi sử dụng mousse đàn hồi cao, mang lại cảm giác êm ái vượt trội
                                        khi bạn ngồi hay nằm thư giãn. Phần tựa lưng được thiết kế với độ nghiêng lý tưởng
                                        để hỗ trợ cột sống, giúp giảm căng thẳng sau một ngày làm việc mệt mỏi.

                                        Thiết kế góc chữ L thông minh không chỉ giúp tối ưu không gian mà còn tạo ra một khu
                                        vực sinh hoạt chung ấm cúng cho gia đình. Dù phòng khách của bạn có diện tích khiêm
                                        tốn hay rộng rãi, Oslo vẫn dễ dàng trở thành trung tâm thu hút mọi ánh nhìn.

                                        Bề mặt sofa được bọc từ chất liệu vải/da cao cấp, không chỉ mang lại vẻ ngoài sang
                                        trọng mà còn có khả năng chống bám bụi và dễ dàng vệ sinh. Tông màu trung tính đa
                                        dạng, từ xám thanh lịch, nâu ấm áp đến xanh pastel nhẹ nhàng, cho phép bạn dễ dàng
                                        phối hợp với các món nội thất khác trong nhà.
                                    </c:otherwise>
                                </c:choose>


                            </p>
                        </div>

                    </div>
                    <div class="product_rate alpha bg-while  magin-bottom">
                        <a class="btn_view buy_now" href="review-product?id=${product.productID}">

                            <p>Xem đánh giá</p>
                        </a>

                    </div>


                </div>
                <div class="block_right omega bg-while">
                    <a class="banner_sale " href="https://zalo.me/0869380447">
                        <img src="https://cdnv2.tgdd.vn/mwg-static/dmx/Banner/79/61/796197adf9f0c2d5cadb6a2c2679358a.png"
                             alt="banner">
                    </a>
                    <div class="block_price">
                        <p class="price-present">${product.formatPrice(product.getPriceAfterDiscount())} <sup>đ</sup>
                        </p>
                        <p class="price-old">${product.formatPrice(product.price)} <sup>đ</sup></p>
                        <p class="price-percent">-${product.discountDefault}%</p>


                    </div>
                    <div class="block_promotion">
                        <div class="promotion_name">
                            <p>Khuyến mãi</p>
                            <p>Giá và khuyến mãi dự kiến áp dụng đến 23:59 | 30/11</p>
                        </div>
                        <div class="promotion_item">
                            <div class="item_content">
                                <i class="fa-solid fa-circle"></i>
                                <p>Nhập mã SOFAFT200 giảm lên đến 200,000đ (áp dụng cho các sản phẩm thuộc
                                    SOFA)</p>
                            </div>
                        </div>
                        <div class="promotion_item">
                            <div class="item_content">
                                <i class="fa-solid fa-circle"></i>
                                <p>Nhập mã XMAS10 để nhận ưu đãi giảm giá lên đến 20% nhân dịp Giáng Sinh!</p>
                            </div>
                        </div>
                        <div class="promotion_item">
                            <div class="item_content">
                                <i class="fa-solid fa-circle"></i>
                                <p>Nhập mã TET20 để nhận ưu đãi giảm giá lên đến 20% chào đón Tết Nguyên Đán! </p>
                            </div>
                        </div>

                    </div>
                    <div class="block_buy">
                       <div class="btn_add-cart buy_now ${product.quantity == 0 ? 'disabled' : ''}" onclick="AddCart('${product.productID}',event)">

                               <i class="fa-solid fa-cart-plus"></i>
                               <p>Thêm vào giỏ hàng</p>

                       </div>
                        <a class="btn_buynow buy_now
                        ${product.quantity == 0 ? 'disabled' : ''}"
                           href="buy-now?id=${product.productID}">
                            <p>Mua Ngay</p>
                        </a>
                    </div>
                    <div class="block_call">
                        <i class="fa-solid fa-phone"></i>
                        <a href="tel:0869380448">0869 380 448</a>
                        <p>(8:00 - 21:30)</p>
                    </div>
                    <div class="block_store">
                        <i class="fa-solid fa-shop"></i>
                        <a href="storeAddress.html">Xem các cửa hàng của Baya</a>
                    </div>

                </div>

            </div>
        </div>
    </div>


    <!-- footer  -->
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
    <!-- end footer  -->
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


</body>
<script src="assets/js/sliderProduct.js"></script>
<script src="./assets/js/modal.js"></script>
<script src="./assets/js/addCart.js"></script>


</html>
