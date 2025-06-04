<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PHAMTAI
  Date: 3/16/2025
  Time: 8:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng kí</title>
    <link rel="stylesheet" href="assets/css/reset/reset.css">

    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/layout/backToTop.css">
    <link rel="stylesheet" href="assets/css/pages/home.css">
    <link rel="stylesheet" href="assets/css/layout/header.css">
    <link rel="stylesheet" href="assets/css/layout/footer.css">
    <link rel="shortcut icon" href="assets/images/favicons/favicon_logo.png" type="image/x-icon">
    <link rel="stylesheet" href="assets/css/layout/modal.css">
    <link rel="stylesheet" href="/assets/css/pages/home.css">
    <link rel="stylesheet" href="/assets/css/styles.css">
    <link rel="stylesheet" href="/assets/css/pages/error.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
          integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <style>
        body{
            font-family: "Arial", Helvetica, sans-serif !important;
        }
        .block_container {

            display: flex;
            text-align: center;
            box-sizing: border-box;
            padding: 40px 0;

        }

        h1 {
            color: var(--main_bg);

            font-weight: 900;
            font-size: 40px;
            margin-bottom: 10px;
        }

        p {


            font-size: 20px;
            margin: 0;
        }


        .card {
            width: 500px;
            background: white;
            padding: 60px;
            border-radius: 4px;
            box-shadow: 0 2px 3px #C8D0D8;

            margin: auto;
        }


        .cart_button {
            text-decoration: none;

            color: rgb(42, 131, 233) !important;

            width: 100%;
            height: 40px;


        }

        .block_link {
            border-radius: 10px;
            display: flex;
            width: fit-content;
            height: fit-content;
            padding: 20px 0;
            margin-top: 20px;
            border: rgb(42, 131, 233) 1px solid;

        }
    </style>
</head>

<body>

