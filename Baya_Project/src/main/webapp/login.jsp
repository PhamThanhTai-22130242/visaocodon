<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PHAMTAI
  Date: 12/11/2024
  Time: 10:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="./assets/css/reset/reset.css">
    <link rel="stylesheet" href="./assets/fonts/stylesheet.css">
    <link rel="stylesheet" href="./assets/css/styles.css">
    <link rel="stylesheet" href="./assets/css/layout/backToTop.css">
    <link rel="stylesheet" href="./assets/css/pages/home.css">
    <link rel="stylesheet" href="./assets/css/layout/header.css">
    <link rel="stylesheet" href="./assets/css/layout/modal.css">
    <link rel="stylesheet" href="./assets/css/pages/login.css">
    <link rel="stylesheet" href="./assets/css/layout/footer.css">
    <link rel="shortcut icon" href="./assets/images/favicons/favicon_logo.png" type="image/x-icon">

    <style>

        <jsp:include page="SharedViews/block_error.jsp" />

    </style>
</head>

<body>


<jsp:include page="SharedViews/header.jsp"/>
<div class="body_home">
    <div class="form">
        <div class="block_img">
            <img src="./assets/images/logo/logo-baya.png" alt="img">
            <h1>Đăng nhập</h1>
        </div>

        <div class="block_login">
            <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid

&redirect_uri=http://localhost:8080/loginGoogleHandler

&response_type=code

&client_id=819070432768-gc11ucpgo2vd5lm4oe0loap8tsg4qlrq.apps.googleusercontent.com

&approval_prompt=force" class="login-gg">
                <img class="" src="./assets/images/logo/google-logo.png" alt="logo-google">
                <p>Google</p>
            </a>
            <a href="https://www.facebook.com/v20.0/dialog/oauth?
client_id=1107088940891688

&redirect_uri=http://localhost:8080/loginFacebookHandler" class="login-fb">
                <img class="" src="./assets/images/logo/facebook-logo.webp" alt="logo-google">
                <p>Facebook</p>
            </a>
        </div>
        <div class="block_line-through">

            <hr>
        </div>
        <form class="block_main" action="/login" method="post" onsubmit="return checkForm()">
            <c:choose>
                <c:when test="${message!=null}">
                    <c:choose>
                        <c:when test="${message eq 'Đăng kí thành công'}">
                            <div class="block_error" id="block_error"
                                 style="display: block; background-color: rgb(66, 186, 150) !important;">
                                <p style="color: #fff">${message}</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="block_error" id="block_error" style="display: block">
                                <p>${message}</p>
                            </div>
                        </c:otherwise>
                    </c:choose>

                </c:when>

                <c:otherwise>
                    <div class="block_error" id="block_error">
                        <p id="error_text" style="color: #dd2f2c"></p>
                    </div>
                </c:otherwise>
            </c:choose>


            <p>Email: </p>
            <input type="email" class="bg_form-input" placeholder="Nhập email" name="email" id="email">
            <p>Mật khẩu: </p>

            <input type="password" class="bg_form-input" placeholder="Nhập mật khẩu" name="password" id="password">
            <a href="/forgetPassword.jsp" class="forget-password">
                <p>Quên mật khẩu?</p>
            </a>
            <div class="g-recaptcha" data-sitekey="6Lcg_gorAAAAALw4HqIHqcriQY0NuEMNla5jU6pv"
                 data-callback="onCaptcha"></div>
            <button class="btn_submit-form">Đăng nhập</button>
            <div class="form_links">
                <p>Bạn chưa có tài khoản? <a href="signUp.jsp">Đăng ký ngay</a></p>

            </div>
        </form>
    </div>


</div>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script>
    let isCaptchaVerified = false;
    async function onCaptcha(token) {
        await fetch('/handlerCaptcha?respone=' + token)
            .then(function (response) {
                return response.json();
            })
            .then(function (data) {
                console.log(data)
                return isCaptchaVerified = data["result"].toString()
                console.log(result)
            })
            .catch(function (error) {
                console.error('Lỗi:', error);
                alert('Đã xảy ra lỗi, vui lòng thử lại.');
            });

        return result;
    }
</script>
<script>
    function checkForm() {
        var password = document.getElementById('password').value;
        var email = document.getElementById('email').value;

        if (!email.trim() || !password.trim()) {
            document.getElementById('block_error').style.display = 'flex'
            document.getElementById('error_text').innerHTML = 'Các trường dữ liệu không được bỏ trống'
            return false;
        }
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            document.getElementById('block_error').style.display = 'flex';
            document.getElementById('error_text').innerHTML = 'Email không hợp lệ';
            return false
        }
        // if (isCaptchaVerified == false) {
        //     document.getElementById('block_error').style.display = 'flex';
        //     document.getElementById('error_text').innerHTML = 'Captcha chưa thành công';
        //     return false
        // }
        else {

            return true;
        }

    }
</script>

</body>
<script src="./assets/js/modal.js"></script>

</html>