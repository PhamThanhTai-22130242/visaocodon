<%@ page import="com.baya.baya_project.Model.User" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ADMIN</title>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/2.2.1/css/dataTables.bootstrap5.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
          integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
    <link rel="stylesheet" href="/assets/css/layout/styleAdmin.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdn.sheetjs.com/xlsx-latest/package/dist/xlsx.full.min.js"></script>
    <script src="https://cdn.sheetjs.com/xlsx-latest/package/dist/xlsx.full.min.js"></script>
</head>

<body>

<h1> ${requestScope.success}</h1>
<c:if test="${requestScope.success != null}">
    <script>



        notifyUpdate(${requestScope.success});
    </script>
</c:if>


<div class="wrapper">
    <!-- Sidebar -->
    <jsp:include page="SharedViews/SideBarAdmin.jsp" />
    <!-- Nội dung chính -->
    <div class="container orders-container">
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="orders-breadcrumb">
            <ul class="breadcrumb">
                <li class="breadcrumb-item"><a href="adminPage.html"><i class="fa-solid fa-house"></i> Tổng Quan</a></li>
                <li class="breadcrumb-item active" aria-current="page"><i class="fa-solid fa-file-invoice-dollar"></i> Danh Sách Đơn Hàng</li>
            </ul>
        </nav>

        <!-- Header -->
        <div class="row header-list">
            <div class="col-md-4">
                <div class="name-table">Danh Sách Đơn Hàng</div>
                <div class="d-flex quantity-container">
                    <div style="font-size: 1.2rem; font-weight: bold;">Số Lượng:</div>
                    <div  id="quantityitem" class="quantity-item badge bg-success" >100</div>
                    <div>Đơn Hàng</div>
                </div>
            </div>
        </div>

        <!-- Danh sách đơn hàng -->
        <div class="row table-container">
            <div class="col-12">
                <table class="table table-bordered table-striped" id="table-order">
                    <thead class="table-dark">
                    <tr>
                        <th>Mã đơn hàng</th>
                        <th>Khách Hàng</th>
                        <th>Ngày Đặt</th>
                        <th>Địa Chỉ Giao</th>
                        <th>Thành Tiền</th>
                        <th>Trạng Thái ĐH</th>
                        <th>Số điện thoại</th>
                        <th>Tùy Chọn</th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div class="d-flex justify-content-start mt-3 gap-2">
                <button class="btn btn-danger btn-print-pdf">
                    <i class="fa-solid fa-file-pdf"></i> PDF
                </button>
                <button class="btn btn-success btn-export-excel">
                    <i class="fa-solid fa-file-excel"></i> Excel
                </button>
            </div>
        </div>

    </div>
</div>

<!-- Modal Xác Nhận Xóa -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Xác Nhận Xóa</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">Bạn có chắc chắn muốn xóa đơn hàng này không?</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Đồng Ý</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Xác Nhận Đơn Hàng -->
<div class="modal fade" id="confirmOrderModal" tabindex="-1" aria-labelledby="confirmOrderModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"  id="confirmOrderModalLabel">Xác Nhận Đơn Hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">Bạn có chắc chắn muốn xác nhận đơn hàng này không?</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-success" id="confirmOrderBtn">Xác Nhận</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="returnOrderModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Xét duyệt yêu cầu hoàn trả</h5>
            </div>
            <div class="modal-body">
                <img id="modal-image" src="" class="img-fluid mb-3" style="max-height: 200px;">
                <p><strong>Lý do:</strong> <span id="modal-reason"></span></p>
                <p type="hidden" id="modal-orderID"></p>
                <div class="form-group">
                    <label for="adminNote">Phản hồi:</label>
                    <textarea id="adminNote" class="form-control" rows="3"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button id="btn-approve" class="btn btn-success">Hoàn trả</button>
                <button id="btn-reject" class="btn btn-danger">Từ chối</button>
            </div>
        </div>
    </div>
</div>


<!-- Thư viện JS -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/2.2.1/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.2.1/js/dataTables.bootstrap5.js"></script>

