package com.baya.baya_project.service;

import com.baya.baya_project.config.Server;

public class ActiveAccount {
    String message;

    public ActiveAccount() {

    }
    public String sendEmailForgetPass(String email, String name, String tokens) {
        return message = "<!DOCTYPE html>\n" +
                "<html lang=\"vi\">\n" +
                "<head>\n" +
                "<meta charset=\"UTF-8\">\n" +
                "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "<title>Kích hoạt tài khoản</title>\n" +
                "<style>\n" +
                "  body {\n" +
                "    font-family: Arial, sans-serif;\n" +
                "    font-size: 14px;\n" +
                "    line-height: 1.6;\n" +
                "    color: #333333;\n" +
                "    background-color: #f4f4f4;\n" +
                "    margin: 0;\n" +
                "    padding: 0;\n" +
                "  }\n" +
                "  .container {\n" +
                "    width: 100%;\n" +
                "    max-width: 600px;\n" +
                "    margin: 20px auto;\n" +
                "    background-color: #ffffff;\n" +
                "    border: 1px solid #dddddd;\n" +
                "  }\n" +
                "  .content {\n" +
                "    padding: 20px;\n" +
                "    text-align: left;\n" +
                "  }\n" +
                "  .header {\n" +
                "    font-size: 16px;\n" +
                "    font-weight: bold;\n" +
                "    margin-bottom: 10px;\n" +
                "  }\n" +
                "  .highlight-text {\n" +
                "    color: #007bff; \n" +
                "    font-weight: bold;\n" +
                "  }\n" +
                "  .button-container {\n" +
                "    text-align: left;\n" +
                "    margin-top: 20px;\n" +
                "    margin-bottom: 20px;\n" +
                "  }\n" +
                "  .button {\n" +
                "    background-color: #007bff; \n" +
                "    color: #ffffff !important;\n" +
                "    padding: 10px 20px;\n" +
                "    text-decoration: none;\n" +
                "    border-radius: 5px;\n" +
                "    font-weight: bold;\n" +
                "    display: inline-block;\n" +
                "  }\n" +
                "  .note {\n" +
                "    font-size: 12px;\n" +
                "    color: #666666;\n" +
                "    margin-top: 15px;\n" +
                "  }\n" +
                "  .footer {\n" +
                "    padding: 20px;\n" +
                "    font-size: 12px;\n" +
                "    color: #666666;\n" +
                "    border-top: 1px solid #eeeeee;\n" +
                "    margin-top: 20px;\n" +
                "  }\n" +
                "  .qr-code {\n" +
                "    float: left;\n" +
                "    margin-right: 20px;\n" +
                "   \n" +
                "  }\n" +
                "  .qr-code img {\n" +
                "    width: 80px;\n" +
                "    height: 80px; \n" +
                "  }\n" +
                "  .app-buttons {\n" +
                "    margin-top: 10px;\n" +
                "  }\n" +
                "  .app-buttons img {\n" +
                "    height: 30px;\n" +
                "    margin-right: 10px;\n" +
                "  }\n" +
                "  .clear {\n" +
                "    clear: both;\n" +
                "  }\n" +
                "  a {\n" +
                "    color: #007bff;\n" +
                "    text-decoration: none;\n" +
                "  }\n" +
                "  a:hover {\n" +
                "    text-decoration: underline;\n" +
                "  }\n" +
                "</style>\n" +
                "</head>\n" +
                "<body>\n" +
                "  <div class=\"container\">\n" +
                "    <div class=\"content\">\n" +
                "      <p class=\"header\">Kính gửi: "+name+" </p>\n" +
                "      <p>CÔNG TY <span class=\"highlight-text\">BAYA-STORE</span> đã mời bạn thay đổi mật khẩu</p>\n" +
                "      <p>Tài khoản đăng nhập: <a href=\"mailto:\\" + email +"\">"+email+"</a></p>\n" +
                "\n" +
                "      <div class=\"button-container\">\n" +
                "        <a href=\""+tokens+"\" class=\"button\">Kích hoạt ngay</a>\n" +
                "      </div>\n" +
                "\n" +
                "      <p class=\"note\">Lưu ý: Email này sẽ có hiệu lực trong vòng 24 giờ.<br>\n" +
                "      Nếu có bất kỳ vướng mắc gì, xin vui lòng liên hệ với Tổng Đài tư vấn Baya-Store để được hỗ trợ.</p>\n" +
                "\n" +
                "     \n" +
                "      Công ty Baya</p>\n" +
                "         <p >Trân trọng,<br>\n" +
                "    </div>\n" +
                "    <div class=\"footer\">\n" +
                "    \n" +
                "      <div>\n" +
                "        Website: <a href=\"https://bayastore.id.vn\">https://bayastore.id.vn</a> | Email: <a href=\"mailto:tailam@gmail.com\">baya@gmail.com</a><br>\n" +
                "       \n" +
                "       \n" +
                "      </div>\n" +
                "      <div class=\"clear\"></div>\n" +
                "      <p style=\"margin-top:15px;\">Lưu ý: Đây là email được gửi tự động từ hệ thống, vui lòng không phản hồi lại email này.</p>\n" +
                "    </div>\n" +
                "  </div>\n" +
                "</body>\n" +
                "</html>";
    }

