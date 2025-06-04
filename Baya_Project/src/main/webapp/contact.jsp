<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 03/09/25
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên hệ và góp ý</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="./assets/css/reset/reset.css">
    <link rel="stylesheet" href="./assets/fonts/stylesheet.css">
    <link rel="stylesheet" href="./assets/css/pages/home.css">
    <link rel="stylesheet" href="./assets/css/styles.css">
    <link rel="stylesheet" href="./assets/css/basic.css">
    <link rel="stylesheet" href="./assets/css/pages/cart.css">
    <link rel="stylesheet" href="./assets/css/grid-layout.css">
    <link rel="stylesheet" href="./assets/css/layout/header.css">
    <link rel="stylesheet" href="./assets/css/layout/footer.css">
    <link rel="stylesheet" href="./assets/css/pages/contact.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
          integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />


    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>


</head>

<body>


<div class="body_home">
    <jsp:include page="SharedViews/header.jsp" />

    <div class="grid bg-while">
        <div class="row">

            <div class="col l-8">
                <div class="content">
                    <nav class="breadcrumb">
                        <a href="#">Trang chủ</a> › <span>Liên hệ và góp ý</span>
                    </nav>
                    <h4>Liên hệ và góp ý cho Baya</h4>
                    <div id="form">
                        <div class="form-group">
                            <div class="form-content">
                                <input type="text" class="infor_contact" id="fullname" name="fullname_contact" placeholder="Họ và tên">

                                <p id="error-fullname" class="error"></p>
                            </div>
                        </div>
                        <div class="form-group">
                           <div class="form-content">
                               <input type="number" class="infor_contact" id="phone" name="phone_contact" placeholder="Số điện thoại">

                               <p id="error-phone" class="error"></p>
                           </div>

                        </div>

                        <div class="form-group">
                            <div class="form-content">
                                <input type="email" class="infor_contact"  id="email" name="email_contact" placeholder="Email của bạn" required>

                                <p id="error-email" class="error"></p>

                            </div>
                        </div>
                        <textarea id="content" name="content_contact" placeholder="Nhập nội dung bạn muốn liên hệ hoặc góp ý với siêu thị Điện máy XANH"></textarea>
                        <p id="error-content" class="error"></p>

                        <button type="button" id="btn-send">GỬI LIÊN HỆ</button>
                    </div>
                </div>
            </div>

            <div class="sidebar col l-4">
                <div>
                    <h3>THÔNG TIN CÔNG TY</h3>
                    <ul>
                        <li><a href="#">Giới thiệu về Điện máy XANH</a></li>
                        <li><a href="#">Tin tức</a></li>
                        <li><a href="#">Chi nhánh</a></li>
                    </ul>
                </div>
                <div>
                </div>
            </div>
        </div>
    </div>

</div>


</body>


<script>



    const notyf = new Notyf();

    $("#btn-send").click(function () {
        if (!checkErrorFullname()) return;
        if (!checkErrorPhone()) return;
        if (!checkErrorEmail()) return;
        if (!checkErrorContent()) return;

        var data = {
            fullname_contact: $("#fullname").val(),
            phone_contact: $("#phone").val(),
            email_contact: $("#email").val(),
            content_contact: $("#content").val()
        };

        fetch('contact', {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: new URLSearchParams(data).toString()
        })
            .then(response => {
                return response.json();
            })
            .then(data => {
             if(data.success){
                 notyf.success('Phản hồi thành công')
             }else{
                 notyf.error('Phản hồi thất bại')
             }
            })
            .catch(error => {
                    notyf.error('Phản hồi thất bại '+error)
                }
            );
    });





    function isValidTelephone(telephone) {
        return telephone.length >= 8
    }

    function checkErrorEmail() {
        let email = $("#email").val();
        let error_email = $("#error-email");
        let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;



        if (!emailRegex.test(email) || email.length==0) {
            error_email.text("Nhập đúng định dạng email");
            return false;
        } else {
            error_email.text("");
            return true;
        }
    }


    function checkErrorPhone() {
        let phone = $("#phone");
        let phone_email = $("#error-phone")


        if (phone.val().length<8) {

            phone_email.text("Nhập số điện thoại trên 8 số");
            return false;

        } else {

            phone_email.text("");
            return true;

        }

    }


    function checkErrorFullname() {

        let phone = $("#fullname");


        let error = $("#error-fullname")


        if (phone.val().length == 0) {
            error.text("Vui lòng nhập tên đầy đủ")
            return false;
        } else {
            error.text("");
            return true;
        }

    }


    function checkErrorContent() {

        let content = $("#content");
        let error = $("#error-content")

        if (content.val() === '') {
            error.text("Vui lòng nội dung đầy đủ")
            return false;
        } else {
            error.text("");
            return true;
        }

    }




</script>
<script src="./assets/js/handlerReloadForm.js"></script>


</html>
