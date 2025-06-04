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
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet"/>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

    <style>
        <jsp:include page="/SharedViews/block_error.jsp" />
        .cke_notification {
            display: none !important;
        }

        .btn-print {
            margin-top: -45px;
        }

        body {
            font-family: "Arial", Helvetica, sans-serif;
            font-weight: normal;
            font-size: 16px;

        }

        .input_recom-wrap {

            position: relative;
            flex: 1;
            width: 415px;
            margin: 0 25px;

        }

        .search_recom {

            z-index: 1000;
            top: 100%;
            left: 0;
            width: 100%;
            height: fit-content;
            position: absolute;
            background-color: #246fdf;
            display: block;
        }

        .autoComplete_highlighted {
            all: unset;
        }

        .header_search:focus-within .search_recom {
            display: block;
        }

        .recom_item {
            padding: 15px 20px;
            display: flex;

            height: 20%;
            background-color: #fff;
            color: #0e2238;

        }

        .recom_item p {
            color: #0e2238 !important;
        }

        .header_search {
            width: 100% !important;
            height: 100% !important;
            margin-left: 0 !important;
            margin-right: 0 !important;
        }

        .recom_item:hover {
            cursor: pointer;
            background-color: rgb(239, 239, 239);
            color: var(--main_bg);
        }


        .modal {
            align-items: center;
            justify-content: center;
        }

        /*.modal-dialog {*/
        /*    max-width: 800px;*/
        /*}*/

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

        .rmh {
            margin-left: 10px;
            padding: 0;
            width: 100%;
        }

        .checkbox-container {
            display: flex;
            flex-wrap: wrap;

        }

        .checkbox-container label {
            width: 50%;
            box-sizing: border-box;
            padding: 4px 0;
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
</head>

<body>
<div class="wrapper">
    <jsp:include page="SharedViews/SideBarAdmin.jsp"/>
    <!-- phần main -->
    <div class="container orders-container">

        <% UserPrincipal us = (UserPrincipal) session.getAttribute("user");
            boolean canView = us.hasPermission("news", "view");
            boolean canCreate = us.hasPermission("news", "create");
            boolean canUpdate = us.hasPermission("news", "update");

            boolean canDelete = us.hasPermission("news", "delete");

            boolean exportExcel = us.hasPermission("news", "exportExcel");

            boolean exportPDF = us.hasPermission("news", "exportPDF");
            request.setAttribute("canCreate", canCreate);
            request.setAttribute("canView", canView);
            request.setAttribute("canUpdate", canUpdate);
            request.setAttribute("canDelete", canDelete);
            request.setAttribute("exportExcel", exportExcel);
            request.setAttribute("exportPDF", exportPDF);
        %>
        <script>
            var canView = <%= canView %>;
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

        <div class="row">
            <nav aria-label="breadcrumb" class="orders-breadcrumb">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="adminPage.html"><i class="fa-solid fa-house "
                                                                            style="margin:2px ;"></i>Tổng Quan</a></li>

                    <li class="breadcrumb-item active" aria-current="page"><i class="fa-solid fa-newspaper"
                                                                              style="margin:2px ;"></i> Danh Sách Tin
                        Tức
                    </li>
                </ul>
            </nav>
        </div>

        <c:choose>
        <c:when test="${canCreate}">
            <div class="row button-center-container">
                <div class="col-md-6 button-left">
                    <button class="btn btn-light btn-primary" id="newModal">Thêm Tin Tức</button>
                </div>
            </div>
        </c:when>
            <c:otherwise></c:otherwise></c:choose>


        <div class="row table-container">
            <div class="col-12">
                <table class="table table-bordered table-striped" id="list">
                    <thead class="table-dark">
                    <tr>
                        <th>STT</th>
                        <th>Tiêu Đề</th>
                        <th>Ảnh</th>
                        <th>Thể loại</th>

                        <th>Chỉnh sửa</th>
                        <th>Xóa</th>
                    </tr>
                    </thead>
                    <tbody>


                    </tbody>
                </table>
                <div class="d-flex justify-content-start mt-3 gap-2">
                    <c:choose>
                        <c:when test="${exportPDF}">
                            <button class="btn btn-danger btn-print-pdf">
                                <i class="fa-solid fa-file-pdf" aria-hidden="true"></i> PDF
                            </button>
                        </c:when>
                        <c:otherwise></c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${exportExcel}">
                            <button class="btn btn-success btn-export-excel">
                                <i class="fa-solid fa-file-excel" aria-hidden="true"></i> Excel
                            </button>
                        </c:when>
                        <c:otherwise></c:otherwise>
                    </c:choose>


                </div>
            </div>
        </div>
    </div>
    <div class="row pagination-container">
        <div class="col-md-6 pagination-left">

        </div>
    </div>
</div>
</div>


<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Xác Nhận Xóa</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Bạn có chắc chắn muốn xóa bài viết này?
            </div>
            <input type="hidden" id="remove_news-id">
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Đồng Ý</button>
            </div>
        </div>
    </div>
</div>
<!-- Phần modal popup thông báo xác nhận đơn hàng -->
<!-- Modal xác nhận đơn hàng -->
<div class="modal fade" id="confirmOrderModal" tabindex="-1" aria-labelledby="confirmOrderModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmOrderModalLabel">Xác Nhận Đơn Hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Bạn có chắc chắn muốn xác nhận đơn hàng này không?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-success" id="confirmOrderBtn">Xác Nhận</button>
            </div>
        </div>
    </div>
</div>
<!-- Thêm Popper.js và Bootstrap JS Bundle cho các tính năng JavaScript của Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<%--<script src="assets/js/scriptAdmin.js"></script>--%>
<script>
    $(document).ready(function () {
        $("#newModal").click(function () {
            resetNewModal()
            $("#newArticle").modal("show");
        });
    });
    $(document).ready(function () {
        $("#btn-delete").click(function () {

            $("#openModal").modal("show");
        });
    });

</script>
<div class="modal fade" id="newArticle" tabindex="-1" aria-labelledby="openModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-xl">

        <div class="modal-content">
            <h5 class="modal-title">Thêm mới tin tức</h5>


            <div class="card-body">

                <p style="margin-bottom: 10px; padding: 0">Tiêu đề bài viết :</p>

                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <!-- <label for="name">Name</label> --> <input class="form-control" type="text"
                                                                           placeholder="tiêu đề bài viết"
                                                                           id="tiltle_newModal"></div>
                    </div>
                </div>
                <p style="margin-bottom: 10px; margin-top: 10px; padding: 0">Hình ảnh bài viết:</p>
                <div class="row">
                    <div class="mb-3">
                        <label for="categoryThumbnail" class="form-label">Chọn Ảnh</label>
                        <input type="file" class="form-control" id="categoryThumbnail" name="categoryThumbnail"
                               accept="image/*"/>
                        <img id="thumbnailPreview" alt="Xem trước ảnh"
                             style="display:none; max-width: 100%; margin-top: 10px; border: 1px solid #ccc; padding: 5px; border-radius: 5px;"/>
                    </div>
                </div>
                <p style="margin-bottom: 10px;margin-top: 10px; padding: 0">Lựa chọn bài viết</p>
                <div class="row">
                    <div class="col-sm-12">
                        <select class="form-select" aria-label="Default select example" name="newsTypeID"
                                id="newsTypeID">
                            <option value="0">Vui lòng chọn</option>

                            <option value="1">Bài viết bình thường</option>
                            <option value="2">Bài viết quảng cáo</option>
                        </select>
                    </div>

                    </select>
                </div>
                <p style="margin-bottom: 10px;margin-top: 10px; padding: 0">Chi tiết bài viết</p>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">

                            <textarea class="form-control" rows="20" id="ckeditor">
                            </textarea>
                        </div>
                    </div>

                    </select>
                </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-danger" id="confirm_Modal">Đồng ý</button>
            </div>

        </div>

    </div>
    <input type="hidden" id="content_value">
</div>
<div class="modal fade  modal-xl" id="editArticle" tabindex="-1" aria-labelledby="openModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <div class="modal-content">
            <h5 class="modal-title">Chỉnh sửa tin tức</h5>


            <div class="card-body">

                <p style="margin-bottom: 10px; padding: 0">Tiêu đề bài viết :</p>

                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <!-- <label for="name">Name</label> --> <input class="form-control" type="text"
                                                                           placeholder="tiêu đề bài viết"
                                                                           id="title_editModal"></div>
                    </div>
                </div>
                <p style="margin-bottom: 10px; margin-top: 10px; padding: 0">Hình ảnh bài viết:</p>
                <div class="row">
                    <div class="mb-3">
                        <label for="editCategoryImage" class="form-label">Ảnh tin tức</label>
                        <input type="file" class="form-control" id="editCategoryImage" name="thumail" accept="image/*">
                        <img id="thumbnailPreviewEd" alt="Xem trước ảnh"
                             style="display:block; max-width: 100%; margin-top: 10px; border: 1px solid #ccc; padding: 5px; border-radius: 5px;"/>
                    </div>
                </div>
                <p style="margin-bottom: 10px;margin-top: 10px; padding: 0">Lựa chọn bài viết</p>
                <div class="row">
                    <div class="col-sm-12">
                        <select class="form-select" aria-label="Default select example" name="newsTypeID"
                                id="edit_newsTypeID">
                            <option value="0">Vui lòng chọn</option>

                            <option value="1">Bài viết bình thường</option>
                            <option value="2">Bài viết quảng cáo</option>
                        </select>
                    </div>

                    </select>
                </div>
                <p style="margin-bottom: 10px;margin-top: 10px; padding: 0">Chi tiết bài viết</p>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <textarea class="form-control ckeditor" rows="20" id="ckeditor_edit">
                            </textarea>
                        </div>
                    </div>

                    </select>
                </div>
                <input type="hidden" id="content_editValue">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-danger" id="confirm_editModal">Đồng ý</button>
            </div>

        </div>

    </div>
    <input type="hidden" id="newsID">
    <input type="hidden" id="content_value-edit">
</div>

<script src="/assets/ckeditor/ckeditor.js"></script>
<script>

    var editor = CKEDITOR.replace('ckeditor');
    var htmlContent;
    htmlContent = editor.getData();

    editor.on('change', function () {
        var htmlContent = editor.getData(); // lấy HTML từ CKEditor
        var decodedContent = $('<div>').html(htmlContent).text().trim(); // chuyển về plain text
        document.getElementById('content_value').value = decodedContent; // gán vào input ẩn
    });
    // });

</script>
<script>

    var editor_edit = CKEDITOR.replace('ckeditor_edit');
    var htmlContent;
    htmlContent = editor_edit.getData();

    editor_edit.on('change', function () {
        var htmlContent = editor_edit.getData(); // lấy HTML từ CKEditor
        var decodedContent = $('<div>').html(htmlContent).text().trim(); // chuyển về plain text
        document.getElementById('content_editValue').value = decodedContent; // gán vào input ẩn
    });
    // });

</script>
<script>
    function error_swal(message) {
        Swal.fire({
            title: "Lỗi!",
            text: message,
            icon: "error",
            confirmButtonText: "Quay lại"
        });
    }

    function swal_success(message) {
        Swal.fire({
            title: "Thành công",
            text: message,
            icon: "success",
            draggable: true,
            confirmButtonText: "Quay về",
            timer: 1500

        });
    }

    function resetNewModal() {
        $("#tiltle_newModal").val(''),
            $("#img_Modal").val(''),
            $("#newsTypeID").val(''),
            $("#ckeditor").val('')

    }

    function openLoading() {
        Swal.fire({
            allowEscapeKey: false,
            allowOutsideClick: false,
            didOpen: () => {
                Swal.showLoading();
            },

        })
    }

    function closeLoading() {
        Swal.close();
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/exceljs@4.3.0/dist/exceljs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>

<script>
    let dataTable
    $(document).ready(function () {

        fetch('/newsPage')
            .then(response => response.json())
            .then(data => {
                console.log(data)


                dataTable = $('#list').DataTable({

                    data: data.list,

                    columns: [
                        {
                            title: "STT",
                            data: null,
                            render: function (data, type, row, meta) {
                                return meta.row + 1;
                            },
                        },
                        {data: 'title'},
                        {
                            data: 'thumbnail',
                            render: function (data, type, row) {

                                return `<img src="` + data + `" alt="Image"
                                        style="width: 50px; height: 50px;">`;
                            }
                        },
                        {
                            data: 'newsTypeID',
                            render: function (data, type, row) {
                                if (data == 1) {
                                    return 'Bài viết bình thường'
                                }
                                if (data == 2) {
                                    return 'Bài viết quảng cáo'
                                } else {
                                    return 'Không xác định'
                                }

                            }

                        },
                        {
                            data: 'newsID',

                            render: function (data, type, row) {
                                if (!canUpdate) return '';
                                return `
                <button class="btn btn-outline-warning btn-edit" onclick="edit_btnNews(` + data + `)" data-toggle="modal" data-id="` + data + `">
                  <i class="fa-solid fa-pen-to-square"></i>
                </button>`;
                            }
                        },
                        {

                            data: 'newsID',
                            title: 'Xóa',
                            className: 'd-none d-md-table-cell text-center',
                            render: function (data, type, row) {
                                if (!canDelete) return '';
                                return `
                <button class="btn btn-outline-danger btn-delete" onclick="remove_btn(` + data + `)" data-userid="${data}">
                  <i class="fa-solid fa-trash" aria-hidden="true"></i>
                </button>`;
                            }
                        }

                    ]
                });
            })

    });

    function remove_btn(id) {
        console.log("da chay vao hàm")
        $("#remove_news-id").val(id)
        $("#deleteModal").modal("show")

    }

    $(document).on("click", "#confirmDeleteBtn", function () {
        console.log("da chay vao function")
        console.log("id:" + document.getElementById("remove_news-id").value)
        var newsID = {
            "id": $("#remove_news-id").val(),
        }
        console.log(newsID)
        openLoading()
        $.ajax({
            url: "/admin/news/delete/removeArticle",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(newsID),
            dataType: "json",
            success: function (response) {
                if (response.success) {
                    $("#deleteModal").modal("hide");
                    closeLoading()
                    swal_success("Đã xóa thành công");
                    fetch('/newsPage')
                        .then(response => response.json())
                        .then(data => {
                            dataTable.clear();
                            dataTable.rows.add(data.list);
                            dataTable.draw();
                        });

                } else {
                    swal_error();
                }
            },
            error: function (xhr) {
                if (xhr.status === 401) {
                    window.location.href = "/login.jsp";
                    return;
                }
                var res = JSON.parse(xhr.responseText);
                console.log(res)
                console.log(res.success)
                Swal.fire({
                    title: "Lỗi!",
                    text: res.message || "Có lỗi xảy ra!",
                    icon: "error",
                    confirmButtonText: "Quay lại"
                });
            }
        });


    })

    function swal_error() {
        Swal.fire({
            title: "Lỗi!",
            text: "Đã xảy ra lỗi",
            icon: "error",
            confirmButtonText: "Thử lại"
        });
    }

    function loadArticleById(id) {
        const articleID = {
            "id": id
        }
        console.log(articleID)

        $.ajax({
            url: "/article",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(articleID),
            dataType: "json",
            success: function (response) {
                if (response.success) {
                    console.log("data gui ve", response)

                    $("#editArticle").modal("show");
                    $("#thumbnailPreviewEd").attr("src", response.img);
                    $("#title_editModal").val(response.title)
                    $("#img_editModal").val(response.img)
                    $("#edit_newsTypeID").val(response.newsTypeID)
                    editor_edit.setData(response.content);

                } else {
                    swal_error();
                }
            },
            error: function (xhr) {
                if (xhr.status === 401) {
                    window.location.href = "/login.jsp";
                    return;
                }
                var res = JSON.parse(xhr.responseText);
                console.log(res)
                console.log(res.success)
                Swal.fire({
                    title: "Lỗi!",
                    text: res.message || "Có lỗi xảy ra!",
                    icon: "error",
                    confirmButtonText: "Quay lại"
                });
            }
        });
    }


    function validateForm() {
        if ($("#tiltle_newModal").val().length == 0) {
            error_swal("Không được bỏ trống tên bài viết")
            return false
        } else if ($("#categoryThumbnail")[0].files.length === 0) {
            error_swal("Trường hình ảnh không được bỏ trống.")
            return false
        } else if ($("#newsTypeID").val() == 0) {
            error_swal("Vui lòng chọn danh mục bài viết")
            return false
        } else if ($("#content_value").val().length == 0) {
            error_swal("Trường thông tin chi tiết bài viết không được bỏ trống.")
            return false
        }
        return true

    }

    $(document).ready(function () {

        $(".btn-print-pdf").click(function () {
            dataTable.page.len(-1).draw();
            $("#list th:nth-child(6), #list td:nth-child(6)").hide();
            setTimeout(function () {
                html2canvas(document.querySelector("#list"), {
                    scale: 2,
                    useCORS: true
                }).then(canvas => {
                    const imgData = canvas.toDataURL("image/png");
                    const {jsPDF} = window.jspdf;
                    let pdf = new jsPDF('l', 'mm', 'a4');
                    let imgWidth = 290;
                    let imgHeight = (canvas.height * imgWidth) / canvas.width;
                    pdf.addImage(imgData, 'PNG', 10, 10, imgWidth, imgHeight);
                    pdf.save("DanhSachTinTuc.pdf");
                    $("#list th:nth-child(6), #list td:nth-child(6)").show();
                    dataTable.page.len(10).draw();
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
                const sheet = workbook.addWorksheet("Danh sách");

                const colCount = table.rows[0].cells.length;

                const exportColIndexes = [];
                for (let i = 0; i < colCount; i++) {
                    if (i !== 4) { // Bỏ cột "Chức năng"
                        exportColIndexes.push(i);
                    }
                }

                sheet.mergeCells(1, 1, 1, exportColIndexes.length);
                const titleCell = sheet.getCell('A1');
                titleCell.value = "Danh Sách";
                titleCell.alignment = {vertical: 'middle', horizontal: 'center'};
                titleCell.font = {bold: true, size: 16};

                let headerRow = [];
                exportColIndexes.forEach(i => {
                    headerRow.push(table.tHead.rows[0].cells[i].innerText.trim());
                });
                const header = sheet.addRow(headerRow);

                const borderStyle = {
                    top: {style: 'thin', color: {argb: 'FF000000'}},
                    left: {style: 'thin', color: {argb: 'FF000000'}},
                    bottom: {style: 'thin', color: {argb: 'FF000000'}},
                    right: {style: 'thin', color: {argb: 'FF000000'}}
                };

                header.alignment = {vertical: 'middle', horizontal: 'center'};
                header.font = {bold: true};
                header.eachCell(cell => {
                    cell.border = borderStyle;
                    cell.fill = {
                        type: 'pattern',
                        pattern: 'solid',
                        fgColor: {argb: 'FFD9E1F2'}
                    };
                });

                for (let i = 0; i < table.tBodies[0].rows.length; i++) {
                    const row = table.tBodies[0].rows[i];
                    let rowData = [];
                    exportColIndexes.forEach(j => {
                        rowData.push(row.cells[j].innerText.trim());
                    });
                    let excelRow = sheet.addRow(rowData);
                    excelRow.alignment = {vertical: 'middle', horizontal: 'center', wrapText: true};
                    excelRow.eachCell(cell => {
                        cell.border = borderStyle;
                    });
                }

                exportColIndexes.forEach((_, index) => {
                    sheet.getColumn(index + 1).width = 20;
                });

                const buffer = await workbook.xlsx.writeBuffer();
                saveAs(new Blob([buffer]), "DanhSach.xlsx");

                dataTable.page.len(originalLength).draw();
                dataTable.page(originalPage).draw('page');
            }, 500);
        });


    });

    function validateEditForm() {
        if ($("#title_editModal").val().length == 0) {
            error_swal("Không được bỏ trống tên bài viết")
            return false
        } else if ($("#editCategoryImage")[0].files.length === 0) {
            error_swal("Trường hình ảnh không được bỏ trống.")
            return false
        } else if ($("#edit_newsTypeID").val() == 0) {
            error_swal("Vui lòng chọn danh mục bài viết")
            return false
        } else if ($("#content_editValue").val().length == 0) {
            error_swal("Trường thông tin chi tiết bài viết không được bỏ trống.")
            return false
        }
        return true
    }

    $(document).ready(function () {
        $("#editCategoryImage").change(function () {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    // $("#thumbnailPreview")
                    //     .attr("src", e.target.result)
                    //     .css("display", "block");
                };
                reader.readAsDataURL(file);
            }
        });
        $("#categoryThumbnail").change(function () {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    $("#thumbnailPreview")
                        .attr("src", e.target.result)
                        .css("display", "block");
                };
                reader.readAsDataURL(file);
            }
        });

        $("#confirm_Modal").click(function () {
            const validate = validateForm();
            if (!validate) return;

            const title = $("#tiltle_newModal").val();
            const newsTypeID = $("#newsTypeID").val();
            const content = CKEDITOR.instances["ckeditor"].getData();
            const thumbnailFile = $("#categoryThumbnail")[0].files[0];

            const formData = new FormData();
            formData.append("title", title);
            formData.append("newsTypeID", newsTypeID);
            formData.append("content", content);
            if (thumbnailFile) {
                formData.append("thumbnail", thumbnailFile);
            }
            console.log('formData', formData)

            openLoading();
            $.ajax({
                url: "/admin/news/create/addArticle",
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response.success) {
                        $("#newArticle").modal("hide");
                        swal_success("Tạo mới thành công");
                        fetch('/newsPage')
                            .then(res => res.json())
                            .then(data => {
                                dataTable.clear();
                                dataTable.rows.add(data.list);
                                dataTable.draw();
                            });
                    } else {
                        swal_error();
                    }
                },
                error: function (xhr) {
                    if (xhr.status === 401) {
                        window.location.href = "/login.jsp";
                        return;
                    }
                    const res = JSON.parse(xhr.responseText);
                    Swal.fire({
                        title: "Lỗi!",
                        text: res.message || "Có lỗi xảy ra!",
                        icon: "error",
                        confirmButtonText: "Quay lại"
                    });
                }
            });
        });
    });

    $(document).ready(function () {
        $("#confirm_editModal").click(function () {
            const thumbnailFile = $("#editCategoryImage")[0].files[0];
            const validate = validateEditForm()
            console.log('validate', validate)
            if (validate) {
                // article = {
                //     "newsID": $("#newsID").val(),
                //     "tiltle": $("#title_editModal").val(),
                //     "thumbnail": thumbnailFile,
                //     "newsTypeID": $("#edit_newsTypeID").val(),
                //     "content": $("#content_editValue").val(),
                // }
                const formData = new FormData();

                formData.append("newsID", $("#newsID").val());
                formData.append("title", $("#title_editModal").val());
                formData.append("newsTypeID", $("#edit_newsTypeID").val());
                formData.append("content", $("#content_editValue").val());
                if (thumbnailFile) {
                    formData.append("thumbnail", thumbnailFile);
                }
                console.log('formData', formData)
                // console.log('article', article)
                openLoading()
                $.ajax({
                    url: "/admin/news/update/editArticle",
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        closeLoading()
                        if (response.success) {
                            $("#editArticle").modal("hide");

                            swal_success("Chỉnh sửa thành công");

                            fetch('/newsPage')
                                .then(response => response.json())
                                .then(data => {
                                    dataTable.clear();
                                    dataTable.rows.add(data.list);
                                    dataTable.draw();
                                });

                        } else {
                            swal_error();
                        }
                    },
                    error: function (xhr) {
                        if (xhr.status === 401) {
                            window.location.href = "/login.jsp";
                            return;
                        }
                        var res = JSON.parse(xhr.responseText);
                        console.log(res)
                        console.log(res.success)
                        Swal.fire({
                            title: "Lỗi!",
                            text: res.message || "Có lỗi xảy ra!",
                            icon: "error",
                            confirmButtonText: "Quay lại"
                        });
                    }
                });

            }

        })
    });


</script>
<script src="/assets/js/scriptAdmin.js"></script>
<script>
    function edit_btnNews(id) {
        $("#newsID").val(id)
        console.log(id)
        loadArticleById(id)


    }
</script>
<!-- Bootstrap JS (bao gồm Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>


</html>