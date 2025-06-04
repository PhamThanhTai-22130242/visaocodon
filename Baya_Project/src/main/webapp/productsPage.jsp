<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.baya.baya_project.Model.ProductAdminCateDTO" %>
<%@ page import="com.baya.baya_project.Model.UserPrincipal" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ADMIN</title>
  <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <script src="https://kit.fontawesome.com/68512d5542.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/assets/css/layout/styleAdmin.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
  <script src="https://cdn.sheetjs.com/xlsx-latest/package/dist/xlsx.full.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/exceljs/dist/exceljs.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/exceljs/dist/exceljs.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <style>
    <jsp:include page="SharedViews/block_error.jsp" />
  </style>
</head>

<body>

<% UserPrincipal us = (UserPrincipal) session.getAttribute("user");
  boolean canCreate = us.hasPermission("products", "create");
  boolean canView = us.hasPermission("products", "view");
  boolean canUpdate = us.hasPermission("products", "update");
  boolean canDelete = us.hasPermission("products", "delete");
  boolean exportExcel = us.hasPermission("products", "exportExcel");
  boolean exportPDF = us.hasPermission("products", "exportPDF");
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
<div class="wrapper">
  <jsp:include page="SharedViews/SideBarAdmin.jsp" />
  <!-- phần main -->
  <div class="container products-container">
    <div class="row">
      <nav aria-label="breadcrumb" class="productspage-breadcrumb">
        <ul class="breadcrumb">
          <li class="breadcrumb-item"><a href="Dashboardadmin.jsp"><i class="fa-solid fa-house "
                                                                      style="margin:2px ;"></i>Tổng Quan</a></li>

          <li class="breadcrumb-item active" aria-current="page"><i class="fa-solid fa-chair"
                                                                    style="margin:2px ;"></i>Danh Sách Sản Phẩm</li>
        </ul>
      </nav>
    </div>
    <!-- phần header -->
    <div class="row header-list">
      <div class="col-md-4 left-header">
        <div class="col-12">
          <div class="name-table">Danh sách sản phẩm</div>
          <div class="d-flex quantity-container">
            <div class="" style="font-size: 1.2rem; font-weight: bold;">Số Lượng:</div>
            <div class="quantity-item badge bg-success">
              <%
                Object totalProductsObj = request.getAttribute("totalProducts");
                int numProducts = 0;
                if (totalProductsObj != null && totalProductsObj instanceof Integer) {
                  numProducts = (Integer) totalProductsObj;
                }
              %>
              <%=numProducts%>

            </div>
            <div>Sản Phẩm</div>
          </div>
        </div>
      </div>
      <div class="col-md-8 right-header">
        <div class="d-flex">
          <div class="dropdown sort-container justify-content-between align-items-center">
            <div class="d-flex">
              <div class="pt-1">Sắp Xếp Theo:</div>
              <button class="btn btn-sortlist" type="button" style="" id="dropdownMenuButton"
                      data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fa-solid fa-sort"></i>
              </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <%  List<String> listCriteria = new ArrayList<>();
                  listCriteria.add("Mặc Định");
                  listCriteria.add("Giá Từ Thấp Đến Cao");
                  listCriteria.add("Giá Từ Cao Đến Thấp");
                  listCriteria.add("Theo Tên");
                  listCriteria.add("Theo Danh Mục");
                  String s = request.getParameter("sortVale");
                  for (String lc : listCriteria) {
                    if (lc.equals(s)){
                %>
                <li><a class="dropdown-item" href="ListProductAdmin?sortValue=<%=s%>" data-sort="asc" selected="true" value="<%=s%>"><%=s%></a></li>
                <%}else{%><li><a class="dropdown-item" href="ListProductAdmin?sortValue=<%=lc%>" data-sort="asc" selected="true" value="<%=lc%>"><%=lc%></a></li>

                <%--                  <li><a class="dropdown-item" href="#" data-sort="asc">Mặc định</a></li>--%>
                <%--                  <li><a class="dropdown-item" href="#" data-sort="desc">Giá Từ Thấp Đến Cao</a></li>--%>
                <%--                  <li><a class="dropdown-item" href="#" data-sort="asc">Giá Từ Cao Đến Thấp</a></li>--%>
                <%--                  <li><a class="dropdown-item" href="#" data-sort="desc">Theo Tên</a></li>--%>
                <%--                  <li><a class="dropdown-item" href="#" data-sort="desc">Theo Danh Mục</a></li>--%>
                <%}%>
                <%}%>
              </ul>
            </div>
            <%--              abc--%>
          </div>

          <form action="${pageContext.request.contextPath}/ListProductAdmin" method="get" class="d-flex search-container">
            <div class="col-md-8 d-flex position-relative">
              <input type="text" name="search" class="form-control search-input"
                     placeholder="Nhập tên sản phẩm..."
                     value="${searchQuery != null ? searchQuery : ''}">
              <button type="button" class="btn-clear" onclick="clearSearch()">×</button>
            </div>
            <button type="submit" class="btn btn-primary search-btn">
              <i class="fa-solid fa-magnifying-glass"></i>
            </button>
          </form>



        </div>
