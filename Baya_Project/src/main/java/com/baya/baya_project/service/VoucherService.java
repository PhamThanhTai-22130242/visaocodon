package com.baya.baya_project.service;

import com.baya.baya_project.Dao.VoucherDao;
import com.baya.baya_project.Model.Voucher;

import java.util.List;
import java.util.stream.Collectors;

public class VoucherService {

    VoucherDao voucherDao;

    public VoucherService() {
        voucherDao = new VoucherDao();
    }


    public List<Voucher> getAllVouchers() {
        return voucherDao.selectAll();
    }

    public List<Voucher> getTop10Vouchers() {
        return voucherDao.selectTop10();
    }


    public Voucher searchVoucher(String code, int totalPrice) {
        return voucherDao.selectByCodeHasCondition(code, totalPrice);
    }

    public List<Voucher> getVoucherTop3BestByCondition(int totalPrice,String category)
    {
            return voucherDao.selectByCondition(totalPrice,category).stream()
                .sorted((v1, v2) -> Integer.compare(
                        getDiscountValue(v2, totalPrice),
                        getDiscountValue(v1, totalPrice)
                ))
                .limit(3)
                .collect(Collectors.toList());
    }

    public static void main(String[] args) {
        System.out.println(new VoucherService().getVoucherTop3BestByCondition(30000000,"discount"));
    }

    private int getDiscountValue(Voucher voucher, double cartTotal) {

        int totalDiscount = 0;
        if(voucher.getTypeID()==1){
            totalDiscount = (int) ((voucher.getVoucherPercent() / 100.0) * cartTotal);
        }else{
            totalDiscount= voucher.getVoucherCash();

        }

        return Math.min(totalDiscount, voucher.getMaximumValue());
    }

}
