<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 05/08/25
  Time: 11:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <link href="./assets/css/pages/return_request.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Yêu cầu hoàn trả đơn hàng</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>

<style>
    .disabled-btn {
        opacity: 0.6;
        cursor: not-allowed;
        pointer-events: none;
    }

    body {
        font-family:  sans-serif;
        background: #f7f7f7;
    }

    .container {
        max-width: 800px;
        margin: 40px auto;
        padding: 30px;
        background: #fff;
        border-radius: 12px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    h2 {
        color: #333;
        margin-bottom: 20px;
    }

    label {
        display: block;
        margin: 20px 0 5px;
        font-weight: bold;
    }

    textarea, input[type="file"] {
        width: 100%;
        padding: 20px;

        border-radius: 8px;
        border: 1px solid #ccc;
        margin-bottom: 20px;
    }

    .submit-btn {
        background: #28a745;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-weight: bold;
    }

    .submit-btn:hover {
        background: #218838;
    }

    .admin-feedback {
        background: #f1f1f1;
        padding: 15px;
        border-radius: 8px;
        margin-top: 20px;
        border-left: 5px solid #17a2b8;
    }

    .image-preview {
        max-width: 300px;
        margin-top: 10px;
    }

</style>
</head>
<body>
<div class="container">
    <h2>Yêu cầu hoàn trả cho đơn hàng</h2>

    <div >
        <input type="hidden" name="orderID" id="orderID" value="${requestScope.orderID}"/>

        <label for="reason">Lý do hoàn trả:</label>
        <textarea name="reason" id="reason" rows="7" required placeholder="Nhập lý do bạn muốn trả hàng...">${requestScope.returnRequest.reason}</textarea>

        <label for="image">Hình ảnh sản phẩm (bắt buộc):</label>
        <input type="file" name="image" id="image" accept="image/*" required />

        <c:if test="${not empty requestScope.returnRequest.imagePath}">
            <img src="${requestScope.returnRequest.imagePath}" class="image-preview" alt="Ảnh đã gửi"/>
        </c:if>

        <button type="button"
                class="submit-btn ${not empty requestScope.returnRequest ? 'disabled-btn' : ''}"
                id="btn_send"
                <c:if test="${not empty requestScope.returnRequest}">disabled</c:if>>Gửi yêu cầu hoàn trả
        </button>
    </div>


</div>

<script>
    const notyf =new Notyf()
   $('#btn_send').on('click',function () {
       const orderID = $('#orderID').val();
       const reason = $('#reason').val();
       const imageFile = $('#image')[0].files[0];

       if (!reason) {
           notyf.error("Vui lòng nhập lý do hoàn trả.");
           return;
       }

       if (!imageFile) {
           notyf.error("Vui lòng cung cấp hình ảnh sản phẩm.");
           return;
       }


       const formData = new FormData();
       formData.append("image", imageFile);
       formData.append("reason",reason);
       formData.append("orderID", orderID);

       fetch("return_request_order", {
           method: "POST",
           body: formData
       })
           .then(res => res.text())
           .then(data =>{
                   notyf.success(data.message)
                    $('#btn_send').addClass('disabled-btn');
           });
   })
</script>
</body>
</html>

