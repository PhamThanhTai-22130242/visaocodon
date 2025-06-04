<%--
  Created by IntelliJ IDEA.
  User: PHAMTAI
  Date: 1/13/2025
  Time: 1:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Đăng kí</title>
  <link rel="stylesheet" href="./assets/css/layout/modal.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
  <link rel="stylesheet" href="./assets/css/reset/reset.css">
  <link rel="stylesheet" href="./assets/fonts/stylesheet.css">
  <link rel="stylesheet" href="./assets/css/styles.css">
  <link rel="stylesheet" href="./assets/css/layout/backToTop.css">
  <link rel="stylesheet" href="./assets/css/pages/home.css">
  <link rel="stylesheet" href="./assets/css/layout/header.css">
  <link rel="stylesheet" href="./assets/css/pages/login.css">
  <link rel="stylesheet" href="./assets/css/layout/footer.css">
  <link rel="shortcut icon" href="./assets/images/favicons/favicon_logo.png" type="image/x-icon">
</head>
<style>

  <jsp:include page="SharedViews/block_error.jsp" />

</style>

<body>

<div class="body_home">
  <div class="form">
    <div class="block_img">
      <img src="./assets/images/logo/logo-baya.png" alt="img">
      <h1>Vui lòng nhập các thông tin</h1>
    </div>
    <!-- <div class="block_login">
        <div class="login-gg">
            <img class="" src="./assets/images/logo/google-logo.png" alt="logo-google">
            <p>Google</p>
        </div>
        <div class="login-fb">
            <img class="" src="./assets/images/logo/facebook-logo.webp" alt="logo-google">
            <p>Facebook</p>
        </div>
    </div> -->
    <div class="block_line-through">

      <!-- <p>hoặc</p> -->
      <hr>
    </div>
    <div class="block_error" id="block_error">
      <p id="error_text"></p>
    </div>
    <form class="block_main" action="handlerGGForm" method="post" onsubmit="return checkForm()">
      <input type="hidden" name="acc" value="${acc}">
      <p>Họ và tên: *</p>
      <input type="text" class="bg_form-input" placeholder="Nhập họ và tên" id="fullName" name="fullName">

      <p>Số điện thoại:</p>
      <input type="text" autocomplete="off" name="phoneNumber" class="bg_form-input" placeholder="Nhập số điện thoại"
             id="phoneNumber">

      <p>Mật khẩu:</p>
      <input type="password" autocomplete="off" class="bg_form-input" placeholder="Nhập mật khẩu" name="password"
             id="password">
      <p>Nhập lại mật khẩu:</p>
      <input type="password" autocomplete="off" class="bg_form-input" placeholder="Nhập lại mật khẩu"
             id="passwordC">





      <button class="btn_submit-form" >Đăng kí</button>

    </form>
  </div>



</div>
<script>

  function checkForm() {
    console.log("da chay vao function");
    var fullName = document.getElementById('fullName').value;
    var password = document.getElementById('password').value;
    var passwordContinue = document.getElementById('passwordC').value;

    var phoneNumber = document.getElementById('phoneNumber').value;


    if ( !fullName.trim() || !phoneNumber.trim() || !password.trim() || !passwordContinue.trim()) {
      document.getElementById('block_error').style.display = 'flex'
      document.getElementById('error_text').innerHTML = 'Các trường dữ liệu không được bỏ trống'
      return false;
    }
    if (password.length < 10) {
      document.getElementById('block_error').style.display = 'flex'
      document.getElementById('error_text').innerHTML = 'Mật khẩu phải ít nhất 10 kí tự'
      return false
    }

    if (password != passwordContinue) {
      document.getElementById('block_error').style.display = 'flex'
      document.getElementById('error_text').innerHTML = 'Mật khẩu không khớp. Vui lòng nhập lại'
      return false
    }
    else {
      console.log('thanh cong')
      return true;
    }


  }
</script>


<script>
  function goToHome(id) {
    var url = "index.html"
    window.location.href = url;
  }

</script>

</body>
<script src="./assets/js/modal.js"></script>

</html>
