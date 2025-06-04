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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/exceljs/dist/exceljs.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>

  <style>
    <jsp:include page="SharedViews/block_error.jsp" />
  </style>
</head>

<body>
<div class="wrapper">
  <jsp:include page="SharedViews/SideBarAdmin.jsp" />

  <% UserPrincipal us = (UserPrincipal) session.getAttribute("user");

    boolean canView = us.hasPermission("logs", "view");
    boolean canCreate = us.hasPermission("logs", "create");
    boolean canUpdate = us.hasPermission("logs", "update");
    boolean canDelete = us.hasPermission("logs", "delete");
    boolean exportExcel = us.hasPermission("logs", "exportExcel");
    boolean exportPDF = us.hasPermission("logs", "exportPDF");
    request.setAttribute("canCreate", canCreate);
    request.setAttribute("canView", canView);
    request.setAttribute("canUpdate", canUpdate);
    request.setAttribute("canDelete", canDelete);
    request.setAttribute("exportExcel", exportExcel);
    request.setAttribute("exportPDF", exportPDF);

  %>
  <script>
    var canUpdate = <%= canUpdate %>;
    var canDelete = <%= canDelete %>;
    var exportExcel = <%= exportExcel %>;
    var exportPDF = <%= exportPDF %>;
    var canCreate = <%= canCreate %>;
    console.log("canView:", canView)
    console.log("canUpdate:", canUpdate);
    console.log("canCreate:", canCreate);
    console.log("canDelete:", canDelete);
    console.log("exportExcel:", exportExcel);
    console.log("exportPDF:", exportPDF);

  </script>

  <!-- phần main -->
  <div class="container orders-container">
    <div class="row">
      <nav aria-label="breadcrumb" class="orders-breadcrumb">
        <ul class="breadcrumb">
          <li class="breadcrumb-item"><a href="Dashboardadmin
         .jsp"><i class="fa-solid fa-house " style="margin:2px ;"></i>Tổng Quan</a></li>
          <li class="breadcrumb-item active" aria-current="page"> <i class="fa-solid fa-newspaper" style="margin:2px ;"></i>Nhật ký hoạt động</li>
        </ul>
      </nav>
    </div>
    <div class="row table-container">
      <div class="col-12">
        <div class="row mb-3">
        <div class="col-md-4 d-flex align-items-center">
          <select class="form-select" id="roleFilter" onchange="filterLogsByRole()">
            <option value="all" ${selectedRole == null || selectedRole == 'all' ? 'selected' : ''}>Tất cả</option>
            <option value="1" ${selectedRole == '1' ? 'selected' : ''}>Người dùng</option>
            <option value="0" ${selectedRole == '0' ? 'selected' : ''}>Admin</option>
          </select>
        </div>
      </div>


        <c:choose>
          <c:when test="${message!=null}">

            <div class="block_error " >
              <p  >${message}</p>

            </div>


          </c:when>

          <c:otherwise>

          </c:otherwise>
        </c:choose>

      </div>
      <table class="table table-bordered table-striped" id="list">
        <thead class="table-dark">
        <tr>
          <th>STT</th>
          <th>Nhãn</th>
          <th>ID người dùng</th>
          <th>Thao tác</th>
          <th>Dữ liệu trước</th>
          <th>Dữ liệu sau</th>

        </tr>
        </thead>
        <tbody>
        <c:set var="count" value="0" />
        <c:forEach items="${logList}" var="log">
          <c:set var="count" value="${count + 1}" />
          <tr id="userRow_${log.logID}">
            <td >${count}</td>
            <td id="logLabel_${log.logID}">${log.label}</td>
            <td id="logUserID_${log.logID}">${log.userID}</td>
            <td id="logLocation_${log.logID}">${log.location}</td>
            <td id="logBeforeData_${log.logID}">${log.beforeData}</td>
            <td id="logAfterData_${log.logID}">${log.afterData}</td>
<%--            <td>--%>
<%--&lt;%&ndash;              <button class="btn btn-warning btn-sm btn-edit" data-id="${log.logID}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <i class="fa-solid fa-pen-to-square"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;              </button>&ndash;%&gt;--%>

<%--              <button class="btn btn-danger btn-sm btn-delete" data-bs-toggle="modal" data-bs-target="#logModal" data-userid="${log.logID}">--%>
<%--                <i class="fa-solid fa-trash"></i>--%>
<%--              </button>--%>
<%--            </td>--%>
          </tr>
        </c:forEach>

        </tbody>
      </table>
      <div class="d-flex justify-content-start mt-3 gap-2">
        <c:choose>
          <c:when test="${exportPDF}">
            <button class="btn btn-danger btn-print-pdf">
              <i class="fa-solid fa-file-pdf"></i> PDF
            </button>
          </c:when>
          <c:otherwise></c:otherwise>
        </c:choose>
        <c:choose>
          <c:when test="${exportExcel}">
            <button class="btn btn-success btn-export-excel">
              <i class="fa-solid fa-file-excel"></i> Excel
            </button>
          </c:when>
          <c:otherwise></c:otherwise>
        </c:choose>


      </div>
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

