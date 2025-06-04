<%@ page import="com.baya.baya_project.Model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.baya.baya_project.service.UserAdminService" %>
<%@ page import="com.baya.baya_project.Model.Roles" %>
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

    <div class="wrapper">
        <jsp:include page="SharedViews/SideBarAdmin.jsp" />

        <!-- phần main -->
        <div class="container edituser-container mb-3">
            <div class="row">
                <nav aria-label="breadcrumb">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="adminPage.html"><i class="fa-solid fa-house"
                                    style="margin:2px ;"></i>Tổng Quan</a></li>
                        <li class="breadcrumb-item"><a href="userPage.jsp"> <i class="fa-solid fa-person"
                                                                               style="margin:2px ;"></i>Danh Sách Người Dùng</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Chỉnh Sửa Người Dùng</li>
                    </ul>
                </nav>
            </div>
            <div class="row header-edituser">
                <div class="col-12">
                    <div class="title-edituser">
                        Chỉnh Sửa Người Dùng
                    </div>
                </div>
            </div>
            <div class="row name-edituser-container mt-3">
                <div class="col-12">
                    <div class="">
                        <% User user = (User) request.getAttribute("user");%>
                        <div class=" d-flex">
                            <span>ID:</span>
                            <p class="id-edituser padding-left "><%=user.getUserID()%></p>
                        </div>
                        <div class="d-flex">
                            <span class="">Tên Người Dùng:</span>
                            <p class="name-edituser padding-left"><%=user.getFullName()%></p>
                        </div>

                    </div>
                    <ul class="nav nav-pills" id="myTab" roles="tablist">
                        <li class="nav-item" roles="presentation">
                            <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home"
                                type="button" roles="tab" aria-controls="home" aria-selected="true">Thông Tin</button>
                        </li>
