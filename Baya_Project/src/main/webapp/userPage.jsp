<%@ page import="java.util.List" %>
<%@ page import="com.baya.baya_project.Model.User" %>
<%@ page import="com.baya.baya_project.Model.UserPrincipal" %>
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
  <link rel="stylesheet" href="/assets/css/layout/styleAdmin.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/exceljs/dist/exceljs.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
<body>
<div class="wrapper">
  <% UserPrincipal us = (UserPrincipal) session.getAttribute("user");
    boolean canCreate = us.hasPermission("users", "create");
    boolean canView = us.hasPermission("users", "view");
    boolean canUpdate = us.hasPermission("users", "update");
    boolean canDelete = us.hasPermission("users", "delete");
    boolean canBanned = us.hasPermission("users", "bannedComment");
    boolean exportExcel = us.hasPermission("users", "exportExcel");
    boolean exportPDF = us.hasPermission("users", "exportPDF");
    request.setAttribute("canCreate", canCreate);
    request.setAttribute("canBanned", canBanned);
    request.setAttribute("canView", canView);
    request.setAttribute("canUpdate", canUpdate);
    request.setAttribute("canDelete", canDelete);
    request.setAttribute("exportExcel", exportExcel);
    request.setAttribute("exportPDF", exportPDF);
  %>
  <script>
    var canview =  <%= canView %>;
    var canCreate =  <%= canCreate %>;
    var canUpdate = <%= canUpdate %>;
    var canDelete = <%= canDelete %>;
    var exportExcel = <%= exportExcel %>;
    var exportPDF = <%= exportPDF %>;
    console.log("canview:", canview);
    console.log("canCreate:", canCreate);
    console.log("canUpdate:", canUpdate);
    console.log("canDelete:", canDelete);
    console.log("exportExcel:", exportExcel);
    console.log("exportPDF:", exportPDF);
  </script>
  <jsp:include page="SharedViews/SideBarAdmin.jsp" />
  <!-- phần main -->
  <div class="container users-container">
    <div class="row">
      <nav aria-label="breadcrumb" class="productspage-breadcrumb">
        <ul class="breadcrumb">
          <li class="breadcrumb-item"><a href="Dashboardadmin.jsp"><i class="fa-solid fa-house " style="margin:2px ;"></i>Tổng Quan</a></li>

          <li class="breadcrumb-item active" aria-current="page"><i class="fa-solid fa-user"  style="margin:2px ;"></i>Danh Sách Người Dùng</li>
        </ul>
      </nav>
    </div>
    <div class="row header-list">
      <div class="col-md-4 left-header">
        <div class="col-12">
          <div class="name-table">Danh Sách Người Dùng</div>
          <div class="d-flex quantity-container">
            <div class="" style="font-size: 1.2rem; font-weight: bold;">Số Lượng:</div>
            <%List<User> userList = (List<User>) request.getAttribute("listUser");%>

            <div class="quantity-item badge bg-success"><%=userList.size()%></div>
            <div>Người dùng</div>
          </div>
        </div>
      </div>
    </div>
    <!-- phần danh sách người dùng-->
    <div class="row table-container ">
      <div class="col-12">
        <table id="listUser" class="table table-bordered table-striped" >
          <thead class="table-dark">
          <tr>
            <th>STT</th>
            <th>Tên người dùng</th>
            <th>Email</th>
            <th>SĐT</th>
            <th>Quyền</th>
            <th>Trạng thái</th>
            <th>Tùy chọn</th>
          </tr>
          </thead>
          <tbody>
          <c:set var="count" value="0"></c:set>
          <c:forEach var="user" items="${listUser}">
            <tr id="userRow_${user.userID}">
              <c:set var="count" value="${count+1}"></c:set>
              <td>${count}</td>
              <td id="userName_${user.userID}">${user.fullName}</td>
              <td id="userEmail_${user.userID}">${user.email}</td>
              <td id="userPhone_${user.userID}">${user.phoneNumber}</td>
              <td id="userRole_${user.userID}">
                <c:choose>
                  <c:when test="${user.accountType == 1}">Quản trị viên</c:when>
                  <c:otherwise>Người dùng</c:otherwise>
                </c:choose>
              </td>
              <td id="userStatus_${user.userID}">
                <c:choose>
                  <c:when test="${user.description == 'Đã xóa'}">
                    <span class="badge bg-secondary">Đã xóa</span>
                  </c:when>
                  <c:when test="${user.description == 'Đang hoạt động'}">
                    <span class="badge bg-success">Đang hoạt động</span>
                  </c:when>
                  <c:when test="${user.description == 'Bị khóa'}">
                    <span class="badge bg-danger">Bị khóa</span>
                  </c:when>
                  <c:when test="${user.description == 'Đang chờ kích hoạt'}">
                    <span class="badge bg-warning text-dark">Đang chờ kích hoạt</span>
                  </c:when>
                  <c:otherwise>
                    <span class="badge bg-light text-dark">${user.description}</span>
                  </c:otherwise>
                </c:choose>
              </td>
              <td>
                <c:choose>
                  <c:when test="${canUpdate}">
                    <button class="btn btn-warning btn-sm btn-edit"
                            data-id="${user.userID}"
                            data-status="${user.description}">
                      <i class="fa-solid fa-pen-to-square"></i>
                    </button>
                  </c:when>
                  <c:otherwise></c:otherwise></c:choose>


                <c:choose>
                  <c:when test="${canDelete}">
                    <button class="btn btn-danger btn-sm btn-delete"
                            data-bs-toggle="modal"
                            data-bs-target="#userModal"
                            data-userid="${user.userID}"
                            data-action="delete"
                            data-message="Bạn có chắc chắn muốn xóa người dùng này không?">
                      <i class="fa-solid fa-trash"></i>
                    </button>
                  </c:when>
                  <c:otherwise></c:otherwise></c:choose>


                <c:choose>
                  <c:when test="${canUpdate}">
                    <c:choose>


                      <c:when test="${user.banned == 1}">
                        <button class="btn btn-primary btn-sm px-2 py-1 btn-ban-comment custom-light-blue"
                                data-bs-toggle="modal"
                                data-bs-target="#userModal"
                                data-userid="${user.userID}"
                                data-action="unban_comment"
                                data-message="Bạn có chắc chắn muốn mở lại quyền bình luận/đánh giá của người dùng này?">
                          <i class="fa-solid fa-comment-slash"></i>
                        </button>
                      </c:when>
                      <c:otherwise>
                        <button class="btn btn-primary btn-sm px-2 py-1 btn-ban-comment custom-light-blue"
                                data-bs-toggle="modal"
                                data-bs-target="#userModal"
                                data-userid="${user.userID}"
                                data-action="ban_comment"
                                data-message="Bạn có chắc chắn muốn cấm người dùng này bình luận/đánh giá?">
                          <i class="fa-solid fa-comment"></i>
                        </button>
                      </c:otherwise>

                    </c:choose>
                  </c:when>
                  <c:otherwise></c:otherwise></c:choose>





              </td>
            </tr>

            <div class="modal fade" id="userModal" tabindex="-1" aria-labelledby="userModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" style="color: #2b2b2b" id="userModalLabel">Xác Nhận</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body" id="modalMessage" style="color: #2b2b2b">
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <form id="modalForm" action="${pageContext.request.contextPath}/admin/users/view" method="post" style="display:inline;">
                      <input type="hidden" name="action" id="modalAction" value=""/>
                      <input type="hidden" name="id" id="modalUserId"/>
                      <button type="submit" class="btn btn-danger">Đồng ý</button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
    <div class="d-flex justify-content-start mt-3 gap-2">


      <c:choose>
        <c:when test="${exportPDF}">
          <button class="btn btn-danger btn-print-pdf">
            <i class="fa-solid fa-file-pdf"></i> PDF
          </button>
        </c:when>
        <c:otherwise></c:otherwise></c:choose>

      <c:choose>
        <c:when test="${exportExcel}">

          <button class="btn btn-success btn-export-excel">
            <i class="fa-solid fa-file-excel"></i> Excel
          </button>
        </c:when>
        <c:otherwise></c:otherwise></c:choose>


    </div>
    <!-- Modal chỉnh sửa user -->
    <div class="modal fade" id="editUserModal" tabindex="-1" roles="dialog">
      <div class="modal-dialog modal-dialog-centered" roles="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Thông tin người dùng</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form id="editUserForm">
              <input type="hidden" id="editUserID">
              <div class="form-group">
                <label class="form-label">Họ và Tên</label>
                <input type="text" id="editFullName" class="form-control input-custom" placeholder="Nhập tên người dùng" required>
              </div>
              <div class="form-group">
                <label class="form-label">Email</label>
                <input type="email" id="editEmail" class="form-control input-custom" placeholder="Nhập email người dùng" required>
              </div>
              <div class="form-group">
                <label class="form-label">Số điện thoại</label>
                <input type="number" id="editPhoneNumber" class="form-control input-custom" placeholder="Nhập số điện thoại người dùng" required>
              </div>
              <div class="form-group">
                <label class="form-label">Vai trò</label>
                <select id="editRole" class="form-control input-custom">
                  <option value="1">Quản trị viên</option>
                  <option value="0">Người dùng</option>
                </select>
              </div>
              <button type="submit" class="btn btn-primary w-100 mt-3">Cập nhật</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    <script>
      // Lấy thông tin user lên form
      $(document).ready(function () {
        $(document).on("click", ".btn-edit", function () {
          var userID = $(this).data("id");
          $.ajax({
            url: "/getUserById",
            type: "GET",
            data: {userID: userID},
            dataType: "json",
            success: function (user) {
              if (user.error) {
                alert(user.error);
                return;
              }
              $("#editUserID").val(user.userID);
              $("#editFullName").val(user.fullName);
              $("#editEmail").val(user.email);
              $("#editPhoneNumber").val(user.phoneNumber);
              $("#editRole").val(user.accountType);
              $("#editUserModal").modal("show");

            },
            error: function (xhr) {
              if (xhr.status === 401) {
                window.location.href = "/login.jsp";
                return;
              }
              alert("Lỗi khi tải dữ liệu người dùng!");
            }
          });
        });
        // Cập nhật user
        $(document).ready(function () {
          $("#editUserForm").submit(function (e) {
            e.preventDefault();
            var userData = {
              userID: $("#editUserID").val(),
              fullName: $("#editFullName").val(),
              email: $("#editEmail").val(),
              phoneNumber: $("#editPhoneNumber").val(),
              accountType: parseInt($("#editRole").val())
            };
            $.ajax({
              url: "/editUser",
              type: "POST",
              contentType: "application/json",
              data: JSON.stringify(userData),
              dataType: "json",
              success: function (response) {
                if (response.success) {
                  $("#editUserModal").modal("hide");
                  setTimeout(() => {
                    Swal.fire({
                      title: "Cập nhật thành công!",
                      text: "Thông tin người dùng đã được cập nhật.",
                      icon: "success",
                      confirmButtonText: "OK",
                      allowOutsideClick: false,
                      allowEscapeKey: false
                    }).then(() => {
                      $("#userName_" + userData.userID).text(userData.fullName);
                      $("#userEmail_" + userData.userID).text(userData.email);
                      $("#userPhone_" + userData.userID).text(userData.phoneNumber);
                      $("#userRole_" + userData.userID).text(userData.accountType == 1 ? "Quản trị viên" : "Người dùng");
                    });
                  }, 300);
                } else {
                  Swal.fire({
                    title: "Lỗi!",
                    text: response.error,
                    icon: "error",
                    confirmButtonText: "Thử lại"
                  });
                }
              },
              error: function (xhr) {
                if (xhr.status === 401) {
                  window.location.href = "/login.jsp";
                  return;
                }

                Swal.fire({
                  title: "Lỗi!",
                  text: "Có lỗi xảy ra khi cập nhật!",
                  icon: "error",
                  confirmButtonText: "Thử lại"
                });
              }
            });
          });
        });
        $(".btn-close, .btn-secondary").click(function () {
          $("#editUserModal").modal("hide");
        });
      });
        document.addEventListener("DOMContentLoaded", function () {
        const userModal = document.getElementById('userModal');

        userModal.addEventListener('show.bs.modal', function (event) {
        const button = event.relatedTarget;
        const userId = button.getAttribute('data-userid');
        const action = button.getAttribute('data-action');
        const message = button.getAttribute('data-message');

        document.getElementById('modalUserId').value = userId;
        document.getElementById('modalAction').value = action;
        document.getElementById('modalMessage').textContent = message;
      });
      });
    </script>
    <style>
      .modal-dialog {
        max-width: 500px;
      }

      .modal-content {
        border-radius: 12px;
        padding: 20px;
      }

      .modal-header {
        text-align: center;
        border-bottom: none;
      }

      .modal-title {
        font-size: 20px;
        text-align: center;
        font-weight: bold;
        color: rgba(0, 0, 0, 0.88);
        width: 100%;
      }

      .form-group {
        margin-bottom: 15px;
      }

      .form-label {
        font-weight: 600;
        color: #616161;
        display: block;
      }

      .input-custom {
        border-radius: 8px;
        padding: 10px;
        font-size: 14px;
        border: 1px solid #ccc;
      }
      .input-custom:focus {
        border-color: #007bff;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
      }
      .btn-primary {
        background-color: #007bff;
        border-radius: 8px;
        padding: 10px;
        font-size: 16px;
      }
      .btn-close {
        position: absolute;
        right: 35px;
        top: 30px;
      }
      .d-flex .btn-print{
        margin-top: -50px;
        display: flex;
        height: 33px;
        gap: 6px;
        width: 60px;
        align-items: center;
        justify-content: center;
        margin-left: 10px;
      }

    </style>
    <div class="row pagination-container">
      <div class="col-md-6 pagination-left">

      </div>
      <%--        <div class="col-md-6 pagination-right d-flex justify-content-end">--%>
      <%--          <table>--%>
      <%--            <tr>--%>
      <%--              <td colspan="10">--%>
      <%--                <nav aria-label="Page navigation">--%>
      <%--                  <ul class="pagination justify-content-end pagination-menu">--%>
      <%--                    <li class="page-item"><a class="page-link" href="#">Trước</a></li>--%>
      <%--                    <li class="page-item"><a class="page-link" href="#">1</a></li>--%>
      <%--                    <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
      <%--                    <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
      <%--                    <li class="page-item"><a class="page-link" href="#">Sau</a></li>--%>
      <%--                  </ul>--%>
      <%--                </nav>--%>
      <%--              </td>--%>
      <%--            </tr>--%>
      <%--          </table>--%>
      <%--        </div>--%>
    </div>
  </div>
