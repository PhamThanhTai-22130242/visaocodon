<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 04/10/25
  Time: 4:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Phiếu nhập kho</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .table td, .table th {
            vertical-align: middle;
        }
    </style>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</head>
<body>

<div class="container mt-4">
    <h3 class="text-center mb-4">Phiếu nhập kho</h3>

    <form action="nhapKhoServlet" method="post">
        <div class="form-row mb-3">
            <div class="col-md-3">
                <label>Chọn loại nhập</label>
                <select class="form-control" id="receiptType">
                    <option value="nhập từ nhà cung cấp">Nhập mua</option>
                    <option value="trả từ khách hàng">Trả hàng</option>
                    <option value="điều chỉnh">Điều chỉnh</option>
                </select>
            </div>
            <div class="col-md-6">
                <label>Ghi chú</label>
                <input type="text" class="form-control" id="note">
            </div>
        </div>

        <div class="form-row mb-3">

            <div class="col-md-6">
                <label>Chọn mặt hàng</label>
                <select class="form-control" id="productId">
                    <option value="">-- Chọn mặt hàng --</option>

                    <c:forEach var="p" items="${requestScope.products}">
                        <option value="${p.productID}"   data-price="${p.price}">${p.name}</option>
                    </c:forEach>
                </select>

                <input type="number" id="quantity" name="quantity" class="form-control mt-3 col-md-3" value="1" min="1">


            </div>


        </div>

        <div class="button-row">
            <button type="button" class="btn btn-success" id="btn-add-item">+ Thêm mục đã chọn</button>

            <input type="file" name="excelFile" id="excelFileInput" style="display: none;" accept=".xls,.xlsx">
            <button type="button" class="btn btn-success" id="importExcelBtn">
                <i class="fa-solid fa-file-excel me-2"></i>
            </button>

        </div>
<style>
    .button-row {
        display: flex;
        align-items: center;
        gap: 15px;
        margin-bottom: 1rem;
    }
</style>

        <table class="table table-bordered"  id="itemTable">
            <thead class="thead-light">
            <tr>
                <th>Name</th>
                <th>Số lượng</th>
                <th>Giá</th>
                <th>Tổng giá</th>
                <th>Loại nhập</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody id="itemTableBody">
            <!-- Dòng mới sẽ được thêm ở đây -->
            </tbody>        </table>

        <div class="text-right">
            <button type="button" id="btnSubmit" class="btn btn-primary">Nhập kho</button>
        </div>
    </form>
