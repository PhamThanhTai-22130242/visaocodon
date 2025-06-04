<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PHAMTAI
  Date: 12/28/2024
  Time: 12:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
<script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tất cả sản phẩm</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="./assets/css/reset/reset.css">
    <link rel="stylesheet" href="./assets/fonts/stylesheet.css">
    <link rel="stylesheet" href="./assets/css/styles.css">
    <%--    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fetch/3.6.20/fetch.min.js"></script>
    <link rel="stylesheet" href="./assets/css/pages/home.css">
    <link rel="stylesheet" href="./assets/css/pages/productDetail.css">
    <link rel="stylesheet" href="./assets/css/layout/header.css">
    <link rel="stylesheet" href="./assets/css/pages/productSearch.css">
    <link rel="stylesheet" href="./assets/css/layout/modal.css">
    <link rel="stylesheet" href="./assets/css/layout/footer.css">
    <link rel="stylesheet" href="./assets/css/layout/breadcrumb.css">
    <link rel="shortcut icon" href="./assets/images/favicons/favicon_logo.png" type="image/x-icon">
</head>
<style>
    .view_more {
        padding: 15px;
        width: 400px;
    }

    .select {
        position: relative;
        min-width: 200px;
    }

    .select svg {
        position: absolute;
        right: 12px;
        top: calc(50% - 3px);
        width: 10px;
        height: 6px;
        stroke-width: 2px;
        stroke: #9098a9;
        fill: none;
        stroke-linecap: round;
        stroke-linejoin: round;
        pointer-events: none;
    }

    .select select {
        -webkit-appearance: none;
        padding: 7px 40px 7px 12px;
        width: 100%;
        border: 1px solid #e8eaed;
        border-radius: 5px;
        background: #fff;
        box-shadow: 0 1px 3px -2px #9098a9;
        cursor: pointer;
        font-family: inherit;
        font-size: 16px;
        transition: all 150ms ease;
    }

    .select select:required:invalid {
        color: #333;
    }

    .select select option {
        color: #333;
    }

    .select select option[value=""][disabled] {
        display: none;
    }

    .select select:focus {
        outline: none;

        /*box-shadow: 0 0 0 2px rgba(0,119,255,0.2);*/
    }

    .select select:hover + svg {
        stroke: #07f;
    }

    .sprites {
        position: absolute;
        width: 0;
        height: 0;
        pointer-events: none;
        user-select: none;
    }

    .sort-button.active {
        background-color: #007bff;
        /* Màu xanh khi button được chọn */
        color: white;
    }

    .card_add-cart.disabled {
        opacity: 0.5;
        cursor: not-allowed;
        pointer-events: none;
    }

    .out-of-stock {
        color: red;
        font-weight: bold;
        font-size: 1rem;
        display: block;
        margin-top: 5px;
        cursor: not-allowed;;
    }

    <jsp:include page="SharedViews/Recom_Header.jsp" />
</style>

