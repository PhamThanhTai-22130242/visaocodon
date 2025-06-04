package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.Product;
import org.jdbi.v3.core.Jdbi;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.*;

public class ProductDao implements DaoInterface<Product> {
    private static final Logger log = LoggerFactory.getLogger(ProductDao.class);
    public Jdbi jdbi;

    public ProductDao() {
        jdbi = JDBIConnector.getJdbi();
    }

    @Override
    public List<Product> selectAll() {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT  productID,  name,  price,  discountDefault,  description, categoryID, quanlityStock,  quanlitySell,  thumbnail,  createAt\n" +
                    "FROM products\n" +

                    "LIMIT 20"
            ).mapToBean(Product.class).list();
        });
    }

    public List<Product> selectAllProducts() {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT  productID, name,  price, discountDefault, createAt\n" +
                    "FROM products\n"
            ).mapToBean(Product.class).list();
        });
    }

    public List<Product> sort(String keyword, int idFilter, int numberProducts) {
        String orderBy = filterProd(idFilter);
        return jdbi.withHandle(ha -> {
            return ha.createQuery(
                            "SELECT  productID,  name,  price,  discountDefault,  description, categoryID, quanlityStock,  quanlitySell,  thumbnail,  createAt\n" +
                                    "FROM products\n" +
                                    "WHERE NAME LIKE ? \n" +
//                                    "order by productID, " +
                                    " ? Limit ?"

                    ).bind(0, "%" + keyword + "%")
                    .bind(1, orderBy).bind(2, numberProducts)

                    .mapToBean(Product.class).list();
        });

    }


    public List<Product> listTopComboProd() {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT  productID,  name,  price,  discountDefault,  description, categoryID, quanlityStock,  quanlitySell,  thumbnail,  createAt\n" +
                    "FROM products\n" +
                    "where name like '%Combo%' " +
                    "LIMIT 10"
            ).mapToBean(Product.class).list();
        });
    }

    public List<String> searchRecom(String keyword) {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("\n" +
                    "SELECT NAME\n" +
                    "FROM products\n" +
                    "WHERE NAME LIKE ?\n" +
                    "LIMIT 5"
            ).bind(0, keyword + "%").mapTo(String.class).list();
        });
    }


    public String filterProd(int id) {
        switch (id) {
            case 10:
                return "";
            case 11:
                return "   price desc ";
            case 12:
                return "  price asc ";
            case 13:
                return " quanlitySell desc ";
            case 14:
                return "  discountDefault desc ";
            default:
                return "";

        }

    }


    public List<Product> searchP(String keyword, int idFilter, int pageIndex) {


        List<Product> list = jdbi.withHandle(ha -> {
            return ha.createQuery(
                            "SELECT productID,  name,  price,  discountDefault,  description, categoryID, quanlityStock,  quanlitySell,  thumbnail,  createAt\n" +
                                    "FROM products\n" +
                                    "WHERE NAME LIKE ? \n" +


                                    "LIMIT 20 OFFSET ? \n"
                    ).bind(0, "%" + keyword + "%")
                    .bind(1, pageIndex * 20)
                    .mapToBean(Product.class).list();
        });
        sortProd(list, idFilter);
        return list;
    }

