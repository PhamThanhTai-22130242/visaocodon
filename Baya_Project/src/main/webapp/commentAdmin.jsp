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
    <link rel="stylesheet" href="/assets/css/layout/styleAdmin.css">
    <script src="https://cdn.sheetjs.com/xlsx-latest/package/dist/xlsx.full.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/exceljs/dist/exceljs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
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
                    <li class="breadcrumb-item"><a href="Dashboardadmin.jsp"><i class="fa-solid fa-house " style="margin:2px ;"></i>Tổng Quan</a></li>
                    <li class="breadcrumb-item active" aria-current="page"> <i class="fa-solid fa-newspaper" style="margin:2px ;"></i>Quản lý bình luận</li>
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
            <%
                UserPrincipal user = (UserPrincipal) request.getSession().getAttribute("user");
            %>
            <table class="table table-bordered table-striped" id="list">
                <thead class="table-dark">
                <tr>
                    <th>STT</th>
                    <th>ID người dùng</th>
                    <th>Tên người dùng</th>
                    <th>ID sản phẩm</th>
                    <th>Đánh giá</th>
                    <th>Bình luận</th>
                    <th>TG đánh giá</th>
                    <th>Tùy Chọn</th>
                </tr>
                </thead>
                <tbody>
                <c:set var="count" value="0" />
              <c:forEach items="${comlist}" var="com">
                    <c:set var="count" value="${count + 1}" />
                    <tr id="userRow_${com.reviewID}">
                        <td >${count}</td>
                        <td >${com.userID}</td>
                        <td >${com.fullName}</td>
                        <td >${com.productID}</td>
                        <td style="min-width: 120px; white-space: nowrap;">
                            <c:forEach begin="1" end="${com.rating}" var="i">
                                <i class="fa-solid fa-star text-warning" style="font-size: 18px;"></i>
                            </c:forEach>
                        </td>

                        <td >${com.comment}</td>
                        <td >${com.createdAt}</td>
                        <td>

                            <%
                                if (user.hasPermission("comments", "delete")) {
                                %>
                            <button class="btn btn-danger btn-sm btn-action"
                                    data-bs-toggle="modal"
                                    data-bs-target="#commentModal"
                                    data-id="${com.reviewID}"
                                    data-action="delete"
                                    data-message="Bạn có chắc chắn muốn xóa bình luận này?">
                                <i class="fa-solid fa-trash"></i>
                            </button>

                            <% } %>

                            <%
                                if (user.hasPermission("comments", "hidden")) {
                            %>
                            <c:choose>
                            <c:when test="${com.hidden == 1}">
                                    <button class="btn btn-success btn-sm btn-action"
                                            data-bs-toggle="modal"
                                            data-bs-target="#commentModal"
                                            data-id="${com.reviewID}"
                                            data-action="unhide"
                                            data-message="Bạn có chắc chắn muốn hiển thị lại bình luận này?">
                                        <i class="fa-solid fa-eye-slash"></i>
                                    </button>
                                </c:when>
                                <c:otherwise>
                                    <button class="btn btn-warning btn-sm btn-action"
                                            data-bs-toggle="modal"
                                            data-bs-target="#commentModal"
                                            data-id="${com.reviewID}"
                                            data-action="hide"
                                            data-message="Bạn có chắc chắn muốn ẩn bình luận này?">
                                        <i class="fa-solid fa-eye"></i>
                                    </button>
                                </c:otherwise>
                            </c:choose>
                            <% } %>

                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>


            <div class="d-flex justify-content-start mt-3 gap-2">

                <%
                    if (user.hasPermission("promotions","exportPDF")){
                %>
            <button class="btn btn-danger btn-print-pdf">
                <i class="fa-solid fa-file-pdf"></i> PDF
            </button>

                <% } %>
                <%
                    if (user.hasPermission("promotions","exportExel")){
                %>
                <button class="btn btn-success btn-export-excel">
                <i class="fa-solid fa-file-excel"></i> Excel

                    <% } %>
            </button>
        </div>
        </div>
    </div>
    <div class="row pagination-container">
        <div class="col-md-6 pagination-left">

        </div>

    </div>
