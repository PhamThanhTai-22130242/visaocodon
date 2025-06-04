package com.baya.baya_project.service;

import com.baya.baya_project.Dao.ProductAdminDao;
import com.baya.baya_project.Model.*;
import org.jdbi.v3.core.Handle;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import static com.baya.baya_project.Dao.JDBIConnector.jdbi;

public class ProductAdminService {
ProductAdminDao productAdminDao;
public ProductAdminService(){
    productAdminDao = new ProductAdminDao();
}

    public static ProductListImg getProductById(String productID) {
        return jdbi.withHandle(handle -> {
            try {
                // Truy vấn sản phẩm từ bảng products
                String sqlProduct = "SELECT productID, name, price, discountDefault, description, categoryID, quanlityStock, quanlitySell, thumbnail, createAt " +
                        "FROM products WHERE productID = :productID";
                ProductListImg product = handle.createQuery(sqlProduct)
                        .bind("productID", productID)
                        .mapTo(ProductListImg.class)  // Chuyển kết quả thành đối tượng ProductListImg
                        .findOnly();  // Lấy một kết quả duy nhất

                if (product == null) {
                    throw new RuntimeException("lỗi: " + productID);
                }

                // Truy vấn chi tiết sản phẩm từ bảng specifications
                String sqlDetails = "SELECT specificationID, dimensions, material, original, standard, productID " +
                        "FROM specifications WHERE productID = :productID";
                Specification specification = handle.createQuery(sqlDetails)
                        .bind("productID", productID)
                        .mapTo(Specification.class)  // Chuyển kết quả thành đối tượng Specification
                        .findOnly();

                // Set chi tiết vào sản phẩm
                product.setSpecification(specification);

                // Truy vấn danh sách hình ảnh từ bảng subImages
                String sqlImages = "SELECT  subImagesID, image, createdDate, productID " +
                        "FROM subImages WHERE productID = :productID";
                List<SubImage> images = handle.createQuery(sqlImages)
                        .bind("productID", productID)
                        .mapTo(SubImage.class)  // Chuyển kết quả thành đối tượng SubImage
                        .list();

                // Set danh sách hình ảnh vào sản phẩm
                product.setSubImageList(images);

                return product;

            } catch (Exception e) {
                throw new RuntimeException("Failed to get product with productID: " + productID, e);
            }
        });
    }
    public List<ProductAdminCateDTO> searchProductsByName(String keyword) {
        return jdbi.withHandle(handle ->

                handle.createQuery("""
            SELECT p.productID, p.name AS productName, p.price, p.discountDefault,
                   p.description, p.quanlityStock, p.quanlitySell, p.thumbnail,
                   p.createAt, c.name AS categoryName
            FROM products p
            JOIN category c ON p.categoryID = c.categoryID
            WHERE LOWER(p.name) LIKE CONCAT('%', LOWER(:keyword), '%')
        """)
                        .bind("keyword", keyword)
                        .map((rs, ctx) -> {
                            // Tạo đối tượng Category
                            Category category = new Category();
                            category.setName(rs.getString("categoryName"));



                            // Tạo đối tượng Product
                            Product product = new Product();
                            product.setProductID(rs.getString("productID"));
                            product.setName(rs.getString("productName"));
                            product.setPrice((int) rs.getDouble("price"));
                            product.setDiscountDefault((int) rs.getDouble("discountDefault"));
                            product.setDescription(rs.getString("description"));
                            product.setQuanlityStock(rs.getInt("quanlityStock"));
                            product.setQuanlitySell(rs.getInt("quanlitySell"));
                            product.setThumbnail(rs.getString("thumbnail"));
                            product.setCreateAt(LocalDate.parse(rs.getString("createAt")).atStartOfDay());

                            // Tạo lớp DTO để chứa dữ liệu từ Product, Category và SubCategory
                            ProductAdminCateDTO dto = new ProductAdminCateDTO();
                            dto.setProduct(product);
                            dto.setCategory(category);

                            return dto;
                        }).list()
        );
    }

