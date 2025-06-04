<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/14/24
  Time: 10:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/reset/reset.css">
    <link rel="stylesheet" href="./assets/fonts/stylesheet.css">
    <link rel="stylesheet" href="./assets/css/pages/home.css">
    <link rel="stylesheet" href="./assets/css/styles.css">
    <link rel="stylesheet" href="./assets/css/layout/basic.css">
    <link rel="stylesheet" href="./assets/css/pages/cart.css">
    <link rel="stylesheet" href="./assets/css/layout/header.css">
    <link rel="stylesheet" href="./assets/css/layout/footer.css">
    <link rel="stylesheet" href="./assets/css/layout/breadcrumb.css">
    <link rel="stylesheet" href="./assets/css/layout/modal.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
</head>

<body>

<jsp:include page="SharedViews/header.jsp"/>


<div class="cotainerPage">

    <div class="grid">

        <nav>
            <div class="breadcrumb">
                <ul>
                    <li><a href="">Trang chủ </a></li>

                    <li>/</li>
                    <li><a href="">Giỏ hàng</a></li>
                </ul>
            </div>
        </nav>

        <div class="cart-content">
            <div class="row">
                <div class="col-md-8">
                    <h2 class="cart-title">Giỏ hàng của bạn</h2>
                    <p class="description-quality">Bạn đang có <strong id="cart-size">${sessionScope.cart.cartSize()}
                        sản phẩm</strong> trong giỏ hàng</p>
                    <c:forEach var="c" items="${sessionScope.cart.getAllCartItems()}">

                        <div class="product-item">
                            <c:if test="${c.isChoose() }">
                                <input type="checkbox" class="select-product"  id="${c.productId}"  checked>
                            </c:if>

                            <c:if test="${!c.isChoose()}">
                                <input type="checkbox" class="select-product" id="${c.productId}" >
                            </c:if>



                            <img src="${c.thumbnail}" alt="Product 2">
                            <div class="product-details">
                                <h5>${c.name}</h5>
                                <div class="product-price">
                                    <f:formatNumber value="${c.getPriceAfterDiscount() }"
                                                                           type="number" groupingUsed="true"
                                                                           maxFractionDigits="0"/> đ
                                </div>
                            </div>
                            <div class="caculator_total">
                             <div>
                                 <div class="quantity-controls">
                                     <button onclick="changeQuatityCartItem(this,'${c.productId}','${c.quatityStock}',false)">−</button>
                                     <span class="quality-product">${c.quantity}</span>
                                     <button onclick="changeQuatityCartItem(this,'${c.productId}','${c.quatityStock}',true)">+</button>
                                 </div>
                                 <div class="total-price">
                                     <f:formatNumber
                                             value="${c.totalPriceCartItem() ==null ?  0 : c.totalPriceCartItem()}"
                                             type="number" groupingUsed="true" maxFractionDigits="0"/>
                                     đ
                                 </div>
                             </div>


                                <button class="btn btn-remove" onclick="removeCartItem(this,'${c.productId}')">Xóa</button>

                            </div>
                        </div>

                    </c:forEach>

                </div>

                <div class="col-md-4">
                    <div class="order-summary">
                        <h4 class="heading_infor">Thông tin đơn hàng</h4>
                        <div class="des-total-price">
                            <p>Tổng tiền:</p> <span class="total-price-checkout" id="id-total-price-checkout">
                            <f:formatNumber
                                    value="${sessionScope.cart.totalPriceCart() ==null ? 0 :sessionScope.cart.totalPriceCartItemInCart()}"
                                    type="number" groupingUsed="true" maxFractionDigits="0"/> đ</span>
                        </div>
                        <div class="des-tip">
                            <ul class="list-tip">
                                <li>Phí vận chuyển sẽ được tính ở trang Thanh toán</li>
                                <li>Mã giảm giá được nhập ở trang Thanh toán</li>
                            </ul>

                        </div>
                        <button id="btn-checkout"  class="checkout-btn" onclick="goToCart()">THANH TOÁN</button>
                    </div>


                </div>
            </div>
        </div>

        <!-- footer  -->

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

                    <img
                            src="https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bdc5094c1d0a4520b209c54ea88e10ba_master.jpg"
                            alt="img">
                    <p>Bàn làm việc</p>

                </a>
                <a class="category-item" href="productSearch.html">

                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG-buIdH3shs3NaAiqPwff0BSvhRDRVGKfaA&s"
                         alt="img">
                    <p>Ghế văn phòng</p>

                </a>
                <a class="category-item" href="productSearch.html">

                    <img
                            src="https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bdc5094c1d0a4520b209c54ea88e10ba_master.jpg"
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