<%--                        <li class="nav-item" roles="presentation">--%>
<%--                            <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#order-tab"--%>
<%--                                type="button" roles="tab" aria-controls="profile" aria-selected="false">Đơn Hàng</button>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item" roles="presentation">--%>
<%--                            <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#comment-tab"--%>
<%--                                type="button" roles="tab" aria-controls="contact" aria-selected="false">Bình--%>
<%--                                Luận</button>--%>
<%--                        </li>--%>
                    </ul>
                </div>
            </div>
            <div class="row main-edituser mt-3 ">
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" roles="tabpanel" aria-labelledby="home-tab">
                        <h4 class="mb-3 mt-3 bold-text">Thông Tin Của Người Dùng</h4>
                        <form action="editUser"  method="POST" class="form-edituser" onsubmit="return checkForm()">
                            <div class="col-12 col-md-6 edituser-form-right">
                                <input type="hidden" id="roleId" value="<%=user.getUserID()%>" name="uid">
                                <!-- Tên người dùng -->
                                <div class="mb-3">
                                    <label for="user-name" class="form-label">Tên Người Dùng</label>
                                    <input type="text" class="form-control input-size-edituser" id="user-name"
                                        placeholder="Chỉnh sửa tên người dùng" value="<%=user.getFullName()%>" name="uname">
                                </div>
                                <!-- Email -->
                                <div class="mb-3">
                                    <label for="user-email" class="form-label">Email</label>
                                    <input type="email" class="form-control input-size-edituser" id="user-email"
                                           name="uemail"   placeholder="Chỉnh sửa email người dùng" value="<%=user.getEmail()%>" >
                                </div>
                                <!-- Mật khẩu (tùy chọn) -->
                                <div class="mb-3">
                                    <label for="user-password" class="form-label">Mật khẩu</label>
                                    <input type="password" class="form-control input-size-edituser" id="user-password"
                                           name="upassword"     placeholder="Nhập mật khẩu mới " value="<%=user.getPassword()%>">
                                </div>

                                <!-- Số điện thoại -->
                                <div class="mb-3">
                                    <label for="user-phone" class="form-label">Số Điện Thoại</label>
                                    <input type="number" class="form-control input-size-edituser" id="user-phone"
                                           name="uphone"  placeholder="Chỉnh sửa số điện thoại người dùng" value="<%=user.getPhoneNumber()%>" >
                                </div>
                                <!-- Vai trò -->
                                <div class="mb-3">
                                    <label for="user-roles" class="form-label">Quyền</label>
                                    <select class="form-select input-size-edituser" id="user-roles" name="urole"  required>
                                        <%
                                            List<Roles> listRoles = (List<Roles>) request.getAttribute("roles");

                                            if (listRoles == null || listRoles.isEmpty()) {
                                                System.out.println("Không có vai trò.");
                                            } else {
                                                for (Roles s : listRoles) {
                                                    String roleName = "";
                                                    if (s.getRoleID() == 0) {
                                                        roleName = "Quản trị viên";
                                                    } else if (s.getRoleID() == 1) {
                                                        roleName = "Người dùng";
                                                    } else {
                                                        roleName = s.getName(); // Nếu không phải ID 0 hoặc 1, hiển thị tên mặc định
                                                    }
                                        %>
                                        <option value="<%= s.getRoleID() %>"><%= roleName %></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
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


                                <button type="submit" class="btn btn-primary btn-light" data-bs-toggle=""
                                    data-bs-target="" style="color: white;" id="btn-edituser">Lưu Thay Đổi</button>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane fade mt-3" id="order-tab" roles="tabpanel" aria-labelledby="profile-tab">
                        <div class="col-12">
                            <h4 class="mb-3 bold-text">Danh Sách Đơn Hàng Của Người Dùng</h4>
                            <table class="table table-bordered table-striped">
                                <thead class="table-dark">
                                    <tr>
                                        <th>STT</th>
                                        <th>Khách Hàng</th>
                                        <th>Ngày Đặt</th>
                                        <th>Địa Chỉ Giao</th>
                                        <th>Ghi Chú</th>
                                        <th>Thành Tiền</th>
                                        <th>Trạng Thái ĐH</th>
                                        <th>Tùy Chọn</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Nguyễn Văn A</td>
                                        <td>2024-11-25</td>
                                        <td>Hà Nội, Việt Nam</td>
                                        <td>Ghế sofa phòng khách</td>
                                        <td>5,000,000 VND</td>
                                        <td><span class="badge bg-secondary">Chờ xác nhận</span></td>
                                        <td>
                                            <button class="btn btn-success btn-sm" data-bs-toggle="modal"
                                                data-bs-target="#confirmOrderModal"><i
                                                    class="fa-solid fa-check"></i></button>
                                            <a href=""><button class="btn btn-info btn-sm"><i
                                                        class="fa-solid fa-circle-info"></i></button></a>
                                            <a href="editOrderPage.jsp"><button class="btn btn-warning btn-sm"><i
                                                        class="fa-solid fa-pen-to-square"></i></button></a>
                                            <button class="btn btn-danger btn-sm btn-delete"><i
                                                    class="fa-solid fa-trash"></i></button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="comment-tab" roles="tabpanel" aria-labelledby="contact-tab">
                        <div class="col-12 mt-3">
                            <h4 class="mb-3 bold-text">Danh Sách Bình Luận Của Người Dùng</h4>
                            <table class="table table-bordered table-striped">
                                <thead class="table-dark">
                                    <tr>
                                        <th scope="col">Mã Khách Hàng</th>
                                        <th scope="col">Sản Phẩm Đã Bình Luận</th>
                                        <th scope="col">Tên Khách Hàng</th>
                                        <th scope="col">Nội Dung Bình Luận</th>
                                        <th scope="col">Ngày Tạo</th>
                                        <th scope="col">Tùy Chọn</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>KH001</td>
                                        <td>Điện Thoại iPhone 13</td>
                                        <td>Nguyễn Văn A</td>
                                        <td>Sản phẩm rất tốt, tôi rất hài lòng!</td>
                                        <td>2024-11-20</td>
                                        <td>
                                            <button class="btn btn-danger btn-sm btn-delete-order"><i
                                                    class="fa-solid fa-trash"></i></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>KH001</td>
                                        <td>Laptop Dell XPS 15</td>
                                        <td>Nguyễn Văn A</td>
                                        <td>Thiết kế đẹp, hiệu năng mạnh mẽ!</td>
                                        <td>2024-11-21</td>
                                        <td>
                                            <button class="btn btn-danger btn-sm btn-delete-order"><i
                                                    class="fa-solid fa-trash"></i></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>KH001</td>
                                        <td>Máy Giặt LG</td>
                                        <td>Nguyễn Văn A</td>
                                        <td>Máy chạy êm, tiết kiệm điện năng.</td>
                                        <td>2024-11-22</td>
                                        <td>
                                            <button class="btn btn-danger btn-sm btn-delete-order"><i
                                                    class="fa-solid fa-trash"></i></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>KH001</td>
                                        <td>Tai Nghe Sony WH-1000XM5</td>
                                        <td>Nguyễn Văn A</td>
                                        <td>Chất âm tuyệt vời, chống ồn tốt.</td>
                                        <td>2024-11-23</td>
                                        <td>
                                            <button class="btn btn-danger btn-sm btn-delete-order"><i
                                                    class="fa-solid fa-trash"></i></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>KH001</td>
                                        <td>Tủ Lạnh Samsung</td>
                                        <td>Nguyễn Văn A</td>
                                        <td>Dung tích lớn, phù hợp gia đình.</td>
                                        <td>2024-11-24</td>
                                        <td>
                                            <button class="btn btn-danger btn-sm btn-delete-order"><i
                                                    class="fa-solid fa-trash"></i></button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row footer-edituser">

            </div>
        </div>
        <!-- end edituser-container -->

    </div>

    <!-- Phần modal popup thông báo xác nhận chỉnh sửa người dùng -->
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Xác Nhận Chỉnh Sửa</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn có chắc chắn muốn Lưu thông tin người dùng này không?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button type="button" class="btn btn-success" id="confirmEditBtn">Đồng Ý</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Phần modal popup thông báo xác nhận xóa -->
    <!-- Modal xác nhận xóa -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Xác Nhận Xóa</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn có chắc chắn muốn xóa đơn hàng này không?
                </div>
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
    <!-- Phần modal popup thông báo xác nhận xóa -->
    <!-- Modal xác nhận xóa bình luận -->
    <div class="modal fade" id="deleteOrderModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Xác Nhận Xóa</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn có chắc chắn muốn xóa bình luận này không?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Đồng Ý</button>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/scriptAdmin.js"></script>
</body>
<script>
    function checkForm() {

        var name = document.getElementById('user-name').value;
        var code = document.getElementById('user-email').value;
        var description = document.getElementById('user-password').value;
        var standard = document.getElementById('user-phone').value;


        if (!name.trim() || !code.trim() || !description.trim() || !standard.trim() )  {
            document.getElementById('block_error').style.display = 'flex'
            document.getElementById('error_text').innerHTML = 'Các trường dữ liệu không được bỏ trống, vui lòng nhập đủ thông tin'
            return false;
        }
        else {

            return true;
        }}
</script>
</html>