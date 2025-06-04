<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PHAMTAI
  Date: 12/14/2024
  Time: 4:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Đăng kí</title>
  <link rel="stylesheet" href="assets/css/layout/modal.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
  <link rel="stylesheet" href="assets/css/reset/reset.css">
  <link rel="stylesheet" href="assets/fonts/stylesheet.css">
  <link rel="stylesheet" href="assets/css/styles.css">
  <link rel="stylesheet" href="assets/css/layout/backToTop.css">
  <link rel="stylesheet" href="assets/css/pages/home.css">
  <link rel="stylesheet" href="assets/css/layout/header.css">
  <link rel="stylesheet" href="assets/css/pages/login.css">
  <link rel="stylesheet" href="assets/css/layout/footer.css">
  <link rel="shortcut icon" href="assets/images/favicons/favicon_logo.png" type="image/x-icon">
</head>
<style>
  <jsp:include page="SharedViews/block_error.jsp" />
</style>



<body>
<jsp:include page="SharedViews/header.jsp" />
<div class="body_home">
  <div class="form">
    <div class="block_img">
      <img src="./assets/images/logo/logo-baya.png" alt="img">
      <h1>Đăng kí</h1>
    </div>
    <div class="block_line-through">
      <hr>
    </div>
    <c:choose>


    <c:when test="${message!= null}">

      <div class="block_error" style="display: block !important;">
        <p >${message}</p>
      </div>
    </c:when>
      <c:otherwise>
        <div class="block_error" id="block_error" >
          <p id="error_text"></p>
        </div>
      </c:otherwise>
    </c:choose>

    <form class="block_main" action="/signUp" method="post" onsubmit="return checkForm()">

      <p>Họ và tên: *</p>
      <input type="text" class="bg_form-input" placeholder="Nhập họ và tên" id="fullName" name="fullName">

      <p>Số điện thoại:</p>
      <input type="text" class="bg_form-input" placeholder="Nhập số điện thoại" id="phoneNumber" name="phoneNumber">
      <p>Email: </p>
      <input type="email" class="bg_form-input" placeholder="Nhập email" id="email" name="email">
      <p>Mật khẩu:</p>
      <input type="password" class="bg_form-input" placeholder="Nhập mật khẩu" id="password" name="password">
      <p>Nhập lại mật khẩu:</p>
      <input type="password" class="bg_form-input" placeholder="Nhập lại mật khẩu" id="passwordC" name="passwordC">


      <div class="form_links" style="text-align: right">

        <p ><a href="forgetPassword.jsp">Quên mật khẩu?</a></p>

      </div>


      <button class="btn_submit-form" type="submit">Đăng kí</button>
      <div class="form_links">

        <p style="margin-bottom: 20px">Bạn đã có tài khoản? <a href="/login">Đăng nhập ngay</a></p>

      </div>
    </form>
  </div>



</div>

<script>

  function checkForm() {
    var password = document.getElementById('password').value;
    var passwordContinue = document.getElementById('passwordC').value;
    var fullName = document.getElementById('fullName').value;
    var phoneNumber = document.getElementById('phoneNumber').value;
    var email = document.getElementById('email').value;
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!fullName.trim() || !phoneNumber.trim() || !email.trim() || !password.trim() || !passwordContinue.trim()) {
      document.getElementById('block_error').style.display = 'flex'
      document.getElementById('error_text').innerHTML = 'Các trường dữ liệu không được bỏ trống'
      return false;
    }
    else if (password.length < 10) {
      document.getElementById('block_error').style.display = 'flex'
      document.getElementById('error_text').innerHTML = 'Mật khẩu phải ít nhất 10 kí tự'
      return false
    }
    else if (password.includes(' ')) {
      document.getElementById('block_error').style.display = 'flex';
      document.getElementById('error_text').innerHTML = 'Mật khẩu không được có khoảng trắng';
      return false;
    }

  else if (!emailRegex.test(email)) {
      document.getElementById('block_error').style.display = 'flex';
      document.getElementById('error_text').innerHTML = 'Email không hợp lệ';
      return false
    }
    else if (password != passwordContinue) {
      document.getElementById('block_error').style.display = 'flex'
      document.getElementById('error_text').innerHTML = 'Mật khẩu không khớp. Vui lòng nhập lại'
      return false
    }
    else{
      return true;
    }

  }
</script>

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
<script>
  function goToHome(id) {
    var url = "index.html"
    window.location.href = url;
  }

</script>

</body>

<script src="./assets/js/formCheckSignUp.js"></script>
<script src="./assets/js/modal.js"></script>

</html>
