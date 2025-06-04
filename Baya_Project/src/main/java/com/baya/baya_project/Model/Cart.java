package com.baya.baya_project.Model;

import com.baya.baya_project.Dao.ProductDao;

import java.util.*;

public class Cart {

    private Map<String, CartItem> carts;
    int fee = 0;
    int discount = 0;
    int discountShipping = 0;

    ProductDao dao;

    public Cart() {
        carts = new HashMap<>();
        dao = new ProductDao();
    }



    public void addCartItem(Product p, int quantity) {
        if (carts.containsKey(p.getProductID())) {
            CartItem item = carts.get(p.getProductID());
            item.setQuantity(item.getQuantity() + quantity);
        } else {
            CartItem newItem = new CartItem(p.getProductID(), p.getName(), p.getPrice(),
                    p.getDiscountDefault(), p.getThumbnail(), quantity,p.getQuantity());
            newItem.setChoose(false);
            carts.put(p.getProductID(), newItem);
        }
    }


    public void addCartItemIsChoose(Product p, int quantity) {
        if (carts.containsKey(p.getProductID())) {
            CartItem item = carts.get(p.getProductID());
            item.setQuantity(item.getQuantity() + quantity);
        } else {
            CartItem newItem = new CartItem(p.getProductID(), p.getName(), p.getPrice(),
                    p.getDiscountDefault(), p.getThumbnail(), quantity,p.getQuantity());
            newItem.setChoose(true);
            carts.put(p.getProductID(), newItem);
        }
    }


    public boolean updateQuantity(String productId, int quantity,int quantityStock) {
        if (carts != null && carts.containsKey(productId) && quantityStock >= quantity) {
            CartItem item = carts.get(productId);
            item.setQuatityStock(item.getQuantity());
            item.setQuantity(quantity);
            return true;
        }
        return false;
    }

    public void removeCartItem(String productId) {
        if (carts != null && carts.containsKey(productId)) {
            carts.remove(productId);
        }
    }

    public int totalPriceCartItemInCart() {
        return carts.values().stream()
                .filter(CartItem::isChoose)
                .mapToInt(CartItem::totalPriceCartItem)
                .sum();
    }


    public List<CartItem> itemCartIsChooseIncart() {
        return carts.values().stream()
                .filter(CartItem::isChoose).toList();
    }

    public int totalPriceCartAddFee() {
        return totalPriceCartItemInCart() + getFee();
    }

    public int totalDiscountCart() {
        return discount+discountShipping;
    }

    public int getDiscountShipping() {
        return discountShipping;
    }

    public int totalPriceCart() {
        return totalPriceCartAddFee() - totalDiscountCart();
    }

    public List<CartItem> getAllCartItems() {
        return new ArrayList<>(carts.values());
    }

    public int cartSize() {
        return carts.size();
    }

    public int itemIsChoosedInCart() {
        System.out.println("start");
        int count = 0;
        for (CartItem item : carts.values()) {
            if (item.isChoose()) {
                count++;
            }
        }
        return count;

    }


    public void clearCart() {
        carts.clear();
    }

    public Map<String, CartItem> getCarts() {
        return carts;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public void setDiscount(Voucher voucher) {
        int rs = 0;
        if (voucher.getTypeID() == 1) {
            rs =(totalPriceCartItemInCart() * voucher.getVoucherPercent() / 100);
            setDiscount(Math.min(rs, voucher.getMaximumValue()));
        } else {
            setDiscount(voucher.getVoucherCash());
        }
    }

    public void setDiscountShipping(Voucher voucher){
        int rs = 0;
        if (voucher.getTypeID() == 1) {
            rs =(getFee() * voucher.getVoucherPercent()) / 100;
            setDiscountShipping(rs);
        } else {
            setDiscountShipping(voucher.getVoucherCash());
        }
    }

    public void setDiscountShipping(int discountShipping) {
        this.discountShipping = discountShipping;
    }

    public int getFee() {

        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    public boolean setChooseItem(String id, boolean check, int quantityStock) {

        System.out.println(id+ " "+check);
        if (carts.containsKey(id) && quantityStock>0) {
         carts.get(id).setChoose(check);
         return true;
        }else{
            carts.get(id).setChoose(false);
            carts.get(id).setQuantity(0);
        }
        return false;
    }

    public void removeItemIsChoose() {
        carts.values().removeIf(CartItem::isChoose);
    }
}

