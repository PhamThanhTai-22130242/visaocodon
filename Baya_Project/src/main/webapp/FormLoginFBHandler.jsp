<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PHAMTAI
  Date: 1/13/2025
  Time: 7:44 AM
  To change this template use File | Settings | File Templates.
--%>
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
        <c:choose>
            <c:when test="${message != null}">
                <div class="block_error" id="block_error" style="display: block">
                    <p >${message}</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="block_error" id="block_error">
                    <p id="error_text"></p>
                </div>
            </c:otherwise>
        </c:choose>

        <form class="block_main" action="handlerFBForm" method="get" onsubmit="return checkForm()">

            <p>Email: </p>
            <input type="email" class="bg_form-input" value="${acc.getEmail() !=null?acc.getEmail(): ""}" placeholder="Nhập email" id="email" name="email">

            <p>Họ và tên: *</p>
            <input type="text" class="bg_form-input" value="${acc.getName() !=null?acc.getName(): ""}" placeholder="Nhập họ và tên" id="fullName" name="fullName">

            <p>Số điện thoại:</p>
            <input type="text" autocomplete="off" name="phoneNumber" class="bg_form-input" placeholder="Nhập số điện thoại"
                   id="phoneNumber">

            <p>Mật khẩu:</p>
            <input type="password" autocomplete="off" class="bg_form-input" placeholder="Nhập mật khẩu" name="password"
                   id="password">
            <p>Nhập lại mật khẩu:</p>
            <input type="password" autocomplete="off" class="bg_form-input" placeholder="Nhập lại mật khẩu"
                   id="passwordC">


            <c:choose>
                <c:when test="${message != null}">
                    <a href="forgetPassword.html" class="forget-password">
                        <p style="color: var(--main_bg);">Quên mật khẩu?</p>
                    </a>
                </c:when>
                <c:otherwise>

                </c:otherwise>
            </c:choose>



            <button class="btn_submit-form" >Đăng kí</button>

        </form>
    </div>



</div>
<script>

    function checkForm() {
        console.log("da chay vao function");
        var password = document.getElementById('password').value;
        var passwordContinue = document.getElementById('passwordC').value;
        var fullName = document.getElementById('fullName').value;
        var phoneNumber = document.getElementById('phoneNumber').value;
        var email = document.getElementById('email').value;

        if (!fullName.trim() || !phoneNumber.trim() || !email.trim() || !password.trim() || !passwordContinue.trim()) {
            document.getElementById('block_error').style.display = 'flex'
            document.getElementById('error_text').innerHTML = 'Các trường dữ liệu không được bỏ trống'
            return false;
        }
        if (password.length < 10) {
            document.getElementById('block_error').style.display = 'flex'
            document.getElementById('error_text').innerHTML = 'Mật khẩu phải ít nhất 10 kí tự'
            return false
        }
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            document.getElementById('block_error').style.display = 'flex';
            document.getElementById('error_text').innerHTML = 'Email không hợp lệ';
            return false
        }
        if (password != passwordContinue) {
            document.getElementById('block_error').style.display = 'flex'
            document.getElementById('error_text').innerHTML = 'Mật khẩu không khớp. Vui lòng nhập lại'
            return false
        }
        else {

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
