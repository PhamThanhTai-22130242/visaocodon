package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.Voucher;
import org.jdbi.v3.core.Jdbi;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

public class VoucherDao implements DaoInterface<Voucher> {


    Jdbi jdbi;

    public VoucherDao() {

        jdbi = JDBIConnector.getJdbi();
    }

    @Override
    public List<Voucher> selectAll() {
        return jdbi.withHandle(handle -> {
            return handle.createQuery("select * from voucher").mapToBean(Voucher.class).list();
        });

    }

    public List<Voucher> selectTop10() {
        return jdbi.withHandle(handle -> {
            return handle.createQuery("select * from voucher LIMIT 10").mapToBean(Voucher.class).list();
        });
    }


    public Voucher selectByCodeHasCondition(String code, int totalPrice) {
        Voucher voucher = jdbi.withHandle(handle -> {
            return handle.createQuery("select * from voucher WHERE code=? AND minOrderValue <= ?").
                    bind(0, code)
                    .bind(1, totalPrice)
                    .mapToBean(Voucher.class).findFirst().orElse(null);
        });

        return voucher;
    }

    public List<Voucher> selectByCondition(int totalPrice,String category) {
        return  jdbi.withHandle(handle -> {
            return handle.createQuery("select  * from voucher WHERE ? <= endDate  AND minOrderValue <= ? " +
                            " AND category_voucher = ? LIMIT 3").
                    bind(0, Date.valueOf(LocalDate.now()))
                    .bind(1, totalPrice)
                    .bind(2, category)
                    .mapToBean(Voucher.class).list();
        });

    }

    @Override
    public Voucher selectById(String id) {
        return null;
    }

    @Override
    public Voucher selectById(int id) {
        return jdbi.withHandle(handle -> {
            return handle.createQuery("select * from voucher").mapToBean(Voucher.class).findOne().orElse(null);
        });
    }

    @Override
    public int insert(Voucher voucher) {

        return jdbi.withHandle(handle -> {
            String sql = "INSERT INTO voucher (code, name, description, typeID, voucherPercent, voucherCash, maximumValue, minOrderValue, startDate, endDate)VALUES (:code, :name, :description, :typeID, :voucherPercent, :voucherCash, :maximumValue, :minOrderValue, :startDate, :endDate)";

            return handle.createUpdate(sql)
                    .bind("code", voucher.getCode())
                    .bind("name", voucher.getName())
                    .bind("description", voucher.getDescription())
                    .bind("typeID", voucher.getTypeID())
                    .bind("voucherPercent", voucher.getVoucherPercent())
                    .bind("voucherCash", voucher.getVoucherCash())
                    .bind("maximumValue", voucher.getMaximumValue())
                    .bind("minOrderValue", voucher.getMinOrderValue())
                    .bind("startDate", voucher.getStartDate())
                    .bind("endDate", voucher.getEndDate())
                    .execute();

        });

    }

    @Override
    public int update(Voucher voucher) {
        return 0;
    }

    @Override
    public int delete(String id) {
        return 0;
    }

    public static void main(String[] args) {
        System.out.println(new VoucherDao().selectByCodeHasCondition("D2TR", 1000));
        System.out.println(new VoucherDao().selectByCodeHasCondition("D2TR", 10005345));

    }
}