    public String sendEmailAdminActive(String email, String name, String tokens, String roleName) {
       return message = "<!DOCTYPE html>\n" +
                "<html lang=\"vi\">\n" +
                "<head>\n" +
                "<meta charset=\"UTF-8\">\n" +
                "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "<title>Kích hoạt tài khoản</title>\n" +
                "<style>\n" +
                "  body {\n" +
                "    font-family: Arial, sans-serif;\n" +
                "    font-size: 14px;\n" +
                "    line-height: 1.6;\n" +
                "    color: #333333;\n" +
                "    background-color: #f4f4f4;\n" +
                "    margin: 0;\n" +
                "    padding: 0;\n" +
                "  }\n" +
                "  .container {\n" +
                "    width: 100%;\n" +
                "    max-width: 600px;\n" +
                "    margin: 20px auto;\n" +
                "    background-color: #ffffff;\n" +
                "    border: 1px solid #dddddd;\n" +
                "  }\n" +
                "  .content {\n" +
                "    padding: 20px;\n" +
                "    text-align: left;\n" +
                "  }\n" +
                "  .header {\n" +
                "    font-size: 16px;\n" +
                "    font-weight: bold;\n" +
                "    margin-bottom: 10px;\n" +
                "  }\n" +
                "  .highlight-text {\n" +
                "    color: #007bff; \n" +
                "    font-weight: bold;\n" +
                "  }\n" +
                "  .button-container {\n" +
                "    text-align: left;\n" +
                "    margin-top: 20px;\n" +
                "    margin-bottom: 20px;\n" +
                "  }\n" +
                "  .button {\n" +
                "    background-color: #007bff; \n" +
                "    color: #ffffff !important;\n" +
                "    padding: 10px 20px;\n" +
                "    text-decoration: none;\n" +
                "    border-radius: 5px;\n" +
                "    font-weight: bold;\n" +
                "    display: inline-block;\n" +
                "  }\n" +
                "  .note {\n" +
                "    font-size: 12px;\n" +
                "    color: #666666;\n" +
                "    margin-top: 15px;\n" +
                "  }\n" +
                "  .footer {\n" +
                "    padding: 20px;\n" +
                "    font-size: 12px;\n" +
                "    color: #666666;\n" +
                "    border-top: 1px solid #eeeeee;\n" +
                "    margin-top: 20px;\n" +
                "  }\n" +
                "  .qr-code {\n" +
                "    float: left;\n" +
                "    margin-right: 20px;\n" +
                "   \n" +
                "  }\n" +
                "  .qr-code img {\n" +
                "    width: 80px;\n" +
                "    height: 80px; \n" +
                "  }\n" +
                "  .app-buttons {\n" +
                "    margin-top: 10px;\n" +
                "  }\n" +
                "  .app-buttons img {\n" +
                "    height: 30px;\n" +
                "    margin-right: 10px;\n" +
                "  }\n" +
                "  .clear {\n" +
                "    clear: both;\n" +
                "  }\n" +
                "  a {\n" +
                "    color: #007bff;\n" +
                "    text-decoration: none;\n" +
                "  }\n" +
                "  a:hover {\n" +
                "    text-decoration: underline;\n" +
                "  }\n" +
                "</style>\n" +
                "</head>\n" +
                "<body>\n" +
                "  <div class=\"container\">\n" +
                "    <div class=\"content\">\n" +
                "      <p class=\"header\">Kính gửi: "+name+" </p>\n" +
                "      <p>CÔNG TY <span class=\"highlight-text\">BAYA-STORE</span> đã mời bạn vào sử dụng tài khoản  quản trị tài khoản ADMIN với vai trò: "+roleName+"</p>\n" +
                "      <p>Tài khoản đăng nhập: <a href=\"mailto:\\" + email +"\">"+email+"</a></p>\n" +
                "\n" +
                "      <div class=\"button-container\">\n" +
                "        <a href=\""+tokens+"\" class=\"button\">Kích hoạt ngay</a>\n" +
                "      </div>\n" +
                "\n" +
                "      <p class=\"note\">Lưu ý: Email này sẽ có hiệu lực trong vòng 24 giờ.<br>\n" +
                "      Nếu có bất kỳ vướng mắc gì, xin vui lòng liên hệ với Tổng Đài tư vấn Baya-Store để được hỗ trợ.</p>\n" +
                "\n" +
                "     \n" +
                "      Công ty Baya</p>\n" +
                "         <p >Trân trọng,<br>\n" +
                "    </div>\n" +
                "    <div class=\"footer\">\n" +
                "    \n" +
                "      <div>\n" +
                "        Website: <a href=\"https://bayastore.id.vn\">https://bayastore.id.vn</a> | Email: <a href=\"mailto:tailam@gmail.com\">baya@gmail.com</a><br>\n" +
                "       \n" +
                "       \n" +
                "      </div>\n" +
                "      <div class=\"clear\"></div>\n" +
                "      <p style=\"margin-top:15px;\">Lưu ý: Đây là email được gửi tự động từ hệ thống, vui lòng không phản hồi lại email này.</p>\n" +
                "    </div>\n" +
                "  </div>\n" +
                "</body>\n" +
                "</html>";
    }
    public String sendEmailUserActive(String email, String name, String tokens) {
        return message = "<!DOCTYPE html>\n" +
                "<html lang=\"vi\">\n" +
                "<head>\n" +
                "<meta charset=\"UTF-8\">\n" +
                "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "<title>Kích hoạt tài khoản</title>\n" +
                "<style>\n" +
                "  body {\n" +
                "    font-family: Arial, sans-serif;\n" +
                "    font-size: 14px;\n" +
                "    line-height: 1.6;\n" +
                "    color: #333333;\n" +
                "    background-color: #f4f4f4;\n" +
                "    margin: 0;\n" +
                "    padding: 0;\n" +
                "  }\n" +
                "  .container {\n" +
                "    width: 100%;\n" +
                "    max-width: 600px;\n" +
                "    margin: 20px auto;\n" +
                "    background-color: #ffffff;\n" +
                "    border: 1px solid #dddddd;\n" +
                "  }\n" +
                "  .content {\n" +
                "    padding: 20px;\n" +
                "    text-align: left;\n" +
                "  }\n" +
                "  .header {\n" +
                "    font-size: 16px;\n" +
                "    font-weight: bold;\n" +
                "    margin-bottom: 10px;\n" +
                "  }\n" +
                "  .highlight-text {\n" +
                "    color: #007bff; \n" +
                "    font-weight: bold;\n" +
                "  }\n" +
                "  .button-container {\n" +
                "    text-align: left;\n" +
                "    margin-top: 20px;\n" +
                "    margin-bottom: 20px;\n" +
                "  }\n" +
                "  .button {\n" +
                "    background-color: #007bff; \n" +
                "    color: #ffffff !important;\n" +
                "    padding: 10px 20px;\n" +
                "    text-decoration: none;\n" +
                "    border-radius: 5px;\n" +
                "    font-weight: bold;\n" +
                "    display: inline-block;\n" +
                "  }\n" +
                "  .note {\n" +
                "    font-size: 12px;\n" +
                "    color: #666666;\n" +
                "    margin-top: 15px;\n" +
                "  }\n" +
                "  .footer {\n" +
                "    padding: 20px;\n" +
                "    font-size: 12px;\n" +
                "    color: #666666;\n" +
                "    border-top: 1px solid #eeeeee;\n" +
                "    margin-top: 20px;\n" +
                "  }\n" +
                "  .qr-code {\n" +
                "    float: left;\n" +
                "    margin-right: 20px;\n" +
                "   \n" +
                "  }\n" +
                "  .qr-code img {\n" +
                "    width: 80px;\n" +
                "    height: 80px; \n" +
                "  }\n" +
                "  .app-buttons {\n" +
                "    margin-top: 10px;\n" +
                "  }\n" +
                "  .app-buttons img {\n" +
                "    height: 30px;\n" +
                "    margin-right: 10px;\n" +
                "  }\n" +
                "  .clear {\n" +
                "    clear: both;\n" +
                "  }\n" +
                "  a {\n" +
                "    color: #007bff;\n" +
                "    text-decoration: none;\n" +
                "  }\n" +
                "  a:hover {\n" +
                "    text-decoration: underline;\n" +
                "  }\n" +
                "</style>\n" +
                "</head>\n" +
                "<body>\n" +
                "  <div class=\"container\">\n" +
                "    <div class=\"content\">\n" +
                "      <p class=\"header\">Kính gửi: "+name+" </p>\n" +
                "      <p>CÔNG TY <span class=\"highlight-text\">BAYA-STORE</span> đã mời bạn kích hoạt tài khoản</p>\n" +
                "      <p>Tài khoản đăng nhập: <a href=\"mailto:\\" + email +"\">"+email+"</a></p>\n" +
                "\n" +
                "      <div class=\"button-container\">\n" +
                "        <a href=\""+new Server().getServerName() +"/activate?tokens="+tokens+"&email="+email+"\"  class=\"button\">Kích hoạt ngay</a>\n" +
                "      </div>\n" +
                "\n" +
                "      <p class=\"note\">Lưu ý: Email này sẽ có hiệu lực trong vòng 24 giờ.<br>\n" +
                "      Nếu có bất kỳ vướng mắc gì, xin vui lòng liên hệ với Tổng Đài tư vấn Baya-Store để được hỗ trợ.</p>\n" +
                "\n" +
                "     \n" +
                "      Công ty Baya</p>\n" +
                "         <p >Trân trọng,<br>\n" +
                "    </div>\n" +
                "    <div class=\"footer\">\n" +
                "    \n" +
                "      <div>\n" +
                "        Website: <a href=\"https://bayastore.id.vn\">https://bayastore.id.vn</a> | Email: <a href=\"mailto:tailam@gmail.com\">baya@gmail.com</a><br>\n" +
                "       \n" +
                "       \n" +
                "      </div>\n" +
                "      <div class=\"clear\"></div>\n" +
                "      <p style=\"margin-top:15px;\">Lưu ý: Đây là email được gửi tự động từ hệ thống, vui lòng không phản hồi lại email này.</p>\n" +
                "    </div>\n" +
                "  </div>\n" +
                "</body>\n" +
                "</html>";
    }

    public String getMessage() {
        return message;
    }
}
