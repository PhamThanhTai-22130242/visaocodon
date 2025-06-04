<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 01/02/25
  Time: 3:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Đơn Hàng</title>
    <link rel="stylesheet" href="./assets/css/pages/inforOrderDetail.css">

    <link rel="stylesheet" href="./assets/fonts/stylesheet.css">
    <link rel="stylesheet" href="./assets/css/styles.css">
<style>
    .btn-request{
        padding: 0.6rem;
        border: var(--color-default) solid 1px;
        background-color: #fff;
        border-radius: 5px;
        color:black
    }

    .btn-cancel:hover {
        background-color: #6a6463;
        color: white;

    }
</style>

</head>


<div class="order-details">
    <div class="order-header"><h2>ĐƠN HÀNG #${requestScope.order.orderId}</h2>
        <span>${requestScope.order.getFormattedDate()}</span></div>
    <div class="customer-info"><h4>Thông tin khách hàng</h4>
        <p>Họ tên:${requestScope.order.fullname}</p>
        <p>Email: ${requestScope.order.email}</p>
        <p>Số điện thoại: ${requestScope.order.phoneNumber}</p>
        <p>Địa chỉ giao hàng: ${requestScope.order.address}</p>
        <p>Ghi chú: ${requestScope.order.note}</p></div>
    <p>Ngày giao: ${not empty requestScope.order.deliveredDate ? requestScope.order.getFormattedDateDeliver() : ''}</p>
<div class="order-status">
        <div class="status-bar">
            <div class="status-step">
                <div class="status-circle  ${requestScope.order.orderStatusID == 1 ? 'status-active' : ''}"
                     onclick="load('${requestScope.order.orderStatusID}')"></div>
                <span>Đang xử lý</span></div>
            <div class="status-step ">
                <div class="status-circle ${requestScope.order.orderStatusID == 2 ? 'status-active' : ''}"></div>
                <span>Đang vận chuyển</span></div>
            <div class="status-step ">
                <div class="status-circle ${requestScope.order.orderStatusID == 3 ? 'status-active' : ''}"></div>
                <span>Đã giao</span></div>
            <div class="status-step ">
                <div class="status-circle ${requestScope.order.orderStatusID == 4 ? 'status-active' : ''}"></div>
                <span>Đã hủy</span></div>
            <div class="status-step ">
                <div class="status-circle ${requestScope.order.orderStatusID == 5 ? 'status-active' : ''}"></div>
                <span>Hoàn tr</span></div>
        </div>
    </div>
    <c:forEach var="oi" items="${requestScope.order.items}">
        <div class="product-item">
            <img src="${oi.thumbnail}" alt="Product Image">
            <span
                    class="des-name">${oi.name}
            </span>
            <span class="price">
                  <f:formatNumber value="${oi.getPriceAfterDiscount()}"
                                  type="number" groupingUsed="true"
                                  maxFractionDigits="0"/> đ
               </span>
            <p class="quality">${oi.quantity}</p>
        </div>
    </c:forEach>
    <div class="order-summary">
        <div class="summary-item"><h4>Tổng hợp</h4>
            <p>Tổng phụ thu: <span>
                                  <f:formatNumber value="${requestScope.order.totalPrice}"
                                                  type="number" groupingUsed="true"
                                                  maxFractionDigits="0"/>
                đ</span></p>
            <p>Phí vận chuyển: <span>  <f:formatNumber value="${requestScope.order.fee}"
                                                       type="number" groupingUsed="true"
                                                       maxFractionDigits="0"/> đ</span></p>
            <p>Giảm giá: <span>  <f:formatNumber value="${requestScope.order.discount}"
                                                 type="number" groupingUsed="true"
                                                 maxFractionDigits="0"/> đ</span></p>
            <p>Tổng: <span>  <f:formatNumber value="${requestScope.order.totalPriceAfterFeeAndDiscount()}"
                                             type="number" groupingUsed="true"
                                             maxFractionDigits="0"/> đ</span></p>

            <c:if test="${requestScope.order.paymentID==1}">
            <p>Thanh toán bằng tiền mặt khi giao hàng</p></div>
        </c:if>


        <c:if test="${requestScope.order.paymentID==2}">
        <p>Đã thanh toán online khi đặt hàng</p></div>
    </c:if>
</div>

<c:if test="${not empty requestScope.returnRequest}">
    <div class="admin-feedback">
        <h4>Phản hồi từ quản trị viên</h4>
        <p>Ngày yêu cầu trả hàng: ${requestScope.returnRequest.getFormattedDateRequest()} </p>
        <p>Trạng thái: ${requestScope.returnRequest.status}</p>
        <p>Ghi chú: ${requestScope.returnRequest.adminNote}</p>
        <p>Ngày phản hồi: ${requestScope.returnRequest.getFormattedDateResponse()} </p>
    </div>
</c:if>
<div class="order-footer">
    <c:if test="${requestScope.order.before3Day() && requestScope.returnRequest==null }">
            <a href=return_request_order?orderID=${requestScope.order.orderId} class="btn-cancel btn-request" style="margin-right:1rem" >Yêu cầu hoàn trả</a>
    </c:if>
    <button class="btn-cancel" onclick="history.back()">Quay lại</button>
</div>


</div>

<script>
    function load(id) {
        alert(id)
    }
</script>
<body>


</body>
</html>