    public List<Product> getProductsToImport() {
        List<Product> products = jdbi.withHandle(handle -> {
            return handle.createQuery(
                    "SELECT " +
                            "p.productID, " +
                            "p.name, " +
                            "returns.returnOrderID, " +
                            "COALESCE(sales.totalPro, 0) AS monthlySales, " +
                            "COALESCE(proc.processingQuantity, 0) AS processingQuantity, " +
                            "COALESCE(returns.returnCount, 0) AS returnCount, " +
                            "COALESCE(i.quantity, 0) AS quanlityStock, " +
                            "GREATEST(0, (COALESCE(sales.totalPro, 0) + COALESCE(proc.processingQuantity, 0)) - COALESCE(i.quantity, 0)) AS quantityToImport, " +
                            "CASE " +
                            "    WHEN (COALESCE(sales.totalPro, 0) + COALESCE(proc.processingQuantity, 0)) - COALESCE(i.quantity, 0) > 0 " +
                            "    THEN GREATEST(0, (COALESCE(sales.totalPro, 0) + COALESCE(proc.processingQuantity, 0)) - COALESCE(i.quantity, 0)) + COALESCE(returns.returnCount, 0) " +
                            "    ELSE COALESCE(returns.returnCount, 0) " +
                            "END AS totalQuantity " +
                            "FROM products p " +
                            "LEFT JOIN inventory i ON p.productID = i.productID " +
                            "LEFT JOIN ( " +
                            "    SELECT od.productID, SUM(od.quantity) AS processingQuantity " +
                            "    FROM order_detail od " +
                            "    JOIN orders o ON o.orderID = od.orderID " +
                            "    WHERE o.orderStatusID = 1 " +
                            "    GROUP BY od.productID " +
                            ") proc ON p.productID = proc.productID " +
                            "LEFT JOIN ( " +
                            "    SELECT od.productID, SUM(od.quantity) AS totalPro " +
                            "    FROM order_detail od " +
                            "    JOIN orders o ON o.orderID = od.orderID " +
                            "    WHERE o.orderStatusID = 3 " +
                            "    AND o.deliveredDate >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH) " +
                            "    GROUP BY od.productID " +
                            ") sales ON p.productID = sales.productID " +
                            "LEFT JOIN ( " +
                            "    SELECT od.productID, SUM(od.quantity) AS returnCount, MAX(o.orderID) AS returnOrderID " +
                            "    FROM order_detail od " +
                            "    JOIN return_request_order o ON o.orderID = od.orderID " +
                            "    WHERE o.status = 'Hoàn trả' AND imported = 0 " +
                            "    GROUP BY od.productID " +
                            ") returns ON p.productID = returns.productID " +
                            "HAVING totalQuantity > 0"
            ).mapToBean(Product.class).list();
        });

        return products;
    }
    public List<Product> getVisibleStockImportLogs() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT productID, name, totalQuantity, note FROM stock_import_log WHERE isVisible = TRUE")
                        .mapToBean(Product.class)
                        .list()
        );
    }



    public List<Product> getProductsToExport() {
        List<Product> products = jdbi.withHandle(handle -> {
            return handle.createQuery(
                            "SELECT " +
                                    "p.productID, " +
                                    "p.name, " +
                                    "SUM(od.quantity) AS quantityToExport, " +
                                    "o.orderID " +
                                    "FROM products p " +
                                    "JOIN order_detail od ON od.productID = p.productID " +
                                    "JOIN orders o ON o.orderID = od.orderID " +
                                    "WHERE o.orderStatusID = 1 " +
                                    "GROUP BY p.productID, p.name, o.orderID " +
                                    "HAVING quantityToExport > 0"
                    )
                    .map((rs, ctx) -> {
                        Product product = new Product();
                        product.setProductID(rs.getString("productID"));
                        product.setName(rs.getString("name"));
                        product.setQuantityToExport(rs.getInt("quantityToExport"));
                        String orderID = rs.getString("orderID");
                        product.setNote("DH" + orderID);
                        return product;
                    }).list();
        });

        // Ghi vào bảng stock_export_log
//        for (Product product : products) {
//            jdbi.useHandle(handle -> {
//                handle.createUpdate("INSERT INTO stock_export_log (productID, name, totalQuantity, note, isVisible, createdAt) " +
//                                "VALUES (:productID, :name, :totalQuantity, :note, TRUE, CURRENT_TIMESTAMP)")
//                        .bind("productID", product.getProductID())
//                        .bind("name", product.getName())
//                        .bind("totalQuantity", product.getQuantityToExport())
//                        .bind("note", product.getNote())
//                        .execute();
//            });
//        }
        return products;
    }

    public List<Product> getVisibleStockExportLogs() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT productID, name, totalQuantity, note FROM stock_export_log WHERE isVisible = TRUE")
                        .mapToBean(Product.class)
                        .list()
        );
    }


    public boolean isProductCodeExists(String productCode) {
        return jdbi.withHandle(handle -> {
            String query = "SELECT COUNT(*) FROM products WHERE productID = ?";
            int count = handle.createQuery(query)
                    .bind(0, productCode)
                    .mapTo(Integer.class)
                    .one();

            return count > 0;
        });
    }
    public List<Product> getProductsBySubcategory(String subCategoryID) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM products WHERE CategoryID = :categoryID")
                        .bind("categoryID", subCategoryID)
                        .mapToBean(Product.class)
                        .list()
        );
    }
    public String getSubcategoryNameById(String CategoryID) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT name FROM category WHERE CategoryID = :categoryID")
                        .bind("categoryID", CategoryID)
                        .mapTo(String.class)
                        .findOne()
                        .orElse("Tất cả sản phẩm")
        );
    }




    public List<ProductAdminCateDTO> selectTableListProducts() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT " +
                        "p.productID, " +
                        "p.name AS productName, " +
                        "p.price, " +
                        "p.discountDefault, " +
                        "p.description, " +
                        "p.quanlityStock, " +
                        "p.quanlitySell, " +
                        "p.thumbnail, " +
                        "p.createAt, " +
                        "c.name AS categoryName " +
                        "FROM products p " +

                        "JOIN category c ON c.categoryID = p.categoryID "

                ).map((rs, ctx) -> {
                    // Tạo đối tượng Category
                    Category category = new Category();
                    category.setName(rs.getString("categoryName"));


                    // Tạo đối tượng Product
                    Product product = new Product();
                    product.setProductID(rs.getString("productID"));
                    product.setName(rs.getString("productName"));
                    product.setPrice((int) rs.getDouble("price"));
                    product.setDiscountDefault((int) rs.getDouble("discountDefault"));
                    product.setDescription(rs.getString("description"));
                    product.setQuanlityStock(rs.getInt("quanlityStock"));
                    product.setQuanlitySell(rs.getInt("quanlitySell"));
                    product.setThumbnail(rs.getString("thumbnail"));
                    product.setCreateAt(LocalDate.parse(rs.getString("createAt")).atStartOfDay());
                    //tạo lớp để chứa data join 3 thằng
                    ProductAdminCateDTO dto = new ProductAdminCateDTO();
                    dto.setProduct(product);
                    dto.setCategory(category);
                    return dto;
                }).list()
        );
    }



    public int getTotalProduct(){
    return selectTableListProducts().size();
    }
    public static List<ProductAdminCateDTO> getPaginationPageOwn(int page, List<ProductAdminCateDTO> products) {
        int itemsPerPage = 15; // Số sản phẩm trên mỗi trang
        int totalProducts = products.size();
        int totalPages = (int) Math.ceil((double) totalProducts / itemsPerPage);

        if (page > totalPages) {
            page = totalPages;
        }
        if (page < 1) {
            page = 1;
        }

        int start = (page - 1) * itemsPerPage;
        int end = Math.min(start + itemsPerPage, totalProducts);

        if (start >= totalProducts) {
            return Collections.emptyList(); // Tránh lỗi khi không có dữ liệu
        }

        return products.subList(start, end);
    }

    public static void addProductTest(Product product){
        jdbi.useTransaction(handle -> {
            try {
                // Thêm sản phẩm vào bảng products
                String sqlProduct = "INSERT INTO products (productID, name, price, discountDefault, description, categoryID, quanlityStock, quanlitySell, thumbnail, createAt) " +
                        "VALUES (:productID, :name, :price, :discountDefault, :description, :categoryID, :quanlityStock, :quanlitySell, :thumbnail, :createAt)";
                handle.createUpdate(sqlProduct)
                        .bind("productID", product.getProductID())
                        .bind("name", product.getName())
                        .bind("price", product.getPrice())
                        .bind("discountDefault", product.getDiscountDefault())
                        .bind("description", product.getDescription())

                        .bind("categoryID", product.getcategoryID())

                        .bind("quanlityStock", product.getQuanlityStock())
                        .bind("quanlitySell", product.getQuanlitySell())
                        .bind("thumbnail", product.getThumbnail())
                        .bind("createAt", product.getCreateAt())
                        .execute();
                System.out.println("thêm sản phẩm thành công");
            } catch (Exception e) {
            // Nếu có lỗi, rollback giao dịch
            handle.rollback();
            throw new RuntimeException("Failed to add product and related data: " + e.getMessage(), e);
        }
    });
    }

    public static void addProduct(ProductListImg product) {
        // Sử dụng giao dịch để đảm bảo tính toàn vẹn của dữ liệu
        jdbi.useTransaction(handle -> {
            try {
                // Thêm sản phẩm vào bảng products
                String sqlProduct = "INSERT INTO products (productID, name, price, discountDefault, description, categoryID, quanlityStock, quanlitySell, thumbnail, createAt) " +
                        "VALUES (:productID, :name, :price, :discountDefault, :description, :categoryID, :quanlityStock, :quanlitySell, :thumbnail, :createAt)";
                handle.createUpdate(sqlProduct)
                        .bind("productID", product.getProductID())
                        .bind("name", product.getName())
                        .bind("price", product.getPrice())
                        .bind("discountDefault", product.getDiscountDefault())
                        .bind("description", product.getDescription())
                        .bind("categoryID", product.getcategoryID())
                        .bind("quanlityStock", product.getQuanlityStock())
                        .bind("quanlitySell", product.getQuanlitySell())
                        .bind("thumbnail", product.getThumbnail())
                        .bind("createAt", product.getCreateAt())
                        .execute();

                // Thêm chi tiết sản phẩm vào bảng specifications
                String sqlDetails = "INSERT INTO specifications (specificationID, dimensions, material, original, standard, productID) " +
                        "VALUES (:productID, :dimensions, :material, :original, :standard, :productID)";
                handle.createUpdate(sqlDetails)
                        .bind("productID", product.getProductID())  // Chắc chắn rằng productID được sử dụng ở đây
                        .bind("dimensions", product.getSpecification().getDimensions())
                        .bind("material", product.getSpecification().getMaterial())
                        .bind("original", product.getSpecification().getOriginal())
                        .bind("standard", product.getSpecification().getStandard())
                        .bind("productID", product.getProductID())  // Cung cấp productID cho khóa ngoại
                        .execute();

                // Thêm danh sách hình ảnh vào bảng subImages
                addImages(handle, product);

                // Nếu không có lỗi, commit giao dịch
                handle.commit();

            } catch (Exception e) {
                // Nếu có lỗi, rollback giao dịch
                handle.rollback();
                throw new RuntimeException("Failed to add product and related data: " + e.getMessage(), e);
            }
        });
    }


    private static void addImages(Handle handle, ProductListImg product) {
        String sqlImages = "INSERT INTO subimages (subImagesID, image, createDate, productID) " +
                "VALUES (:subImagesID, :image, :createDate, :productID)";
        for (SubImage subImage : product.getSubImageList()) {
            handle.createUpdate(sqlImages)
                    .bind("subImagesID", subImage.getSubImagesID())
                    .bind("image", subImage.getImage())
                    .bind("createDate", subImage.getCreateDate())
                    .bind("productID", product.getProductID())

                    .execute();
        }
    }
    public List<Inventory_History> selectAll() {
        return jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT id, productID, " +
                            "CASE WHEN change_type = 'receipt' THEN 'Nhập kho' " +
                            "     WHEN change_type = 'issue' THEN 'Xuất kho' " +
                            "     ELSE change_type END AS changeType, " +
                            "related_id AS relatedId, quantity_change AS quantityChange, " +
                            "CASE WHEN change_type = 'receipt' THEN new_quantity - quantity_change " +
                            "     WHEN change_type = 'issue' THEN new_quantity + quantity_change " +
                            "     ELSE new_quantity END AS oldQuantity, " +
                            "new_quantity AS newQuantity, change_date AS changeDate, " +
                            "changed_by AS changedBy, note " +
                            "FROM inventory_history")
                    .mapToBean(Inventory_History.class)
                    .list();
        });
    }
    public void deleteById(int id) {
        jdbi.useHandle(handle -> {
            handle.createUpdate("DELETE FROM inventory_history WHERE id = :id")
                    .bind("id", id)
                    .execute();
        });
    }

    // update product
