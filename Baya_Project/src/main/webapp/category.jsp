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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <!-- css data table -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
    <% UserPrincipal us = (UserPrincipal) session.getAttribute("user");
        boolean canCreate = us.hasPermission("categories", "create");
        boolean canView = us.hasPermission("categories", "view");
        boolean canUpdate = us.hasPermission("categories", "update");
        boolean canDelete = us.hasPermission("categories", "delete");
        boolean exportExcel = us.hasPermission("categories", "exportExcel");
        boolean exportPDF = us.hasPermission("categories", "exportPDF");
        request.setAttribute("canCreate", canCreate);
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
                    <li class="breadcrumb-item"><a href="adminPage.html"><i class="fa-solid fa-house "
                                                                            style="margin:2px ;"></i>Tổng Quan</a></li>

                    <li class="breadcrumb-item active" aria-current="page"> <i class="fa-solid fa-newspaper"
                                                                               style="margin:2px ;"></i> Danh Sách danh mục</li>
                </ul>
            </nav>
        </div>
        <div class="row button-center-container">
            <c:choose>
                <c:when test="${canCreate}">
                    <div class="col-md-6 button-left">
                        <button class="btn btn-light btn-primary" id="btn-add" style="color: #fff">Thêm Danh mục</button>
                    </div>
                </c:when>
                <c:otherwise></c:otherwise></c:choose>


            <!-- <div class="col-md-6 button-right d-flex justify-content-end align-items-end">
            <button class="btn btn-light btn-primary align-items-end" id="btn-view-deleted">
                <a href="#####" style="color: #fff;">
                Số Sản Phẩm Đã Xóa:
                <div class="products-deleted badge bg-danger">10</div>
                </a>
            </button>
           </div> -->
        </div>
        <div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title" id="addCategoryModalLabel">Thêm Danh Mục</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                        <form id="categoryForm" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="categoryID" class="form-label">Mã Danh Mục</label>
                                <input type="text" class="form-control" id="categoryID" name="categoryID" required>
                            </div>

                            <div class="mb-3">
                                <label for="categoryName" class="form-label">Tên Danh Mục</label>
                                <input type="text" class="form-control" id="categoryName" name="categoryName" required>
                            </div>
                            <div class="mb-3">
                                <label for="categoryThumbnail" class="form-label">Chọn Ảnh</label>
                                <input type="file" class="form-control" id="categoryThumbnail" name="categoryThumbnail" accept="image/*" />
                                <img id="thumbnailPreview" alt="Xem trước ảnh" style="display:none; max-width: 100%; margin-top: 10px; border: 1px solid #ccc; padding: 5px; border-radius: 5px;" />
                            </div>

                            <button type="submit" class="btn btn-primary">Thêm</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    <script>
        const inputFile = document.getElementById('categoryThumbnail');
        const previewImg = document.getElementById('thumbnailPreview');

        inputFile.addEventListener('change', function() {
        const file = this.files[0];
        if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
        previewImg.setAttribute('src', e.target.result);
        previewImg.style.display = 'block';
    }
        reader.readAsDataURL(file);
    } else {
        previewImg.setAttribute('src', '');
        previewImg.style.display = 'none';
    }
    });

        </script>
        <style>
            .modal {
                align-items: center;
                justify-content: center;
            }

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

            .mb-3 {
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
                text-align: center;
                width: 100%;
            }
            .btn-close {
                position: absolute;
                right: 35px;
                top: 30px;
            }
            .small-popup {
                width: 320px !important;
                font-size: 14px !important;
                padding: 15px !important;
            }
            .d-flex .btn-print {
                margin-top: -55px;
                display: flex;
                height: 33px;
                width: 60px;
                gap: 6px;
                align-items: center;
                justify-content: center;
                margin-left: 10px;
            }
        </style>

        <!-- phần danh sách sản phẩm -->
        <div class="row table-container">
            <div class="col-12">

                <c:choose>
                    <c:when test="${message!=null}">

                        <div class="block_error " style="display: block; background-color: #1dc071 !important;">
                            <p  style="color: #fff8f8 !important;">${message}</p>

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
                    <th>Mã</th>
                    <th>Tên Danh mục</th>
                    <th>Ảnh danh mục</th>
                    <th>Tùy Chọn</th>
                </tr>
                </thead>
                <tbody>
                <c:set var="count" value="0"></c:set>
                <c:forEach items="${list}" var="items">
                    <c:set var="count" value="${count + 1}"></c:set>
                    <tr>
                        <td>${count}</td>
                        <td>${items.categoryID}</td>
                        <td>${items.name}</td>
                        <td>
                            <img src="${items.thumbnail}" alt="Ảnh danh mục" style="width: 80px; height: 60px; object-fit: cover; border-radius: 8px;">
                        </td>
                        <td>



                            <c:choose>
                                <c:when test="${canUpdate}">
                                    <button class="btn btn-warning btn-sm" onclick="openEditModal('${items.categoryID}', '${items.name}', '${items.thumbnail}')">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </button>
                                </c:when>
                                <c:otherwise></c:otherwise></c:choose>



                            <c:choose>
                                <c:when test="${canDelete}">
                                    <button class="btn btn-danger btn-sm btn-delete" data-bs-toggle="modal" data-bs-target="#logModal" data-userid="${items.categoryID}">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                </c:when>
                                <c:otherwise></c:otherwise></c:choose>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>

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
    <div class="row pagination-container">
        <div class="col-md-6 pagination-left">

        </div>
    </div>
