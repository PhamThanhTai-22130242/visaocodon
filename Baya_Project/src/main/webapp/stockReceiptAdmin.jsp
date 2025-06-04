<%@ page import="com.baya.baya_project.Model.UserPrincipal" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 04/10/25
  Time: 2:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/fontawesome.min.js"></script>
    <script src="https://kit.fontawesome.com/68512d5542.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="/assets/css/pages/stockReceiptAdmin.css">
    <link href="https://cdn.datatables.net/2.2.1/css/dataTables.bootstrap5.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/exceljs/dist/exceljs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
    <link rel="stylesheet" href="/assets/css/layout/styleAdmin.css">

    <title>Báo cáo kho</title>

</head>
<body>
<div class="wrapper">

    <jsp:include page="SharedViews/SideBarAdmin.jsp" />


    <div class="container">
        <h2> Báo cáo</h2>

        <% UserPrincipal user = (UserPrincipal) request.getSession().getAttribute("user");
            if(user.hasPermission("inventories","create")){
        %>
        <div class="toolbar">
            <button type="button"
                    data-bs-toggle="modal" data-bs-target="#nhapKhoModal">📥 Nhập kho</button>
        </div>
        <%
            }
        %>

        <div class="filters" action="report" method="get">


            <input type="date" name="date" id="min-date" value=""/>


            <input type="date" name="date" id="max-date" value=""/>

        </div>

        <table id="receipt_table">
            <thead>
            <tr>
                <th style="width: 10%;">Mã phiếu</th>
                <th style="width: 10%">Ngày tạo</th>
                <th style="width: 40%;">Mô tả</th>
                <th style="width: 10%;">Chức năng</th>

            </tr>
            </thead>
            <tbody>


            </tbody>
        </table>
        <div class="d-flex justify-content-start mt-5 gap-2">

            <%
                if(user.hasPermission("inventories","exportPDF")){
            %>
            <button class="btn btn-danger btn-print-pdf">
                <i class="fa-solid fa-file-pdf"></i> PDF
            </button>

            <%}%>

            <%
                if(user.hasPermission("inventories","exportExel")){
            %>
            <button class="btn btn-success btn-export-excel">
                <i class="fa-solid fa-file-excel"></i> Excel
            </button>

            <%}%>



        </div>
    </div>



    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/assets/js/scriptAdmin.js"></script>

</div>

<div class="modal fade" id="nhapKhoModal" tabindex="-1" roles="dialog" aria-labelledby="nhapKhoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" roles="document">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title" id="nhapKhoModalLabel">Phiếu nhập kho</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Đóng">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <jsp:include page="formImportProductAdmin.jsp" />
            </div>

        </div>
    </div>
</div>


<div class="modal fade" id="nhapKhoChiTietModal" tabindex="-1" roles="dialog" aria-labelledby="nhapKhoChiTietModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" roles="document">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title" id="nhapKhoChitietModalLabel">Phiếu nhập kho</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Đóng">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body" id="receipt-detail-container">
                <jsp:include page="stock_detail.jsp" />

            </div>

        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/2.2.1/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.2.1/js/dataTables.bootstrap5.js"></script>

