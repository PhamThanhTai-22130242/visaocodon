<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ADMIN</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/fontawesome.min.js">
    <script src="https://kit.fontawesome.com/68512d5542.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
    <link rel="stylesheet" href="assets/css/layout/styleAdmin.css">
</head>

<body>




<c:if test="${requestScope.success != null}">
    <script>

        function notifyUpdate(success){
            const notyf = new Notyf();
            if(success){
                notyf.success(`Cập nhật đơn hàng thành công`);
            }else{
                notyf.fail(`Cập nhật đơn hàng thất bại`);
            }
        }

        notifyUpdate(${requestScope.success});
    </script>
</c:if>
    <div class="wrapper">

        <jsp:include page="SharedViews/SideBarAdmin.jsp" />
        <!-- phần main -->

        <div class="container editorder-container">
            <div class="row">
                <nav aria-label="breadcrumb">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="adminPage.html"><i class="fa-solid fa-house "
                                    style="margin:2px ;"></i>Tổng Quan</a></li>
                        <li class="breadcrumb-item"><a href="orderPageAdmin.jsp"> <i class="fa-solid fa-file-invoice-dollar"
                                                                                     style="margin:2px ;"></i> Danh Sách Đơn Hàng</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Chỉnh Sửa Đơn Hàng</li>
                    </ul>
                </nav>
            </div>
            <div class="row header-createorder">
                <div class="col-12">
                    <div class="title-createorder">
                        Chỉnh Sửa Đơn Hàng
                        <h4 class="id-detailorder">${requestScope.order.orderId}</h4>
                    </div>
                </div>
            </div>
            <div class="row main-editorder ">
                <form  id="form-update" action="edit-order-admin?id=${requestScope.order.orderId}" method="post" class="d-flex">
                    <div class=" editorder-left col-12">
                        <div class="mb-2">
                            <h4 class="form-title">Thông Tin Khách Hàng</h4>
                            <label for="usernameRE" class="form-label">Người Nhận</label>
                            <input type="text" class="form-control input-size-createorder color-input" id="usernameRE"
                                value="${requestScope.order.fullname}" name="usernameRE" required placeholder="Tên người nhận">
                        </div>
                        <div class="mb-2">
                            <label for="phoneRE" class="form-label">SĐT Người Nhận</label>
                            <input type="text" class="form-control input-size-createorder color-input" id="phoneRE"
                                name="phoneRE" value="${requestScope.order.phoneNumber}" required maxlength="10"
                                placeholder="Số điện thoại người nhận">
                        </div>
                        <div class="mb-2">
                            <label for="mailRE" class="form-label">Email Người Nhận</label>
                            <input type="email" class="form-control input-size-createorder color-input" id="mailRE"
                                name="mailRE" value="${requestScope.order.email}" placeholder="Email người nhận">
                        </div>
                        <div class="mb-2">
                            <label for="paymentName" class="form-label">Phương thức thanh toán</label>
                            <input type="text" class="form-control input-size-createorder color-input" id="paymentName"
                                name="paymentName" value="${requestScope.order.paymentName}" required maxlength="10" placeholder="Phương thức thanh toán">
                        </div>
                        <div class="mb-3">
                            <label for="note" class="form-label">Ghi Chú Đơn Hàng</label>
                            <input type="text" class="form-control input-size-createorder color-input" style=" width: 50%; height: 100px; /* Đặt độ rộng là 100% */
                            padding: 10px; /* Thêm padding nếu cần */
                            font-size: 16px; " id="note" name="note" placeholder="Lời nhắn, yêu cầu đặc biệt"
                                value="${requestScope.order.note}">
                        </div>

                    </div>
                    <div class=" editorder-right col-12">

                        <div class="mb-2">
                            <label for="address" class="form-label">Địa Chỉ Giao</label>
                            <input type="text" class="form-control input-size-createorder color-input" id="address"
                                name="address" required placeholder="Địa chỉ giao hàng"
                                value="${requestScope.order.address}">
                        </div>
                        <div class="mb-2">
                            <label for="status" class="form-label">Trạng Thái Đơn Hàng</label>
                            <select class="form-control input-size-createorder color-input" id="status" name="status"
                                required>
                                <option value="0">${requestScope.order.orderStatusName}</option>
                                <option value="1">Đang xử lí</option>
                                <option value="2">Đang vận chuyển</option>
                                <option value="3">Hoàn thành</option>
                                <option value="4">Đã hủy</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="row mt-3 custom-dropdown-editorder-container">
                <div class="custom-dropdown-editorder">

                    <div class="dropdown-menu-editorder" id="dropdownMenu">
                        <label class="dropdown-item-editorder">
                            <input type="checkbox" id="product1-checkbox">
                            <img src="https://via.placeholder.com/50" alt="Sản phẩm 1" class="product-img-editorder">
                            <div class="product-info-editorder">
                                <h5>Ghế sắt</h5>
                                <span class="quantity">Số lượng: 10</span>
                            </div>
                        </label>
                        <label class="dropdown-item-editorder">
                            <input type="checkbox" id="product2-checkbox">
                            <img src="https://via.placeholder.com/50" alt="Sản phẩm 2" class="product-img-editorder">
                            <div class="product-info-editorder">
                                <h5>Bàn</h5>
                                <span class="quantity">Số lượng: 15</span>
                            </div>
                        </label>
                        <label class="dropdown-item-editorder">
                            <input type="checkbox" id="product3-checkbox">
                            <img src="https://via.placeholder.com/50" alt="Sản phẩm 3" class="product-img-editorder">
                            <div class="product-info-editorder">
                                <h5>Đèn Ngủ</h5>
                                <span class="quantity">Số lượng: 8</span>
                            </div>
                        </label>
                        <label class="dropdown-item-editorder">
                            <input type="checkbox" id="product4-checkbox">
                            <img src="https://via.placeholder.com/50" alt="Sản phẩm 4" class="product-img-editorder">
                            <div class="product-info-editorder">
                                <h5>Đèn treo tường</h5>
                                <span class="quantity">Số lượng: 20</span>
                            </div>
                        </label>
                        <label class="dropdown-item-editorder">
                            <input type="checkbox" id="product5-checkbox">
                            <img src="https://via.placeholder.com/50" alt="Sản phẩm 5" class="product-img-editorder">
                            <div class="product-info-editorder">
                                <h5>Thảm nhựa</h5>
                                <span class="quantity">Số lượng: 5</span>
                            </div>
                        </label>
                    </div>
                </div>
            </div>
            <div class="row mt-3 addproduct-createorder">
                <div class="col-12">
                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                        <tr>
                            <th style="width: 7%; text-align: center;">Hình ảnh</th>
                            <th style="width: 35%; text-align: left;">Tên sản phẩm</th>
                            <th style="width: 8%; text-align: center;">Số lượng</th>
                            <th style="width: 15%; text-align: left;">Giá sau giảm</th>
                            <th style="width: 15%; text-align: left;">Tổng giá</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="o" items="${requestScope.order.items}">
                            <tr>
                                <td><img src="${o.thumbnail}"  style="width: 50px ; height: 50px" alt="Sản phẩm 1"></td>
                                <td>${o.name}</td>
                                <td>${o.quantity}</td>
                                <td>
                                    <f:formatNumber
                                            value="${o.getPriceAfterDiscount()}"
                                            type="number" groupingUsed="true" maxFractionDigits="0"/> đ</td>
                                <td>
                                    <f:formatNumber
                                            value="${o.totalPriceCartItem()}"
                                            type="number" groupingUsed="true" maxFractionDigits="0"/> đ</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row button-createorder-container mt-4 mb-4">
                <div class="col-12 mt-3 mb-3">
                    <button type="submit" class="btn btn-success btn-light " style="color: white;" onclick="saveUpdate()"
                        id="btn-createorder">Lưu Đơn Hàng</button>
                </div>
            </div>

            <div class="row footer-addproduct">
            </div>
        </div>
        <!-- end addproduct-container -->

    </div>

    <!-- Phần modal popup thông báo xác nhận xóa -->
    <!-- Modal xác nhận xóa -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/scriptAdmin.js"></script>
<script>
    function saveUpdate(){
        document.getElementById("form-update").submit();
    }


</script>
</body>

</html>