<!-- Modal chỉnh sửa user -->
<div class="modal fade" id="editLogModal" tabindex="-1" roles="dialog">
  <div class="modal-dialog modal-dialog-centered" roles="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Thông tin nhật ký</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="editLogForm">
          <!-- Thêm input ẩn cho logID -->
          <input type="hidden" id="editLogID">
          <div class="form-group">
            <label class="form-label">ID người dùng</label>
            <input type="number" id="editUserID" class="form-control input-custom" placeholder="Nhập ID người dùng" readonly>
          </div>
          <div class="form-group">
            <label class="form-label">Nhãn</label>
            <input type="text" id="editLabel" class="form-control input-custom" placeholder="Nhập nhãn" required>
          </div>
          <div class="form-group">
            <label class="form-label">Thao tác</label>
            <input type="text" id="editLocation" class="form-control input-custom" placeholder="Nhập thao tác" required>
          </div>
          <div class="form-group">
            <label class="form-label">Dữ liệu trước</label>
            <input type="text" id="editBeforeData" class="form-control input-custom" placeholder="Nhập dữ liệu trước" required>
          </div>
          <div class="form-group">
            <label class="form-label">Dữ liệu sau</label>
            <input type="text" id="editAfterData" class="form-control input-custom" placeholder="Nhập dữ liệu sau" required>
          </div>
          <button type="submit" class="btn btn-primary w-100 mt-3">Cập nhật</button>
        </form>
      </div>
    </div>
  </div>
