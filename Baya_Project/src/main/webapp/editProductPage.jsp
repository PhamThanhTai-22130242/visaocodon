<%@ page import="java.util.List" %>
<%@ page import="com.baya.baya_project.service.ProductAdminService" %>
<%@ page import="com.baya.baya_project.Model.*" %>
<%@ page import="java.util.ArrayList" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/fontawesome.min.js">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <script src="https://kit.fontawesome.com/68512d5542.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="assets/css/layout/styleAdmin.css">
</head>
<style>
    .block_error{
        display: none;
    }
    .block_error-message{
        display: flex;
    }
    .block_error {


        align-items: center;
        border-radius: 5px;
        justify-content: center;
        height: 40px;
        width: 100%;
        background-color: #ffced2;
    }

    .block_error p {
        color: #dd2f2c;


    }
</style>
<body>
<% Product product = (Product) request.getAttribute("product");
    Specification specification = (Specification) request.getAttribute("specification");
    List<SubImage> subImageList = (List<SubImage>) request.getAttribute("subImageList");

%>
<div class="wrapper">
    <jsp:include page="SharedViews/SideBarAdmin.jsp" />
    <!-- phần main -->
    <div class="container addproduct-container">
        <div class="row">
            <nav aria-label="breadcrumb">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="adminPage.html"><i class="fa-solid fa-house "
                                                                            style="margin:2px ;"></i>Tổng Quan</a></li>
                    <li class="breadcrumb-item"><a href="productsPage.jsp"> <i class="fa-solid fa-chair"
                                                                               style="margin:2px ;"></i>Danh Sách Sản Phẩm</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Chỉnh Sửa Sản Phẩm</li>
                </ul>
            </nav>
        </div>
        <div class="row header-addproduct">
            <div class="col-12">
                <div class="title-addproduct">
                    Chỉnh Sửa Sản Phẩm
                </div>
            </div>
        </div>
        <div class="row main-addproduct mt-3">
            <form class="form-addproduct d-flex"  action="EditProduct"  method="POST" enctype="multipart/form-data" onsubmit="return checkForm()" >
                <div class="col-12 col-md-6 addproduct-form-left">
                    <!-- Ảnh chính -->
                    <div class="mb-1">
                        <div class="form-img-left">
                            <label for="form-img-upload" style="display: block;">Thumbnail </label>
                            <input id="form-img-upload" onchange="chooseFile1(this)" name="upload" type="file"
                                   accept=".png, .jpg, .jpeg" required>
                            <img id="img-up" style="display: block;" src="<%=subImageList.get(0).getImage()==null ? "Defaut.jpg":subImageList.get(0).getImage()%>" alt="">
                        </div>
                        <!-- Nút thêm -->
                        <!-- Chọn Danh Mục Chính -->
                        <div class="mb-1">
                            <label for="category" class="form-label">Danh Mục Chính</label>
                            <select class="form-select" id="category" name="catefather">
                                <% List<Category> listCate = ProductAdminService.getListCategory();
                                    for(Category c: listCate){%>
                                <option value="<%=c.getCategoryID()%>"><%=c.getName()%></option>
                                <%}%>
                            </select>
                        </div>

                        <%--                        <!-- Nhập Danh Mục Mới (Hiển thị khi chọn 'Khác') -->--%>
                        <%--                        <div class="mb-1 new-category-input">--%>
                        <%--                            <label for="newCategory" class="form-label color-input">Nhập Danh Mục Mới</label>--%>
                        <%--                            <input type="text" class="form-control" id="newCategory" placeholder="Nhập danh mục mới">--%>
                        <%--                        </div>--%>

                        <!-- Chọn Danh Mục Con -->