<style>
  .search-container {
    display: flex;
    align-items: center;
    justify-content: flex-end; /* Đẩy các phần tử sang phải */
    width: 100%;
  }

  .search-input {
    width: 100%;
    padding: 0.5rem;
    border-radius: 0.25rem;
    border: 1px solid #ccc;
    padding-right: 30px; /* Khoảng trống cho nút "x" */
  }

  .search-btn {
    margin-left: 10px;
    padding: 0.5rem 1rem;
    border-radius: 0.25rem;
  }

  .search-input:focus {
    border-color: #007bff;
    outline: none;
  }

  .search-btn .fa-solid {
    font-size: 1.2rem;
  }

  .search-container .btn-clear {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    background: none;
    border: none;
    font-size: 18px;
    color: #aaa; /* Đảm bảo rằng nút x có màu dễ nhìn */
    cursor: pointer;
  }

  .search-container .btn-clear:hover {
    color: #007bff; /* Chỉnh màu khi hover */
  }


</style>
      </div>
    </div>
    <div class="row button-center-container">
      <div class="col-md-6 button-left">


        <c:choose>
          <c:when test="${canCreate}">
            <form action="ImportExcelProduct" method="post" enctype="multipart/form-data" id="excelImportForm">
              <input type="file" name="excelFile" id="excelFile" style="display: none;" accept=".xls,.xlsx">
              <button type="button" class="btn btn-success">
                <i class="fa-solid fa-file-excel me-2"></i>Import Excel
              </button>
              <button class="btn btn-light btn-primary" id="btn-add"><a href="addProductPage.jsp" style="color: #fff;">Thêm
                Sản Phẩm</a></button>
            </form>

          </c:when>
          <c:otherwise></c:otherwise></c:choose>
      </div>
    </div>

    <script>
      document.addEventListener("DOMContentLoaded", function () {
        document.querySelector(".btn-success").addEventListener("click", function () {
          console.log("Button clicked");
          document.getElementById('excelFile').click();
        });

        document.getElementById("excelFile").addEventListener("change", function () {
          console.log("File selected");
          document.getElementById("excelImportForm").submit();
        });
      });
    </script>

    <!-- phần danh sách sản phẩm -->
    <div class="row table-container">
      <div class="col-12">
        <table id="listProducts" class="table table-bordered table-striped">
          <thead class="table-dark">
          <tr>
            <th>Mã SP</th>
            <th>Ảnh</th>
            <th>Tên sản phẩm</th>
            <th>Danh Mục chính</th>
            <th>Giá</th>
            <th>Ngày Tạo</th>
            <th>Tồn kho</th>
            <th>Tùy chọn</th>
          </tr>
          </thead>

          <tbody>
          <%
            List<ProductAdminCateDTO> listProductPage = (List<ProductAdminCateDTO>) request.getAttribute("listProductsPage");
            if (listProductPage != null) {
              for (ProductAdminCateDTO pro : listProductPage) {
          %>
          <tr>
            <td name="pcode"><%=pro.getProduct().getProductID()%></td>
            <td>
              <%
                String thumbnail = pro.getProduct().getThumbnail();
                String imgSrc = "";

                if (thumbnail != null && !thumbnail.isEmpty()) {
                  if (thumbnail.startsWith("data:image")) {
                    imgSrc = thumbnail;
                  } else if (thumbnail.startsWith("http://") || thumbnail.startsWith("https://")) {
                    imgSrc = thumbnail;
                  } else {
                    imgSrc = request.getContextPath() + "/" + thumbnail;
                  }
                }
              %>
              <img src="<%= imgSrc %>" alt="Image" style="width: 50px; height: 50px;">

            </td>

            <td><%=pro.getProduct().getName()%></td>
            <td><%=pro.getCategory().getName()%></td>
            <td><%=pro.getProduct().formatPrice(pro.getProduct().getPrice())%>đ</td>
            <td><%=pro.getProduct().getCreateAt()%></td>
            <td><%=pro.getProduct().getQuanlityStock()%></td>
            <td>

              <c:choose>
                <c:when test="${canUpdate}">
                  <a href="EditProduct?id=<%=pro.getProduct().getProductID()%>">
                    <button class="btn btn-warning btn-sm"><i class="fa-solid fa-pen-to-square"></i></button>
                  </a>

                </c:when>
                <c:otherwise></c:otherwise></c:choose>
              <c:choose>
                <c:when test="${canDelete}">
                  <button class="btn btn-danger btn-sm btn-delete" data-bs-toggle="modal" data-bs-target="#proModal"
                          data-proid="<%=pro.getProduct().getProductID()%>">
                    <i class="fa-solid fa-trash"></i>
                  </button>

                </c:when>
                <c:otherwise></c:otherwise></c:choose>

            </td>
          </tr>
          <%
              }
            }
          %>
          </tbody>
        </table>

        <!-- Modal Xác nhận Xóa (chỉ tạo 1 lần) -->
        <div class="modal fade" id="proModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel" style="color: #2b2b2b">Xác Nhận Xóa</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body" style="color: #2b2b2b">
                Bạn có chắc chắn muốn xóa sản phẩm này không?
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                <form action="${pageContext.request.contextPath}/ListProductAdmin" method="post" style="display:inline;">
                  <input type="hidden" name="action" value="delete"/>
                  <input type="hidden" name="id" id="productIdToDelete"/>
                  <button type="submit" class="btn btn-danger">Đồng ý</button>
                </form>
              </div>
            </div>
          </div>
        </div>

      </div>
      <script>
        document.addEventListener("DOMContentLoaded", function () {
          const userModal = document.getElementById('proModal');
          userModal.addEventListener('show.bs.modal', function (event) {
            let button = event.relatedTarget;
            let proId = button.getAttribute('data-proId');
            document.getElementById('productIdToDelete').value = proId;
          });
        });
      </script>
    </div>
    <div class="row pagination-container">

      <div class="col-md-6 pagination-left">

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
      <div class="col-md-6 pagination-right d-flex justify-content-end">
        <table>
          <tr><td colspan="10">
            <nav aria-label="Page navigation">
              <ul class="pagination justify-content-end pagination-menu">
                <%
                  int numberPage = (int) request.getAttribute("numberPage");
                  int totalPages = (int) request.getAttribute("totalPages");
                %>
                <% if (numberPage > 1) { %>
                <li class="page-item">
                  <a class="page-link" href="ListProductAdmin?page=<%=numberPage - 1%>">Trước</a>
                </li>
                <% } %>
                <%
                  int startPage = Math.max(1, numberPage - 1);
                  int endPage = Math.min(totalPages, numberPage + 2);

                  for (int i = startPage; i <= endPage; i++) {
                    if (i == numberPage) { // Trang hiện tại
                %>
                <li class="page-item active">
                  <a class="page-link" href="ListProductAdmin?page=<%=i%>"><%=i%></a>
                </li>
                <% } else { %>
                <li class="page-item">
                  <a class="page-link" href="ListProductAdmin?page=<%=i%>"><%=i%></a>
                </li>
                <% } } %>
                <% if (numberPage < totalPages) { %>
                <li class="page-item">
                  <a class="page-link" href="ListProductAdmin?page=<%=numberPage + 1%>">Sau</a>
                </li>
                <% } %>
              </ul>
            </nav>
          </td>

          </tr>
        </table>
      </div>
    </div>
  </div>
