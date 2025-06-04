<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

  <script src="https://kit.fontawesome.com/68512d5542.js" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="//cdn.datatables.net/2.1.8/css/dataTables.dataTables.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
  <!-- css data table -->
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
  <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
  <link rel="stylesheet" href="assets/css/layout/styleAdmin.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <style>
    <jsp:include page="SharedViews/block_error.jsp" />
  </style>
</head>

<body>
<div class="wrapper">
  <jsp:include page="SharedViews/SideBarAdmin.jsp" />
  <!-- phần main -->
  <div class="container orders-container">
    <div class="row">
      <nav aria-label="breadcrumb" class="orders-breadcrumb">
        <ul class="breadcrumb">
          <li class="breadcrumb-item"><a href="adminPage.html"><i class="fa-solid fa-house "
                                                                  style="margin:2px ;"></i>Tổng Quan</a></li>
          <li class="breadcrumb-item"><a href="ListProductAdmin"> <i class="fa-solid fa-chair"
                                                                     style="margin:2px ;"></i>Danh Sách Sản Phẩm</a></li>
          <li class="breadcrumb-item active" aria-current="page">Thêm Sản Phẩm</li>
        </ul>
      </nav>
    </div>
    <div class="row table-container">
      <div class="col-12">
        <c:choose>
          <c:when test="${message != null}">
            <div class="block_error">
              <p>${message}</p>
            </div>
          </c:when>
          <c:otherwise>
          </c:otherwise>
        </c:choose>
      </div>

      <table class="table table-bordered table-striped" id="productList">
        <thead class="table-dark">
        <tr>
          <th>STT</th>
          <th>Tên sản phẩm</th>
          <th>Ảnh</th>
          <th>Danh mục chính</th>
          <th>Mã sản phẩm</th>
          <th>Mô tả sản phẩm</th>
          <th>Tiêu chuẩn</th>
          <th>Chất liệu</th>
          <th>Kích thước</th>
          <th>Xuất xứ</th>
          <th>Số lượng kho</th>
          <th>Giá</th>
          <th>Tùy chọn</th>

        </tr>
        </thead>
        <tbody>
        <c:set var="count" value="0" />
        <c:forEach items="${importedProducts}" var="product">
          <c:set var="count" value="${count + 1}" />
          <tr data-code="${product.code}">
            <td>${count}</td>
            <td>${product.name}</td>
            <td>
              <img src="${product.image}" alt="Product Image" width="100" height="100" />
            </td>
            <td>${product.mainCategory}</td>
            <td>${product.code}</td>
            <td>${product.description}</td>
            <td>${product.standard}</td>
            <td>${product.material}</td>
            <td>${product.size}</td>
            <td>${product.origin}</td>
            <td>${product.stock}</td>
            <td>${product.price}</td>
            <td>
              <button class="btn btn-success btn-sm rounded-circle add-btn" title="Thêm"
                      data-id="${product.code}"
                      data-name="${product.name}"
                      data-price="${product.price}"
                      data-stock="${product.stock}"
                      data-description="${product.description}"
                      data-standard="${product.standard}"
                      data-material="${product.material}"
                      data-size="${product.size}"
                      data-origin="${product.origin}"
                      data-thumbnail="${product.image}"
                      data-category-id="${product.mainCategory}"
                     data-related-images="${product.relatedImageLinks}">
                <i class="fas fa-plus"></i>
              </button>
            </td>
          </tr>
        </c:forEach>

        </tbody>
      </table>
    </div>

  </div>
  <div class="row pagination-container">
    <div class="col-md-6 pagination-left">

    </div>
    <%--                <div class="col-md-6 pagination-right d-flex justify-content-end">--%>
    <%--                    <table>--%>
    <%--                        <tr>--%>
    <%--                            <td colspan="10">--%>
    <%--                                <nav aria-label="Page navigation">--%>
    <%--                                    <ul class="pagination justify-content-end pagination-menu">--%>
    <%--                                        <li class="page-item"><a class="page-link" href="#">Trước</a></li>--%>
    <%--                                        <li class="page-item"><a class="page-link" href="#">1</a></li>--%>
    <%--                                        <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
    <%--                                        <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
    <%--                                        <li class="page-item"><a class="page-link" href="#">Sau</a></li>--%>
    <%--                                    </ul>--%>
    <%--                                </nav>--%>
    <%--                            </td>--%>
    <%--                        </tr>--%>
    <%--                    </table>--%>
    <%--                </div>--%>
  </div>