public static void updateProduct(ProductListImg product) {
    // Sử dụng giao dịch để đảm bảo tính toàn vẹn của dữ liệu
    jdbi.useTransaction(handle -> {
        try {
            // Cập nhật sản phẩm vào bảng products
            String sqlProduct = "UPDATE products SET name = :name, price = :price, discountDefault = :discountDefault, description = :description, " +
                    "categoryID = :categoryID, quanlityStock = :quanlityStock, quanlitySell = :quanlitySell, " +
                    "thumbnail = :thumbnail, createAt = :createAt WHERE productID = :productID";
            handle.createUpdate(sqlProduct)
                    .bind("productID", product.getProductID())
                    .bind("name", product.getName())
                    .bind("price", product.getPrice())
                    .bind("discountDefault", product.getDiscountDefault())
                    .bind("description", product.getDescription())

                    .bind("categoryID", product.getcategoryID())

                    .bind("quanlityStock", product.getQuanlityStock())
                    .bind("quanlitySell", product.getQuanlitySell())
                    .bind("thumbnail", product.getThumbnail())
                    .bind("createAt", product.getCreateAt())
                    .execute();

            // Cập nhật chi tiết sản phẩm vào bảng specifications
            String sqlDetails = "UPDATE specifications SET dimensions = :dimensions, material = :material, original = :original, " +
                    "standard = :standard WHERE specificationID = :productID";
            handle.createUpdate(sqlDetails)
                    .bind("productID", product.getProductID()) // Đổi thành specificationID nếu cần
                    .bind("dimensions", product.getSpecification().getDimensions())
                    .bind("material", product.getSpecification().getMaterial())
                    .bind("original", product.getSpecification().getOriginal())
                    .bind("standard", product.getSpecification().getStandard())
                    .execute();
            // Cập nhật hình ảnh trong bảng subImages (nếu có thay đổi)
            updateImages(handle, product);

            // Nếu không có lỗi, commit giao dịch
            handle.commit();

        } catch (Exception e) {
            // Nếu có lỗi, rollback giao dịch
            handle.rollback();
            throw new RuntimeException("Failed to update product and related data: " + e.getMessage(), e);
        }
    });
}
    private static void updateImages(Handle handle, ProductListImg product) {
        // Trước tiên xóa tất cả các hình ảnh cũ
        String deleteImages = "DELETE FROM subimages WHERE productID = :productID";
        handle.createUpdate(deleteImages)
                .bind("productID", product.getProductID())
                .execute();

        // Sau đó thêm các hình ảnh mới vào bảng subImages
        String sqlImages = "INSERT INTO subimages (subImagesID, image, createDate, productID) " +
                "VALUES (:subImagesID, :image, :createDate, :productID)";
        for (SubImage subImage : product.getSubImageList()) {
            handle.createUpdate(sqlImages)
                    .bind("subImagesID", subImage.getSubImagesID())
                    .bind("image", subImage.getImage())
                    .bind("createDate", subImage.getCreateDate())
                    .bind("productID", product.getProductID())
                    .execute();
        }
    }
    public static List<SubCategory> getListSubCategory() {
        try (Handle handle = jdbi.open()) {
            // Thực thi truy vấn và ánh xạ kết quả sang các đối tượng TypeOfCake
            return handle.createQuery("SELECT categoryID, name, thumbnail,categoryID FROM subcategory")
                    .mapToBean(SubCategory.class)  // Tự động ánh xạ các cột vào lớp TypeOfCake
                    .list(); // Trả về một danh sách các đối tượng TypeOfCake
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>(); // Trả về danh sách rỗng trong trường hợp có lỗi
        }
    }