</div>
<style>
  .btn-print-pdf, .btn-export-excel {
    font-weight: 500;
    font-size: 14px;
    padding: 4px 10px;
    height: 28px;
    border-radius: 6px;
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1);
    transition: transform 0.15s ease, box-shadow 0.2s ease;
    position: relative;
    top: 40px;
    left: 20px;
  }

  .btn-print-pdf:hover, .btn-export-excel:hover {
    transform: translateY(-1px);
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.15);
  }
</style>
<script>
  function clearSearch() {
    document.querySelector('input[name="search"]').value = '';
    document.querySelector('form').submit();
  }
</script>
<script>
  const urlParams = new URLSearchParams(window.location.search);
  if (urlParams.has('success')) {
    Swal.fire({
      title: "Thành công!",
      text: "Sản phẩm đã được thêm thành công!",
      icon: "success",
      confirmButtonText: "OK"
    }).then(() => {
      const newUrl = window.location.href.split("?")[0];
      window.history.replaceState({}, document.title, newUrl);
    });
  }
</script>
<script>
  const urlParams = new URLSearchParams(window.location.search);
  if (urlParams.has('success')) {
    Swal.fire({
      title: "Thành công!",
      text: "Sản phẩm đã được cập nhật thành công!",
      icon: "success",
      confirmButtonText: "OK"
    }).then(() => {
      const newUrl = window.location.href.split("?")[0];
      window.history.replaceState({}, document.title, newUrl);
    });
  }
