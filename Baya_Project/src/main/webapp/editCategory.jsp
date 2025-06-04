<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Danh Mục</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/fontawesome.min.js">
    <script src="https://kit.fontawesome.com/68512d5542.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css">
    <script src="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"></script>
    <link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/43.3.1/ckeditor5.css">
    <link rel="stylesheet" href="assets/css/layout/styleAdmin.css">
    <script src="
https://cdn.jsdelivr.net/npm/marked@15.0.6/lib/marked.umd.min.js
"></script>

    <script src="assets/ckeditor/ckeditor.js"></script>
    <style>

        <jsp:include page="SharedViews/block_error.jsp" />

    </style>
</head>

<body>
    <div class="wrapper">
        <jsp:include page="SharedViews/SideBarAdmin.jsp" />
        <!-- phần main -->
        <div class="container addnew-container">
            <div class="row">

            </div>
            <div class="row header-addproduct">
                <div class="col-12">
                    <div class="title-addproduct">
                        Thêm Danh mục
                    </div>
                </div>
            </div>
            <div class="row  main-addnew mt-3">
                <form action="/addCategory" method="post" class="form-addnew d-flex" onsubmit="return checkAdd()">

                    <div class="col-12 form_right " >
                        <c:choose>
                            <c:when test="${message!=null}">

                        <div class="block_error " style="display: block!important;">
                            <p  >${message}</p>

                        </div>
                            </c:when>

                            <c:otherwise>
                                <div class="block_error " id="block_error">
                                    <p  id="error_text"></p>

                                </div>
                            </c:otherwise>
                        </c:choose>
                        <!-- Tên tin tức -->

                        <div class="mb-1">
                            <label  class="form-label">ID Danh mục</label>
                            <input type="text"  class="form-control color-input size_textarea" autocomplete="off"  id="id" name="id"
                                placeholder="Nhập ID" >
                        </div>
                        <div class="mb-1">
                            <label  class="form-label">Tên Danh Mục</label>
                            <input autocomplete="off"  type="text" class="form-control color-input size_textarea"
                                   placeholder="Nhập tên"  name="name" id="name">
                        </div>


                        <!-- Nội dung -->

                        <!-- ngày tạo -->
<%--                        <div class="mb-1 new-date-input">--%>
<%--                            <label for="createDate" class="form-label">Ngày Tạo</label>--%>
<%--                            <input type="date" class="form-control size_textarea" id="createDate"--%>
<%--                                placeholder="Chọn ngày tạo">--%>
<%--                        </div>--%>
                        <button  class="btn btn-primary btn-light " style="color: white;"
                            id="btn-addnew" >Hoàn tất</button>
                    </div>
                </form>
            </div>
            <div class="row footer-addproduct">

            </div>
        </div>
        <!-- end addproduct-container -->

    </div>
    <!-- Phần modal popup thông báo xác nhận xóa -->
    <!-- Modal xác nhận xóa -->
    <div class="modal fade" id="add-modal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addModalLabel">Xác Nhận Thêm</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn có chắc chắn muốn thêm sản phẩm này không?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button type="button" class="btn btn-success" id="confirmDeleteBtn">Đồng Ý</button>
                </div>
            </div>
        </div>
        <div id="hienthi"></div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/scriptAdmin.js"></script>
<%--    <script>--%>

<%--        var simplemde = new SimpleMDE({ element: document.getElementById("markdown-editor") });--%>

<%--        // Lắng nghe sự thay đổi trong trình soạn thảo và cập nhật nội dung--%>
<%--                simplemde.codemirror.on('change', function () {--%>
<%--            var content = simplemde.options.previewRender(simplemdeValue);--%>

<%--            // // Sử dụng marked.js để chuyển Markdown thành HTML (nếu cần)--%>
<%--            // // const html = marked(simplemdeValue);--%>
<%--            //     var    htmlContent = marked.parse(content.value);--%>
<%--            //--%>
<%--            // // Cập nhật nội dung HTML vào phần tử với ID 'content'--%>
<%--            // // document.getElementById('content').innerHTML = html;--%>
<%--            //         document.getElementById('content').value = DOMPurify.sanitize(htmlContent,--%>
<%--            //             {USE_PROFILES: {html: true}});--%>
<%--            //--%>
<%--            // // Log nội dung HTML đã render--%>
<%--            // console.log(htmlContent);--%>
<%--                    var markdownContent = simplemde.value(); // Lấy nội dung Markdown từ trình soạn thảo--%>

<%--                    // Chuyển đổi Markdown thành HTML bằng marked.js--%>
<%--                    var htmlContent = marked(markdownContent);--%>

<%--                    // Dùng DOMPurify để tránh XSS--%>
<%--                    var sanitizedContent = DOMPurify.sanitize(htmlContent, { USE_PROFILES: { html: true } });--%>

<%--                    // Cập nhật nội dung HTML vào input hidden--%>
<%--                    document.getElementById('content').value = sanitizedContent;--%>

<%--                    // Debug: Kiểm tra nội dung đã render--%>
<%--                    console.log("HTML đã render:", sanitizedContent);--%>

<%--        });--%>
<%--    </script>--%>

<script>
    function checkAddA(){

        var  id = document.getElementById('id').value
        var name = document.getElementById('name').value

        if(id.length ==0 || name.length ==0){
            document.getElementById('error_text').innerHTML = 'Các trường dữ liệu không được bỏ trống'
            document.getElementById('block_error').style.display = 'flex'
            return false
        }
        else{

            // document.getElementById('content').value = content


            return true
        }


    }
</script>
</body>

</html>