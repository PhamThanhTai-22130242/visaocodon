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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/fontawesome.min.js">
    <script src="https://kit.fontawesome.com/68512d5542.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="assets/css/layout/styleAdmin.css">
</head>

<body>
    <div class="wrapper">
        <jsp:include page="SharedViews/SideBarAdmin.jsp" />

        <!-- phần main -->
        <div class="container adduser-container">
            <div class="row">
                <nav aria-label="breadcrumb">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="adminPage.html"><i class="fa-solid fa-house"
                                    style="margin:2px ;"></i>Tổng Quan</a></li>
                        <li class="breadcrumb-item"><a href="userPage.jsp"> <i class="fa-solid fa-person"
                                                                               style="margin:2px ;"></i>Danh Sách Người Dùng</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Thêm Người Dùng</li>
                    </ul>
                </nav>
            </div>
            <div class="row header-adduser">
                <div class="col-12">
                    <div class="title-adduser">
                        Thêm Người Dùng
                    </div>
                </div>
            </div>
            <div class="row main-adduser mt-3">
                <form action="" class="form-adduser ">
                    <div class="col-12 col-md-6 adduser-form-right">
                        <!-- Tên người dùng -->
                        <div class="mb-3">
                            <label for="user-name" class="form-label">Tên Người Dùng</label>
                            <input type="text" class="form-control input-size-adduser" id="user-name"
                                placeholder="Nhập tên người dùng" required>
                        </div>

                        <!-- Email -->
                        <div class="mb-3">
                            <label for="user-email" class="form-label">Email</label>
                            <input type="email" class="form-control input-size-adduser" id="user-email"
                                placeholder="Nhập email người dùng" required>
                        </div>

                        <!-- Số điện thoại -->
                        <div class="mb-3">
                            <label for="user-phone" class="form-label">Số Điện Thoại</label>
                            <input type="text" class="form-control input-size-adduser" id="user-phone"
                                placeholder="Nhập số điện thoại người dùng" required>
                        </div>
                           <!-- Tài Khoản -->
                        <div class="mb-3">
                            <label for="user-name" class="form-label">Tài Khoản</label>
                            <input type="text" class="form-control input-size-adduser" id="user-name"
                                placeholder="Nhập tên người dùng" required>
                        </div>

                        <!-- Mật khẩu -->
                        <div class="mb-3">
                            <label for="user-password" class="form-label">Mật khẩu</label>
                            <input type="password" class="form-control input-size-adduser" id="user-password"
                                placeholder="Nhập mật khẩu người dùng" required>
                        </div>

                        <!-- Vai trò -->
                        <div class="mb-3">
                            <label for="user-roles" class="form-label">Quyền</label>
                            <select class="form-select input-size-adduser" id="user-roles" required>
                                <option value="" disabled selected>Chọn vai trò người dùng</option>
                                <option value="admin">Quản trị viên</option>
                                <option value="staff">Nhân viên</option>
                                <option value="customer">Khách hàng</option>
                            </select>
                        </div>

                        <!-- Trạng thái tài khoản -->
                        <div class="mb-3">
                            <label for="user-status" class="form-label">Trạng Thái Tài Khoản</label>
                            <select class="form-select input-size-adduser" id="user-status" required>
                                <option value="active">Kích hoạt</option>
                                <option value="locked">Bị khóa</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary btn-light" style="color: white;" id="btn-adduser">Thêm Người Dùng</button>
                    </div>
                </form>
            </div>
            <div class="row footer-adduser">

            </div>
        </div>
        <!-- end adduser-container -->

    </div>

    <!-- Phần modal popup thông báo xác nhận thêm người dùng -->
    <div class="modal fade" id="add-modal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addModalLabel">Xác Nhận Thêm</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn có chắc chắn muốn thêm người dùng này không?
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
    <script src="../assets/js/scriptAdmin.js"></script>
</body>

</html>
