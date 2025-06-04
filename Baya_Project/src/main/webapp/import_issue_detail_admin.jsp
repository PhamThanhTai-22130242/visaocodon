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
    <title>Phiếu xuất kho</title>
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
    <h3 class="text-center mb-4">Phiếu xuất kho</h3>

    <form action="nhapKhoServlet" method="post">
        <div class="form-row mb-3">
            <div class="col-md-3">
                <label>Chọn loại xuất</label>
                <select class="form-control" id="receiptType">
                    <option value="bán cho khách hàng">Bán cho khách hàng</option>
                    <option value="trả nhà cung cấp">Trả nhà cung cấp</option>
                    <option value="hết hạn">Hết hạn</option>
                    <option value="điều chỉnh">Hết hạn</option>

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

        <table class="table table-bordered"  id="itemTable">
            <thead class="thead-light">
            <tr>
                <th>Name</th>
                <th>Số lượng</th>
                <th>Giá</th>
                <th>Tổng giá</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody id="itemTableBody">
            </tbody>        </table>

        <div class="text-right">
            <button type="button" id="btnSubmit" class="btn btn-primary">Xuất kho</button>
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
                    console.warn(`Bỏ qua dòng ${i + 1} vì dữ liệu không hợp lệ`);
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

                // let receiptType = "bán cho khách hàng";
                // $('#receiptType').val(receiptType);

                const match = note.match(/dh(\d+)/i);
                if (match && match[1]) {
                    const orderId = parseInt(match[1]);
                    console.log("Debug orderId:", orderId);
                    if (!isNaN(orderId)) {
                        const params = new URLSearchParams();
                        params.append("orderID", orderId);

                        fetch(`/updateOrderStatus`, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded'
                            },
                            body: params.toString()
                        })
                            .then(res => {
                                if (!res.ok) throw new Error("Lỗi khi cập nhật đơn hàng");
                                return res.text();
                            })
                            .then(text => {
                                console.log(`Cập nhật đơn hàng #${orderId} thành công`);
                                console.log("Server response:", text);
                            })
                            .catch(err => {
                                console.error(err);
                                notyf.error(`Cập nhật đơn hàng #${orderId} thất bại`);
                            });

                    }
                }
                const total = quantity * price;

                var newRow = "<tr>" +
                    "<td><input type='hidden' name='productIds' value='" + productId + "'>" + name + "</td>" +
                    "<td><input type='hidden' name='quantities' value='" + quantity + "'>" + quantity + "</td>" +
                    "<td><input type='hidden' name='prices' value='" + price + "'>" + price.toLocaleString() + " đ</td>" +
                    "<td>" + total.toLocaleString() + " đ</td>" +
                    "<td><button type='button' class='btn btn-danger btn-delete'>Xóa</button></td>" +
                    "</tr>";

                $("#itemTableBody").append(newRow);
            }

            document.getElementById("excelFileInput").value = '';
        };

        reader.readAsArrayBuffer(file);
    });

    $(document).ready(function () {
        $('#btn-add-item').click(function () {
            const select = $('#productId');
            const selectOption = select.find("option:selected");
            const id = selectOption.val()
            const name = selectOption.text()
            const price =  selectOption.data("price")
            const quantity = parseInt($("#quantity").val());


            if (!id || isNaN(quantity) || isNaN(price) || quantity <= 0 || price <= 0) {
                const notyf = new Notyf();
                notyf.error(`Vui lòng nhập tên và số lượng phù hợp`);
                return
            }

            const total = quantity * price;

            var newRow = "<tr>" +
                "<td>" +
                "<input type='hidden' name='productIds' value='" + id + "'>" +
                name +
                "</td>" +
                "<td>" +
                "<input type='hidden' name='quantities' value='" + quantity + "'>" +
                quantity +
                "</td>" +
                "<td>" +
                "<input type='hidden' name='prices' value='" + price + "'>" +
                price.toLocaleString() + " đ" +
                "</td>" +
                "<td>" + total.toLocaleString() + " đ</td>" +
                "<td><button type='button' class='btn btn-danger btn-delete'>Xóa</button></td>" +
                "</tr>";

            $("#itemTableBody").append(newRow);

            $("#productId").val("");
            $("#quantity").val("1");
            $('#note').val("")
        });

        $("#itemTableBody").on("click", ".btn-delete", function () {
            $(this).closest("tr").remove();
        });
    });


    $("#btnSubmit").click(function () {
        const select = $('#receiptType');
        const selectOption = select.find("option:selected");
        const receiptType = selectOption.val()
        const note = $('#note').val()
        let items = [];
        $("#itemTableBody tr").each(function () {
            const productId = $(this).find("input[name='productIds']").val();
            const quantity = $(this).find("input[name='quantities']").val();
            const price = $(this).find("input[name='prices']").val();

            items.push({
                productId: productId,
                quantity: quantity,
                price: price
            });
        });
        const quantity = parseInt($("#quantity").val());

        const notyf = new Notyf();

        if(quantity<=0){
            notyf.error(`Vui lòng nhập số lượng phù hợp`);

        }
        if ( items.length == 0 ) {
            notyf.error(`Vui lòng chọn sản trước khi xuất kho`);
            return
        }


        const payload = {
            receiptType: receiptType,
            note: note,
            items: items
        };

        fetch("stock-issue-admin", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(payload)
        })
            .then(res => res.json())
            .then(data => {
                console.log('oklala')

                if (data.success) {
                    notyf.success(data.message);

                    $("#itemTableBody").empty();
                    $("#productId").val("");
                    $("#quantity").val("1");
                    $('#note').val('');
                    $('#xuatKhoModal').on('hidden.bs.modal', function () {
                        $('#issue_table', window.parent.document).DataTable().ajax.reload();
                    });

                } else {
                    notyf.error(data.message);
                }

            })

    });


</script>

</body>
</html>