<script>

    let selectedOrderId = null;


    const notyf = new Notyf();




    $(document).on('click', '.btn-confirm-status', function () {
        const id = $(this).data('id');
        const idstatus = $(this).data('id-status');

        console.log(idstatus);
        $('#confirmOrderModal').data('order-id', id);
        $('#confirmOrderModal').data('order-idstatus', idstatus);
        console.log($('#confirmOrderModal').data('order-idstatus'));
    });

    $('#confirmOrderBtn').on('click', function () {

        var id = $('#confirmOrderModal').data('order-id');
        var idstatus = $('#confirmOrderModal').data('order-idstatus');
        console.log(idstatus);

        fetch('/order-handler-admin', {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: 'id=' + id + '&idstatus=' + idstatus
        })
            .then(response =>{
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
                if(data.success){

                    console.log("Cập nhật trạng thái thành công!");
                    $('#confirmOrderModal').modal('hide');
                    const button = $(`.btn-confirm-status[data-id="${id}"]`);
                    $('#table-order').DataTable().ajax.reload();
                }else{

                    function notifyUpdate(success){
                        if(success){
                            notyf.success(`Cập nhật đơn hàng thành công`);
                        }else{
                            notyf.error(`Cập nhật thất bại sản phẩm trong kho đã hết`);
                        }
                    }


                    $('#confirmOrderModal').modal('hide');

                    notifyUpdate(false);
                }


            })
            .catch(error => console.error('Error:', error));


    });


    let table = $('#table-order').DataTable({
        "ajax": "/order-list-admin",
        "columns": [
            { "data": "orderId" },
            { "data": "fullname" },
            { "data": "createAt" },
            { "data": "address" },
            { "data": "totalPrice" },
            { "data": "orderStatusName" },
            { "data": "phoneNumber" },
            {
                "data": "actions",
                "orderable": false,
                "searchable": false
            }
        ],
        "initComplete": function () {
            let totalRowCount = table.rows().count();
            document.getElementById("quantityitem").textContent = totalRowCount;
        }
    });



    function getStatusIcon(status) {

        switch (parseInt(status)) {
            case 1:
                return "<i class='fa-solid fa-spinner' style='color: white;'></i>";
            case 2:
                return "<i class='fa-solid fa-truck' style='color: white;'></i>";
            case 3:
                return "<i class='fa-solid fa-check' style='color: white;'></i>";
            case 4:
                return "<i class='fa-solid fa-ban' style='color: white;'></i>";

        }
    }

    $(document).ready(function () {
        let dataTable = $('#table-order').DataTable();

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
            $('#table-order th, #table-order td').css({
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
                let listElement = document.querySelector("#table-order");

                waitForImagesToLoad(listElement, () => {
                    html2canvas(listElement, { scale: 2 }).then(canvas => {
                        const { jsPDF } = window.jspdf;
                        let pdf = new jsPDF('l', 'mm', 'a4');
                        let pageWidth = pdf.internal.pageSize.getWidth();
                        let pageHeight = pdf.internal.pageSize.getHeight();
                        let margin = 10;

                        const title = "Danh Sách Đơn Hàng";
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

                        pdf.save("DanhSachDonHang.pdf");

                        dataTable.column(7).visible(true);
                        dataTable.page.len(originalLength).draw();
                        dataTable.page(originalPage).draw('page');
                    });
                });
            }, 500);
        });

        $(".btn-export-excel").click(function () {
            if (typeof XLSX === 'undefined') {
                alert("Chưa load thư viện SheetJS (xlsx). Vui lòng thêm vào.");
                return;
            }

            let originalLength = dataTable.page.len();
            let originalPage = dataTable.page();

            dataTable.page.len(-1).draw();

            setTimeout(() => {
                let table = document.getElementById('table-order');
                let clonedTable = table.cloneNode(true);

                [...clonedTable.querySelectorAll('tr')].forEach(tr => {
                    if (tr.children.length >= 8) tr.removeChild(tr.children[7]); // Xóa cột "Tùy Chọn"
                });

                let ws = XLSX.utils.table_to_sheet(clonedTable, { raw: true, origin: "A2" });
                let colCount = clonedTable.querySelector('tr').children.length;

                let titleRow = new Array(colCount).fill("");
                titleRow[0] = "Danh Sách Đơn Hàng";
                XLSX.utils.sheet_add_aoa(ws, [titleRow], { origin: "A1" });

                ws['!merges'] = [{ s: { r: 0, c: 0 }, e: { r: 0, c: colCount - 1 } }];

                let titleCell = ws["A1"];
                if (titleCell) {
                    titleCell.s = {
                        alignment: { horizontal: "center", vertical: "center" },
                        font: { bold: true, sz: 16 }
                    };
                }

                let range = XLSX.utils.decode_range(ws['!ref']);
                for (let R = 1; R <= range.e.r; ++R) {
                    for (let C = range.s.c; C <= range.e.c; ++C) {
                        let addr = XLSX.utils.encode_cell({ r: R, c: C });
                        if (!ws[addr]) continue;
                        if (!ws[addr].s) ws[addr].s = {};
                        ws[addr].s.alignment = { vertical: "center", horizontal: "center" };
                        if (R === 1) ws[addr].s.font = { bold: true };
                    }
                }

                let wb = XLSX.utils.book_new();
                XLSX.utils.book_append_sheet(wb, ws, "DonHang");
                XLSX.writeFile(wb, "DanhSachDonHang.xlsx");

                dataTable.page.len(originalLength).draw();
                dataTable.page(originalPage).draw('page');
            }, 500);
        });
    });


    $(document).on('click', '.btn-return-order', function () {
        const id = $(this).data('id');
        fetch('/return_request_order_admin?returnOrderID='+id, {
            method: 'GET',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded'}
        })
            .then(response =>{
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
                $('#modal-image').attr('src', data.imagePath);
                $('#modal-reason').text(data.reason);
                $('#modal-orderID').text(data.orderID);
                $('#adminNote').val('');
                $('#returnOrderModal').modal('show');
            });

    });

    $('#btn-approve, #btn-reject').on('click', function () {


        const orderID = $('#modal-orderID').text();
        const note = $('#adminNote').val();
        const status = $(this).attr('id') === 'btn-approve' ? 'Hoàn trả' : 'Từ chối';
        const formData = new FormData();
        formData.append("orderID", orderID);
        formData.append("adminNote",note);
        formData.append("status", status);

        fetch('/return_request_order_admin',{
            method:'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams(formData)
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
                if(data.success){
                    notyf.success('Cập nhật trạng thái thành công')
                    const id = data.id
                    const button = $('.btn-return-order[data-id="' + id + '"]');
                    if(button){
                        button.prop('disabled',true)
                        button.css({
                            'opacity': '0.6',
                            'cursor': 'not-allowed'
                        });
                        button.text(status)
                    }else{


                    }
                    $('#returnOrderModal').modal('hide');
                }else{
                    notyf.success('Cập nhật trạng thái thất bại')
                }
            })

    });

</script>

<script src="/assets/js/scriptAdmin.js"></script>

</body>
</html>