</div>
</div>


<!-- Modal xác nhận xóa -->
<div class="modal fade" id="contactModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteModalLabel">Xác Nhận Xóa</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Bạn có chắc chắn muốn xóa thông tin phản hồi này không?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
        <form action="${pageContext.request.contextPath}/contactAd" method="post" style="display:inline;">
          <input type="hidden" name="action" value="delete"/>
          <input type="hidden" name="id" id="contactIdToDelete"/>
          <button type="submit" class="btn btn-danger">Đồng ý</button>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- Phần modal phản hồi-->
<div class="modal fade" id="replyModal" tabindex="-1" aria-labelledby="replyModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="replyModalLabel">Phản hồi khách hàng</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="replyForm">
          <div class="mb-3">
            <label class="form-label">Email khách hàng:</label>
            <input type="text" class="form-control" id="customerEmail" readonly>
          </div>
          <div class="mb-3">
            <label class="form-label">Nội dung phản hồi:</label>
            <textarea class="form-control" id="replyMessage" rows="4"></textarea>
          </div>
          <input type="hidden" id="contactId">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
        <button type="button" class="btn btn-success" onclick="sendReply()">Gửi phản hồi</button>
      </div>
    </div>
  </div>
</div>
<div class="toast-container position-fixed top-0 end-0 p-3">
  <div id="successToast" class="toast" style="display: none; min-width: 300px;">
    <div class="toast-header">
      <strong class="me-auto">Thông báo</strong>
      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body" id="toastMessage"></div>
  </div>
</div>

<!-- Thêm Popper.js và Bootstrap JS Bundle cho các tính năng JavaScript của Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/scriptAdmin.js"></script>


<script>
  $(document).ready(function () {
    const table = $('#productList').DataTable();

    $(".add-btn").on("click", function () {
      const button = $(this);
      const row = button.closest("tr");

      const data = {
        code: button.data("id"),
        name: button.data("name"),
        price: button.data("price"),
        stock: button.data("stock"),
        description: button.data("description"),
        standard: button.data("standard"),
        material: button.data("material"),
        size: button.data("size"),
        origin: button.data("origin"),
        image: button.data("thumbnail"),
        mainCategory: button.data("category-id"),
        relatedImages: button.data("related-images") ?
                button.data("related-images").replace(/\[|\]/g, "").split(",").map(s => s.trim()) : []
      };

      $.ajax({
        url: "AddProductServlet",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(data),
        success: function (response) {
          Swal.fire({
            icon: 'success',
            title: 'Thêm sản phẩm thành công!',
            text: 'Sản phẩm đã được thêm vào cơ sở dữ liệu.',
            confirmButtonText: 'OK'
          }).then(() => {
            const rowCode = button.data("id");
            table.rows().every(function () {
              const rowNode = this.node();
              if ($(rowNode).data("code") === rowCode) {
                this.remove().draw();
              }
            });
          });
        },
        error: function (xhr) {
          if (xhr.status === 409) {
            Swal.fire({
              icon: 'warning',
              title: 'Mã sản phẩm đã tồn tại!',
              text: 'Vui lòng kiểm tra lại mã sản phẩm.',
              confirmButtonText: 'OK'
            });
          } else {
            Swal.fire({
              icon: 'error',
              title: 'Có lỗi xảy ra!',
              text: 'Không thể thêm sản phẩm vào cơ sở dữ liệu.',
              confirmButtonText: 'OK'
            });
          }
        }
      });
    });
  });
</script>

</body>


</html>