<body>
<div class="container">


    <!-- HEADER  -->
    <jsp:include page="SharedViews/header.jsp"/>


    <div class="body_home">
        <div class="main_container">
            <div class="breadcrumb">
                <ul>
                    <li><a href="">Trang chủ</a></li>
                    <li>/</li>
                    <li><a href="">Tất cả sản phẩm</a></li>
                </ul>
            </div>

            <div class="block_product bg-while">
                <div class="filter-bar">
                    <div class="filter-options">
                        <button class="filter-button"><i class="fa-solid fa-filter"></i>
                            Tất cả sản phẩm
                        </button>

                    </div>


                    <div class="sort-options">
                        <span>Sắp xếp theo:</span>
                        <button class="sort-button active" value="1" onclick="sort(1)">Nổi bật</button>
                        <button class="sort-button" value="2" onclick="sort(2)">Bán chạy</button>
                        <button class="sort-button" value="3" onclick="sort(3)">Giảm giá</button>
                        <button class="sort-button" value="2" onclick="sort(4)">Từ cao đến thấp</button>
                        <button class="sort-button" value="3" onclick="sort(5)">Từ thấp đến cao</button>

                        <div>

                        </div>
                    </div>
                    <div style="width: 100%; display: flex; margin-top: 20px">

                        <div style="display: flex; align-items: center; width: 400px; ">
                            <p style=" width: 25%">Khoảng giá:</p>
                            <label class="select" for="slct">
                                <select id="slct" required="required">
                                    <option value="0" >Vui lòng chọn</option>
                                    <option value="1">Từ 0 đến 2.5 triệu</option>
                                    <option value="2">Từ 2.5 đến 5 triệu</option>
                                    <option value="3">Từ 5 đến 10 triệu</option>
                                    <option value="4">Trên 10 triệu</option>

                                </select>
                                <svg>
                                    <use xlink:href="#select-arrow-down"></use>
                                </svg>
                            </label>
                            <!-- SVG Sprites-->
                            <svg class="sprites">
                                <symbol id="select-arrow-down" viewbox="0 0 10 6">
                                    <polyline points="1 1 5 5 9 1"></polyline>
                                </symbol>
                            </svg>
                        </div>
                        <div style="display: flex; align-items: center; width: 500px;">
                            <p style=" width: 25%">Nơi sản xuất:</p>
                            <label class="select" for="slct">
                                <select id="sorry" required="required">
                                    <option value="0" disabled="disabled" selected="selected">Vui lòng chọn</option>
                                    <option value="1">Việt Name</option>
                                    <option value="2">Trung Quốc</option>
                                    <option value="3">Nhật Bản</option>
                                    <option value="4">Châu Âu EU</option>
                                    <option value="5">Hoa Kỳ</option>

                                </select>
                                <svg>
                                    <use xlink:href="#select-arrow-down"></use>
                                </svg>
                            </label>
                            <!-- SVG Sprites-->
                            <svg class="sprites">
                                <symbol id="select-arrow-down" viewbox="0 0 10 6">
                                    <polyline points="1 1 5 5 9 1"></polyline>
                                </symbol>
                            </svg>
                        </div>


                    </div>
                </div>
                <div class="product_list sale_list" id="productList">

                    <c:choose>
                        <c:when test="${message != null}">
                            <h1 style="color: #9c3328">Vui lòng nhập từ khóa tìm kếm</h1>
                        </c:when>
                        <c:when test="${list.isEmpty()}">
                            <h1 style="color: #9c3328">Không tìm thấy sản phẩm nào</h1>


                        </c:when>
                        <c:otherwise>

                            <c:forEach var="itemProduct" items="${list}">


                                <div class="product_card " onclick="goToProDetail('${itemProduct.productID}')">
                                    <div class="card_image">
                                        <img src="${itemProduct.thumbnail}"
                                             alt="product">
                                    </div>
                                    <div class="card_tilte">
                                        <h4>${itemProduct.name}</h4>
                                    </div>

                                    <p class="card_price-show">
                                            ${itemProduct.formatPrice(itemProduct.getPriceAfterDiscount())}
                                        đ</p>

                                    <div class="card_price-discount">
                                        <p class="card_price-through">${itemProduct.formatPrice(itemProduct.price)}
                                            đ</p>
                                        <b>${itemProduct.discountDefault}%</b>
                                    </div>


                                    <div class="card_bottom">
                                        <div class="card_vote">
                                            <i class="fa-solid fa-star"></i>
                                            <p class="magin-right">(${itemProduct.quanlitySell})</p>

                                        </div>
                                        <div class="card_add-cart
                      ${itemProduct.quantity == 0 ? 'disabled' : ''}"
                                             onclick="AddCart('${itemProduct.productID}',event,${itemProduct.quantity})">
                                            <c:if test="${itemProduct.quantity == 0}">
                                                <span class="out-of-stock">Hết hàng</span>
                                            </c:if>

                                            <c:if test="${itemProduct.quantity != 0}">
                                                <i class="fa-solid fa-cart-arrow-down">
                                                </i>
                                            </c:if>

                                        </div>

                                    </div>

                                </div>
                            </c:forEach>

                        </c:otherwise>
                    </c:choose>


                </div>
                <c:choose>
                    <c:when test="${message!= null || list.size()<20}">
                        <div class="see_more-product" style="display: none" id="see_more-product">
                            <div class="btn_rate buy_now view_more" href="writeReview.html"
                                 onclick="loadMoreProduct(10)">
                                <p>Xem thêm sản phẩm</p>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="see_more-product" style="display: flex" id="see_more-product">
                            <div class="btn_rate buy_now view_more" href="writeReview.html"
                                 onclick="loadMoreProduct(10)">
                                <p>Xem thêm sản phẩm</p>
                            </div>
                        </div>
                    </c:otherwise>

                </c:choose>


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
<script src="./assets/js/sliderSearchPro.js"></script>
<script src="./assets/js/modal.js"></script>
<script>
    function goToProDetail(id) {
        var url = "detailProduct?id=" + id;
        window.location.href = url;

    }


