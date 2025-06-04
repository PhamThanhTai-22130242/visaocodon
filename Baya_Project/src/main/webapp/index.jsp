<%@ page import="com.baya.baya_project.Model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi_VN"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
<script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Siêu thị nội thất Baya</title>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
  <link rel="stylesheet" href="assets/css/reset/reset.css">

  <link rel="stylesheet" href="assets/css/styles.css">
  <link rel="stylesheet" href="assets/css/layout/backToTop.css">
  <link rel="stylesheet" href="assets/css/pages/home.css">
  <link rel="stylesheet" href="assets/css/layout/header.css">
  <link rel="stylesheet" href="assets/css/layout/footer.css">
  <link rel="stylesheet" href="./assets/css/pages/ui_chat.css">
  <link rel="shortcut icon" href="assets/images/favicons/favicon_logo.png" type="image/x-icon">
  <link rel="stylesheet" href="assets/css/layout/modal.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
        integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>


  <style>
  <jsp:include page="SharedViews/Recom_Header.jsp" />
  <%
   User user = (User) session.getAttribute("user");
   int userID =  user==null ? 0 :user.getUserID();
  %>
  %>
  <c:set var="userID" value="${userID}" />



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

</style>
</head>

<body>
<div class="container">
  <!-- HEADER  -->
  <jsp:include page="SharedViews/header.jsp" />
  <!-- end header  -->

  <div class="body_home">



    <div class="main_container">



      <div class="block_top" id="block_top">

        <div class="top_slide">
          <div class="slides">

            <img  class="slide" src="./assets/images/slide/slide_3_img.jpeg">
            <img class="slide"
                 src="https://theme.hstatic.net/200000796751/1001266995/14/slide_3_img.jpg?v=69">
            <img class="slide"
                 src="https://theme.hstatic.net/200000796751/1001266995/14/slide_2_img.jpg?v=66">

            <img class="slide" src="./assets/images/slide/slide_1_img.jpeg">



          </div>
          <div class="close_slides" onclick="closeSlider()">
            <i class="fa-regular fa-circle-xmark"></i>
          </div>
        </div>

      </div>

      <!-- subcategory.jsp -->
      <div class="block_category bg-white">
        <div class="category_img img_top_left">
          <img src="https://cdnv2.tgdd.vn/webmwg/2024/ContentMwg/images/noel/2024/dmx/icon-promo-l.png" alt="">
        </div>

        <c:forEach var="item" items="${categoryList}">
          <a class="category_item" href="productSearchCategory?subcategoryID=${item.categoryID}" target="_blank">
            <img src="${item.thumbnail}" alt="${item.name}">
            <p>${item.name}</p>
          </a>
        </c:forEach>

        <div class="category_img img_right_bottom">
          <img src="https://cdnv2.tgdd.vn/webmwg/2024/ContentMwg/images/noel/2024/dmx/icon-promo-r.png" alt="">
        </div>
      </div>

    <%--      <div class="block_category bg-while">--%>
<%--        <div class="category_img img_top_left">--%>
<%--          <img src="https://cdnv2.tgdd.vn/webmwg/2024/ContentMwg/images/noel/2024/dmx/icon-promo-l.png"--%>
<%--               alt="">--%>
<%--        </div>--%>

<%--        <c:forEach var="subList" items="${subCategoryList}">--%>


<%--          <a class="category_item" href="productSearch.html">--%>
<%--            <img src="${subList.thumbnail}" alt="">--%>
<%--            <p>${subList.name}</p>--%>
<%--          </a>--%>

<%--        </c:forEach>--%>
<%--        <a class="category_item" href="productSearch.html">--%>
<%--          <img src="./assets/images/category/banlamviec.png" alt="">--%>
<%--          <p>Tất cả sản phẩm</p>--%>
<%--        </a>--%>

<%--        <div class="category_img img_right_bottom">--%>
<%--          <img src="https://cdnv2.tgdd.vn/webmwg/2024/ContentMwg/images/noel/2024/dmx/icon-promo-r.png"--%>
<%--               alt="">--%>
<%--        </div>--%>


