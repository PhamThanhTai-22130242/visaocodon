package com.baya.baya_project.service;

import com.baya.baya_project.Model.JavaMail;
import com.baya.baya_project.Model.Order;
import com.baya.baya_project.Model.OrderDetail;

import java.text.SimpleDateFormat;

public class MailService {
    JavaMail javaMail;

    public MailService() {
        javaMail = new JavaMail();
    }


    public void sendMailTo(String to, String subject, Order order) {
        String body =createOrderEmailBody(order, order.getFee(), order.getDiscount());
        javaMail.sendEmail(to, subject, body);
    }




        public  String createOrderEmailBody(Order order,int fee,int discount) {
            StringBuilder body = new StringBuilder();

            body.append("<style>");
            body.append("body { font-family: Arial, sans-serif; color: #333333; background-color: #f4f4f4; margin: 0; padding: 0; }");
            body.append(".container { background-color: #fffef6; max-width: 600px; margin: 0 auto; padding: 20px; font-size: 16px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); }");
            body.append("h1 { color: #4CAF50; text-align: center; }");
            body.append("p { font-size: 16px; line-height: 1.5; }");
            body.append("table { width: 100%; border-collapse: collapse; margin: 20px 0; }");
            body.append("th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }");
            body.append("th { background-color: #f2f2f2; color: #333; }");
            body.append("td { background-color: #fafafa; }");
            body.append(".footer { text-align: center; font-size: 14px; color: #777; margin-top: 30px; }");
            body.append(".total-price { font-weight: bold; color: #4CAF50; }");
            body.append(".order-status { padding: 8px 12px; background-color: #ff9800; color: white; border-radius: 4px; font-weight: bold; }");
            body.append("</style>");

            body.append("<div class=\"container\" style=\"background-color: #f7fafb; font-size: 16px; border-radius: 10px; padding:20px\">");
            body.append("<h1>Thông tin đơn hàng</h1>");

            body.append("<p><strong>Họ tên: </strong>" + order.getFullname() + "</p>");
            body.append("<p><strong>Email: </strong>" + order.getEmail() + "</p>");
            body.append("<p><strong>Số điện thoại: </strong>" + order.getPhoneNumber() + "</p>");
            body.append("<p><strong>Địa chỉ giao hàng: </strong>" + order.getAddress() + "</p>");
            body.append("<p><strong>Ghi chú: </strong>" + order.getNote() + "</p>");


            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            body.append("<p><strong>Ngày tạo đơn: </strong>" + dateFormat.format(order.getCreateAt()) + "</p>");

            body.append("<h3>Chi tiết sản phẩm:</h3>");
            body.append("<table>");
            body.append("<tr><th>Sản phẩm</th><th>Số lượng</th><th>Tổng giá</th></tr>");

            for (OrderDetail item : order.getItems()) {
                body.append("<tr>");
                body.append("<td>" + item.getName() + "</td>");
                body.append("<td style=\" text-align: center;\">" + item.getQuantity() + "</td>");
                body.append("<td style=\"text-align: end; padding:15px\">" +  item.getTotalPrice() + " đ</td>");
                body.append("</tr>");
            }

            body.append("<tr><td colspan='2'><strong>Phí vận chuyển:</strong></td>");
            body.append("<td style=\"text-align: end; padding:15px\" class='total-price'>" +  fee+ " đ</td></tr>");

            body.append("<tr><td colspan='2'><strong>Giảm giá :</strong></td>");
            body.append("<td style=\"text-align: end; padding:15px\" class='total-price'>" +  discount + " đ</td></tr>");

            body.append("<tr><td colspan='2'><strong>Tổng giá trị đơn hàng:</strong></td>");
            body.append("<td style=\"text-align: end; padding:15px\"  class='total-price'>" + order.getTotalPrice() + " đ</td></tr>");
            body.append("</table>");

            body.append("<p><strong>Phương thức thanh toán: </strong><span class='order-status'>" + order.getPaymentName() + "</span></p>");
            body.append("<p><strong>Trạng thái đơn hàng: </strong><span class='order-status'>" + order.getOrderStatusName() + "</span></p>");
            body.append("<p class='footer'>Cảm ơn bạn đã mua hàng tại cửa hàng chúng tôi!</p>");
            body.append("</div>");
            return body.toString();
        }

    public static void main(String[] args) {

    }




}
