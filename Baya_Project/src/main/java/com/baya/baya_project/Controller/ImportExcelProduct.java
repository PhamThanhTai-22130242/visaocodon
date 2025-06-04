package com.baya.baya_project.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import com.baya.baya_project.Model.ProductExcel;
import com.baya.baya_project.service.ProductAdminService;
import org.apache.poi.ss.usermodel.*;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/ImportExcelProduct")
@MultipartConfig
public class ImportExcelProduct extends HttpServlet {

    private ProductAdminService productAdminService = new ProductAdminService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Part filePart = request.getPart("excelFile");

        if (filePart == null || filePart.getSize() == 0) {
            request.setAttribute("message", "Không có file nào được chọn.");
            request.getRequestDispatcher("productExcel.jsp").forward(request, response);
            return;
        }

        InputStream inputStream = filePart.getInputStream();
        List<ProductExcel> productList = new ArrayList<>();

        try (Workbook workbook = WorkbookFactory.create(inputStream)) {
            Sheet sheet = workbook.getSheetAt(0);

            for (int i = 1; i <= sheet.getLastRowNum(); i++) {
                Row row = sheet.getRow(i);
                if (row == null) continue;

                String productCode = getStringCell(row, 2);
                if (productAdminService.isProductCodeExists(productCode)) {
                    continue;
                }

                ProductExcel product = new ProductExcel();
                product.setName(getStringCell(row, 0));
                product.setMainCategory(getStringCell(row, 1));
                product.setCode(productCode);
                product.setDescription(getStringCell(row, 3));
                product.setStandard(getStringCell(row, 4));
                product.setMaterial(getStringCell(row, 5));
                product.setSize(getStringCell(row, 6));
                product.setOrigin(getStringCell(row, 7));
                product.setStock((int) getNumericCell(row, 8));
                product.setPrice(getNumericCell(row, 9));

                String mainImageUrl = getStringCell(row, 10);
                if (mainImageUrl != null && !mainImageUrl.isEmpty()) {
                    String base64 = convertImageUrlToBase64(mainImageUrl);
                    if (base64 != null) {
                        product.setImage("data:image/jpeg;base64," + base64);
                    } else {
                        product.setImage(null);
                    }
                } else {
                    product.setImage(null);
                }

                // Ảnh phụ (cột 11) - phân tách theo dấu phẩy
                String relatedImagesStr = getStringCell(row, 11);
                List<String> relatedBase64List = new ArrayList<>();
                if (relatedImagesStr != null && !relatedImagesStr.isEmpty()) {
                    List<String> urls = Arrays.stream(relatedImagesStr.split(","))
                            .map(String::trim)
                            .collect(Collectors.toList());

                    for (String url : urls) {
                        String base64 = convertImageUrlToBase64(url);
                        if (base64 != null) {
                            relatedBase64List.add("data:image/jpeg;base64," + base64);
                        }
                    }
                }
                product.setRelatedImages(relatedBase64List);

                productList.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Lỗi khi đọc file Excel: " + e.getMessage());
            request.getRequestDispatcher("productExcel.jsp").forward(request, response);
            return;
        }

        // Truyền danh sách sản phẩm đã import có ảnh base64 sang JSP hoặc xử lý tiếp
        request.setAttribute("importedProducts", productList);
        request.getRequestDispatcher("productExcel.jsp").forward(request, response);
    }

    private String getStringCell(Row row, int cellIndex) {
        Cell cell = row.getCell(cellIndex);
        if (cell == null) return "";
        cell.setCellType(CellType.STRING);
        return cell.getStringCellValue().trim();
    }

    private double getNumericCell(Row row, int cellIndex) {
        Cell cell = row.getCell(cellIndex);
        if (cell == null) return 0;
        try {
            return cell.getNumericCellValue();
        } catch (Exception e) {
            try {
                return Double.parseDouble(cell.getStringCellValue().trim());
            } catch (Exception ex) {
                return 0;
            }
        }
    }

    private String convertImageUrlToBase64(String imageUrl) {
        try (InputStream is = new URL(imageUrl).openStream()) {
            byte[] buffer = new byte[8192];
            int bytesRead;
            java.io.ByteArrayOutputStream os = new java.io.ByteArrayOutputStream();
            while ((bytesRead = is.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            byte[] imageBytes = os.toByteArray();
            os.close();

            return Base64.getEncoder().encodeToString(imageBytes);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
