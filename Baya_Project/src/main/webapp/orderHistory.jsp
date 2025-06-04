<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/24/24
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Giao diện Đơn hàng</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

  <link rel="stylesheet" href="./assets/css/layout/basic.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

  <link rel="stylesheet" href="./assets/css/reset/reset.css">
  <link rel="stylesheet" href="./assets/fonts/stylesheet.css">
  <link rel="stylesheet" href="./assets/css/styles.css">
  <link rel="stylesheet" href="./assets/css/pages/order-history.css">
  <link rel="stylesheet" href="./assets/css/layout/header.css">
  <link rel="stylesheet" href="./assets/css/pages/home.css">
  <link rel="stylesheet" href="./assets/css/layout/footer.css">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

</head>

<body>
<div class="body_home">
  <jsp:include page="./SharedViews/header.jsp"></jsp:include>
  <div class="grid  bg-while">
    <div class="row">
      <div class="col-md-3 menu-left">
        <div class="avatar">

          <p class="font-weight-bold mt-2">${sessionScope.user.fullName}</p>

        </div>
        <hr>
        <nav>

          <a href="profile" class=""><i class="fa-regular fa-user-astronaut icon"></i>
            Tài Khoản Của Tôi</a>
          <a href="#" class="bold active"><i class="fa-solid fa-list icon"></i>
            Đơn Mua</a>
          <a href="#" class="">
            <i class="fa-solid fa-bell icon"></i>
            Thông Báo</a>
        </nav>

      </div>

      <div class="col-md-9">
        <div class="order-content">
          <ul class="mb-3">
            <li class="nav-item">
              <a class="nav-link active" onclick="filterStatusOrder('all')">Tất cả </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" onclick="filterStatusOrder('Đang xử lí')">Đang xử lí</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" onclick="filterStatusOrder('Đang vận chuyển')">Đang vận chuyển</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" onclick="filterStatusOrder('Hoàn thành')" >Hoàn thành</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" onclick="filterStatusOrder('Đã hủy')">Đã hủy</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" onclick="filterStatusOrder('Hoàn trả')">Hoàn trả</a>
            </li>


          </ul>

          <div class="filter" style="margin-right: 0.3rem;margin-bottom: 1rem">

            <label for="filterDate">Lọc đơn hàng theo:</label>
            <select class="filter_order" id="filterDate">
              <option value=""></option>
              <option value="today">Hôm nay</option>
              <option value="month">Tháng </option>
              <option value="year">Năm</option>
            </select>

            <select  class="filter_order" id="filterMethodPayment" class="">
              <option value="0"></option>
              <option value="1">COD</option>
              <option value="2">Thanh toán online</option>
            </select>
          </div>
          <div class="list-product">
            <c:forEach var="o" items="${requestScope.orders}">
              <div class="product" >

                <h3 class="order_Cod">Mã đơn hàng : ${o.orderId}</h3>

                <span class="status-order">Trạng thái : ${o.orderStatusName}</span>
                <c:forEach var="p" items="${o.items}">
                  <div class="product-item">
                    <img src="${p.thumbnail}" alt="Product" class="product-image mr-3">
                    <div>
                      <p class="name">${p.name}</p>
                      <span class="quality">Số lượng : x${p.quantity}</span>
                    </div>
                    <div class="ml-auto text-right infor_price">
                        <span class="color-default">
                            <f:formatNumber value="${p.getPriceAfterDiscount()}"
                                            type="number" groupingUsed="true"
                                            maxFractionDigits="0"/> đ
                        </span>
                      <p class="color-default">
                        <f:formatNumber value="${p.totalPriceCartItem()}"
                                        type="number" groupingUsed="true"
                                        maxFractionDigits="0"/> đ
                      </p>
                    </div>
                  </div>
                </c:forEach>


                <hr>

                <div class="btn-another">
                  <button class="btn-cancel btn-detail" onclick="goToInforOrderDetail('${o.orderId}')">Xem chi tiết</button>

                  <c:if test="${o.orderStatusID==1}">
                    <button class="btn-cancel" onclick="cancelOrder(this,'${o.orderId}')">Hủy đơn</button>
                  </c:if>
                </div>
              </div>
            </c:forEach>

          </div>
        </div>
      </div>
      <!-- footer  -->

    </div>
  </div>