</script>

<script>
    function sort(id) {
        const buttons = document.querySelectorAll('.sort-button');

        // Loại bỏ class 'active' khỏi tất cả các nút
        buttons.forEach(button => {
            button.classList.remove('active');
        });

        // Thêm class 'active' vào nút được nhấn
        const selectedButton = buttons[id - 1];  // Chọn nút dựa trên chỉ số
        selectedButton.classList.add('active');

        console.log('da chay vao day')
        var productContainer = document.querySelector('.product_card').parentNode;
        var numberProduct = document.querySelectorAll('.product_card').length;
        console.log('Số sản phẩm hiện có: ' + numberProduct);

        var keySearch = document.getElementById('keySearch').value;
        var pageNumber = Math.floor(numberProduct / 20);
        console.log('Số trang hiện tại: ' + pageNumber);


        fetch('/filterProducts?keySearch=' + keySearch + '&m=0&o=0&p=0&f=' + id + '&pr=0' , {
            method: 'GET',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        })
            .then(function (response) {
                if (!response.ok) {
                    throw new Error('Lỗi: ' + response.status);
                }
                return response.json();
            })

            .then(function (data) {
                console.log('Dữ liệu nhận được:', data);
                productContainer.innerHTML = '';
                data.list.forEach(function (product) {
                    var isOutOfStock = product.quantity == 0;
                    var addCartHTML = '';

                    if (isOutOfStock) {
                        addCartHTML =
                            '<div class="card_add-cart disabled" style="cursor: default;" onclick="event.stopPropagation()">' +
                            '<span class="out-of-stock">Hết hàng</span>' +
                            '</div>';
                    } else {
                        addCartHTML =
                            '<div class="card_add-cart" onclick="AddCart(\'' + product.productID + '\', event, ' + product.quantity + ')">' +
                            '<i class="fa-solid fa-cart-arrow-down"></i>' +
                            '</div>';
                    }

                    var productHTML =
                        '<div class="product_card" onclick="goToProDetail(\'' + product.productID + '\')">' +
                        '<div class="card_image">' +
                        '<img src="' + product.thumbnail + '" alt="product">' +
                        '</div>' +
                        '<div class="card_tilte">' +
                        '<h4>' + product.name + '</h4>' +
                        '</div>' +
                        '<p class="card_price-show">' + formatPrice(product.priceAfterDiscount) + ' đ</p>' +
                        '<div class="card_price-discount">' +
                        '<p class="card_price-through">' + formatPrice(product.price) + ' đ</p>' +
                        '<b>-' + product.discountDefault + '%</b>' +
                        '</div>' +
                        '<div class="card_bottom">' +
                        '<div class="card_vote">' +
                        '<i class="fa-solid fa-star"></i>' +
                        '<p class="magin-right">(' + product.quanlitySell + ')</p>' +
                        '</div>' +
                        addCartHTML +
                        '</div>' +
                        '</div>';

                    console.log(productHTML);
                    productContainer.insertAdjacentHTML('beforeend', productHTML);

                });

                var updateNumberProduct = document.querySelectorAll('.product_card').length
                if (updateNumberProduct % 20 != 0) {
                    document.getElementById('see_more-product').style.display = 'none'
                    return
                }


            })

            .catch(function (error) {
                console.error('Lỗi:', error);
                alert('Đã xảy ra lỗi, vui lòng thử lại.');
            });

    }