</div>
<!-- Modal Dùng Chung -->
<div class="modal fade" id="commentModal" tabindex="-1" aria-labelledby="commentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="commentModalLabel">Xác nhận hành động</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
            </div>
            <div class="modal-body" id="commentModalMessage">
                <!-- Nội dung sẽ được cập nhật bằng JavaScript -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                <form action="${pageContext.request.contextPath}/comments" method="post" style="display:inline;">
                    <input type="hidden" name="action" id="commentModalAction"/>
                    <input type="hidden" name="id" id="commentModalId"/>
                    <button type="submit" class="btn btn-primary">Đồng ý</button>
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
    //
    document.addEventListener('DOMContentLoaded', function () {
        const actionButtons = document.querySelectorAll('.btn-action');
        const modalMessage = document.getElementById('commentModalMessage');
        const modalId = document.getElementById('commentModalId');
        const modalAction = document.getElementById('commentModalAction');

        actionButtons.forEach(button => {
            button.addEventListener('click', function () {
                const action = this.getAttribute('data-action');
                const id = this.getAttribute('data-id');
                const message = this.getAttribute('data-message');

                modalAction.value = action;
                modalId.value = id;
                modalMessage.textContent = message;
            });
        });
    });

    // in
    $(document).ready(function () {
        let dataTable = $('#list').DataTable();

        function waitForImagesToLoad(container, callback) {
            const images = container.querySelectorAll('img');
            let loaded = 0;
            const total = images.length;
            if (total === 0) return callback();

            images.forEach(img => {
                if (img.complete) {
                    if (++loaded === total) callback();
                } else {
                    img.onload = img.onerror = () => {
                        if (++loaded === total) callback();
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
            let originalLength = dataTable.page.len();
            let originalPage = dataTable.page();

            dataTable.column(7).visible(false);
            dataTable.page.len(-1).draw();

            setTimeout(() => {
                let listElement = document.querySelector("#list");

                waitForImagesToLoad(listElement, () => {
                    html2canvas(listElement, { scale: 2 }).then(canvas => {
                        const { jsPDF } = window.jspdf;
                        let pdf = new jsPDF('l', 'mm', 'a4');
                        let pageWidth = pdf.internal.pageSize.getWidth();
                        let pageHeight = pdf.internal.pageSize.getHeight();
                        let margin = 10;

                        const title = "Danh Sách Đánh Giá";
                        pdf.setFontSize(18);
                        pdf.setTextColor(40);
                        pdf.text(title, pageWidth / 2, margin, { align: 'center' });

                        let imgWidth = pageWidth - margin * 2;
                        let imgHeight = (canvas.height * imgWidth) / canvas.width;
                        const maxContentHeight = pageHeight - 25;
                        let y = 15;

                        if (imgHeight > maxContentHeight) {
                            const totalPages = Math.ceil(imgHeight / maxContentHeight);
                            for (let i = 0; i < totalPages; i++) {
                                let srcY = (canvas.height / totalPages) * i;
                                let srcHeight = canvas.height / totalPages;

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
                            pdf.addImage(canvas.toDataURL("image/png"), 'PNG', margin, y, imgWidth, imgHeight);
                        }

                        pdf.save("DanhSachDanhGia.pdf");

                        dataTable.column(7).visible(true);
                        dataTable.page.len(originalLength).draw();
                        dataTable.page(originalPage).draw('page');
                    });
                });
            }, 500);
        });

        $(".btn-export-excel").click(async function () {
            // Lưu trạng thái hiện tại DataTable
            let originalLength = dataTable.page.len();
            let originalPage = dataTable.page();

            dataTable.page.len(-1).draw();

            setTimeout(async () => {
                const table = document.getElementById('list');

                const workbook = new ExcelJS.Workbook();
                const sheet = workbook.addWorksheet("DanhGia");

                const colCount = table.rows[0].cells.length - 1;

                sheet.mergeCells(1, 1, 1, colCount);
                const titleCell = sheet.getCell('A1');
                titleCell.value = "Danh Sách Đánh Giá";
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
                        if (j === 4) { // cột "Đánh giá"
                            const stars = row.cells[j].querySelectorAll('i.fa-star, i.fa-solid.fa-star');
                            rowData.push(stars.length.toString());
                        } else {
                            rowData.push(row.cells[j].innerText.trim());
                        }
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
                saveAs(new Blob([buffer]), "DanhSachDanhGia.xlsx");

                dataTable.page.len(originalLength).draw();
                dataTable.page(originalPage).draw('page');
            }, 500);
        });


    });


</script>
<script>
    $(document).ready(function () {
        $('#list').DataTable();
    });
</script>
</body>


</html>