
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết kho</title>
    <link rel="stylesheet" href="/assets/css/pages/stock_detail.css">
</head>
<body>



<div class="header">
    <h2 id="title"></h2>
</div>

<div id="receipt-info">
    <span class="detail-label">Mã phiếu:</span> <span id="receipt-id"></span><br>
    <span class="detail-label">Ngày tạo:</span> <span id="receipt-date"></span><br>
    <span class="detail-label">Ghi chú:</span> <span id="receipt-note"></span>
</div>

<table>
    <thead>
    <tr>
        <th>Tên sản phẩm</th>
        <th>Số lượng</th>
        <th>Số tiền</th>
        <th>Loại nhập</th>
    </tr>
    </thead>
    <tbody id="receipt-detail-body">
    </tbody>
</table>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>


</body>

</html>