//danh muc cha
public static List<Category> getListCategory() {
    try (Handle handle = jdbi.open()) {
        // Thực thi truy vấn và ánh xạ kết quả sang các đối tượng TypeOfCake
        return handle.createQuery("SELECT categoryID, name FROM category")
                .mapToBean(Category.class)  // Tự động ánh xạ các cột vào lớp TypeOfCake
                .list(); // Trả về một danh sách các đối tượng TypeOfCake
    } catch (Exception e) {
        e.printStackTrace();
        return new ArrayList<>(); // Trả về danh sách rỗng trong trường hợp có lỗi
    }
}
    public static void deleteProduct(String productID) {
        // Sử dụng giao dịch để đảm bảo tính toàn vẹn của dữ liệu
        jdbi.useTransaction(handle -> {
            try {
                System.out.println("Bắt đầu xóa sản phẩm với ID: " + productID);

                // Xóa các hình ảnh liên quan đến sản phẩm trong bảng subImages
                String sqlImages = "DELETE FROM subimages WHERE productID = :productID";
                int deletedImages = handle.createUpdate(sqlImages)
                        .bind("productID", productID)
                        .execute();
                System.out.println("Số ảnh bị xóa: " + deletedImages);

                // Xóa chi tiết sản phẩm trong bảng specifications
                String sqlDetails = "DELETE FROM specifications WHERE specificationID = :productID";
                int deletedDetails = handle.createUpdate(sqlDetails)
                        .bind("productID", productID)
                        .execute();
                System.out.println("Số thông tin đặc tả bị xóa: " + deletedDetails);

                // Xóa sản phẩm trong bảng products
                String sqlProduct = "DELETE FROM products WHERE productID = :productID";
                int affectedRows = handle.createUpdate(sqlProduct)
                        .bind("productID", productID)
                        .execute();
                System.out.println("Số sản phẩm bị xóa: " + affectedRows);

                if (affectedRows == 0) {
                    throw new RuntimeException("Không tìm thấy sản phẩm có ID: " + productID);
                }

            } catch (Exception e) {
                System.err.println("Lỗi khi xóa sản phẩm: " + e.getMessage());
                e.printStackTrace(); // Hiển thị lỗi chi tiết
                handle.rollback();
            }
        });
    }
    public boolean insertFullProduct(ProductExcel product) {
        return jdbi.withHandle(handle -> {
            // Kiểm tra xem mã sản phẩm đã tồn tại hay chưa
            String checkSql = "SELECT COUNT(*) FROM products WHERE productID = ?";
            int count = handle.createQuery(checkSql)
                    .bind(0, product.getCode())
                    .mapTo(Integer.class)
                    .one();

            if (count > 0) {
                System.err.println(">>> Mã sản phẩm đã tồn tại: " + product.getCode());
                throw new IllegalStateException("Product code already exists.");
            }

            try {
                handle.begin();

                String thumbnail = product.getImage();
                if (thumbnail == null || thumbnail.trim().isEmpty()) {
                    thumbnail = "default_image.jpg";
                }

                String sqlProduct = "INSERT INTO products (productID, name, price, description, categoryID, thumbnail, createAt, quanlityStock, quanlitySell) " +
                        "VALUES (?, ?, ?, ?, ?, ?, NOW(), ?, ?)";

                int affectedProduct = handle.createUpdate(sqlProduct)
                        .bind(0, product.getCode())
                        .bind(1, product.getName())
                        .bind(2, product.getPrice())
                        .bind(3, product.getDescription())
                        .bind(4, product.getMainCategory())
                        .bind(5, product.getImage())
                        .bind(6, product.getStock())
                        .bind(7, 0)
                        .execute();

                if (affectedProduct == 0) {
                    throw new RuntimeException("Không thêm được sản phẩm.");
                }

                String sqlSpec = "INSERT INTO specifications (specificationID, dimensions, material, original, standard, productID) " +
                        "VALUES (?, ?, ?, ?, ?, ?)";

                int affectedSpec = handle.createUpdate(sqlSpec)
                        .bind(0, product.getCode())
                        .bind(1, product.getSize())
                        .bind(2, product.getMaterial())
                        .bind(3, product.getOrigin())
                        .bind(4, product.getStandard())
                        .bind(5, product.getCode())
                        .execute();

                if (affectedSpec == 0) {
                    throw new RuntimeException("Không thêm được thông số kỹ thuật.");
                }

                if (product.getRelatedImages() != null && !product.getRelatedImages().isEmpty()) {
                    String sqlSubImage = "INSERT INTO subimages (image, createDate, productID) VALUES (?, NOW(), ?)";
                    for (String imageUrl : product.getRelatedImages()) {
                        int affectedSubImage = handle.createUpdate(sqlSubImage)
                                .bind(0, imageUrl)
                                .bind(1, product.getCode())
                                .execute();

                        if (affectedSubImage == 0) {
                            throw new RuntimeException("Không thêm được ảnh phụ: " + imageUrl);
                        }
                    }
                }

                handle.commit();
                return true;

            } catch (Exception e) {
                try {
                    handle.rollback();
                } catch (Exception rollbackEx) {
                    System.err.println("Lỗi khi rollback: " + rollbackEx.getMessage());
                }
                e.printStackTrace();
                return false;
            }
        });
    }



    public static void main(String[] args) {
        ProductAdminService productAdminService = new ProductAdminService();
        List<ProductAdminCateDTO> products = productAdminService.selectTableListProducts();
//
//       List<SubCategory> s = productAdminService.getListSubCategory();
//       s.forEach(subCategory -> System.out.println(subCategory));
//        List<Category> c = productAdminService.getListCategory();
//        c.forEach(Category -> System.out.println(Category));
        ProductListImg pli =  getProductById("MFWRHB301V2.BSMH");
        System.out.println(pli);

//        products.forEach(product -> System.out.println(product));
//
//        Specification specification = new Specification();
//        specification.setSpecificationID("abc");
//        specification.setDimensions("40x40x30");
//        specification.setMaterial("Wood");
//        specification.setOriginal("Vietnam");
//        specification.setStandard("ISO 9001");
//
//        // Tạo danh sách hình ảnh
//        SubImage subImage1 = new SubImage();
//        subImage1.setSubImagesID("IMG001");
//        subImage1.setImage("/images/img1.jpg");
//        subImage1.setCreateDate(LocalDateTime.now());
//
//        SubImage subImage2 = new SubImage();
//        subImage2.setSubImagesID("IMG002");
//        subImage2.setImage("/images/img2.jpg");
//        subImage2.setCreateDate(LocalDateTime.now());
//
//        // Tạo ProductListImg
//        ProductListImg product = new ProductListImg();
//        product.setProductID("P001");
//        product.setName("Bàn làm việc");
//        product.setPrice(5000000);
//        product.setDiscountDefault(10);
//        product.setDescription("Bàn làm việc gỗ tự nhiên");
//        product.setcategoryID("LV-GVP");
//        product.setQuanlityStock(100);
//        product.setQuanlitySell(0);
//        product.setThumbnail("/images/thumbnail.jpg");
//        product.setCreateAt(LocalDateTime.now());
//        product.setSpecification(specification);
//        product.setSubImageList(Arrays.asList(subImage1, subImage2));

        // Gọi hàm addProduct
//        addProduct(product);
        // Log kết
        System.out.println();
        System.out.println("Thêm sản phẩm thành công!");
    }


    }