<%--                        <div class="mt-3 mb-1">--%>
<%--                            <label for="subCategory" class="form-label">Danh Mục Con</label>--%>
<%--                            <select class="form-select" id="subCategory" name="catebaby"  >--%>
<%--                                <% List<SubCategory> listSub = ProductAdminService.getListSubCategory();--%>
<%--                                    for(SubCategory s: listSub){%>--%>
<%--                                <option value="<%=s.getSubCategoryID()%>"><%=s.getName()%></option>--%>
<%--                                <%}%>--%>
<%--                            </select>--%>
<%--                        </div>--%>


                        <!-- Nhập Danh Mục Con Mới (Hiển thị khi chọn 'Khác') -->
                        <%--                        <div class="mb-1 new-subcategory-input">--%>
                        <%--                            <label for="newSubCategory" class="form-label c">Nhập Danh Mục Con Mới</label>--%>
                        <%--                            <input type="text" class="form-control color-input" id="newSubCategory" placeholder="Nhập danh mục con mới">--%>
                        <%--                        </div>--%>

                        <!-- Ảnh liên quan -->
                        <%--                            <div class="mb-1">--%>
                        <%--                                <label for="related-images" class="form-label">Ảnh liên quan:</label>--%>
                        <%--                                <input type="file" class="form-control" id="related-images" name="related_images[]" accept="image/*" multiple>--%>
                        <%--                                <small id="image-help" class="form-text text-muted">thêm 3 ảnh.</small>--%>
                        <%--                            </div>--%>
                        <div class="mt-3" style="color: #007bff"><strong>Lưu ý: Nên thêm ảnh độ phân giả HD,kích thức 720x1080</strong></div>
                        <div class="wrap mt-3">

                            <div class="dandev-reviews">
                                <div class="form__input form_upload " >
                                    <label class="dandev_insert_attach "  style=" color: white; border-radius: 5px;background-color: #3bacf0; padding: 2px" required>Thêm hình ảnh liên quan</label>
                                </div>
                                <div class="list_attach" >
                                    <ul class="dandev_attach_view">
                                    </ul>
                                    <span class="dandev_insert_attach"><i class="dandev-plus"></i></span>
                                </div>
                            </div>
                        </div>
                        <div id="related-images-preview" class="mt-2"></div>
                        <%
                            String error = (String) request.getAttribute("Error");
                            String message = error != null ? error : "";
                        %>

                        <% if (message != null && !message.isEmpty()) { %>
                        <div class="block_error" style="display: block !important;">
                            <p><%= message %></p>
                        </div>
                        <% } else { %>
                        <div class="block_error" id="block_error">
                            <p id="error_text"></p>
                        </div>
                        <% } %>

                    </div>
                </div>
                <div class="col-12 col-md-6 addproduct-form-right">

                    <!-- Tên sản phẩm -->
                    <div class="mb-1">
                        <label for="product-name" class="form-label ">Tên Sản Phẩm</label>
                        <input type="text" class="form-control input-size-addproduct color-input" id="product-name"
                               name="pname"  placeholder="Nhập tên sản phẩm" value="<%=product.getName()%>" >
                        <span class="insertText" style="color: red; font-style: italic"><%= error != null ? error:""%></span>
                        <div id="product-name-error" style="color: red; display: none;">Vui lòng nhập tên sản phẩm.</div>
                    </div>
                    <!-- Mã sản phẩm-->
                    <div class="mb-1">
                        <label  class="form-label">Mã Sản Phẩm</label>
                        <input type="text" class="form-control input-size-addproduct color-input" style="background-color: dimgray; "id="product-code"
                               name="pcode"  placeholder="Nhập Mã Sản Phẩm" value="<%=product.getProductID()%>"  readonly>
                    </div>


                    <!-- Mô tả -->
                    <div class="mb-1">
                        <label for="material" class="form-label ">Mô Tả Sản Phẩm</label>
                        <textarea type="text" class="form-control input-size-addproduct color-input" id="product-description" style="height: 200px;"
                                  name="pdescription"   placeholder="Nhập Mô Tả Sản Phẩm" ><%=product.getDescription()%></textarea>
                    </div>
                    <!-- Tiêu chuẩn-->
                    <div class="mb-1">
                        <label for="material" class="form-label ">Tiêu Chuẩn</label>
                        <input type="text" class="form-control input-size-addproduct color-input" id="product-standard"
                               name="ptieuchuan"  placeholder="Nhập Mô Tả Sản Phẩm" value="<%=specification.getStandard()%>"  >
                    </div>


                    <!-- Chất liệu -->
                    <div class="mb-1">
                        <%--@declare id="materialproduct"--%><label for="materialproduct" class="form-label ">Chất Liệu</label>
                        <input type="text" class="form-control input-size-addproduct color-input" id="product-material"
                               name="pmaterial"  placeholder="Nhập chất liệu sản phẩm" value="<%=specification.getMaterial()%>" >
                    </div>
                    <!-- Chất liệu -->
                    <div class="mb-1">
                        <label for="sizeproduct" class="form-label ">Kích Thước</label>
                        <input type="text" class="form-control input-size-addproduct color-input" id="product-size"
                               name="psize" placeholder="Nhập kích thước sản phẩm" value="<%=specification.getDimensions()%>">
                    </div>

                    <!-- Xuất xứ -->
                    <div class="mb-1">
                        <label for="origin" class="form-label">Xuất Xứ</label>
                        <input type="text" class="form-control input-size-addproduct color-input" id="product-origin"
                               name="porigin"  placeholder="Nhập xuất xứ sản phẩm" value="<%=specification.getOriginal()%>" >
                    </div>

                    <!-- Số lượng -->
                    <div class="mb-1">
                        <label for="quantity" class="form-label">Số Lượng Trong Kho</label>
                        <input type="number" class="form-control input-size-addproduct color-input" id="product-quantity" value="<%=product.getQuanlityStock()%>"
                               name="pquanlity"  placeholder="Nhập số lượng sản phẩm" >
                    </div>

                    <!-- Giá -->
                    <div class="mb-1">
                        <label for="product-price" class="form-label">Giá</label>
                        <input type="number" class="form-control input-size-addproduct color-input" id="product-price" value="<%=product.getPrice()%>"
                               name="pprice"   placeholder="Nhập giá sản phẩm" required>
                    </div>
                    <!-- ngày tạo -->