</div>
<script>
    const notyf = new Notyf();

    document.getElementById("importExcelBtn").addEventListener("click", function () {
        document.getElementById("excelFileInput").click();
    });

    document.getElementById("excelFileInput").addEventListener("change", function () {
        const file = this.files[0];
        if (!file) {
            notyf.error("Vui lòng chọn file Excel");
            return;
        }

        const reader = new FileReader();
        reader.onload = function (e) {
            const data = new Uint8Array(e.target.result);
            const workbook = XLSX.read(data, { type: "array" });
            const sheet = workbook.Sheets[workbook.SheetNames[0]];
            const jsonData = XLSX.utils.sheet_to_json(sheet, { header: 1 });

            console.log("🔍 Dữ liệu Excel:", jsonData);

            for (let i = 1; i < jsonData.length; i++) {
                const row = jsonData[i];

                const productId = (row[0] || "").toString().trim();
                const quantity = parseInt(row[2]);
                const note = (row[3] || "").toLowerCase();

                if (!productId || isNaN(quantity) || quantity <= 0) {
                    console.warn(`⚠️ Bỏ qua dòng ${i + 1} vì dữ liệu không hợp lệ`);
                    continue;
                }

                const option = $('#productId option').filter(function () {
                    return $(this).val().trim() === productId;
                });

                if (option.length === 0) {
                    notyf.error(`Sản phẩm ID ${productId} không tồn tại`);
                    continue;
                }

                const rawPrice = option.attr("data-price");
                const price = parseFloat(rawPrice);
                const name = option.text();

                if (isNaN(price) || price <= 0) {
                    notyf.error(`Không có giá hợp lệ cho sản phẩm ${productId}`);
                    continue;
                }

                let receiptType = "";
                if (note.includes("hết hàng")) {
                    receiptType = "nhập từ nhà cung cấp";
                } else if (note.includes("trả hàng từ dh")) {
                    receiptType = "trả từ khách hàng";
                    const match = note.match(/DH\d+/i);

                    if (match) {
                        const orderCode = match[0].toUpperCase();
                        const orderIdNum = orderCode.replace(/DH/i, "");
                        console.log("Đơn hàng cần cập nhật:", orderCode);

                        // Gọi API cập nhật đơn hàng
                        $.ajax({
                            url: `/updateReturnStatus`,
                            method: 'POST',
                            data: {
                                orderID: orderIdNum,
                                status: 'returned',
                                note: note
                            },
                            success: function(response) {
                                console.log("Cập nhật thành công đơn hàng trả:", response);
                            },
                            error: function(error) {
                                console.error("Lỗi cập nhật đơn hàng:", error);
                            }
                        });
                    } else {
                        console.warn("Không tìm thấy mã đơn hàng trong ghi chú.");
                    }

                if (receiptType) {
                    $('#receiptType').val(receiptType);
                }

                }

                const total = quantity * price;

                var newRow = "<tr>" +
                    "<td><input type='hidden' name='productIds' value='" + productId + "'>" + name + "</td>" +
                    "<td><input type='hidden' name='quantities' value='" + quantity + "'>" + quantity + "</td>" +
                    "<td><input type='hidden' name='prices' value='" + price + "'>" + price.toLocaleString() + " đ</td>" +
                    "<td>" + total.toLocaleString() + " đ</td>" +
                    "<td><input type='hidden' name='receiptTypes' value='" + receiptType + "'>" + receiptType + "</td>" +
                    "<td><button type='button' class='btn btn-danger btn-delete'>Xóa</button></td>" +
                    "</tr>";

                $("#itemTableBody").append(newRow);
            }

            document.getElementById("excelFileInput").value = '';
        };

        reader.readAsArrayBuffer(file);
    });

    // Thêm sản phẩm thủ công
    $(document).ready(function () {
        $('#btn-add-item').click(function () {
            const selectOption = $('#productId').find("option:selected");
            const id = selectOption.val();
            const name = selectOption.text();
            const price = parseFloat(selectOption.data("price"));
            const quantity = parseInt($("#quantity").val());
            const receiptType = $('#receiptType').val();

            if (!id || isNaN(quantity) || isNaN(price) || quantity <= 0 || price <= 0) {
                notyf.error(`Vui lòng chọn sản phẩm và nhập số lượng hợp lệ`);
                return;
            }

            const total = quantity * price;

            var newRow = "<tr>" +
                "<td><input type='hidden' name='productIds' value='" + id + "'>" + name + "</td>" +
                "<td><input type='hidden' name='quantities' value='" + quantity + "'>" + quantity + "</td>" +
                "<td><input type='hidden' name='prices' value='" + price + "'>" + price.toLocaleString() + " đ</td>" +
                "<td>" + total.toLocaleString() + " đ</td>" +
                "<td><input type='hidden' name='receiptTypes' value='" + receiptType + "'>" + receiptType + "</td>" +
                "<td><button type='button' class='btn btn-danger btn-delete'>Xóa</button></td>" +
                "</tr>";

            $("#itemTableBody").append(newRow);

            $("#productId").val("");
            $("#quantity").val("1");
        });

        $("#itemTableBody").on("click", ".btn-delete", function () {
            $(this).closest("tr").remove();
        });

        $("#btnSubmit").click(function () {
            const receiptType = $('#receiptType').val();
            const note = $('#note').val();
            let items = [];

            $("#itemTableBody tr").each(function () {
                const productId = $(this).find("input[name='productIds']").val();
                const quantity = parseInt($(this).find("input[name='quantities']").val());
                const price = parseFloat($(this).find("input[name='prices']").val());
                const rowReceiptType = $(this).find("input[name='receiptTypes']").val();

                items.push({
                    productId: productId,
                    quantity: quantity,
                    price: price,
                    receiptType: rowReceiptType
                });
            });

            if (items.length === 0) {
                notyf.error(`Vui lòng chọn sản phẩm trước khi nhập`);
                return;
            }
            if (!receiptType) {
                notyf.error(`Vui lòng chọn loại phiếu nhập kho`);
                return;
            }

            const payload = {
                receiptType: receiptType,
                note: note,
                items: items
            };

            fetch("stock-receipt-admin", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(payload)
            })
                .then(res => res.json())
                .then(data => {
                    if (data.success) {
                        notyf.success(data.message);

                        $("#itemTableBody").empty();
                        $("#productId").val("");
                        $("#quantity").val("1");
                        $('#note').val('');

                        $('#nhapKhoModal').on('hidden.bs.modal', function () {
                            $('#receipt_table', window.parent.document).DataTable().ajax.reload();
                        });
                    } else {
                        notyf.error(data.message || "Có lỗi xảy ra khi nhập kho");
                    }
                })
                .catch(() => {
                    notyf.error("Lỗi kết nối đến server");
                });
        });
    });
</script>

<script>

</script>

</body>
</html>
