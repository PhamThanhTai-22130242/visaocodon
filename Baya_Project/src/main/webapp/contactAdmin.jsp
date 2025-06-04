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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
  <script src="https://cdn.sheetjs.com/xlsx-latest/package/dist/xlsx.full.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/exceljs/dist/exceljs.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/exceljs/dist/exceljs.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
  <style>
    <jsp:include page="/SharedViews/block_error.jsp" />
  </style>
</head>

<body>

<%
  UserPrincipal us = (UserPrincipal) session.getAttribute("user");
  boolean canResponse = us.hasPermission("contacts", "response");
  boolean canCreate = us.hasPermission("contacts", "create");
  boolean canView = us.hasPermission("contacts", "view");
  boolean canDelete = us.hasPermission("contacts", "delete");
  boolean exportExcel = us.hasPermission("contacts", "exportExcel");
  boolean exportPDF = us.hasPermission("contacts", "exportPDF");
  request.setAttribute("canView", canView);
  request.setAttribute("canCreate", canCreate);
  request.setAttribute("canResponse", canResponse);

  request.setAttribute("canDelete", canDelete);
  request.setAttribute("exportExcel", exportExcel);
  request.setAttribute("exportPDF", exportPDF);
%>
<script>
  var canview =  <%= canView %>;
  var canview =  <%= canCreate %>;
  var canResponse = <%= canResponse %>;
  var canDelete = <%= canDelete %>;
  var exportExcel = <%= exportExcel %>;
  var exportPDF = <%= exportPDF %>;
  console.log("canview:", canview);
  console.log("canResponse:", canResponse);

  console.log("canCreate:", canCreate);
  console.log("canDelete:", canDelete);
  console.log("exportExcel:", exportExcel);
  console.log("exportPDF:", exportPDF);

