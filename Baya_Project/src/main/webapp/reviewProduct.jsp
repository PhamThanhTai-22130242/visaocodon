<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/25/24
  Time: 11:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<style>
    <jsp:include page="SharedViews/Recom_Header.jsp" />
</style>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="./assets/css/reset/reset.css">
    <link rel="stylesheet" href="./assets/fonts/stylesheet.css">
    <link rel="stylesheet" href="./assets/css/pages/home.css">

    <link rel="stylesheet" href="./assets/css/pages/productDetail.css">
    <link rel="stylesheet" href="./assets/css/layout/header.css">
    <link rel="stylesheet" href="./assets/css/layout/footer.css">
    <link rel="stylesheet" href="./assets/css/pages/reviews.css">
    <link rel="stylesheet" href="./assets/css/layout/breadcrumb.css">
    <link rel="stylesheet" href="./assets/css/styles.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>


    <link rel="shortcut icon" href="./assets/images/favicons/favicon_logo.png" type="image/x-icon">
    <title>Document</title>

    <style>
        #modal{
            display: none;
        }
    </style>
</head>

<body>
<div class="container">
  <jsp:include page="SharedViews/header.jsp"></jsp:include>

    <div class="body_home">
        <div class="main_container">


            <div class="product_name">
                <h1>${requestScope.nameProduct}</h1>
            </div>

            <div class="product_name_rating">
                <ul>
                    <li>
                        <p>Đã bán:</p>
                        <p>${requestScope.quantitySell}</p>
                    </li>
                    <li>
                        <p><i class="fa-solid fa-star"></i></p>
                        <p>${requestScope.avg}</p>
                    </li>
                    <li>
                        <p><i class="fa-solid fa-ruler"></i></p>
                        <p>Thông số</p>
                    </li>
                </ul>
            </div>

            <div class="review-container bg-while">
                <div class="filter-section">
                    <h2>Lọc đánh giá</h2>
                    <div class="filter-options">
                        <button class="filter-btn active "onclick="filterByStar(0,'${requestScope.productID}',this)">Tất cả</button>
                        <button class="filter-btn" onclick="filterByStar(5,'${requestScope.productID}',this)">5 ★</button>
                        <button class="filter-btn" onclick="filterByStar(4,'${requestScope.productID}',this)">4 ★</button>
                        <button class="filter-btn" onclick="filterByStar(3,'${requestScope.productID}',this)">3 ★</button>
                        <button class="filter-btn" onclick="filterByStar(2,'${requestScope.productID}',this)">2 ★</button>
                        <button class="filter-btn" onclick="filterByStar(1,'${requestScope.productID}',this)">1 ★</button>
                    </div>

                </div>

                <div class="reviews-section">
                    <c:forEach var="pr" items="${requestScope.list}">
                        <div class="review">
                            <h3>${pr.fullName}</h3>
                            <div class="rating">
                                <c:forEach begin="1" end="5" var="i">
                                <c:choose>
                                    <c:when test="${i <= pr.rating}">
                                        ★
                                    </c:when>
                                    <c:otherwise>
                                        ☆
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            </div>
                            <p>${pr.comment}</p>
                            <p class="timestamp">Đã bình luận vào ${pr.formatCreateAt()}</p>
                        </div>
                    </c:forEach>


                </div>

                <div class="add-review">
                    <h3>Thêm Đánh Giá Của Bạn</h3>
                    <div >
                        <div class="form-group">
                            <label >Đánh giá của bạn:</label>
                            <div class="rating-input">
                                <input type="radio" id="star5" name="rating" value="5" /><label for="star5">★</label>
                                <input type="radio" id="star4" name="rating" value="4" /><label for="star4">★</label>
                                <input type="radio" id="star3" name="rating" value="3" /><label for="star3">★</label>
                                <input type="radio" id="star2" name="rating" value="2" /><label for="star2">★</label>
                                <input type="radio" id="star1" name="rating" value="1" /><label for="star1">★</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="review-text">Nội dung đánh giá:</label>
                            <textarea id="review-text" name="review-text" rows="7" required></textarea>
                        </div>
                        <button type="button" onclick="comment('${requestScope.productID}')" class="send-review-btn">
                            <i class="fa-solid fa-paper-plane"></i> Gửi
                        </button>

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

</div>

<script src="sliderProduct.js"></script>

<script>

    function comment(id){
        var notyf= new Notyf();
        var rating = document.querySelector('input[name="rating"]:checked');
        var cmt =$('#review-text').val();
      if(rating== null){
          notyf.error('Vui long danh gia sao')
          return;
      }
      if(cmt.length==0){
          notyf.error('Vui nhap noi dung')
          return;
      }


      rating=rating.value;



       // window.location.href='write-review-product?'+'content='+cmt+'&rating='+rating+'&id='+'MFBNCB801.B16'
        fetch('/write-review-product', {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: 'content='+cmt+'&rating='+rating+'&id='+ id
        })
            .then(response => response.json())
            .then(data => {
                if(data.error){
                    notyf.error(data.message)
                }

                if(data.success) {

                    const reviewSection = document.querySelector('.reviews-section');
                    let stars = '';
                    for (let i = 1; i <= 5; i++) {
                        if (i <= data.rating) {
                            stars += '★';
                        } else {
                            stars += '☆';
                        }
                    }

                    const newReview =
                        '<div class="review">' +
                        '<h3>' + data.fullName + '</h3>' +
                        '<div class="rating">' +
                        stars +
                        '</div>' +
                        '<p>' + data.comment + '</p>' +
                        '<p class="timestamp">Đã bình luận vào ' + data.createAt + '</p>' +
                        '</div>';
                    reviewSection.insertAdjacentHTML('beforeend', newReview);


                    $('#review-text').val('');
                    const radios = document.querySelectorAll('input[type="radio"]');

                    radios.forEach(radio => {
                        radio.checked = false;
                    });



                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Đã xảy ra lỗi, vui lòng thử lại.');
            });
    }

    function filterByStar(rating,id,btn) {
        fetch('/filter-review-product?' + 'rating=' + rating + '&id=' + id, {
            method: 'GET',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        })
            .then(response => response.json())
            .then(data => {


                const reviewSection = document.querySelector('.reviews-section');
                reviewSection.innerHTML = '';

                if (data.length > 0) {
                    data.forEach(review => {
                        let stars = '';
                        for (let i = 1; i <= 5; i++) {
                            stars += (i <= review.rating) ? '★' : '☆';
                        }

                        const reviewHTML =
                            '<div class="review">' +
                            '<h3>' + review.fullName + '</h3>' +
                            '<div class="rating">' + stars + '</div>' +
                            '<p>' + review.comment + '</p>' +
                            '<p class="timestamp"> Đã bình luận vào hôm nay' + '</p>' +
                            '</div>';

                        reviewSection.insertAdjacentHTML('beforeend', reviewHTML);
                    });


                } else {
                    reviewSection.innerHTML = '<p>Không có đánh giá nào phù hợp.</p>';
                }

                const buttons = document.querySelectorAll('.filter-btn');
                buttons.forEach(btn => btn.classList.remove('active'));
                btn.classList.add('active');
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Đã xảy ra lỗi, vui lòng thử lại.');
            });
    }

</script>

</body>

</html>
