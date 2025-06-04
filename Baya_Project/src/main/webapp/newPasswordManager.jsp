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
    <title>Thêm Mật khẩu</title>
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.6/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.6/dist/sweetalert2.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            <h1>Thêm mật khẩu</h1>
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
        <div class="block_main"
              autocomplete="off">
            <p>Nhập mật khẩu: </p>
            <input type="password" class="bg_form-input" placeholder="Nhập mật khẩu" id="password" name="password">
            <p>Nhập lại mật khẩu: </p>
            <input type="password" class="bg_form-input" placeholder="Nhập lại mật khẩu" id="passwordC"
                   name="passwordC">
            <input type="hidden" value="${email}" id="email">
            <button class="btn_submit-form">Hoàn tất</button>

        </div>


    </div>


</div>


</body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
        }
        else if (password.includes(' ')) {
            document.getElementById('block_error').style.display = 'flex'
            document.getElementById('error_text').innerHTML = 'Mật khẩu không được chứa phím cách'

            return false
        }else if (password != passwordContinue) {
            console.log("da chay vao mat khau ko trung nhau")
            document.getElementById('block_error').style.display = 'flex'
            document.getElementById('error_text').innerHTML = 'Mật khẩu không khớp. Vui lòng nhập lại'

            return false
        } else {
            console.log("da chay vao truong hop dung")
            console.log('pass:', password)
            return true;
        }

    }
    function openLoading() {
        Swal.fire({
            allowEscapeKey: false,
            allowOutsideClick: false,
            didOpen: () => {
                Swal.showLoading();
            },

        })
    }

    function closeLoading() {
        Swal.close();
    }
    function swal_error(message) {
        Swal.fire({
            title: "Lỗi!",
            text: message,
            icon: "error",
            confirmButtonText: "Thử lại"
        });
    }
    function swal_success(message) {
        Swal.fire({
            title: "Thành công",
            text: message,
            icon: "success",
            draggable: true,
            confirmButtonText: "Đến trang đăng nhập",
            allowOutsideClick: false,   // Không cho click ra ngoài để đóng
            // allowEscapeKey: false,      // Không cho nhấn ESC để đóng

        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = "/login.jsp";
            }
        });;
    }

    $(document).ready(function () {
        $(".btn_submit-form").click(function () {
            console.log("chay vao btn submit form")
            const check = checkForm()
            console.log(check)
            if( $("#email").val().length ==0){
                console.log("trim =0")
                swal_error("Đã có lỗi xảy ra. Vào Email để kích hoạt tài khoản")
                return
            }
            else
            if(check) {
                var result = {
                    "email": $("#email").val(),
                    "password": $("#password").val()
                }
                console.log(result)
                openLoading()
                $.ajax({
                    url: "/confirmPasswordManager",
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify(result),
                    dataType: "json",
                    success: function (response) {
                        if (response.success) {
                            closeLoading()
                            swal_success("Đã cập nhập thành công");
                        }

                    },
                    error: function (xhr) {
                        closeLoading()
                        var res = JSON.parse(xhr.responseText);
                        Swal.fire({
                            title: "Lỗi!",
                            text: res.message || "Có lỗi xảy ra!",
                            icon: "error",
                            confirmButtonText: "Thử lại"
                        });
                    }
                });
            }
        });
    });

</script>


</html>
