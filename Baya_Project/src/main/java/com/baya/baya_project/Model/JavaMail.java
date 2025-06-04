package com.baya.baya_project.Model;

import com.baya.baya_project.service.ActiveAccount;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class JavaMail {

    public  void sendEmail(String toEmail, String subject, String body) {
        final String fromEmail = "tailam164@gmail.com";
        final String password = "bdnpbtgnmmelluak";
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });


        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(toEmail)
            );
            message.setSubject(subject);
            message.setContent(body, "text/html; charset=utf-8");



            Transport.send(message);

            System.out.println("Email đã được gửi thành công!");
        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println("Gửi email thất bại!");
        }
    }

    public static String paramURL(String email, String tokens){
        return "/activate?tokens="+tokens+ "&email="+email+"";
    }
    public static String resultURL(String para, String serverName){
        StringBuilder builder = new StringBuilder();
        builder.append(serverName);
        builder.append(para);
        return builder.toString();
    }

    public static void main(String[] args) {
        String serverName = "http://localhost:8080";

        resultURL(   paramURL("22130242@gmail.com","abcxyzhahah"),serverName);
        System.out.println(  resultURL(   paramURL("22130242@gmail.com","abcxyzhahah"),serverName));
//        new JavaMail().sendEmail("22130321@st.hcmuaf.edu.vn", "KÍCH HOẠT TÀI KHOẢN NGƯỜI QUẢN TRỊ BAYA-STORE",new ActiveAccount().sendEmailAdminActive("22130242@st.hcmuaf.edu.vn","Ghệ IUUU CUA E A VÀNG ĐẸP TRAI",    resultURL(   paramURL("22130242@gmail.com","abcxyzhahah"),serverName) ,  "lÀM GHỆ CỦA E"));

        new JavaMail().sendEmail("thanhtaip0308200@gmail.com", "KÍCH HOẠT TÀI KHOẢN VỚI BAYA-STORE", new ActiveAccount().sendEmailUserActive("22130242@st.hcmuaf.edu.vn", "Tài pham", "123"));

    }

}
