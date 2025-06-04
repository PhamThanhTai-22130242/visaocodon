<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>


    <link rel="stylesheet" href="assets/css/layout/styleAdmin.css">
</head>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<body>
    <div class="wrapper">
        <jsp:include page="SharedViews/SideBarAdmin.jsp" />

        <!-- phần main -->
        <div class="container adduser-container">
            <div class="row">
                <nav aria-label="breadcrumb">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="adminPage.html"><i class="fa-solid fa-house"
                                    style="margin:2px ;"></i>Tổng Quan</a></li>
                        <li class="breadcrumb-item"><a href="orderPageAdmin.jsp"> <i class="fa-solid fa-person"
                                                                                     style="margin:2px ;"></i>Danh Sách Hóa Đơn</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Chi Tiết Hóa Đơn</li>
                    </ul>
                </nav>
            </div>
            <div class="row header-detailorder">
                <div class="col-12">
                    <div class="title-detailorder">
                        <p class="" style="font-weight: bold; font-size: 1.5rem; color: white;">Chi Tiết Hóa Đơn</p>
                        <h4 class="id-detailorder">Mã đơn hàng : ${requestScope.order.orderId}</h4>
                    </div>
                </div>
            </div>
            <div class="row main-detailorder mt-3 d-flex">
                <div class="col-12 col-md-8 detailorder-left">
                    <div class="list-detailorder col-12">
                        <div class="col-12 mt-3">
                            <h4 class="mt-3" style="font-weight: bold;">Danh Sách Đơn Hàng</h4>
                            <table class="table table-bordered table-striped">
                                <thead class="table-dark">
                                    <tr>
                                        <th scope="col"> Ảnh </th>
                                        <th scope="col">Tên Sản Phẩm</th>
                                        <th scope="col">Số Lượng</th>
                                        <th scope="col" style="width: 100px;">Đơn Giá</th>
                                        <th scope="col" style="width: 100px;">Tổng Tiền</th>
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
                    <div class="col-12 infor-customer mb-3">
                        <h4 class="mt-3 " style="font-weight: bold;">Thông Tin Khách Hàng</h4>
                        <div class="mb-3 d-flex">
                            <strong>Người nhận:</strong>
                            <div class="padding-left">${requestScope.order.fullname}</div>
                        </div>
                        <div class="mb-3 d-flex">
                            <strong>SĐT người nhận:</strong>
                            <div class="padding-left">${requestScope.order.phoneNumber} </div>
                        </div>
                        <div class="mb-3 d-flex">
                            <strong>Email người nhận:</strong>
                            <div class="padding-left">${requestScope.order.email}</div>
                        </div>

                    </div>
                </div>
                <div class="col-12 col-md-4 detailorder-right">
                    <div class="col-12 infor-customer">
                        <h4 class="mt-3" style="font-weight: bold;">Tóm Tắt Đơn Hàng</h4>
                        <div class="mb-3 d-flex">
                            <strong>Ngày đặt hàng</strong>
                            <div class="padding-left"> ${requestScope.order.getFormattedDate()}</div>
                        </div>
                        <div class="mb-3 d-flex">
                            <strong>Ngày giao hàng thành công</strong>
                            <c:if test="${requestScope.order.deliveredDate == null}">
                                <div class="padding-left"> Chưa có</div>

                            </c:if>

                            <c:if test="${requestScope.order.deliveredDate != null}">
                                <div class="padding-left">${requestScope.order.getFormattedDateSimple2()}</div>

                            </c:if>

                        </div>
                        <div class="mb-3 d-flex">
                            <strong>Ghi chú: </strong>
                            <div class="padding-left">${requestScope.order.note}</div>
                        </div>
                        <div class="mb-3 d-flex">
                            <strong>Trạng Thái:</strong>
                            <div class="padding-left"> ${requestScope.order.orderStatusName}</div>
                        </div>
                        <div class="mb-3 d-flex">
                            <strong>Địa Chỉ Giao:</strong>
                            <div class="padding-left">${requestScope.order.address}</div>
                        </div>


                    </div>
                    <div class="col-12">

                        <div class="mt-3 mb-3   totalprice-customer " style="display: flex;justify-content: space-between">
                            <strong style="font-size: 1.2rem;">Giảm giá</strong>
                            <div class="padding-left " style="font-size: 1.5rem;  color: #FFA500; padding-right: 10px;">
                                <f:formatNumber
                                        value="${requestScope.order.fee}"
                                        type="number" groupingUsed="true" maxFractionDigits="0"/>

                                đ</div>
                        </div>

                        <div class="mt-3 mb-3   totalprice-customer"  style="display: flex;justify-content: space-between">
                            <strong style="font-size: 1.2rem;">Phí vận chuyển :</strong>
                            <div class="padding-left " style="font-size: 1.5rem;  color: #FFA500; padding-right: 10px;">

                                <f:formatNumber
                                        value="${requestScope.order.discount}"
                                        type="number" groupingUsed="true" maxFractionDigits="0"/>

                                đ</div>
                        </div>

                        <div class="mt-3 mb-3  totalprice-customer"  style="display: flex;justify-content: space-between">
                            <strong style="font-size: 1.2rem;">Thành Tiền:</strong>
                            <div class="padding-left " style="font-size: 1.5rem;  color: #FFA500; padding-right: 10px;">
                                <f:formatNumber
                                        value="${requestScope.order.totalPriceAfterFeeAndDiscount()}"
                                        type="number" groupingUsed="true" maxFractionDigits="0"/>
                                đ</div>
                        </div>
                    </div>


                </div>
            </div>

            <button class="btn btn-primary btn-print">
                <i class="fa-solid fa-print"></i> In
            </button>
            <div class="row footer-adduser">

            </div>
        </div>
        <!-- end adduser-container -->

    </div>


    <!-- Phần modal popup thông báo xác nhận thêm người dùng -->
    <div class="modal fade" id="add-modal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addModalLabel">Xác Nhận Thêm</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn có chắc chắn muốn thêm người dùng này không?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button type="button" class="btn btn-success" id="confirmDeleteBtn">Đồng Ý</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        document.querySelector(".btn-print").addEventListener("click", async function () {
            const { jsPDF } = window.jspdf;

            const printButton = document.querySelector(".btn-print");
            printButton.style.display = "none";

            const originalContainer = document.querySelector('.adduser-container');
            const clone = originalContainer.cloneNode(true);

            const firstRow = clone.querySelector('.row');
            if (firstRow) firstRow.remove();

            const tempDiv = document.createElement('div');
            tempDiv.style.position = 'absolute';
            tempDiv.style.left = '-9999px';
            tempDiv.style.top = '0';
            tempDiv.appendChild(clone);
            document.body.appendChild(tempDiv);

            await html2canvas(clone, {
                scale: 2,
                useCORS: true
            }).then(canvas => {
                const imgData = canvas.toDataURL('image/png');
                const pdf = new jsPDF('p', 'mm', 'a4');

                const pdfWidth = pdf.internal.pageSize.getWidth();
                const imgProps = pdf.getImageProperties(imgData);
                const imgRatio = imgProps.height / imgProps.width;
                const imgHeight = pdfWidth * imgRatio;

                pdf.addImage(imgData, 'PNG', 0, 0, pdfWidth, imgHeight);
                pdf.save('chi-tiet-hoa-don.pdf');
            });

            document.body.removeChild(tempDiv);
            printButton.style.display = "inline-block";
        });
    </script>



    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/scriptAdmin.js"></script>
<script>
    function formatPrice(price) {
        return price.toLocaleString('vi-VN');
    }

</script>
</body>

</html>