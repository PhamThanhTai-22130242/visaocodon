package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ProductDao;
import com.baya.baya_project.Dao.VoucherDao;
import com.baya.baya_project.Model.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;


@WebServlet(name = "CreateVoucher", value = "/setVoucher")
public class CreateVoucherController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String promoName = request.getParameter("promo-name");
        String promoCode = request.getParameter("promo-code");
        String promoDescription = request.getParameter("promo-des");
        String promoType = request.getParameter("promo-type");
        String promoValue = request.getParameter("promo-val");
        String promoMin = request.getParameter("promo-min");
        String promoMax = request.getParameter("promo-max");
        String startDate = request.getParameter("start-date");
        String endDate = request.getParameter("end-date");

        System.out.println("Tên khuyến mãi: " + promoName);
        System.out.println("Mã khuyến mãi: " + promoCode);
        System.out.println("Mô tả khuyến mãi: " + promoDescription);
        System.out.println("Loại khuyến mãi: " + promoType);
        System.out.println("Giá trị khuyến mãi: " + promoValue);
        System.out.println("Áp dụng tối thiểu: " + promoMin);
        System.out.println("Áp dụng tối đa: " + promoMax);
        System.out.println("Ngày bắt đầu: " + startDate);
        System.out.println("Ngày kết thúc: " + endDate);

        VoucherDao dao = new VoucherDao();
        Voucher voucher = new Voucher();

        voucher.setName(promoName);
        voucher.setCode(promoCode);
        voucher.setDescription(promoDescription);
        if(promoType.equals("percentage")){
            voucher.setVoucherPercent(Integer.parseInt(promoValue));
            voucher.setTypeID(1);
        } else if(promoType.equals("amount")){
            voucher.setVoucherCash(Integer.parseInt(promoValue));
            voucher.setTypeID(2);
        }

        voucher.setMinOrderValue(Integer.parseInt(promoMin));
        voucher.setMaximumValue(Integer.parseInt(promoMax));
        voucher.setStartDate(startDate);
        voucher.setEndDate(endDate);

        int success = dao.insert(voucher);


        request.setAttribute("success", success > 0);
        request.getRequestDispatcher("promotionPageAdmin.jsp").forward(request, response);

    }


}