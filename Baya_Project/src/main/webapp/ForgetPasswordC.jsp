<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PHAMTAI
  Date: 1/13/2025
  Time: 12:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên mật khẩu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="./assets/css/reset/reset.css">
    <link rel="stylesheet" href="./assets/fonts/stylesheet.css">
    <link rel="stylesheet" href="./assets/css/styles.css">
    <link rel="stylesheet" href="./assets/css/layout/backToTop.css">
    <link rel="stylesheet" href="./assets/css/pages/home.css">
    <link rel="stylesheet" href="./assets/css/layout/header.css">
    <link rel="stylesheet" href="./assets/css/pages/login.css">
    <link rel="stylesheet" href="./assets/css/layout/footer.css">
    <link rel="stylesheet" href="./assets/css/layout/modal.css">
    <link rel="stylesheet" href="./assets/css/pages/fogetPassword.css">
    <link rel="shortcut icon" href="./assets/images/favicons/favicon_logo.png" type="image/x-icon">
</head>
<style>

    <jsp:include page="SharedViews/block_error.jsp" />

</style>

<body>

<jsp:include page="SharedViews/header.jsp"/>

<div class="body_home">
    <div class="form">
        <div class="block_img">
            <img src="./assets/images/logo/logo-baya.png" alt="img">
            <h1>Quên mật khẩu</h1>
            <br>

        </div>
        <c:choose>
            <c:when test="${message!= null}">
                <div class="block_error" id="block_error" style="display: block">
                    <p>${message}</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="block_error" id="block_error">
                    <p id="error_text"></p>
                </div>
            </c:otherwise>
        </c:choose>

        <form class="block_main" action="/confirmPassword" method="get" onsubmit="return checkForm()"
              autocomplete="off">
            <p>Nhập mật khẩu mới: </p>
            <input type="password" class="bg_form-input" placeholder="Nhập mật khẩu" id="password" name="password">
            <p>Nhập lại mật khẩu mới: </p>
            <input type="password" class="bg_form-input" placeholder="Nhập lại mật khẩu" id="passwordC"
                   name="passwordC">

            <button class="btn_submit-form">Hoàn tất</button>

        </form>


    </div>


</div>


</body>

<script>

    function checkForm() {
        console.log("da chay vao function")
        var password = document.getElementById('password').value;
        var passwordContinue = document.getElementById('passwordC').value;
        if (!password.trim() || !passwordContinue.trim()) {
            document.getElementById('block_error').style.display = 'flex'
            document.getElementById('error_text').innerHTML = 'Các trường dữ liệu không được bỏ trống'
            return false;
        } else if (password.length < 10) {
            document.getElementById('block_error').style.display = 'flex'
            document.getElementById('error_text').innerHTML = 'Mật khẩu phải ít nhất 10 kí tự'
            return false
        } else if (password != passwordContinue) {
            console.log("da chay vao mat khau ko trung nhau")
            document.getElementById('block_error').style.display = 'flex'
            document.getElementById('error_text').innerHTML = 'Mật khẩu không khớp. Vui lòng nhập lại'
            return false
        } else {
            console.log("da chay vao truong hop dung")
            return true;
        }

    }


</script>


</html>