</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const countrySelect = document.getElementById("sorry"); // Select quốc gia
        const priceSelect = document.getElementById("slct"); // Select giá tiền

        function handleSelectionChange(event) {
            const selectedCountry = countrySelect.value; // Lấy giá trị quốc gia
            const selectedPrice = priceSelect.value; // Lấy giá trị giá tiền

            console.log("Quốc gia đã chọn:", selectedCountry);
            console.log("Mức giá đã chọn:", selectedPrice);
            const activeButton = document.querySelector('.sort-button.active').value;
            console.log("activeButton"+ activeButton)
            var productContainer = document.querySelector('.product_card').parentNode; // Lấy phần tử chứa danh sách sản phẩm
            var numberProduct = document.querySelectorAll('.product_card').length;
            var keySearch = document.getElementById('keySearch').value;
            var pageNumber = Math.floor(numberProduct / 20);
            fetch('/filterProducts?keySearch=' + keySearch + '&m=0&o='+selectedCountry+'&p='+selectedPrice+'&f=' + activeButton + '&pr=' + numberProduct, {
                method: 'GET',
                headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            })
                .then(function (response) {
                    if (!response.ok) {
                        throw new Error('Lỗi: ' + response.status);
                    }
                    return response.json();
                })

                .then(function (data) {
                    console.log('Dữ liệu nhận được:', data);
                    productContainer.innerHTML = '';
                    data.list.forEach(function (product) {
                        var productHTML =
                            '<div class="product_card" onclick="goToProDetail(\'' + product.productID + '\')">' +
                            '<div class="card_image">' +
                            '<img src="' + product.thumbnail + '" alt="product">' +
                            '</div>' +
                            '<div class="card_tilte">' +
                            '<h4>' + product.name + '</h4>' +
                            '</div>' +
                            '<p class="card_price-show">' + formatPrice(product.priceAfterDiscount) + ' đ</p>' +
                            '<div class="card_price-discount">' +
                            '<p class="card_price-through">' + formatPrice(product.price) + ' đ</p>' +
                            '<b>-' + product.discountDefault + '%</b>' +
                            '</div>' +
                            '<div class="card_bottom">' +
                            '<div class="card_vote">' +
                            '<i class="fa-solid fa-star"></i>' +
                            '<p class="magin-right">(' + product.quanlitySell + ')</p>' +
                            '</div>' +
                            (product.quantity == 0
                                    ? '<div class="card_add-cart disabled" style="cursor: default;" onclick="event.stopPropagation()">' +
                                    '<span class="out-of-stock">Hết hàng</span>' +
                                    '</div>'
                                    : '<div class="card_add-cart" onclick="AddCart(\'' + product.productID + '\', event, ' + product.quantity + ')">' +
                                    '<i class="fa-solid fa-cart-arrow-down"></i>' +
                                    '</div>'
                            ) +
                            '</div>' +
                            '</div>';

                        console.log(productHTML);
                        productContainer.insertAdjacentHTML('beforeend', productHTML);

                    });

                    var updateNumberProduct = document.querySelectorAll('.product_card').length
                    if (updateNumberProduct % 20 != 0) {
                        document.getElementById('see_more-product').style.display = 'none'
                        return
                    }
                    else{
                        document.getElementById('see_more-product').style.display = 'flex'
                        return
                    }


                })

                .catch(function (error) {
                    console.error('Lỗi:', error);
                    alert('Đã xảy ra lỗi, vui lòng thử lại.');
                });
        }

        // Lắng nghe sự kiện thay đổi trên cả hai dropdown
        countrySelect.addEventListener("change", handleSelectionChange);
        priceSelect.addEventListener("change", handleSelectionChange);
    });