</script>
<div class="wrapper">
  <jsp:include page="/SharedViews/SideBarAdmin.jsp" />
  <!-- phần main -->
  <div class="container orders-container">
    <div class="row">
      <nav aria-label="breadcrumb" class="orders-breadcrumb">
        <ul class="breadcrumb">
          <li class="breadcrumb-item"><a href="Dashboardadmin.jsp"><i class="fa-solid fa-house " style="margin:2px ;"></i>Tổng Quan</a></li>
          <li class="breadcrumb-item active" aria-current="page"> <i class="fa-solid fa-newspaper" style="margin:2px ;"></i>Quản lý liên hệ</li>
        </ul>
      </nav>
    </div>
    <div class="row table-container">
      <div class="col-12">
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
      <table class="table table-bordered table-striped" id="contactList">
        <thead class="table-dark">
        <tr>
          <th>STT</th>
          <th>Họ Tên</th>
          <th>Email</th>
          <th>Nội dung</th>
          <th>Thời gian gửi</th>
          <th>Trạng thái</th>
          <th>Thời gian phản hồi</th>
          <th>Tùy chọn</th>
        </tr>
        </thead>
        <tbody>
        <c:set var="count" value="0" />
        <c:forEach items="${contactList}" var="contact">
          <c:set var="count" value="${count+1}" />
          <tr>
            <td>${count}</td>
            <td>${contact.fullname}</td>
            <td>${contact.email}</td>
            <td>${contact.message}</td>
            <td>${contact.sentTime}</td>
            <td>
              <c:choose>
                <c:when test="${contact.status == 'pending'}">
                  <span class="badge bg-warning">Chưa phản hồi</span>
                </c:when>
                <c:otherwise>
                  <span class="badge bg-success">Đã phản hồi</span>
                </c:otherwise>
              </c:choose>
            </td>
            <td>
              <c:if test="${contact.replyTime != null}">
                ${contact.replyTime}
              </c:if>
            </td>
            <td>

              <c:choose>
                <c:when test="${canResponse}">
                  <button class="btn btn-sm ${contact.status == 'pending' ? 'btn-primary' : 'btn-info'}"
                          onclick="replyContact('${contact.contactID}', '${contact.email}', '${contact.status}', '${contact.replyMessage}')">
                    <i class="fa-solid ${contact.status == 'pending' ? 'fa-reply' : 'fa-circle-info'}"></i>
                  </button>
                </c:when>
                <c:otherwise></c:otherwise>
              </c:choose>

              <c:choose>
                <c:when test="${canDelete}">

                  <button class="btn btn-danger btn-sm btn-delete" data-bs-toggle="modal" data-bs-target="#contactModal" data-userid="${contact.contactID}">
                    <i class="fa-solid fa-trash"></i>
                  </button>
                </c:when>
                <c:otherwise></c:otherwise>
              </c:choose>








            </td>

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
        <form action="${pageContext.request.contextPath}/admin/contacts/view" method="post" style="display:inline;">
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
<script src="/assets/js/scriptAdmin.js"></script>
<script>
  function replyContact(contactID, email, status, replyMessage) {
    const emailInput = document.getElementById("customerEmail");
    const replyTextarea = document.getElementById("replyMessage");
    const contactIdInput = document.getElementById("contactId");
    const sendBtn = document.querySelector("#replyModal .btn-success");

    contactIdInput.value = contactID;
    emailInput.value = email;

    if (status === 'replied') {
      replyTextarea.value = replyMessage;
      replyTextarea.setAttribute("readonly", true);
      sendBtn.style.display = "none";
    } else {
      replyTextarea.value = "";
      replyTextarea.removeAttribute("readonly");
      sendBtn.style.display = "inline-block";
    }

    const replyModal = new bootstrap.Modal(document.getElementById('replyModal'));
    replyModal.show();
  }
  function sendReply() {
    const contactId = document.getElementById("contactId").value;
    const email = document.getElementById("customerEmail").value;
    const replyMessage = document.getElementById("replyMessage").value;

    if (replyMessage.trim() === "") {
      alert("Vui lòng nhập nội dung phản hồi!");
      return;
    }
    $.ajax({


      url: "/replyContact",
      type: "POST",
      data: {
        contactId: contactId,
        email: email,
        replyMessage: replyMessage
      },
      success: function (response) {
        alert("Phản hồi đã được gửi!");
        location.reload();
      },
      error: function () {
        alert("Đã xảy ra lỗi khi gửi phản hồi!");
      }
    });
  }
  // Xóa phàn hồi
  document.addEventListener("DOMContentLoaded", function () {
    const contactModal = document.getElementById('contactModal');
    contactModal.addEventListener('show.bs.modal', function (event) {
      let button = event.relatedTarget;
      let contactId = button.getAttribute('data-userid');
      document.getElementById('contactIdToDelete').value = contactId;
    });
  });

  $(document).ready(function () {
    let dataTable = $('#contactList').DataTable();

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
      $('#contactList th, #contactList td').css({
        'text-align': 'center',
        'vertical-align': 'middle',
        'font-family': 'Arial, sans-serif'
      });
    }

    centerTableContent();

    $(".btn-print-pdf").click(function () {
      let originalLength = dataTable.page.len();
      let originalPage = dataTable.page();

      dataTable.column(7).visible(false);

      dataTable.page.len(-1).draw();

      setTimeout(() => {
        let listElement = document.querySelector("#contactList");
        waitForImagesToLoad(listElement, () => {
          html2canvas(listElement, { scale: 2 }).then(canvas => {
            const imgData = canvas.toDataURL("image/png");
            const { jsPDF } = window.jspdf;
            let pdf = new jsPDF('l', 'mm', 'a4');
            let pageWidth = pdf.internal.pageSize.getWidth();
            let pageHeight = pdf.internal.pageSize.getHeight();
            let margin = 4;

            const title = "Danh Sách Liên Hệ";
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
              pdf.addImage(imgData, 'PNG', margin, y, imgWidth, imgHeight);
            }

            pdf.save("DanhSachLienHe.pdf");

            dataTable.column(7).visible(true);
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
        const table = document.getElementById('contactList');
        if (!table) {
          alert("Không tìm thấy bảng contactList!");
          return;
        }

        const workbook = new ExcelJS.Workbook();
        const sheet = workbook.addWorksheet("LienHe");

        let colCount = table.rows[0].cells.length;
        if (colCount >= 8) {
          colCount = colCount - 1;
        }

        sheet.mergeCells(1, 1, 1, colCount);
        const titleCell = sheet.getCell('A1');
        titleCell.value = "Danh Sách Liên Hệ";
        titleCell.alignment = { vertical: 'middle', horizontal: 'center' };
        titleCell.font = { bold: true, size: 16 };

        let headerRow = [];
        for (let i = 0; i < table.tHead.rows[0].cells.length; i++) {
          if (i === 7) continue; // bỏ cột 8 (index 7)
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
          for (let j = 0; j < row.cells.length; j++) {
            if (j === 7) continue; // bỏ cột 8
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
        saveAs(new Blob([buffer]), "DanhSachLienHe.xlsx");

        dataTable.page.len(originalLength).draw();
        dataTable.page(originalPage).draw('page');
      }, 500);
    });


  });

</script>

<script>
  $(document).ready(function () {
    $('#contactList').DataTable();
  });
</script>
</body>


</html>