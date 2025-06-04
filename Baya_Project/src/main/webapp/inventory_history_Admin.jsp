<%@ page import="com.baya.baya_project.Model.UserPrincipal" %>
<%@ page import="com.baya.baya_project.Model.User" %>
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
    <style>
        <jsp:include page="SharedViews/block_error.jsp" />
    </style>
</head>

<body>
<div class="wrapper">


    <% UserPrincipal us = (UserPrincipal) session.getAttribute("user");
        boolean canCreate = us.hasPermission("warehouseHistories", "create");
        boolean canView = us.hasPermission("warehouseHistories", "view");
        boolean canUpdate = us.hasPermission("warehouseHistories", "update");
        boolean canDelete = us.hasPermission("warehouseHistories", "delete");
        boolean canBanned = us.hasPermission("warehouseHistories", "bannedComment");
        boolean exportExcel = us.hasPermission("warehouseHistories", "exportExcel");
        boolean exportPDF = us.hasPermission("warehouseHistories", "exportPDF");
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
    <div class="container orders-container">
        <div class="row">
            <nav aria-label="breadcrumb" class="orders-breadcrumb">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Dashboardadmin.jsp"><i class="fa-solid fa-house " style="margin:2px ;"></i>Tổng Quan</a></li>
                    <li class="breadcrumb-item active" aria-current="page"> <i class="fa-solid fa-newspaper" style="margin:2px ;"></i>Lịch sử kho hàng</li>
                </ul>
            </nav>
        </div>
        <div class="row table-container">
            <div class="col-12">
                <div class="row mb-3">
                    <div class="col-md-4 d-flex align-items-center">
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
                    <th>Product ID</th>
                    <th>Kiểu thay đổi</th>
                    <th>Related ID</th>
                    <th>Số lượng cũ</th>
                    <th>Thay đổi số lượng</th>
                    <th>Số lượng mới</th>
                    <th>Ngày thay đổi</th>
                    <th>ID người thay đổi</th>
                    <th>Ghi chú</th>

                </tr>
                </thead>
                <tbody>
                <c:set var="count" value="0" />
                <c:forEach items="${historyList}" var="item">
                    <c:set var="count" value="${count + 1}" />
                    <tr id="historyRow_${item.id}">
                        <td>${count}</td>
                        <td id="productID_${item.id}">${item.productID}</td>
                        <td id="changeType_${item.id}">${item.changeType}</td>
                        <td id="relatedID_${item.id}">${item.relatedId}</td>
                        <td id="oldQuantity${item.id}">${item.oldQuantity}</td>
                        <td id="quantityChange_${item.id}">${item.quantityChange}</td>
                        <td id="newQuantity_${item.id}">${item.newQuantity}</td>
                        <td id="changeDate_${item.id}">${item.changeDate}</td>
                        <td id="changedBy_${item.id}">${item.changedBy}</td>
                        <td id="note_${item.id}">${item.note}</td>
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
                    <c:otherwise></c:otherwise></c:choose>

                <c:choose>
                    <c:when test="${exportExcel}">

                        <button class="btn btn-success btn-export-excel">
                            <i class="fa-solid fa-file-excel"></i> Excel
                        </button>
                    </c:when>
                    <c:otherwise></c:otherwise></c:choose>





            </div>
        </div>
    </div>
    <div class="row pagination-container">
        <div class="col-md-6 pagination-left">

        </div>

    </div>
</div>
</div>


<div class="modal fade" id="logModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content custom-modal">
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title" id="deleteModalLabel"><i class="fa-solid fa-triangle-exclamation"></i> Xác Nhận Xóa</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center">
                <p class="fs-5">Bạn có chắc chắn muốn <span class="fw-bold text-danger">xóa lịch sử</span> này không?</p>
                <i class="fa-solid fa-trash fa-3x text-danger mb-3"></i>
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <button type="button" class="btn btn-outline-secondary me-2" data-bs-dismiss="modal">
                    <i class="fa-solid fa-xmark"></i> Không
                </button>
                <form action="${pageContext.request.contextPath}/inventoryHistory" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete"/>
                    <input type="hidden" name="id" id="logIdToDelete"/>
                    <button type="submit" class="btn btn-danger">
                        <i class="fa-solid fa-check"></i> Đồng ý
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="/assets/js/scriptAdmin.js"></script>

<script>

    document.addEventListener("DOMContentLoaded", function() {
        const deleteButtons = document.querySelectorAll(".btn-delete");
        const logIdToDelete = document.getElementById("logIdToDelete");

        deleteButtons.forEach(button => {
            button.addEventListener("click", function() {
                const id = this.getAttribute("data-userid");
                logIdToDelete.value = id;
            });
        });
    });

</script>
<script>
    $(document).ready(function () {
        $('#list').DataTable();
    });
</script>
<script>
    $(document).ready(function () {
        let dataTable = $('#list').DataTable({
            pageLength: 5
        });

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

            dataTable.page.len(-1).draw();

            setTimeout(() => {
                let tableElement = document.querySelector("#list");

                waitForImagesToLoad(tableElement, () => {
                    html2canvas(tableElement, { scale: 2 }).then(canvas => {
                        const { jsPDF } = window.jspdf;
                        let pdf = new jsPDF('l', 'mm', 'a4');
                        let pageWidth = pdf.internal.pageSize.getWidth();
                        let pageHeight = pdf.internal.pageSize.getHeight();
                        let margin = 10;

                        const title = "Lịch Sử Xuất Nhập Kho";
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

                        pdf.save("LichSuXuatNhapKho.pdf");

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
                const sheet = workbook.addWorksheet("LichSuXuatNhapKho");

                const colCount = table.rows[0].cells.length;

                sheet.mergeCells(1, 1, 1, colCount);
                const titleCell = sheet.getCell('A1');
                titleCell.value = "Lịch Sử Xuất Nhập Kho";
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
                saveAs(new Blob([buffer]), "LichSuXuatNhapKho.xlsx");

                dataTable.page.len(originalLength).draw();
                dataTable.page(originalPage).draw('page');
            }, 500);
        });
    });

</script>
</body>


</html>