<script>
    let table;
    let fisrt = true;

    $(document).ready(function () {
        table = $('#receipt_table').DataTable({
            "ajax": "/load-receipt-stock?action=all",
            "columns": [
                { "data": "id" },
                { "data": "receipt_date" },
                { "data": "note" },
                {
                    "data": null,
                    "render": function (data, type, row, meta) {
                        return '<button class="btn btn-primary btn-sm view-btn" data-bs-toggle="modal" data-bs-target="#nhapKhoChiTietModal" data-id="' + row.id + '">\
                            <i class="fas fa-eye"></i> Xem\
                        </button>';
                    }
                }
            ]
        });

        $('#receipt_table tbody').on('click', '.view-btn', function () {
            const id = $(this).data('id');
            loadReceipt(id);
        });

        $('#min-date, #max-date').on('change keyup', function () {
            table.draw();
        });
    });

    function loadReceipt(id) {
        fetch("/load-receipt-stock?action=detail&id=" + id, {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            }
        })
            .then(response => {
                if (!response.ok) {
                    // Tự ném lỗi để chuyển xuống .catch
                    if (response.status === 401) {
                        // Redirect nếu 401
                        window.location.href = "/login.jsp";
                        throw new Error("Unauthorized"); // Dừng luôn flow
                    } else {
                        throw new Error("HTTP error " + response.status);
                    }
                }
                return response.json();
            })
            .then(data => {
                let receipt = data.data;

                $('#title').text('Chi tiết phiếu kho ' + receipt.id);
                $('#receipt-id').text(receipt.id);
                // $('#receipt-type').text(receipt.receipt_type);
                $('#receipt-date').text(receipt.receipt_date || 'N/A');
                $('#receipt-note').text(receipt.note);

                let tbody = $('#receipt-detail-body');
                tbody.empty();

                receipt.items.forEach(item => {
                    let row = '<tr>' +
                        '<td>' + item.name + '</td>' +
                        '<td>' + item.quantity + '</td>' +
                        '<td>' + item.unit_price.toLocaleString() + 'đ</td>' +
                        '<td>' + item.receipt_type + '</td>' +

                        '</tr>';
                    tbody.append(row);
                });
            });
    }

    $.fn.dataTable.ext.search.push(
        function (settings, data, dataIndex) {

            let min = $('#min-date').val();
            let max = $('#max-date').val();
            let dateCreate = data[2];

            if (dateCreate == null) return false;

            let date = new Date(dateCreate);
            let minDate = min ? new Date(min) : null;
            let maxDate = max ? new Date(max) : null;
            if(minDate == null || maxDate ==null) return true ;

            if ((date >= minDate) && (date <= maxDate)) return true;


            return false;
        }
    );
</script>
<script>
    $(document).ready(function () {
        let dataTable = $('#receipt_table').DataTable();

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
            $('#receipt_table th, #receipt_table td').css({
                'text-align': 'center',
                'vertical-align': 'middle',
                'font-family': 'Arial, sans-serif'
            });
        }

        centerTableContent();

        $(".btn-print-pdf").click(function () {
            let originalLength = dataTable.page.len();
            let originalPage = dataTable.page();

            dataTable.column(4).visible(false);

            dataTable.page.len(-1).draw();

            setTimeout(() => {
                let tableElement = document.querySelector("#receipt_table");

                waitForImagesToLoad(tableElement, () => {
                    html2canvas(tableElement, { scale: 2 }).then(canvas => {
                        const imgData = canvas.toDataURL("image/png");
                        const { jsPDF } = window.jspdf;
                        let pdf = new jsPDF('l', 'mm', 'a4');
                        let pageWidth = pdf.internal.pageSize.getWidth();
                        let pageHeight = pdf.internal.pageSize.getHeight();
                        let margin = 4;

                        const title = "Danh Sách Phiếu Xuất Kho";
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

                        pdf.save("DanhSachPhieuXuatKho.pdf");

                        // Khôi phục cột "Chức năng" và trạng thái phân trang ban đầu
                        dataTable.column(4).visible(true);
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
                const table = document.getElementById('receipt_table');

                const workbook = new ExcelJS.Workbook();
                const sheet = workbook.addWorksheet("DanhSachNhapKho");

                const colCount = table.rows[0].cells.length;

                // 👉 Bỏ cột cuối cùng (Chức năng)
                const exportColCount = colCount - 1;

                sheet.mergeCells(1, 1, 1, exportColCount);
                const titleCell = sheet.getCell('A1');
                titleCell.value = "Danh Sách Nhập Kho";
                titleCell.alignment = { vertical: 'middle', horizontal: 'center' };
                titleCell.font = { bold: true, size: 16 };

                let headerRow = [];
                for (let i = 0; i < exportColCount; i++) {
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
                    for (let j = 0; j < exportColCount; j++) {
                        rowData.push(row.cells[j].innerText.trim());
                    }
                    let excelRow = sheet.addRow(rowData);
                    excelRow.alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };
                    excelRow.eachCell(cell => {
                        cell.border = borderStyle;
                    });
                }

                for (let i = 1; i <= exportColCount; i++) {
                    sheet.getColumn(i).width = 20;
                }

                const buffer = await workbook.xlsx.writeBuffer();
                saveAs(new Blob([buffer]), "DanhSachNhapKho.xlsx");

                dataTable.page.len(originalLength).draw();
                dataTable.page(originalPage).draw('page');
            }, 500);
        });
    });
</script>

</body>
</html>