//    public List<Product> filterP(String keyword, int idFilter, int pr, int o, int p) {
//
//
//        List<Product> list = jdbi.withHandle(ha -> {
//            return ha.createQuery(
//                            "SELECT productID,  name,  price,  discountDefault,  description, categoryID, quanlityStock,  quanlitySell,  thumbnail,  createAt\n" +
//                                    "FROM products\n" +
//                                    "WHERE NAME LIKE ? \n" +
//
//
//                                    "LIMIT ? OFFSET 0 \n"
//                    ).bind(0, "%" + keyword + "%")
//                    .bind(1, pr)
//
//                    .mapToBean(Product.class).list();
//        });
//        sortProd(list, idFilter);
////       List<Product> result = sortPrice(list, p);
////        sortByOriginal(result, o);
//
//
//        return result;
//
//    }
    public List<Product> loadProd(String keyword, int pageIndex ) {
        List<Product> list = jdbi.withHandle(ha -> {
            return ha.createQuery(
                            "SELECT p.productID,  name,  price,  discountDefault,  description, categoryID, quanlityStock,  quanlitySell,  thumbnail,  createAt, i.quantity\n" +
                                    "FROM products p JOIN inventory i ON p.productID = i.productID " +
                                    "WHERE NAME LIKE ? \n" +
                                    "LIMIT 20 OFFSET ? \n"
                    ).bind(0, "%" + keyword + "%")
                    .bind(1, pageIndex * 20)
                    .mapToBean(Product.class).list();
        });

        return list;
    }

    public void sortByOriginal(List<Product> list, int o) {
        SpecificationDao dao = new SpecificationDao();
        list.removeIf(p -> {
            String idProduct = p.getProductID();
            String originalByID = dao.originalByID(idProduct);

            switch (o) {
                case 1:
                    return !originalByID.equals("Việt Nam");
                case 2:
                    return !originalByID.equals("Trung Quốc");
                case 3:
                    return !originalByID.equals("Châu ÂU");
                case 4:
                    return !originalByID.equals("Hoa Kỳ");
                default:
                    return false;
            }
        });
    }


    public void sortProd(List<Product> list, int f) {
        switch (f) {
            case 2:
                System.out.println("chay vao day");
                //ban chay
                list.sort(Comparator.comparingInt(Product::getQuanlitySell).reversed());
                break;
            case 3:
                //giam gia

                list.sort(Comparator.comparingInt(Product::getDiscountDefault).reversed());
                break;

            case 4:

                //gia giam dan
                list.sort(Comparator.comparingDouble(Product::getFinalPrice).reversed());
                break;
            case 5:
                //gia tang dan
                list.sort(Comparator.comparingDouble(Product::getFinalPrice));
                break;
            default:
                // Giữ nguyên danh sách
                break;
        }


    }

    public List<Product> sortPri(List<Product> list, int f) {
        List<Product> result = new ArrayList<>();
        for (Product p : list) {
            switch (f) {
                case 1:
                    if (p.getPrice() < 2500000) {
                        result.add(p);

                    }
                    break;
                case 2:
                    if (p.getPrice() > 2500000 && p.getPrice() < 5000000) {
                        result.add(p);
                    }
                    break;
                case 3:
                    if (p.getPrice() > 5000000 && p.getPrice() < 10000000) {
                        result.add(p);

                    }
                    break;
                case 4:
                    if (p.getPrice() > 10000000) {
                        result.add(p);
                    }
                    break;
                default:
                    result.add(p);
                    break;
            }
        }
        return result;
    }
    public void sortPrice(List<Product> list, int f) {

            Iterator<Product> iterator = list.iterator();
            while (iterator.hasNext()) {
                Product p = iterator.next();
                switch (f) {
                    case 1:
                        if (p.getPrice() >= 2500000) iterator.remove();
                        break;
                    case 2:
                        if (p.getPrice() <= 2500000 || p.getPrice() >= 5000000) iterator.remove();
                        break;
                    case 3:
                        if (p.getPrice() <= 5000000 || p.getPrice() >= 10000000) iterator.remove();
                        break;
                    case 4:
                        if (p.getPrice() <= 10000000) iterator.remove();
                        break;
                    default:
                        break;
                }
            }


    }

    public void sortByPrice(List<Product> list, int p) {
        list.removeIf(product -> {
            double price = product.getPrice();
            switch (p) {
                case 1:
                    return price > 2500000;
                case 2:
                    return !(price > 2500000 && price < 5000000);
                case 3:
                    return !(price > 5000000 && price < 10000000);
                case 4:
                    return !(price > 10000000);
                default:
                    return false;
            }
        });
    }


    public List<Product> searchProduct(String keyword, int offset) {
        return jdbi.withHandle(ha -> {
            return ha.createQuery(" \n" +
                    "SELECT  productID,  name,  price,  discountDefault,  description, categoryID, quanlityStock,  quanlitySell,  thumbnail,  createAt\n" +
                    "FROM products\n" +
                    "WHERE NAME LIKE ? \n" +
                    "LIMIT 20 OFFSET 0"
            ).bind(0, "%" + keyword + "%").mapToBean(Product.class).list();
        });

    }

    @Override
    public Product selectById(String id) {
        return jdbi.withHandle(ha -> {
            return ha.createQuery(
                            "SELECT p.productID, name, price, discountDefault, description, categoryID, quanlityStock, quanlitySell, thumbnail, createAt, i.quantity " +
                                    "FROM products p JOIN inventory i ON p.productID = i.productID " +
                                    "WHERE p.productID = ?"
                    )
                    .bind(0, id)
                    .mapToBean(Product.class)
                    .findOne()
                    .orElse(null);
        });
    }

    @Override
    public Product selectById(int id) {
        return null;
    }

    public List<Product> topProductSell() {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT  p.productID,  name,  price,  discountDefault,  description, categoryID, quanlityStock,  quanlitySell,  thumbnail,  createAt,i.quantity \n" +
                    "    FROM products p JOIN inventory i ON p.productID = i.productID\n " +
                    "    ORDER BY quanlitySell DESC\n" +
                    "    LIMIT 10"
            ).mapToBean(Product.class).list();
        });
    }

    public List<Product> selectTopLastDate() {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT  p.productID,  name,  price,  discountDefault,  description, categoryID, quanlityStock,  quanlitySell,  thumbnail,  createAt,i.quantity \n" +
                    "    FROM products p JOIN inventory i ON p.productID = i.productID\n " +
                    "ORDER BY createAt desc\n" +
                    "LIMIT 10"
            ).mapToBean(Product.class).list();
        });
    }

    public boolean findByID(String id) {
        if (selectByID(id) != null) {
            return true;
        }
        return false;
    }

    public Product selectByID(String productID) {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT p.productID,  name,  price,  discountDefault,  description, categoryID, quanlityStock,  quanlitySell,  thumbnail,  createAt,i.quantity \n" +
                    "FROM products p JOIN inventory i ON i.productID= p.productID " +
                    "WHERE p.productID = ?"
            ).bind(0, productID).mapToBean(Product.class).findFirst().orElse(null);
        });

    }


    @Override
    public int insert(Product product) {
        return 0;
    }

    @Override
    public int update(Product product) {
        return 0;
    }

    @Override
    public int delete(String id) {
        return 0;
    }


    public List<Product> pagingProduct(int index) {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT  p.productID,  name,  price,  discountDefault,  description, categoryID, quanlityStock,  quanlitySell,  thumbnail,  createAt,i.quantity \n" +
                    "    FROM products p JOIN inventory i ON p.productID = i.productID\n " +
                    "ORDER BY createAt desc\n" +
                    "LIMIT 10"
            ).mapToBean(Product.class).list();
        });
    }

    public List<Product> featuredFlashSales(int idFilter, int pageIndex) {
        String orderBy = filterProd(idFilter);

        return jdbi.withHandle(ha -> {
            return ha.createQuery(
                            "SELECT productID,  name,  price,  discountDefault,  description, categoryID, quanlityStock,  quanlitySell,  thumbnail,  createAt\n" +
                                    "FROM products\n" +

                                    "order by  ? , discountDefault desc " +

                                    "LIMIT 20 OFFSET ? \n"
                    )
                    .bind(0, orderBy)
                    .bind(1, pageIndex * 20)
                    .mapToBean(Product.class).list();
        });

    }

    public List<Product> featuredTopSells(int idFilter, int pageIndex) {
        String orderBy = filterProd(idFilter);
        return jdbi.withHandle(ha -> {
            return ha.createQuery(
                            "SELECT productID,  name,  price,  discountDefault,  description, categoryID, quanlityStock,  quanlitySell,  thumbnail,  createAt\n" +
                                    "FROM products\n" +

                                    "order by  ? , quanlitySell desc " +

                                    "LIMIT 20 OFFSET ? \n"
                    )
                    .bind(0, orderBy)
                    .bind(1, pageIndex * 20)
                    .mapToBean(Product.class).list();
        });

    }

    public List<Product> featuredFullCombo(int idFilter, int pageIndex) {
        String orderBy = filterProd(idFilter);

        return jdbi.withHandle(ha -> {
            return ha.createQuery(
                            "SELECT productID,  name,  price,  discountDefault,  description, categoryID, quanlityStock,  quanlitySell,  thumbnail,  createAt\n" +
                                    "FROM products\n" +
                                    "where name like ' %Combo%'" +
                                    "order by  ?  " +

                                    "LIMIT 20 OFFSET ? \n"
                    )
                    .bind(0, orderBy)
                    .bind(1, pageIndex * 20)
                    .mapToBean(Product.class).list();
        });

    }


    public int getTotalProducts() {
        return jdbi.withHandle(hanlder -> {
            return hanlder.createQuery("SELECT COUNT(*) as total from products").mapTo(Integer.class).findOne().orElse(0);
        });
    }


    public List<Product> getTop5Sellest() {

        return jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT \n" +
                            "   p.*,SUM(oi.quantity) AS total_quantity\n" +
                            "FROM order_detail oi \n" +
                            "JOIN orders o ON oi.orderID = o.orderID\n" +
                            "JOIN products p ON oi.productID = p.productID\n" +
                            "WHERE MONTH(o.deliveredDate) = MONTH(CURRENT_DATE)\n" +
                            "  AND YEAR(o.deliveredDate) = YEAR(CURRENT_DATE)\n" +
                            "GROUP BY oi.productID\n" +
                            "ORDER BY total_quantity DESC\n" +
                            "LIMIT 10;\n")
                    .mapToBean(Product.class)
                    .list();
        });

    }

    public int setQuatityForProduct(String id) {
        return jdbi.withHandle(handle -> {
            return handle.createUpdate("UPDATE products\n" +
                    "SET NAME = ?" +
                    "WHERE NAME LIKE 'Sản phẩm%';").bind(0,"Baya-Signature Năm 2025 " +id).execute();
        });
    }
    private static String generateRandomCode() {
        String letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        Random rand = new Random();
        StringBuilder code = new StringBuilder();
        for (int i = 0; i < 8; i++) {
            code.append(letters.charAt(rand.nextInt(letters.length())));
        }
        return code.toString();
    }
    public int updateName(String name){
        return jdbi.withHandle(handle -> {
            return handle.createUpdate("UPDATE products p SET p.QuanlitySell =  p.QuanlitySell+1 ,p.QuanlityStock=p.QuanlityStock-1\n" +
                    "where p.productID= ?").bind(0, name).execute();
        });
    }

    public List<Product> getListProductByOrder(int orderID) {
        return jdbi.withHandle( handle -> {
            return  handle.createQuery(
                            "SELECT p.* from \n" +
                            "orders o JOIN order_detail od on o.orderID =od.orderID join products p on p.productID=od.productID\n" +
                            "where o.orderID=?").
                    bind(0,orderID).mapToBean(Product.class).list();
        });
    }
    public void updateProductNamesWithRandomCodes() {
        jdbi.useHandle(handle -> {
            // 1. Lấy danh sách ID các sản phẩm cần cập nhật
            List<String> productIds = handle
                    .createQuery("SELECT productID FROM products WHERE NAME LIKE 'Baya-Signature%'")
                    .mapTo(String.class)
                    .list();

            // 2. Chuẩn bị câu lệnh update
            org.jdbi.v3.core.statement.Update update = handle.createUpdate("UPDATE products SET NAME = :newName WHERE productID = :id");

            // 3. Cập nhật từng sản phẩm với mã riêng
            for (String id : productIds) {
                String randomCode = generateRandomCode();
                String newName = "Baya-Signature Năm 2025 - " + randomCode;
                update.bind("newName", newName)
                        .bind("id", id)
                        .execute();

                System.out.println("Cập nhật ID " + id + " thành '" + newName + "'");
            }
        });
    }

    public static void main(String[] args) {
        ProductDao productDao = new ProductDao();
        productDao.updateProductNamesWithRandomCodes();
//        System.out.println(productDao.updateProductNamesWithRandomCodes());
//        System.out.println(new ProductDao().topProductSell().get(1).getQuantity());
    }
}
