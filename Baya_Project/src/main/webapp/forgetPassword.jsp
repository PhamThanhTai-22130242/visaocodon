<%--
  Created by IntelliJ IDEA.
  User: PHAMTAI
  Date: 1/11/2025
  Time: 4:59 PM
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
    <link rel="stylesheet" href="./assets/css/layout/modal.css">
    <link rel="stylesheet" href="./assets/css/pages/login.css">
    <link rel="stylesheet" href="./assets/css/layout/footer.css">
    <link rel="stylesheet" href="./assets/css/pages/forgetPassword.css">
    <link rel="shortcut icon" href="./assets/images/favicons/favicon_logo.png" type="image/x-icon">
</head>
<style>

    <jsp:include page="SharedViews/block_error.jsp" />

</style>

<body>


<jsp:include page="SharedViews/header.jsp"/>

<div class="body_home">
    <div onclick="checkEmailExist(1)">Check email</div>
    <div class="form">
        <div class="block_img">
            <img src="./assets/images/logo/logo-baya.png" alt="img">
            <h1>Quên mật khẩu</h1>
            <br>
        </div>
        <div class="restore_text">
            <p>Hãy nhập email của bạn để bắt đầu quá trình khôi phục mật khẩu</p>
        </div>
        <div class="block_error" id="block_error">
            <p id="error_text"></p>
        </div>

        <form class="block_main" method="post" action="/forgetPassword" onsubmit="return checkForm(event)" id="form_input">
            <%--        <form class="block_main" onclick="checkForm()">--%>
            <p>SĐT/Email: </p>
            <input type="email" class="bg_form-input" placeholder="Nhập Email" name="email" id="email">
            <button class="btn_submit-form" type="submit">Tiếp tục</button>
        </form>
    </div>


</div>


<script>
    async function checkForm(event) {
        event.preventDefault();
        console.log('chay vao function checkform')
        var email = document.getElementById('email').value;

        let emailExists = await checkEmailExist(email);
        console.log("Kết quả kiểm tra email:", emailExists);

        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!email.trim()) {
            document.getElementById('block_error').style.display = 'flex'
            document.getElementById('error_text').innerHTML = 'Vui lòng nhập email'
            return false;
        } else if (!emailRegex.test(email)) {
            document.getElementById('block_error').style.display = 'flex';
            document.getElementById('error_text').innerHTML = 'Email không hợp lệ';
            return false
        } else if (emailExists=="false") {
            console.log("chay vao if check email nay")
            console.log(checkEmailExist(email))
            document.getElementById('block_error').style.display = 'flex';
            document.getElementById('error_text').innerHTML = 'Không tìm thấy Email';
            return false
        }
        console.log("Form hợp lệ, tiến hành submit...");
        document.getElementById("form_input").submit();

    }

    function check_2() {
        console.log("chay vao function check 2")
        return false
    }
</script>
<script>
    async function checkEmailExist(email) {
        console.log("da chay vao function checkEmail")
        let result;
        await fetch('/checkEmailExist?email='+email)
            .then(function (response) {
                return response.json();
            })
            .then(function (data) {
                console.log(data)
                result = data["result"].toString()
                console.log(result)
            })
            .catch(function (error) {
                console.error('Lỗi:', error);
                alert('Đã xảy ra lỗi, vui lòng thử lại.');
            });

        return result;

    }

</script>

<script src="./assets/js/modal.js"></script>


</body>

</html>