</div>
<!-- Modal chỉnh sửa danh mục -->
<div class="modal fade" id="editCategoryModal" tabindex="-1" aria-labelledby="editCategoryModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editCategoryModalLabel">Chỉnh Sửa Danh Mục</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
            </div>
            <div class="modal-body">
                <form id="editCategoryForm" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="editCategoryID" class="form-label">Mã Danh Mục</label>
                        <input type="text" class="form-control" id="editCategoryID" name="categoryID" readonly>
                    </div>

                    <div class="mb-3">
                        <label for="editCategoryName" class="form-label">Tên Danh Mục</label>
                        <input type="text" class="form-control" id="editCategoryName" name="categoryName" required>
                    </div>

                    <div class="mb-3">
                        <label for="editCategoryImage" class="form-label">Ảnh danh mục</label>
                        <input type="file" class="form-control" id="editCategoryImage" name="thumail" accept="image/*">
                        <img id="thumbnailPreviewEd" alt="Xem trước ảnh" style="display:block; max-width: 100%; margin-top: 10px; border: 1px solid #ccc; padding: 5px; border-radius: 5px;" />
                    </div>

                    <button type="submit" class="btn btn-primary">Cập Nhật</button>
                </form>
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
                <p class="fs-5">Bạn có chắc chắn muốn <span class="fw-bold text-danger">xóa danh mục</span> này không?</p>
                <i class="fa-solid fa-trash fa-3x text-danger mb-3"></i>
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <button type="button" class="btn btn-outline-secondary me-2" data-bs-dismiss="modal">
                    <i class="fa-solid fa-xmark"></i> Không
                </button>
                <form action="${pageContext.request.contextPath}/admin/categories/delete/removeCate" method="post" style="display:inline;">
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
        $("#btn-add").click(function () {
            $("#addCategoryModal").modal("show");
        });

        $("#categoryThumbnail").change(function () {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    $("#previewImg").attr("src", e.target.result).show();
                };
                reader.readAsDataURL(file);
            } else {
                $("#previewImg").hide();
            }
        });

        $("#categoryForm").submit(function (event) {
            event.preventDefault();
            var formData = new FormData(this);
            $("#addCategoryModal").modal("hide");

            $.ajax({
                type: "POST",
                url: "/admin/categories/create/addCategory",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function () {
                        openLoading();
                    },
                success: function (response) {
                    Swal.close();
                    if (response === "success") {
                        Swal.fire({
                            icon: "success",
                            title: "Thành công!",
                            text: "Danh mục đã được thêm!",
                            confirmButtonText: "OK"
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    type: "GET",
                                    url: "categoryAdmin",
                                    success: function (data) {
                                        var tbody = $(data).find("#list tbody").html();
                                        $("#list tbody").html(tbody);
                                    }
                                });
                                $("#categoryForm")[0].reset();
                                $("#previewImg").hide();
                            }
                        });
                    } else {
                        Swal.fire({
                            icon: "error",
                            title: "Thất bại!",
                            text: "Không thể thêm danh mục. Vui lòng thử lại!",
                            confirmButtonText: "OK"
                        });
                    }
                },
                error: function (xhr) {
                    if (xhr.status === 401) {
                        window.location.href = "/login.jsp";
                        return;
                    }
                    Swal.close();
                    Swal.fire({
                        icon: "error",
                        title: "Lỗi hệ thống!",
                        text: "Đã xảy ra lỗi. Vui lòng thử lại sau!",
                        confirmButtonText: "OK"
                    });
                }
            });
        });
    });

    $(document).ready(function () {
        window.openEditModal = function (categoryID, categoryName, thumbnail) {
            console.log("Open edit modal:", categoryID, categoryName, thumbnail);
            $("#editCategoryID").val(categoryID);
            $("#editCategoryName").val(categoryName);
            $("#thumbnailPreviewEd").attr("src", thumbnail).show();
            $("#editCategoryImage").val("");
            $("#editCategoryModal").modal("show");
        };

        $("#editCategoryImage").on("change", function () {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    console.log("Preview image changed");
                    $("#thumbnailPreviewEd").attr("src", e.target.result).show();
                };
                reader.readAsDataURL(file);
            }
        });

        $("#editCategoryForm").submit(function (event) {
            event.preventDefault();

            const form = $("#editCategoryForm")[0];
            const formData = new FormData(form);

            console.log("Submitting form with data:");
            for (const pair of formData.entries()) {
                console.log(pair[0] + ": ", pair[1]);
            }

            Swal.fire({
                title: "Đang cập nhật...",
                text: "Vui lòng đợi trong giây lát",
                allowOutsideClick: false,
                didOpen: () => {
                    Swal.showLoading();
                }
            });

            $.ajax({
                type: "POST",
                url: "/admin/categories/update/editCategory",
                data: formData,
                contentType: false,
                processData: false,
                success: function (response) {
                    console.log("Server response:", response);
                    Swal.close();
                    if (response.trim() === "success") {
                        $("#editCategoryModal").modal("hide");
                        setTimeout(() => {
                            Swal.fire({
                                icon: "success",
                                title: "Cập nhật thành công!",
                                text: "Thông tin đã được cập nhật.",
                                confirmButtonText: "OK",
                                allowOutsideClick: false,
                                allowEscapeKey: false
                            }).then(() => {
                                location.reload();
                            });
                        }, 300);
                    } else {
                        Swal.fire({
                            icon: "error",
                            title: "Lỗi!",
                            text: "Không thể cập nhật danh mục. Vui lòng thử lại!",
                            confirmButtonText: "OK"
                        });
                    }
                },
                error: function (xhr) {
                    if (xhr.status === 401) {
                        window.location.href = "/login.jsp";
                        return;
                    }
                    Swal.close();
                    Swal.fire({
                        icon: "error",
                        title: "Lỗi hệ thống!",
                        text: "Đã xảy ra lỗi. Vui lòng thử lại sau!",
                        confirmButtonText: "OK"
                    });
                }
            });
        });
    });


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

        $(".btn-export-pdf").click(function () {
            const table = document.querySelector("#list");
            const rows = table.querySelectorAll("tr");
            rows.forEach(row => {
                const lastCell = row.lastElementChild;
                if (lastCell) {
                    lastCell.style.display = "none";
                }
            });

            const tableWrapper = document.querySelector(".dataTables_scrollBody") || document.querySelector(".dataTables_wrapper");
            tableWrapper.style.overflow = "visible";
            tableWrapper.style.height = "auto";

            setTimeout(() => {
                html2canvas(table).then((canvas) => {
                    const imgData = canvas.toDataURL("image/png");
                    const pdf = new jsPDF("l", "mm", "a4");

                    const pageWidth = pdf.internal.pageSize.getWidth();
                    const pageHeight = pdf.internal.pageSize.getHeight();
                    const imgProps = pdf.getImageProperties(imgData);
                    const pdfWidth = pageWidth - 20;
                    const pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;

                    let position = 10;

                    if (pdfHeight < pageHeight) {
                        pdf.addImage(imgData, "PNG", 10, position, pdfWidth, pdfHeight);
                    } else {
                        let heightLeft = pdfHeight;
                        let pageCount = 0;

                        while (heightLeft > 0) {
                            const startY = position - (pageCount * pageHeight);
                            pdf.addImage(imgData, "PNG", 10, startY, pdfWidth, pdfHeight);
                            heightLeft -= pageHeight;
                            pageCount++;
                            if (heightLeft > 0) {
                                pdf.addPage();
                            }
                        }
                    }

                    pdf.save("DanhSachDanhMuc.pdf");

                    rows.forEach(row => {
                        const lastCell = row.lastElementChild;
                        if (lastCell) {
                            lastCell.style.display = "";
                        }
                    });
                    tableWrapper.style.overflow = "";
                    tableWrapper.style.height = "";
                });
            }, 300);
        });


        $(".btn-export-excel").click(async function () {
            const table = document.querySelector("#list");
            const workbook = new ExcelJS.Workbook();
            const sheet = workbook.addWorksheet("Danh Mục");

            sheet.mergeCells("A1:D1");
            sheet.getCell("A1").value = "Danh Sách Danh Mục";
            sheet.getCell("A1").font = { size: 16, bold: true };
            sheet.getCell("A1").alignment = { vertical: "middle", horizontal: "center" };

            const headerCells = table.querySelectorAll("thead th");
            const headerValues = [];
            for (let i = 0; i < headerCells.length - 1; i++) {
                headerValues.push(headerCells[i].innerText.trim());
            }

            const headerRow = sheet.addRow(headerValues);
            headerRow.font = { bold: true };
            headerRow.alignment = { vertical: 'middle', horizontal: 'center' };
            headerRow.eachCell((cell) => {
                cell.border = {
                    top: { style: 'thin' },
                    left: { style: 'thin' },
                    bottom: { style: 'thin' },
                    right: { style: 'thin' }
                };
            });

            const rows = table.querySelectorAll("tbody tr");

            for (let i = 0; i < rows.length; i++) {
                const row = rows[i];
                const cells = row.querySelectorAll("td");
                const excelRow = [];

                for (let j = 0; j < cells.length - 1; j++) {
                    const cell = cells[j];
                    const img = cell.querySelector("img");

                    if (img) {
                        excelRow.push("");
                    } else {
                        excelRow.push(cell.innerText.trim());
                    }
                }

                const addedRow = sheet.addRow(excelRow);
                const currentRowNumber = addedRow.number;

                addedRow.eachCell({ includeEmpty: true }, (cell) => {
                    cell.alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };
                    cell.border = {
                        top: { style: 'thin' },
                        left: { style: 'thin' },
                        bottom: { style: 'thin' },
                        right: { style: 'thin' }
                    };
                });

                for (let j = 0; j < cells.length - 1; j++) {
                    const cell = cells[j];
                    const img = cell.querySelector("img");
                    if (img) {
                        try {
                            const base64 = await getBase64FromUrl(img.src);
                            const imageId = workbook.addImage({
                                base64: base64,
                                extension: 'png',
                            });

                            const colIdx = j + 1;

                            sheet.addImage(imageId, {
                                tl: { col: colIdx - 1, row: currentRowNumber - 1 },
                                br: { col: colIdx, row: currentRowNumber }
                            });

                            sheet.getRow(currentRowNumber).height = 80;
                            sheet.getColumn(colIdx).width = 20;
                        } catch (err) {
                            console.warn("Lỗi tải ảnh:", err);
                        }
                    }
                }
            }

            const buffer = await workbook.xlsx.writeBuffer();
            saveAs(new Blob([buffer]), "DanhSachDanhMuc.xlsx");
        });


        async function getBase64FromUrl(url) {
            const response = await fetch(url);
            const blob = await response.blob();
            return new Promise((resolve, reject) => {
                const reader = new FileReader();
                reader.onloadend = () => resolve(reader.result);
                reader.onerror = reject;
                reader.readAsDataURL(blob);
            });
        }
    });



    function openLoading() {
        Swal.fire({
            title: "Đang xử lý...",
            text: "Vui lòng đợi trong giây lát",
            allowEscapeKey: false,
            allowOutsideClick: false,
            didOpen: () => {
                Swal.showLoading();
            }
        });
    }

</script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="/assets/js/scriptAdmin.js"></script>
<script>

</script>
<script>
    $(document).ready(function () {
        $('#list').DataTable();
    });
</script>
</body>


</html>