<jsp:include page="SharedViews/header.jsp"/>
<div class="block_container">
    <img src="" alt="">
    <c:choose>
        <c:when test="${type==1}">

            <div class="card">
                <img src="https://img.icons8.com/ios11/512/40C057/ok.png"
                     style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">

                </img>

                <p style="color: var(  --color-default);">Chúc mừng bạn đăng kí tài khoản thành công<br/></p>


                <div class="error_omega-contact" style="margin-top: 20px; ">
                    <a href="/login.jsp" style="background-color: rgb(64 192 87) !important;">Đi đến trang đăng nhập</a>

                </div>
            </div>
        </c:when>
        <c:when test="${type==6}">

            <div class="card">
                <img src="https://img.icons8.com/ios11/512/40C057/ok.png"
                     style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">

                </img>

                <p style="color: var(  --color-default);">Bạn đã thay đổi mật khẩu thành công<br/></p>


                <div class="error_omega-contact" style="margin-top: 20px; ">
                    <a href="/home" style="background-color: rgb(64 192 87) !important;">Về lại trang chủ</a>

                </div>
            </div>
        </c:when>
      <c:when test="${type==2}">
          <div class="card">
              <img src="https://cdn-icons-png.flaticon.com/512/4201/4201973.png"
                   style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">
              </img>

              <p style="color: var(  --color-default);">Vui lòng đăng nhập bằng tài khoản khác<br/>
              </p>

              <div class="error_omega-contact" style="margin-top: 20px; ">
                  <a href="/home" style="background-color:rgb(238 64 76) !important; ;">Trở về trang chủ</a>

              </div>
          </div>
      </c:when>
        <c:when test="${type ==3}">
            <div class="card">
                <img src="https://cdn-icons-png.flaticon.com/512/4201/4201973.png"
                     style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">

                </img>

                <p style="color: var(  --color-default);">Đã hết thời gian kích hoạt tài khoản<br/>
                </p>
                <!-- <div class="block_link">


                    <a href="abc.com" class="cart_button" style="height: 100%;">Quay về trang chủ</a>
                </div> -->
                <form action="reactivate" method="get" style="height: fit-content; width: fit-content">
                    <input type="hidden" name="${email}">
                    <div type="submit" class="error_omega-contact" style="width: 100%;margin-top: 20px; ">
                        <div style="background-color: rgb(64 192 87) !important; ;">Kích hoạt lại</div>
                    </div>
                </form>
                    <div class="error_omega-contact" style="margin-top: 20px; ">
                        <a href="/home" style="background-color:rgb(238 64 76) !important; ;">Trở về trang chủ</a>

                    </div>


            </div>
        </c:when>
        <c:when test="${type ==5}">
            <div class="card">
                <img src="https://media.istockphoto.com/id/1407160246/vi/vec-to/bi%E1%BB%83u-t%C6%B0%E1%BB%A3ng-tam-gi%C3%A1c-nguy-hi%E1%BB%83m.jpg?s=612x612&w=0&k=20&c=tbTVS87KiLRU6rjklVK5zwoEx6406QrKQZTPN4sFRSk="
                     style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">

                </img>

                <p style="color: var(  --color-default);">Vui lòng kiểm tra Email để thay đổi lại mật khẩu<br/>
                </p>
                <!-- <div class="block_link">


                    <a href="abc.com" class="cart_button" style="height: 100%;">Quay về trang chủ</a>
                </div> -->
                <form action="reactivate" method="get" style="height: fit-content; width: fit-content">
                    <input type="hidden" name="${email}">

                </form>
                <div class="error_omega-contact" style="margin-top: 20px; ">
                    <a href="/home" style="background-color:rgb(251 189 4) !important; ;">Trở về trang chủ</a>

                </div>


            </div>
        </c:when>
        <c:when test="${type==4}">

            <div class="card">
                <img src="https://img.icons8.com/ios11/512/40C057/ok.png"
                     style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">

                </img>

                <p style="color: var(  --color-default);">Tài khoản của bạn đang ở trạng thái được kích hoạt<br/></p>


                <div class="error_omega-contact" style="margin-top: 20px; ">
                    <a href="/login.jsp" style="background-color: rgb(64 192 87) !important;">Đi đến trang đăng nhập</a>

                </div>
            </div>
        </c:when>
        <c:when test="${type==7}">
            <div class="card">
                <img src="https://cdn-icons-png.flaticon.com/512/4201/4201973.png"
                     style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">

                </img>

                <p style="color: var(  --color-default);">Vui lòng đăng nhập tài khoản<br/>
                </p>
                <!-- <div class="block_link">


                    <a href="abc.com" class="cart_button" style="height: 100%;">Quay về trang chủ</a>
                </div> -->

                <div class="error_omega-contact" style="margin-top: 20px; ">
                    <a href="/home" style="background-color:rgb(238 64 76) !important; ;">Trở về trang chủ</a>

                </div>
            </div>
        </c:when>
        <c:when test="${type==8}">
            <div class="card">
                <img src="https://media.istockphoto.com/id/1407160246/vi/vec-to/bi%E1%BB%83u-t%C6%B0%E1%BB%A3ng-tam-gi%C3%A1c-nguy-hi%E1%BB%83m.jpg?s=612x612&w=0&k=20&c=tbTVS87KiLRU6rjklVK5zwoEx6406QrKQZTPN4sFRSk="
                     style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">

                <p style="color: var(  --color-default);">Vui lòng giữ lại TAB đã đăng nhập tài khoản<br/>
                </p>
                <!-- <div class="block_link">


                    <a href="abc.com" class="cart_button" style="height: 100%;">Quay về trang chủ</a>
                </div> -->

                <div class="error_omega-contact" style="margin-top: 20px; ">
                    <a href="/home" style="background-color:rgb(251 189 4) !important; ;">Trở về trang chủ</a>

                </div>
            </div>
        </c:when>
        <c:when test="${type==9}">
            <div class="card">
                <img src="https://media.istockphoto.com/id/1407160246/vi/vec-to/bi%E1%BB%83u-t%C6%B0%E1%BB%A3ng-tam-gi%C3%A1c-nguy-hi%E1%BB%83m.jpg?s=612x612&w=0&k=20&c=tbTVS87KiLRU6rjklVK5zwoEx6406QrKQZTPN4sFRSk="
                     style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">

                <p style="color: var(  --color-default);">Không tìm thấy người quản trị trong hệ thống<br/>
                </p>
                <!-- <div class="block_link">


                    <a href="abc.com" class="cart_button" style="height: 100%;">Quay về trang chủ</a>
                </div> -->

                <div class="error_omega-contact" style="margin-top: 20px; ">
                    <a href="/home" style="background-color:rgb(251 189 4) !important; ;">Trở về trang chủ</a>

                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="card">
                <img src="https://cdn-icons-png.flaticon.com/512/4201/4201973.png"
                     style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">

                </img>

                <p style="color: var(  --color-default);">Vui lòng kiểm tra lại email hoặc đăng kí lại tài khoản<br/>
                </p>
                <!-- <div class="block_link">


                    <a href="abc.com" class="cart_button" style="height: 100%;">Quay về trang chủ</a>
                </div> -->

                <div class="error_omega-contact" style="margin-top: 20px; ">
                    <a href="/home" style="background-color:rgb(238 64 76) !important; ;">Trở về trang chủ</a>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>


</div>

</body>

</html>