<script>

    const notyf = new Notyf();
    checkSize()
    function getTotalPrice() {
        let total = $('.total-price-checkout').text();
        return parseInt(total);
    }
    function checkSize() {
        if(getTotalPrice() == 0) {
             $('#btn-checkout').css({
                 opacity : 0.5,
                 cursor : 'default'
             }).prop('disabled',true)
        }else {
            $('#btn-checkout').css({
                opacity : 1,
                cursor : 'pointerenter'
            }).prop('disabled',false)
        }
    }


    function goToCart() {
        var url = "infor-payment";
        window.location.href = url;
    }

    function changeQuatityCartItem(button, id,quatityStock, isIncrement) {

        var quantityElement = $(button).siblings('span.quality-product');
        var productItem = $(button).closest('.product-item');
        let currentQuantity = parseInt(quantityElement.text());
        let newQuantity = (isIncrement) ? ++currentQuantity : --currentQuantity;
        if (newQuantity <= 0) {
            return;
        }
        if(!isIncrement && newQuantity<=quatityStock){
            $(button).closest('.quantity-controls').find('button').eq(1).prop('disabled', false);
        }



        fetch('/cart-handler', {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: 'action=change&quatity=' + newQuantity + '&productId=' + id
        })
            .then(response => {
                return response.json();
            })
            .then(data => {
                if(data.check){
                    quantityElement.text(newQuantity);
                    productItem.find('.total-price').text(new Intl.NumberFormat('vi-VN').format(data.totalPriceCartItem) + " đ")
                    document.getElementById('id-total-price-checkout').textContent = new Intl.NumberFormat('vi-VN').format(data.totalPriceCart) + " đ"
                    checkSize()
                }else{
                    $(button).prop('disabled', true);

                }

            })
            .catch(error => console.error('Error:', error));
    }


    function removeCartItem(button, id) {
        var productItem = $(button).closest('.product-item');

        fetch('/cart-handler', {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: 'action=delete&quatity=' + 0 + '&productId=' + id
        })
            .then(response => {
                return response.json();
            })
            .then(data => {

                productItem.remove();
                document.getElementById("cart-size").textContent = data.sizeCart + " sản phẩm";
                document.getElementById('id-total-price-checkout').textContent = new Intl.NumberFormat('vi-VN').format(data.totalPriceCart) + " đ"
                checkSize()

            })
            .catch(error => console.error('Error:', error));
    }



    $('.select-product').change(function() {

        let id = $(this).attr('id');
        let check = $(this).is(':checked')

        let productItem = $(this).closest('.product-item');

        fetch('/cart-handler', {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: 'action=choose&isChoose=' + check + '&productId=' + id
        })
            .then(response => {
                return response.json();
            })
            .then(data => {if(data.check){
                   let total = new Intl.NumberFormat('vi-VN').format(data.totalPriceCart)+ " đ"
                   $('#id-total-price-checkout').text(total)
                   checkSize()
               }else{
                   notyf.error('Sản phẩm trong kho tạm hết')
                   $(this).prop('checked', false);
                productItem.find('.quality-product').text('0');
                productItem.find('.total-price').text('0 đ');

            }
            })
            .catch(error => console.error('Error:', error));

    });
</script>
</body>

<script src="./assets/js/modal.js"></script>

</html>