</script>
<script>
    function loadMoreProduct(i) {
        const priceSelect = document.getElementById("slct"); // Select giá tiền
        let productList = document.getElementById("productList")
        const activeButton = document.querySelector('.sort-button.active').value;
        const selectedPrice = priceSelect.value;
        console.log('gia tri:::::' + activeButton);
        var filter = i;
        var productContainer = document.querySelector('.product_card').parentNode; // Lấy phần tử chứa danh sách sản phẩm
        var numberProduct = document.querySelectorAll('.product_card').length;
        console.log('Số sản phẩm hiện có: ' + numberProduct);

        var keySearch = document.getElementById('keySearch').value;
        var pageNumber = Math.floor(numberProduct / 20);
        console.log('Số trang hiện tại: ' + pageNumber);

        console.log('/search?keySearch=' + keySearch + '&o=0&f=' + filter + '&pi=' + pageNumber)
        fetch('/filterProducts?keySearch=' + keySearch + '&m=1&o=0&f=' + activeButton +'&p='+ selectedPrice+ '&pr=' + pageNumber, {
            method: 'GET',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        })
            .then(function (response) {
                return response.json();
            })
            .then(function (data) {
                console.log('Dữ liệu nhận được:', data);
                productList.innerHTML =''
                data.list.forEach(function (product) {
                    var productHTML =
                        '<div class="product_card" onclick="goToProDetail(\'' + product.productID + '\')">' +
                        '<div class="card_image">' +
                        '<img src="' + product.thumbnail + '" alt="product">' +
                        '</div>' +
                        '<div class="card_tilte">' +
                        '<h4>' + product.name + '</h4>' +
                        '</div>' +
                        '<p class="card_price-show">' + formatPrice(product.priceAfterDiscount) + ' đ</p>' +
                        '<div class="card_price-discount">' +
                        '<p class="card_price-through">' + formatPrice(product.price) + ' đ</p>' +
                        '<b>-' + product.discountDefault + '%</b>' +
                        '</div>' +
                        '<div class="card_bottom">' +
                        '<div class="card_vote">' +
                        '<i class="fa-solid fa-star"></i>' +
                        '<p class="magin-right">(' + product.quanlitySell + ')</p>' +
                        '</div>' +

                        (product.quantity == 0
                                ? '<div class="card_add-cart disabled" style="cursor: default;" onclick="event.stopPropagation()">' +
                                '<span class="out-of-stock">Hết hàng</span>' +
                                '</div>'
                                : '<div class="card_add-cart" onclick="AddCart(\'' + product.productID + '\', event, ' + product.quantity + ')">' +
                                '<i class="fa-solid fa-cart-arrow-down"></i>' +
                                '</div>'
                        ) +

                        '</div>' +
                        '</div>';

                    productContainer.insertAdjacentHTML('beforeend', productHTML);

                });

                var updateNumberProduct = document.querySelectorAll('.product_card').length
                if (updateNumberProduct % 20 != 0) {
                    document.getElementById('see_more-product').style.display = 'none'
                    return
                }
            })
            .catch(function (error) {
                console.error('Lỗi:', error);
                alert('Đã xảy ra lỗi, vui lòng thử lại.');
            });

    }

    // Hàm định dạng giá tiền
    function formatPrice(price) {
        return price.toLocaleString('vi-VN');
    }

</script>
<script>


</script>

<script src="assets/js/addCart.js"></script>

</body>

</html>