</div>
<div class="footer">
  <div class="footer-top">
    <div class="newsletter">
      <p>Đăng ký nhận tin</p>
      <div class="newsletter-input">
        <input type="email" placeholder="Nhập email của bạn">
        <button>ĐĂNG KÝ</button>
      </div>
    </div>
    <div class="social">
      <p>Kết nối với chúng tôi</p>
      <div class="social-icons">
        <a href="#"><i class="fab fa-facebook-f"></i></a>
        <a href="#"><i class="fab fa-youtube"></i></a>
      </div>
      <hr>
    </div>
  </div>
  <div class="footer-content">
    <div class="footer-column">
      <h3>CÔNG TY NỘI THẤT BAYA</h3>
      <ul>

        <li>Thương hiệu nội thất và trang trí hàng đầu Việt Nam, góp phần xây dựng thêm nhiều tổ
          ấm mỗi
          ngày.
        </li>
        <li><i class="fa-solid fa-location-dot"></i> Tầng 08, Tòa nhà Pearl Plaza, Số 561A
          Điện Biên
          Phủ,
          Phường 25, Quận Bình Thạnh, Thành phố Hồ
          Chí Minh </li>
        <li><i class="fa-solid fa-phone"></i> 1900 63 64 76</li>
        <li><i class="fa-solid fa-envelope"></i> webshop@baya.vn</li>
      </ul>
    </div>
    <div class="footer-column">
      <h3>VỀ BAYA</h3>
      <ul>
        <li><a href="introduce.html"><i class="fa-solid fa-circle icon-small"></i>Giới thiệu</a></li>
        <li><a href="contact.html"><i class="fa-solid fa-circle icon-small"></i>Liên hệ</a></li>
        <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Blog</a></li>
        <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Hệ thống cửa hàng</a></li>
      </ul>
    </div>
    <div class="footer-column">
      <h3>HỖ TRỢ KHÁCH HÀNG</h3>
      <ul>
        <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Câu hỏi thường gặp</a></li>
        <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Hướng dẫn đặt hàng</a></li>
        <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Mua hàng trả góp</a></li>
        <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Hướng dẫn thanh toán
          VNPAY-QR</a>
        </li>
      </ul>
    </div>
    <div class="footer-column">
      <h3>CHÍNH SÁCH</h3>
      <ul>
        <li><a href="#"><i class="fa-solid fa-circle icon-small "></i>Chính sách bảo hành</a>
        </li>
        <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Chi phí vận chuyển</a></li>
        <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Chính sách đổi trả và hoàn
          tiền</a>
        </li>
        <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Chính sách vận chuyển</a>
        </li>
        <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Các hình thức thanh
          toán</a></li>
        <li><a href="#"><i class="fa-solid fa-circle icon-small"></i>Chính sách bảo mật thông
          tin</a>
        </li>
      </ul>
    </div>
  </div>
  <div class="footer-bottom">
    <p>Copyright © 2024 Baya. Powered by Nhóm 1</p>
  </div>
</div>

<script>

  var statusFilter = 'all'

  $('select').on('change',function (){
    filterStatusOrder(statusFilter)
  })



  function formatCurrency(amount) {
    return amount.toLocaleString('vi-VN');
  }


  function cancelOrder(button,id){
    var productItem = $(button).closest('.product');

    fetch('/cancel-order', {
      method: 'POST',
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: 'orderId=' + id
    })
            .then(response => {
              return response.json();
            })
            .then(data => {
              if(data.success){
                $(button).text('Đã hủy').prop('disabled', true);
                productItem.find('.status-order').text('Trạng thái : Đã hủy');
              }
            })
            .catch(error => console.error('Error:', error));
  }



  function filterStatusOrder(status) {
    statusFilter = status

    let dateValue = $('#filterDate').val()
    let methodPaymentValue = $('#filterMethodPayment').val()



    fetch('/status-order?status='+statusFilter+'&date='+dateValue+'&methodPayment='+methodPaymentValue, {
      method: 'GET',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    })
            .then(response => response.json())
            .then(data => {
              const orderContent = document.querySelector('.list-product');
              orderContent.innerHTML = '';



              data.forEach(order => {
                let itemsHtml = '';
                console.log(order)

                if (Array.isArray(order.items) && order.items.length > 0) {

                  order.items.forEach(item => {
                    itemsHtml +=
                            '<div class="product-item">' +
                            '<img src="' + item.thumbnail + '" alt="Product" class="product-image mr-3">' +
                            '<div>' +
                            '<p class="name">' + item.name + '</p>' +
                            '<span class="quality">x ' + item.quantity + '</span>' +
                            '</div>' +
                            '<div class="ml-auto text-right infor_price">' +
                            '<span class="color-default">' +
                            (item.price - item.discountDefault).toLocaleString('vi-VN') + ' đ' +
                            '</span>' +
                            '<p class="color-default">' +
                            item.totalPrice.toLocaleString('vi-VN') + ' đ' +
                            '</p>' +
                            '</div>' +
                            '</div>';
                  });
                } else {
                  itemsHtml = '<p>Không có sản phẩm nào trong đơn hàng này.</p>';
                }

                let actionButton = '';
                if (order.orderStatusID === 1) {
                  actionButton = '<button class="btn-cancel" onclick="cancelOrder(this,\'' + order.orderId + '\')">Hủy đơn</button>';

                } else if (order.orderStatusID === 3) {

                }
                let listId = JSON.stringify(order.items)


                if (order.orderStatusID === 3 || order.orderStatusID === 4 || order.orderStatusID === 5) {

                  actionButton += '<button class=" btn-cancel btn-detail" ' +
                          'onclick="AddOrder(\'' + order.orderId + '\')">Mua lại</button>';

                  actionButton += '<button class=" btn-cancel btn-detail" onclick="goToInforOrderDetail(\'' + order.orderId + '\')">Xem chi tiết</button>';


                }

                let orderHtml =
                        '<div class="product">' +
                        '<h3 class="order_Cod">Mã đơn hàng: ' + order.orderId + '</h3>' +
                        '<span class="status-order">Trạng thái: ' + order.orderStatusName + '</span>' +
                        '<p class="createAt-order">Ngày Đặt: ' + order.createAt + '</p>' +
                        '<p class="total-order">' +
                        'Tổng tiền: ' + order.totalPrice.toLocaleString('vi-VN') + ' đ' +
                        '</p>' +
                        itemsHtml +
                        '<hr>' +
                        '<div class="btn-another">' +
                        actionButton +
                        '</div>' +
                        '</div>';

                orderContent.innerHTML += orderHtml;
              });
            })
            .catch(error => console.error('Error:', error));
  }

  function render(id){
    return `<div class="product"
            <h3 class="order_Cod">Mã đơn hàng: ${id}</h3>
            </div>`;
  }

  function goToInforOrderDetail(id){
    window.location.href ='infor-order-detail?id='+id;
  }


</script>

<script src="assets/js/addCart.js"></script>

</body>

</html>