</script>

<script>
  $(document).ready(function () {
    function centerTableContent() {
      $('#listProducts th, #listProducts td').css({
        'text-align': 'center',
        'vertical-align': 'middle',
        'font-family': 'Arial, sans-serif'
      });
    }
    centerTableContent();

    function waitForImagesToLoad(container, callback) {
      const images = container.querySelectorAll('img');
      if (images.length === 0) return callback();

      let loaded = 0;
      images.forEach(img => {
        if (img.complete) {
          if (++loaded === images.length) callback();
        } else {
          img.onload = img.onerror = () => {
            if (++loaded === images.length) callback();
          };
        }
      });
    }
    $(".btn-print-pdf").click(function () {
      const table = document.querySelector("#listProducts");

      $('#listProducts tr').each(function () {
        $(this).find('td:last-child, th:last-child').hide();
      });

      function waitForImagesToLoad(container, callback) {
        const images = container.querySelectorAll('img');
        if (images.length === 0) return callback();

        let loaded = 0;
        images.forEach(img => {
          if (img.complete) {
            if (++loaded === images.length) callback();
          } else {
            img.onload = img.onerror = () => {
              if (++loaded === images.length) callback();
            };
          }
        });
      }

      waitForImagesToLoad(table, () => {
        html2canvas(table, { scale: 2, useCORS: true }).then(canvas => {
          const { jsPDF } = window.jspdf;
          const pdf = new jsPDF('l', 'mm', 'a4');

          const pageWidth = pdf.internal.pageSize.getWidth();
          const pageHeight = pdf.internal.pageSize.getHeight();

          const margin = 10;
          const titleHeight = 10;

          const usableHeight = pageHeight - margin * 2 - titleHeight;

          const imgWidth = pageWidth - margin * 2;
          const imgHeight = (canvas.height * imgWidth) / canvas.width;

          pdf.setFontSize(16);
          pdf.text("Danh Sách Sản Phẩm", pageWidth / 2, margin + 6, { align: 'center' });

          if (imgHeight > usableHeight) {
            const ratio = canvas.width / imgWidth;
            const srcHeight = usableHeight * ratio;
            let y = 0;
            let page = 0;
            while (y < canvas.height) {
              if (page > 0) pdf.addPage();

              const pageCanvas = document.createElement("canvas");
              pageCanvas.width = canvas.width;
              pageCanvas.height = Math.min(srcHeight, canvas.height - y);

              const ctx = pageCanvas.getContext("2d");
              ctx.drawImage(canvas, 0, y, canvas.width, pageCanvas.height, 0, 0, canvas.width, pageCanvas.height);

              const imgData = pageCanvas.toDataURL("image/png");
              const thisImgHeight = (pageCanvas.height * imgWidth) / canvas.width;

              pdf.addImage(imgData, 'PNG', margin, margin + titleHeight, imgWidth, thisImgHeight);

              y += srcHeight;
              page++;
            }
          } else {
            pdf.addImage(canvas.toDataURL("image/png"), 'PNG', margin, margin + titleHeight, imgWidth, imgHeight);
          }
          pdf.save("DanhSachSanPham.pdf");
          $('#listProducts tr').each(function () {
            $(this).find('td:last-child, th:last-child').show();
          });
        });
      });
    });


    $(".btn-export-excel").click(async function () {
      const table = document.querySelector("#listProducts");
      const rows = table.querySelectorAll("tbody tr");

      const workbook = new ExcelJS.Workbook();
      const worksheet = workbook.addWorksheet("Danh Sách Sản Phẩm");

      worksheet.mergeCells('A1:G1');
      const titleCell = worksheet.getCell('A1');
      titleCell.value = 'Danh Sách Sản Phẩm';
      titleCell.alignment = { vertical: 'middle', horizontal: 'center' };
      titleCell.font = { bold: true, size: 16 };

      const headers = ["Mã SP", "Hình ảnh", "Tên SP", "Danh mục", "Giá", "Ngày tạo", "Số lượng"];
      const headerRow = worksheet.addRow(headers);
      headerRow.font = { bold: true };
      headerRow.alignment = { vertical: 'middle', horizontal: 'center' };
      headerRow.eachCell(cell => {
        cell.border = {
          top: { style: 'thin' },
          left: { style: 'thin' },
          bottom: { style: 'thin' },
          right: { style: 'thin' }
        };
      });

      for (let i = 0; i < rows.length; i++) {
        const tds = rows[i].querySelectorAll("td");
        const rowData = [
          tds[0].innerText.trim(),
          "", // ảnh
          tds[2].innerText.trim(),
          tds[3].innerText.trim(),
          tds[4].innerText.trim(),
          tds[5].innerText.trim(),
          tds[6].innerText.trim()
        ];

        const excelRow = worksheet.addRow(rowData);
        excelRow.alignment = { vertical: 'middle', horizontal: 'center' };
        excelRow.eachCell(cell => {
          cell.border = {
            top: { style: 'thin' },
            left: { style: 'thin' },
            bottom: { style: 'thin' },
            right: { style: 'thin' }
          };
        });

        const img = tds[1].querySelector("img");
        if (img && img.src) {
          try {
            const base64 = await getBase64FromUrl(img.src);
            const imageId = workbook.addImage({
              base64: base64,
              extension: 'png'
            });

            worksheet.addImage(imageId, {
              tl: { col: 1, row: i + 2 },
              ext: { width: 50, height: 50 }
            });

            worksheet.getRow(i + 2).height = 80;
            worksheet.getColumn(2).width = 15;
          } catch (e) {
            console.warn("Không thể chèn ảnh (có thể do CORS):", e.message);
          }
        }
      }
      worksheet.columns = [
        { width: 15 },
        { width: 15 },
        { width: 25 },
        { width: 20 },
        { width: 15 },
        { width: 20 },
        { width: 12 }
      ];

      worksheet.eachRow((row, rowNumber) => {
        if (rowNumber > 2) {
          row.height = 80;
        }
      });

      const buffer = await workbook.xlsx.writeBuffer();
      saveAs(new Blob([buffer]), "DanhSachSanPham.xlsx");
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
</script>
<!-- Thêm Popper.js và Bootstrap JS Bundle cho các tính năng JavaScript của Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="/assets/js/scriptAdmin.js"></script>
</body>

</html>