</div>
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

  .form-control {
    border-radius: 8px;
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ccc;
  }
  .form-control:focus {
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
<!-- Modal xác nhận xóa -->
<div class="modal fade" id="logModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteModalLabel">Xác Nhận Xóa</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Bạn có chắc chắn muốn xóa nhật kí này không?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
        <form action="${pageContext.request.contextPath}/logs" method="post" style="display:inline;">
          <input type="hidden" name="action" value="delete"/>
          <input type="hidden" name="id" id="logIdToDelete"/>
          <button type="submit" class="btn btn-danger">Đồng ý</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Thêm Popper.js và Bootstrap JS Bundle cho các tính năng JavaScript của Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="/assets/js/scriptAdmin.js"></script>

<script>
  $(document).ready(function () {
    $(document).on("click", ".btn-edit", function () {
      var logID = $(this).data("id");
      $.ajax({
        url: "/getLogById",
        type: "GET",
        data: { logID: logID },
        dataType: "json",
        success: function (log) {
          if (log.error) {
            Swal.fire({
              title: "Lỗi!",
              text: log.error,
              icon: "error",
              confirmButtonText: "Thử lại"
            });
            return;
          }
          // Điền dữ liệu vào modal
          $("#editLogID").val(log.logID);
          $("#editLabel").val(log.label);
          $("#editLocation").val(log.location);
          $("#editBeforeData").val(log.beforeData);
          $("#editAfterData").val(log.afterData);
          $("#editUserID").val(log.userID);
          $("#editLogModal").modal("show");
        },
        error: function () {
          Swal.fire({
            title: "Lỗi!",
            text: "Không thể tải dữ liệu nhật ký!",
            icon: "error",
            confirmButtonText: "Thử lại"
          });
        }
      });
    });

    // Cập nhật nhật ký
    $("#editLogForm").submit(function (e) {
      e.preventDefault();

      // Lấy dữ liệu từ form
      var logData = {
        logID: $("#editLogID").val(),
        label: $("#editLabel").val(),
        location: $("#editLocation").val(),
        beforeData: $("#editBeforeData").val(),
        afterData: $("#editAfterData").val(),
        userID: $("#editUserID").val()
      };
      if (!logData.label || !logData.location || !logData.beforeData || !logData.afterData) {
        Swal.fire({
          title: "Lỗi!",
          text: "Vui lòng điền đầy đủ thông tin nhật ký.",
          icon: "warning",
          confirmButtonText: "OK"
        });
        return;
      }

      console.log("Sending Log Data: ", logData);

      $.ajax({
        url: "/editLog",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(logData),
        dataType: "json",
        success: function (response) {
          if (response.success) {
            $("#editLogModal").modal("hide");
            setTimeout(() => {
              Swal.fire({
                title: "Cập nhật thành công!",
                text: "Thông tin nhật ký đã được cập nhật.",
                icon: "success",
                confirmButtonText: "OK",
                allowOutsideClick: false,
                allowEscapeKey: false
              }).then(() => {
                $("#logLabel_" + logData.logID).text(logData.label);
                $("#logLocation_" + logData.logID).text(logData.location);
                $("#logBeforeData_" + logData.logID).text(logData.beforeData);
                $("#logAfterData_" + logData.logID).text(logData.afterData);
                $("#logUserID_" + logData.logID).text(logData.userID);
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
        error: function () {
          Swal.fire({
            title: "Lỗi!",
            text: "Có lỗi xảy ra khi cập nhật nhật ký!",
            icon: "error",
            confirmButtonText: "Thử lại"
          });
        }
      });
    });

    // Đóng modal
    $(".btn-close, .btn-secondary").click(function () {
      $("#editLogModal").modal("hide");
    });
  });

  // Xóa
  document.addEventListener("DOMContentLoaded", function () {
    const logModal = document.getElementById('logModal');
    logModal.addEventListener('show.bs.modal', function (event) {
      let button = event.relatedTarget;
      let logId = button.getAttribute('data-userid');
      document.getElementById('logIdToDelete').value = logId;
    });
  });

  function filterLogsByRole() {
    var roleID = document.getElementById("roleFilter").value;
    var url = "/logs?roles=" + roleID;

    // Gửi yêu cầu tới servlet
    window.location.href = url;
  }


</script>
<script>
  $(document).ready(function () {
    $('#list').DataTable();
  });
</script>
<script>
  $(document).ready(function () {
    let dataTable = $('#list').DataTable();

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
      $('#list th, #list td').css({
        'text-align': 'center',
        'vertical-align': 'middle',
        'font-family': 'Arial, sans-serif'
      });
    }

    centerTableContent();

    $(".btn-print-pdf").click(function () {
      const originalLength = dataTable.page.len();
      const originalPage = dataTable.page();

      dataTable.column(6).visible(false);

      dataTable.page.len(-1).draw();

      setTimeout(() => {
        const table = document.querySelector("#list");
        const clonedTable = table.cloneNode(true);

        for (let row of clonedTable.querySelectorAll("tr")) {
          if (row.cells.length > 6) {
            row.deleteCell(-1);
          }
        }

        waitForImagesToLoad(clonedTable, () => {
          html2canvas(clonedTable, { scale: 2 }).then(canvas => {
            const { jsPDF } = window.jspdf;
            let pdf = new jsPDF('l', 'mm', 'a4');
            let pageWidth = pdf.internal.pageSize.getWidth();
            let pageHeight = pdf.internal.pageSize.getHeight();
            let margin = 4;

            const title = "Lịch Sử Thao Tác";
            pdf.setFontSize(18);
            pdf.setTextColor(40);
            pdf.text(title, pageWidth / 2, margin + 5, { align: 'center' });

            let imgWidth = pageWidth - 2 * margin;
            let imgHeight = (canvas.height * imgWidth) / canvas.width;
            let y = 25;
            let maxContentHeight = pageHeight - 30;

            if (imgHeight > maxContentHeight) {
              const totalPages = Math.ceil(imgHeight / maxContentHeight);

              for (let i = 0; i < totalPages; i++) {
                let srcY = (canvas.height / totalPages) * i;
                let srcHeight = canvas.height / totalPages;

                let pageCanvas = document.createElement("canvas");
                pageCanvas.width = canvas.width;
                pageCanvas.height = srcHeight;

                let ctx = pageCanvas.getContext("2d");
                ctx.drawImage(
                        canvas,
                        0, srcY, canvas.width, srcHeight,
                        0, 0, canvas.width, srcHeight
                );

                let pageImgData = pageCanvas.toDataURL("image/png");
                let h = (srcHeight * imgWidth) / canvas.width;

                if (i !== 0) pdf.addPage();
                pdf.addImage(pageImgData, 'PNG', margin, y, imgWidth, h);
              }
            } else {
              pdf.addImage(canvas.toDataURL("image/png"), 'PNG', margin, y, imgWidth, imgHeight);
            }

            pdf.save("LichSuThaoTac.pdf");

            dataTable.column(6).visible(true);
            dataTable.page.len(originalLength).draw();
            dataTable.page(originalPage).draw('page');
          });
        });
      }, 500);
    });

  $(".btn-export-excel").click(async function () {
      let originalLength = dataTable.page.len();
      let originalPage = dataTable.page();

      dataTable.page.len(-1).draw();

      setTimeout(async () => {
        const table = document.getElementById('list');

        const workbook = new ExcelJS.Workbook();
        const sheet = workbook.addWorksheet("LichSuThaoTac");

        const colCount = table.rows[0].cells.length - 1;

        sheet.mergeCells(1, 1, 1, colCount);
        const titleCell = sheet.getCell('A1');
        titleCell.value = "Lịch Sử Thao Tác";
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
            fgColor: { argb: 'FFEFEFEF' }
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
        saveAs(new Blob([buffer]), "LichSuThaoTac.xlsx");

        dataTable.page.len(originalLength).draw();
        dataTable.page(originalPage).draw('page');
      }, 500);
    });
  });


</script>
</body>


</html>