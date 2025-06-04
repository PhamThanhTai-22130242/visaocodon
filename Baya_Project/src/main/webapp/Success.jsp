<%--
  Created by IntelliJ IDEA.
  User: PHAMTAI
  Date: 1/13/2025
  Time: 2:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> Thành công</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/reset/reset.css">
    <link rel="stylesheet" href="assets/fonts/stylesheet.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/layout/backToTop.css">
    <link rel="stylesheet" href="assets/css/pages/home.css">
    <link rel="stylesheet" href="assets/css/layout/header.css">
    <link rel="stylesheet" href="assets/css/layout/footer.css">
    <link rel="shortcut icon" href="assets/images/favicons/favicon_logo.png" type="image/x-icon">
    <link rel="stylesheet" href="assets/css/layout/modal.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
          integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- FontAwesome -->

    <style>
        .congratulation-wrapper {

            max-width: 550px;
            margin-inline: auto;
            -webkit-box-shadow: 0 0 20px #f3f3f3;
            box-shadow: 0 0 20px #f3f3f3;
            padding: 30px 20px;
            background-color: #fff;
            border-radius: 10px;
        }

        .congratulation-contents.center-text .congratulation-contents-icon {
            margin-inline: auto;
        }

        .congratulation-contents-icon {

            overflow: hidden;
            border-radius: 50% !important;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
            height: 100px;
            width: 100px;
            background-color: #65c18c;
            color: #fff;
            font-size: 50px;

            margin-bottom: 30px;
        }

        .congratulation-contents-title {
            text-align: center;
            font-size: 32px;
            line-height: 36px;
            margin: -6px 0 0;
        }

        .congratulation-contents-para {
            text-align: center;
            font-size: 16px;
            line-height: 24px;
            margin-top: 15px;
        }

        .btn-wrapper {
            margin: auto;
            display: block;
        }

        .cmn-btn.btn-bg-1 {
            text-align: center;
            background: #6176f6;
            color: #fff;
            border: 2px solid transparent;
            border-radius: 3px;
            text-decoration: none;
            padding: 5px;
        }
    </style>
</head>

<body>
<jsp:include page="SharedViews/header.jsp" />
<!-- Congratulations area start -->
<div class="congratulation-area text-center mt-5">
    <div class="container">
        <div class="congratulation-wrapper">
            <div class="congratulation-contents center-text">
                <div class="congratulation-contents-icon">
                    <img style="width: 100%; height: 100%;"
                         src="https://e7.pngegg.com/pngimages/966/803/png-clipart-check-mark-tick-green-tick-mark-angle-leaf-thumbnail.png"
                         alt="">
                </div>
                <h4 class="congratulation-contents-title"> Chúc mừng! </h4>
                <p class="congratulation-contents-para"> Bạn đã thay đổi mật khẩu thành công
                </p>
                <div class="btn-wrapper mt-4">
                    <a href="/" class="cmn-btn btn-bg-1"> Đi về trang chủ </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Congratulations area end -->

<!-- Latest compiled JavaScript -->

</body>

</html>
