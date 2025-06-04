package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.Category;
import com.baya.baya_project.Model.Product;
import com.baya.baya_project.Model.Specification;
import com.baya.baya_project.Model.SubImage;
import org.jdbi.v3.core.statement.Query;

import java.util.List;

import static com.baya.baya_project.Dao.JDBIConnector.jdbi;

public class ProductAdminDao implements DaoInterface{
    public ProductAdminDao(){
            jdbi = JDBIConnector.getJdbi();
    }

    @Override
    public  List<Product> selectAll() {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT  productID,  name,  price,  discountDefault,  description, categoryID, quanlityStock,  quanlitySell,  thumbnail,  createAt\n" +
                    "FROM products\n" +

                    "LIMIT 20"
            ).mapToBean(Product.class).list();
        });
    }
    // list ảnh
    public static List<SubImage> findListImgProductID(String idProduct) {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT subImagesID,  image,  createDate,  productID\n" +
                    "FROM subimages\n" +
                    "WHERE productID = ?"
            ).bind(0, idProduct).mapToBean(SubImage.class).list();
        });
    }
    public static SubImage findImgProductID(String idProduct) {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT subImagesID,  image,  createDate,  productID\n" +
                    "FROM subimages\n" +
                    "WHERE productID = ?"
            ).bind(0, idProduct).mapToBean(SubImage.class).findOnly();
        });
    }


    // đặc tả kỹ thuật
    public static Specification findSpecificationBy(String id) {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT specificationID,  dimensions,  material,  original,  standard\n" +
                    "FROM specifications\n" +
                    "WHERE specificationID = ?"
            ).bind(0, id).mapToBean(Specification.class).findOnly();
        });
    }
    public static Product findProductById(String productId) {
        return jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT productID, name, price, discountDefault, description, categoryID, quanlityStock, quanlitySell, thumbnail, createAt " +
                            "FROM products WHERE productID = :productId")
                    .bind("productId", productId) // Bind tham số productId vào truy vấn
                    .mapToBean(Product.class) // Ánh xạ kết quả truy vấn thành đối tượng Product
                    .findOnly(); // Lấy một sản phẩm duy nhất
        });
    }
    public List<Product> selectTableProducts(){

        return null;
    }
    public static List<Category> getListType() {
        return jdbi.withHandle(handle -> {
            Query query = handle.createQuery("SELECT categoryID, name FROM category;");
            return query.mapToBean(Category.class).list();
        });
    }


    @Override
    public Object selectById(String id) {
        return null;
    }

    @Override
    public Object selectById(int id) {
        return null;
    }

    @Override
    public int insert(Object o) {
        return 0;
    }

    @Override
    public int update(Object o) {
        return 0;
    }

    @Override
    public int delete(String id) {
        return 0;
    }

    public static void main(String[] args) {
        ProductAdminDao p = new ProductAdminDao();
       List<Category> cate = p.getListType();
       Product product = p.findProductById("MFWRHB301V2.BSMH");
       System.out.println(product);
    }
}