<%--      </div>--%>

      <div class="block_sale">
        <div class="sale_title">
          <div class="title-alpha">
            <img src="https://cdn2.cellphones.com.vn/x/media/catalog/product/b/f/bf2024__title_flashsale.png"
                 alt="banner">
          </div>


        </div>
        <div class="product_list">
          <c:forEach var="itemProduct" items="${listProductSale}">




            <div class="product_card" onclick="goToProDetail('${itemProduct.productID}')">
              <div class="card_image">
                <img src="${itemProduct.thumbnail}"
                     alt="product">
              </div>
              <div class="card_tilte">
                <h4>${itemProduct.name}</h4>
              </div>

              <p class="card_price-show">

                  ${itemProduct.formatPrice(itemProduct.getPriceAfterDiscount())}  đ</p>

              <div class="card_price-discount">
                <p class="card_price-through">
                    ${itemProduct.formatPrice(itemProduct.price)} đ</p>
                   </p>
                <b>-${itemProduct.discountDefault}%</b>
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





        </div>
<%--        <div class="view-more">--%>
<%--          <a href="productDetail.html">Xem tất cả sản phẩm <i class="fa-solid fa-chevron-right"></i></a>--%>
<%--        </div>--%>
      </div>

      <div class="block_product bg-while">
        <div class="product_list_title">
          <h3>Sản phẩm bán chạy nhất</h3>


        </div>
        <div class="product_list sale_list">
          <c:forEach var="productSell" items="${topProductSell}">
            <div class="product_card" onclick="goToProDetail('${productSell.productID}')">
              <div class="card_image">
                <img src="${productSell.thumbnail}"
                     alt="product">
              </div>
              <div class="card_tilte">
                <h4>${productSell.name}</h4>
              </div>

              <p class="card_price-show">

                  ${productSell.formatPrice(productSell.getPriceAfterDiscount())} đ</p>

              <div class="card_price-discount">
                <p class="card_price-through">${productSell.formatPrice(productSell.price)} đ</p>
                <b>-${productSell.discountDefault}%</b>
              </div>


              <div class="card_bottom">
                <div class="card_vote">
                  <i class="fa-solid fa-star"></i>
                  <p class="magin-right">(${productSell.quanlitySell})</p>



                </div>
                <div class="card_add-cart
                      ${productSell.quantity == 0 ? 'disabled' : ''}"
                     onclick="AddCart('${productSell.productID}',event,${productSell.quantity})">
                  <c:if test="${productSell.quantity == 0}">
                    <span class="out-of-stock">Hết hàng</span>
                  </c:if>

                  <c:if test="${productSell.quantity != 0}">
                    <i class="fa-solid fa-cart-arrow-down">
                    </i>
                  </c:if>

                </div>

              </div>

            </div>
          </c:forEach>

        </div>

      </div>
      <div class="block_product bg-while">
        <div class="product_list_title">
          <h3>Full Combo Hàng Cao Cấp</h3>


        </div>
        <div class="product_list sale_list">
          <c:forEach var="product" items="${listCombo}">
            <div class="product_card" onclick="goToProDetail('${product.productID}')">
              <div class="card_image">
                <img src="${product.thumbnail}"
                     alt="product">
              </div>
              <div class="card_tilte">
                <h4>${product.name}</h4>
              </div>

              <p class="card_price-show">

                  ${product.formatPrice(product.getPriceAfterDiscount())} đ</p>

              <div class="card_price-discount">
                <p class="card_price-through">${product.formatPrice(product.price)} đ</p>
                <b>-${product.discountDefault}%</b>
              </div>


              <div class="card_bottom">
                <div class="card_vote">
                  <i class="fa-solid fa-star"></i>
                  <p class="magin-right">(${product.quanlitySell})</p>

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


        </div>

      </div>
      <!-- blog new  -->
      <div class="news-section">
        <div class="news-header">
          <h2>Bài tin</h2>

        </div>

        <div class="news-cards">
          <c:forEach var="item" items="${newsList}">
            <a class="news-card" href="/articleDetail?id=${item.newsID}">
              <img src="${item.thumbnail}">
              <p>${item.title}</p>
            </a>
          </c:forEach>




        </div>

        <div class="view-more">
          <a href="/news">Xem thêm bài tin <i class="fa-solid fa-chevron-right"></i></a>
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
          <li><a href="news.html"><i class="fa-solid fa-circle icon-small"></i>Blog</a></li>
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
        <h3>CÁC THÔNG TIN KHÁC</h3>
        <ul>
          <li><a href="#"><i class="fa-solid fa-circle icon-small "></i>Tin mới nhất</a></li>


        </ul>
      </div>
    </div>
    <div class="footer-bottom">
      <p>Copyright © 2024 Baya. Powered by Nhóm 1</p>
    </div>
  </div>
  <div class="back_to-top " onclick="back_to_top()">
    <i class="fa-solid fa-angle-right"></i>
  </div>

    <button id="chatbotButton" class="chatbot-btn">
      <i class="fas fa-robot"></i>
    </button>


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


  <div class="modal-overlay" id="chatModal">
    <div class="modal-container light-mode body_chat">
      <div class="modal-header">
        <div class="modal-title">
          <img width="32" height="32" src="./assets/images/favicons/chatbot.png" alt="Chatbot">
          <span>Chatbot nè</span>
        </div>
        <button id="btn_toggle">
          <i class="fa-solid fa-moon" style="color: darkseagreen" ></i>
        </button>
      </div>
      <div class="modal-body">
        <div class="chat-messages" id="chatMessages"></div>
      </div>
      <div class="modal-footer">
        <div class="chat-input">
          <input type="text" id="userMessage" placeholder="Nhập tin nhắn...">
          <button id="sendBtn">➤</button>
        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

  <script>

    const userID = <%= userID %>
        console.log(userID)
    $(document).ready(function() {
      let isModalOpen = false;

      $('#chatbotButton').click(function() {
        $('#chatModal').css('display', 'flex');
        $('#chatModal').fadeIn(200);
        isModalOpen = true;
      });


      $('#chatModal').click(function(e) {
        if (e.target === this) {
          closeModal();
        }
      });

      function closeModal() {
        $('#chatModal').fadeOut(200);
        isModalOpen = false;
      }

      $('#sendBtn').click(sendMessage);
      $('#userMessage').keypress(function(e) {
        if (e.key === "Enter") sendMessage();
      });

      function sendMessage() {

        const msg = $('#userMessage').val().trim();
        if (msg !== "") {
          $('#chatMessages').append('<div class="message user">' + msg + '</div>');
          $('#userMessage').val("");
         setTimeout(() => {
           $('#chatMessages').scrollTop = $('#chatMessages').scrollHeight;
          }, 100);
          fetch('https://chatbot.bayastore.id.vn/chat', {
            method: 'POST',
            headers: {
              "Content-Type": "application/json"
            },
            body: JSON.stringify({question: msg,
              userID: userID
            })          })
                  .then(response => {
                    return response.json();
                  })
                  .then(data => {
                    $('#chatMessages').append(showBotMessage(data.answer));
                    $('#chatMessages').scrollTop($('#chatMessages')[0].scrollHeight);
                  });

        }






      $('#btn_toggle').click(function() {
        $('.body_chat').toggleClass('dark-mode light-mode');
        const icon = $(this).find('i');

        if ($('.body_chat').hasClass('dark-mode')) {
          icon.removeClass('fa-moon').addClass('fa-sun');
        } else {
          icon.removeClass('fa-sun').addClass('fa-moon');
        }
      });
    }
    });

    function showBotMessage(response) {
      const messageDiv = document.createElement('div');
      messageDiv.className = 'message bot';
      let formattedAnswer = response.replace(/\n/g, "<br>");
      const imgMatch = formattedAnswer.match(/Ảnh:\s*(https?:\/\/\S+)/);
      if (imgMatch) {
        const imgUrl = imgMatch[1].trim().replace(/<br>$/, '');
        console.log(imgUrl)

        formattedAnswer = formattedAnswer.replace(/<br>Ảnh:\s*https?:\/\/\S+/, "");
        console.log(formattedAnswer)

        formattedAnswer += '<br><img src="' + imgUrl + '" alt="Ảnh sản phẩm" class="product-img" >';

        console.log(formattedAnswer)
      }

      messageDiv.innerHTML = formattedAnswer;
      console.log(messageDiv)
      return messageDiv

    }

    function formatPrice(price) {
      return parseInt(price).toLocaleString('vi-VN') + 'đ';
    }
  </script>

</div>
</script>

<script src="./main.js"></script>
<script src="./assets/js/addCart.js"></script>


<script src="./assets/js/sliderBanner.js"></script>


<script src="./assets/js/modal.js"></script>
<script>
  function goToProDetail(id) {


    var url = "detailProduct?id="+id;
    window.location.href = url;


    }

</script>
<script>

  function back_to_top() {
    window.scroll(0, 0);
  }
  function closeSlider() {
    var close = document.getElementById('block_top');
    close.style.display = "none";
  }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>


</body>


</html>