</div>
<!-- Phần modal popup thông báo -->
<!-- Modal xác nhận chặn -->
<!-- <div class="modal modal-lock  fade" id="lockModal" tabindex="-1" aria-labelledby="lockModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="lockModalLabel">Xác nhận chặn</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Bạn có chắc chắn muốn chặn người này?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
        <button type="button" class="btn btn-primary" id="confirm-lock">Đồng ý</button>
      </div>
    </div>
  </div>
</div>
-- Modal xác nhận mở chặn -->
<div class="modal fade" id="openModal" tabindex="-1" aria-labelledby="openModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="openModalLabel">Xác nhận gỡ chặn</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Bạn có chắc chắn muốn gỡ chặn người này?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
        <button type="button" class="btn btn-primary" id="confirm-open">Đồng ý</button>
      </div>
    </div>
  </div>
</div>
<!-- Thêm Popper.js và Bootstrap JS Bundle cho các tính năng JavaScript của Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="/assets/js/scriptAdmin.js"></script>
<script>
</script>
<script>
  $(document).ready(function () {
    $('#listUser').DataTable();
  });
</script>
<script>
  $(document).ready(function () {
    let table = $('#listUser').DataTable();
    let currentPage = localStorage.getItem("currentPage");
    if (currentPage !== null && !isNaN(currentPage)) {
      currentPage = parseInt(currentPage);
      let totalPages = table.page.info().pages;
      if (currentPage >= 0 && currentPage < totalPages) {
        table.page(currentPage).draw(false);
      }
    }
    table.on('page.dt', function () {
      let page = table.page.info().page;
      localStorage.setItem("currentPage", page);
    });
  });

  $(document).ready(function () {
    let dataTable = $('#listUser').DataTable();

    function waitForImagesToLoad(container, callback) {
      const images = container.querySelectorAll('img');
      let loadedCount = 0;
      const total = images.length;

      if (total === 0) {
        callback();
        return;
      }

      images.forEach(img => {
        if (img.complete) {
          loadedCount++;
          if (loadedCount === total) callback();
        } else {
          img.onload = img.onerror = () => {
            loadedCount++;
            if (loadedCount === total) callback();
          };
        }
      });
    }

    function centerTableContent() {
      $('#listUser th, #listUser td').css({
        'text-align': 'center',
        'vertical-align': 'middle',
        'font-family': 'Arial, sans-serif'
      });
    }

    centerTableContent();

    // In PDF
    $(".btn-print-pdf").click(function () {
      let originalLength = dataTable.page.len();
      let originalPage = dataTable.page();

      dataTable.column(-1).visible(false); // Ẩn cột cuối

      dataTable.page.len(-1).draw();

      setTimeout(() => {
        let listElement = document.querySelector("#listUser");
        waitForImagesToLoad(listElement, () => {
          html2canvas(listElement, { scale: 2 }).then(canvas => {
            const imgData = canvas.toDataURL("image/png");
            const { jsPDF } = window.jspdf;
            let pdf = new jsPDF('l', 'mm', 'a4');
            let pageWidth = pdf.internal.pageSize.getWidth();
            let pageHeight = pdf.internal.pageSize.getHeight();
            let margin = 4;

            const title = "Danh Sách Người Dùng";
            pdf.setFontSize(18);
            pdf.setTextColor(40);
            pdf.text(title, pageWidth / 2, margin + 5, { align: 'center' });

            let imgWidth = pageWidth - 2 * margin;
            let imgHeight = (canvas.height * imgWidth) / canvas.width;

            const maxContentHeight = pageHeight - 30;
            let y = 25;

            if (imgHeight > maxContentHeight) {
              const totalPages = Math.ceil(imgHeight / maxContentHeight);
              for (let i = 0; i < totalPages; i++) {
                let srcY = (canvas.height / totalPages) * i;
                let srcHeight = (canvas.height / totalPages);

                let pageCanvas = document.createElement("canvas");
                pageCanvas.width = canvas.width;
                pageCanvas.height = srcHeight;

                let ctx = pageCanvas.getContext("2d");
                ctx.drawImage(canvas, 0, srcY, canvas.width, srcHeight, 0, 0, canvas.width, srcHeight);

                let pageImgData = pageCanvas.toDataURL("image/png");
                let h = (srcHeight * imgWidth) / canvas.width;

                if (i !== 0) pdf.addPage();
                pdf.addImage(pageImgData, 'PNG', margin, y, imgWidth, h);
              }
            } else {
              pdf.addImage(imgData, 'PNG', margin, y, imgWidth, imgHeight);
            }

            pdf.save("DanhSachNguoiDung.pdf");

            // Trả lại như cũ
            dataTable.column(-1).visible(true);
            dataTable.page.len(originalLength).draw();
            dataTable.page(originalPage).draw('page');
          });
        });
      }, 500);
    });

    // Xuất Excel
    $(".btn-export-excel").click(async function () {
      let originalLength = dataTable.page.len();
      let originalPage = dataTable.page();

      dataTable.page.len(-1).draw();

      setTimeout(async () => {
        const table = document.getElementById('listUser');
        if (!table) {
          alert("Không tìm thấy bảng listUser!");
          return;
        }

        const workbook = new ExcelJS.Workbook();
        const sheet = workbook.addWorksheet("NguoiDung");

        let colCount = table.rows[0].cells.length - 1;

        sheet.mergeCells(1, 1, 1, colCount);
        const titleCell = sheet.getCell('A1');
        titleCell.value = "Danh Sách Người Dùng";
        titleCell.alignment = { vertical: 'middle', horizontal: 'center' };
        titleCell.font = { bold: true, size: 16 };

        let headerRow = [];
        for (let i = 0; i < colCount; i++) {
          headerRow.push(table.tHead.rows[0].cells[i].innerText.trim());
        }
        const header = sheet.addRow(headerRow);

        const borderStyle = {
          top: { style: 'thin', color: { argb: 'FF000000' } },
          left: { style: 'thin', color: { argb: 'FF000000' } },
          bottom: { style: 'thin', color: { argb: 'FF000000' } },
          right: { style: 'thin', color: { argb: 'FF000000' } }
        };

        header.alignment = { vertical: 'middle', horizontal: 'center' };
        header.font = { bold: true };
        header.eachCell(cell => {
          cell.border = borderStyle;
          cell.fill = {
            type: 'pattern',
            pattern: 'solid',
            fgColor: { argb: 'FFD9E1F2' }
          };
        });

        for (let i = 0; i < table.tBodies[0].rows.length; i++) {
          const row = table.tBodies[0].rows[i];
          let rowData = [];
          for (let j = 0; j < colCount; j++) {
            rowData.push(row.cells[j].innerText.trim());
          }
          let excelRow = sheet.addRow(rowData);
          excelRow.alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };
          excelRow.eachCell(cell => {
            cell.border = borderStyle;
          });
        }

        for (let i = 1; i <= colCount; i++) {
          sheet.getColumn(i).width = 20;
        }

        const buffer = await workbook.xlsx.writeBuffer();
        saveAs(new Blob([buffer]), "DanhSachNguoiDung.xlsx");

        dataTable.page.len(originalLength).draw();
        dataTable.page(originalPage).draw('page');
      }, 500);
    });
  });


  $(document).ready(function () {
    $(".btn-edit").each(function () {
      var status = $(this).data("status");
      if (status !== "Đang hoạt động" && status !== "Đang chờ kích hoạt") {
        $(this).prop("disabled", true).css({
          "cursor": "not-allowed",
          "opacity": "0.5"
        });
      }
    });
  });

    document.addEventListener("DOMContentLoaded", function () {
    const userRows = document.querySelectorAll("tr[id^='userRow_']");

    userRows.forEach(function(row) {
    const userStatus = row.querySelector("[id^='userStatus_']").innerText.trim();
    const deleteButton = row.querySelector(".btn-delete");
      const banButton = row.querySelector(".btn-ban-comment");

    if (userStatus === "Đã xóa") {
    deleteButton.style.opacity = "0.5";
    deleteButton.style.pointerEvents = "none";
      banButton.style.opacity = "0.5";
      banButton.style.pointerEvents = "none";
  }
  });
  });


</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>


</body>
</html>