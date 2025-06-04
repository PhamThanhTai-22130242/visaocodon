<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Tin Tức</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/fontawesome.min.js">
    <script src="https://kit.fontawesome.com/68512d5542.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css">
    <script src="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"></script>

    <link rel="stylesheet" href="assets/css/layout/styleAdmin.css">
    <style>

        <jsp:include page="SharedViews/block_error.jsp" />

    </style>


    <script src="assets/ckeditor/ckeditor.js"></script>

</head>

<body>
<div class="wrapper">
    <jsp:include page="SharedViews/SideBarAdmin.jsp" />
    <!-- phần main -->
    <div class="container addnew-container">
        <div class="row">
            <nav aria-label="breadcrumb">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="adminPage.html"><i class="fa-solid fa-house "
                                                                            style="margin:2px ;"></i>Tổng Quan</a></li>
                    <li class="breadcrumb-item"><a href="newsPage.jsp"> <i class="fa-solid fa-chair"
                                                                           style="margin:2px ;"></i>Danh Sách Tin Tức</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Chỉnh sửa bài viết</li>
                </ul>
            </nav>
        </div>
        <div class="row header-addproduct">
            <div class="col-12">
                <div class="title-addproduct">
                    Chỉnh sửa bài viết
                </div>
            </div>
        </div>
        <div class="row  main-addnew mt-3">
            <form action="/editArticle" method="get" class="form-addnew d-flex" onsubmit="return checkAddArticle()">

                <div class="col-12 form_right " >

                    <div class="block_error " id="block_error">
                        <p  id="error_text"></p>

                    </div>
                    <!-- Tên tin tức -->

                    <div class="mb-1">
                        <label  class="form-label">Tiêu Đề bài viết</label>
                        <input type="text" class="form-control color-input size_textarea" value="${news.title}"id="title" name="title"
                               >
                    </div>
                    <input  type="hidden" name="newsID" value="${news.newsID}">
                    <div class="mb-1">
                        <label  class="form-label">Hình ảnh bài viết</label>
                        <input type="text" class="form-control color-input size_textarea"
                              name="thumbnail" id="thumbnail" value="${news.thumbnail}">
                    </div>
                    <div class="mb-1">
                        <label  class="form-label">Lựa chọn loại bài viết</label>
                        <select class="form-select" aria-label="Default select example" name="newsTypeID" id="newsTypeID" >
                            <option value="0" >Vui lòng chọn</option>
                            <c:forEach items="${listType}" var="type">


                                <option value="${type.newsTypeID}">${type.name}</option>
                            </c:forEach>

                        </select>
                    </div>

                    <!-- Nội dung -->
                    <div class="mb-1">
                        <label class="form-label ">Nội Dung Tin Tức</label>
                        <!-- <textarea type="text" class="form-control size_textarea color-input ckeditor_height "
                            id="material" style="height: 200px;" placeholder="Nhập Nội Dung Tin Tức"
                            required></textarea> -->
                        <textarea name="content" id="ckeditor"
                        ${news.content}
                                  class="form-control size_textarea color-input ckeditor_height "
                                  style="height: 800px;"></textarea>


                    </div>
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
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/scriptAdmin.js"></script>

<script>
    function checkAddArticle(){

        var  title = document.getElementById('title').value
        var thumbnail = document.getElementById('thumbnail').value
        var content = document.getElementById('markdown-editor').value

        var typeId = document.getElementById('newsTypeID').value
        console.log(content)
        if(typeId == 0 ){
            document.getElementById('error_text').innerHTML = 'Vui lòng lựa chọn loại bài viết'
            document.getElementById('block_error').style.display = 'flex'
            return false
        }
        if(title.length ==0 || thumbnail.length ==0|| content.length == 0){
            document.getElementById('error_text').innerHTML = 'Các trường dữ liệu không đuơcj bỏ trống'
            document.getElementById('block_error').style.display = 'flex'
            return false
        }
        else{

            document.getElementById('content').value = content

            console.log( "value cua name content: " +document.getElementById('content').value)
            return true
        }


    }
</script>
<script>

    var editor = CKEDITOR.replace('ckeditor');
    var htmlContent;
    // editor.on('change', function() {
    htmlContent = editor.getData();

    var decodedContent = $('<div/>').html(htmlContent).text();
    document.getElementById('content').value =decodedContent

    // Cập nhật giá trị HTML mới từ CKEditor
    console.log(htmlContent);  // In ra giá trị HTML trong console (hoặc bạn có thể xử lý theo cách khác)
    // });

</script>

</body>

</html>