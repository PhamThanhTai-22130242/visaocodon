<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/18/24
  Time: 11:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Thông tin đơn hàng</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="./assets/css/pages/inforOrder.css">
  <link rel="stylesheet" href="./assets/css/styles.css">
</head>
<body>
<div class="container my-5">


  <div class="back-home">
    <a href="infor-order" class="btn btn-light">
      <i class="bi bi-house-door"></i> Quay về trang chính
    </a>
  </div>
  <h1 class="header-title text-center mb-4">Thông tin đơn hàng</h1>



  <div class="mb-4">
    <h4>Thông tin khách hàng</h4>
    <ul class="list-group">
      <li class="list-group-item"><strong>Họ tên:</strong> ${sessionScope.name}</li>
      <li class="list-group-item"><strong>Email:</strong> ${sessionScope.email}</li>
      <li class="list-group-item"><strong>Số điện thoại:</strong> ${sessionScope.phone}</li>
      <li class="list-group-item"><strong>Địa chỉ giao hàng:</strong> ${sessionScope.address}</li>
      <li class="list-group-item"><strong>Ngày tạo đơn:</strong> ${sessionScope.date}
      </li>

      <li class="list-group-item"><strong>Ghi chú:</strong> ${sessionScope.note}
      </li>
    </ul>
  </div>

  <div class="mb-4">
    <h4>Chi tiết sản phẩm</h4>
    <table class="table table-bordered table-hover">
      <thead class="table-light">
      <tr>
        <th>Sản phẩm</th>
        <th>Số lượng</th>
        <th>Tổng giá</th>
      </tr>
      </thead>
      <tbody>
     <c:forEach var="i" items="${sessionScope.cart.itemCartIsChooseIncart()}">
       <tr>
         <td>${i.name}</td>
         <td>${i.quantity}</td>
         <td>
           <f:formatNumber value="${i.getPriceAfterDiscount()}"
                             type="number" groupingUsed="true"
                             maxFractionDigits="0">

           </f:formatNumber> đ
         </td>
       </tr>
     </c:forEach>
      </tbody>
      <tfoot>

      <tr>
        <th colspan="2" class="text-end">Phí vận chuyển :</th>
        <th><f:formatNumber value="${sessionScope.cart.getFee() }"
                            type="number" groupingUsed="true"
                            maxFractionDigits="0"/> đ</th>
      </tr>

      <tr>
        <th colspan="2" class="text-end"> Giảm giá :</th>
        <th><f:formatNumber value="${sessionScope.cart.getDiscount() }"
                            type="number" groupingUsed="true"
                            maxFractionDigits="0"/> đ</th>
      </tr>
      <tr>
        <th colspan="2" class="text-end">Tổng giá trị đơn hàng:</th>
        <th><f:formatNumber value="${sessionScope.cart.totalPriceCart()}"
                            type="number" groupingUsed="true"
                            maxFractionDigits="0"/> đ</th>
      </tr>


      </tfoot>
    </table>
  </div>

  <div class="mb-4">
    <h4>Trạng thái đơn hàng</h4>
    <ul class="list-group">
      <li class="list-group-item"><strong>Phương thức thanh toán : </strong> ${sessionScope.method}</li>
      <li class="list-group-item"><strong>Trạng thái đơn hàng : </strong> <span class="status">Chờ xác nhận</span></li>
    </ul>
  </div>

  <div class="footer">
    <p>Cảm ơn bạn đã mua hàng tại cửa hàng chúng tôi! </p>
  </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