<%--                    <div class="mb-1 new-date-input">--%>
<%--                        <label for="createDate" class="form-label">Ngày Tạo</label>--%>
<%--                        <input type="date" class="form-control input-size-addproduct" name="pcreatedate" id="createDate" placeholder="Chọn ngày tạo" value="<%=product.getCreateAt()%>">--%>
<%--                    </div>--%>

                    <button type="submit" class="btn btn-primary btn-light " style="color: white;" id="btn-addproduct">Lưu Sản Phẩm</button>
                </div>
            </form>
        </div>
        <div class="row footer-addproduct">

        </div>
    </div>
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
    // Hiển thị ảnh thumbnail khi chọn file
    // function chooseFile1(input) {
    //     const file = input.files[0];
    //     const imgPreview = document.getElementById('form-img-left');
    //     const label = document.getElementById('thumbnail-label');
    //
    //     if (file) {
    //         const reader = new FileReader();
    //
    //         reader.onload = function(e) {
    //             imgPreview.src = e.target.result;
    //             imgPreview.style.display = 'block';
    //             label.style.display = 'none';// Hiển thị ảnh sau khi chọn
    //         };
    //
    //         reader.readAsDataURL(file);
    //     }
    // }
    function chooseFile1(input) {
        var file = input.files[0]; // Lấy tệp người dùng chọn
        if (file) {
            var reader = new FileReader();

            reader.onload = function(e) {
                console.log(e.target.result); // Kiểm tra dữ liệu ảnh
                var imgElement = document.getElementById('img-up');
                imgElement.src = e.target.result; // Cập nhật ảnh
            };

            reader.readAsDataURL(file); // Đọc ảnh dưới dạng DataURL
        }
    }



    /*==============================
    hiển thị file
    ==============================*/
    document.querySelector('.dandev_insert_attach').addEventListener('click', function() {
        var listAttach = document.querySelector('.list_attach');
        if (!listAttach.classList.contains('show-btn')) {
            listAttach.classList.add('show-btn');
        }

        var lastImg = document.querySelector('.dandev_attach_view li:last-child input[type="file"]')?.value;

        if (lastImg !== '') {
            var time = 0;
            var li = document.createElement('li');
            li.id = 'li_files_' + (time++);
            li.classList.add('li_file_hide');

            var imgWrap = document.createElement('div');
            imgWrap.classList.add('img-wrap');
            var closeBtn = document.createElement('span');
            closeBtn.classList.add('close');
            closeBtn.textContent = '×';
            closeBtn.addEventListener('click', function() {
                DelImg(this);
            });

            var imgWrapBox = document.createElement('div');
            imgWrapBox.classList.add('img-wrap-box');

            imgWrap.appendChild(closeBtn);
            imgWrap.appendChild(imgWrapBox);

            var div = document.createElement('div');
            var fileInput = document.createElement('input');
            fileInput.type = 'file';
            fileInput.classList.add('hidden');
            fileInput.accept = '.png, .jpg, .jpeg';
            fileInput.name = 'upload';
            fileInput.addEventListener('change', function() {
                uploadImg(this);
            });

            div.appendChild(fileInput);

            li.appendChild(imgWrap);
            li.appendChild(div);

            document.querySelector('.dandev_attach_view').appendChild(li);
            fileInput.click();
        } else {
            if (lastImg === '') {
                var lastFileInput = document.querySelector('.dandev_attach_view li:last-child input[type="file"]');
                if (lastFileInput) {
                    lastFileInput.click();
                }
            } else {
                if (listAttach.classList.contains('show-btn')) {
                    listAttach.classList.remove('show-btn');
                }
            }
        }
    });

    function uploadImg(el) {
        var fileData = el.files[0];
        if (!fileData) return;

        var fileReader = new FileReader();

        fileReader.onload = function(fileLoadedEvent) {
            var srcData = fileLoadedEvent.target.result;

            var newImage = document.createElement('img');
            newImage.src = srcData;
            // Thêm mã thay đổi kích thước ảnh ở đây:
            newImage.style.width = '50px';   // Đặt chiều rộng ảnh
            newImage.style.height = '50px';  // Đặt chiều cao ảnh
            newImage.style.objectFit = 'cover';

            var li = el.closest('li');
            if (li && li.classList.contains('li_file_hide')) {
                li.classList.remove('li_file_hide');
            }

            var imgWrapBox = li.querySelector('.img-wrap-box');
            if (imgWrapBox) {
                imgWrapBox.appendChild(newImage);
            }
        };

        fileReader.readAsDataURL(fileData);
    }

    function DelImg(el) {
        var li = el.closest('li');
        if (li) {
            li.remove();
        }
    }

    function chooseFile(fileInput) {
        if (fileInput.files && fileInput.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                var formImg = document.getElementById('form__img');
                if (formImg) {
                    formImg.src = e.target.result;
                }
            };
            reader.readAsDataURL(fileInput.files[0]);
        }
    }
    function validateForm() {
        let isValid = true;

        // Kiểm tra Tên sản phẩm
        let productName = document.getElementById('product-name').value;
        if (!productName) {
            document.getElementById('product-name-error').style.display = 'block';
            isValid = false;
        } else {
            document.getElementById('product-name-error').style.display = 'none';
        }

        function changeHref(link) {
            location.href = link;
        }
    }
    function checkForm() {

        var name = document.getElementById('product-name').value;
        var code = document.getElementById('product-code').value;
        var description = document.getElementById('product-description').value;
        var standard = document.getElementById('product-standard').value;
        var matiral = document.getElementById('product-material').value;
        var origin = document.getElementById('product-origin').value;
        var size = document.getElementById('product-size').value;
        var price = document.getElementById('product-price').value;
        var quanlity = document.getElementById('product-quantity').value;

        if (!name.trim() || !code.trim() || !description.trim() || !standard.trim() ||
            !matiral.trim() || !origin.trim() || !size.trim() || !price.trim()||!quanlity.trim())  {
            document.getElementById('block_error').style.display = 'flex'
            document.getElementById('error_text').innerHTML = 'Các trường dữ liệu không được bỏ trống, vui lòng nhập đủ thông tin'
            return false;
        }
        else {

            return true;
        }}
</script>
</body>

</html>