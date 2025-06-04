package com.baya.baya_project.service;

public class VetifyAccount {

    String subject = "XÁC MINH EMAIL TỪ BAYA";
    String content;
    public VetifyAccount() {

    }
    public VetifyAccount(String tokens, String email) {
        content ="<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "    <title>Sucess</title>\n" +
                "\n" +
                "    <link rel=\"stylesheet\" href=\"../assets/css/styles.css\">\n" +
                "\n" +
                "\n" +
                "    <style>\n" +
                "        :root {\n" +
                "            --main_bg: rgb(42, 131, 233);\n" +
                "            --color-default: #676262;\n" +
                "        }\n" +
                "\n" +
                "        body {\n" +
                "            font-family: \"Arial\", Helvetica, sans-serif;\n" +
                "            font-weight: normal;\n" +
                "            font-size: 16px;\n" +
                "        }\n" +
                "\n" +
                "        * {\n" +
                "            scroll-behavior: smooth;\n" +
                "            box-sizing: border-box;\n" +
                "        }\n" +
                "\n" +
                "        .container {\n" +
                "            width: 100%;\n" +
                "        }\n" +
                "\n" +
                "\n" +
                "\n" +
                "        a {\n" +
                "            text-decoration: none;\n" +
                "        }\n" +
                "\n" +
                "        .error_alpha {\n" +
                "            width: 900px;\n" +
                "            height: auto;\n" +
                "        }\n" +
                "\n" +
                "        .error_alpha img {\n" +
                "            width: 100%;\n" +
                "            height: auto;\n" +
                "            object-fit: cover;\n" +
                "        }\n" +
                "\n" +
                "        .error-body {\n" +
                "            margin: auto;\n" +
                "            max-width: 1200px;\n" +
                "            height: 100vh;\n" +
                "            display: flex;\n" +
                "            justify-content: center;\n" +
                "            align-items: center;\n" +
                "            flex-direction: row;\n" +
                "            gap: 30px;\n" +
                "        }\n" +
                "\n" +
                "        .error_omega {\n" +
                "\n" +
                "            display: flex;\n" +
                "            flex-direction: column;\n" +
                "            justify-content: center;\n" +
                "            text-align: left;\n" +
                "        }\n" +
                "\n" +
                "        .error_omega-content h1 {\n" +
                "            font-size: 48px;\n" +
                "            color: #2b2b2b;\n" +
                "            margin-bottom: 20px;\n" +
                "        }\n" +
                "\n" +
                "        .error_omega-contact {\n" +
                "            display: flex;\n" +
                "            flex-direction: column;\n" +
                "            gap: 15px;\n" +
                "\n" +
                "            font-size: 16px;\n" +
                "        }\n" +
                "\n" +
                "        .error_omega-contact a {\n" +
                "            display: flex;\n" +
                "\n" +
                "            align-items: center;\n" +
                "            justify-content: center;\n" +
                "            padding: 15px;\n" +
                "            background-color: var(--main_bg);\n" +
                "            color: #FFFFFF;\n" +
                "            text-decoration: none;\n" +
                "            border-radius: 5px;\n" +
                "            cursor: pointer;\n" +
                "        }\n" +
                "\n" +
                "        .block_container {\n" +
                "\n" +
                "            display: flex;\n" +
                "            text-align: center;\n" +
                "            box-sizing: border-box;\n" +
                "            padding: 40px 0;\n" +
                "\n" +
                "        }\n" +
                "\n" +
                "        h1 {\n" +
                "            color: var(--main_bg);\n" +
                "\n" +
                "            font-weight: 900;\n" +
                "            font-size: 40px;\n" +
                "            margin-bottom: 10px;\n" +
                "        }\n" +
                "\n" +
                "        p {\n" +
                "\n" +
                "\n" +
                "            font-size: 20px;\n" +
                "            margin: 0;\n" +
                "        }\n" +
                "\n" +
                "\n" +
                "        .card {\n" +
                "            width: 500px;\n" +
                "            background: white;\n" +
                "            padding: 60px;\n" +
                "            border-radius: 4px;\n" +
                "            box-shadow: 0 2px 3px #C8D0D8;\n" +
                "\n" +
                "            margin: auto;\n" +
                "        }\n" +
                "\n" +
                "\n" +
                "\n" +
                "        .cart_button {\n" +
                "            text-decoration: none;\n" +
                "\n" +
                "            color: rgb(42, 131, 233) !important;\n" +
                "\n" +
                "            width: 100%;\n" +
                "            height: 40px;\n" +
                "\n" +
                "\n" +
                "        }\n" +
                "\n" +
                "        .block_link {\n" +
                "            border-radius: 10px;\n" +
                "            display: flex;\n" +
                "            width: fit-content;\n" +
                "            height: fit-content;\n" +
                "            padding: 20px 0;\n" +
                "            margin-top: 20px;\n" +
                "            border: rgb(42, 131, 233) 1px solid;\n" +
                "        }\n" +
                "    </style>\n" +
                "</head>\n" +
                "\n" +
                "<body>\n" +
                "    <div class=\"block_container\">\n" +
                "        <img src=\"\" alt=\"\">\n" +
                "        <div class=\"card\">\n" +
                "            <img src=\"https://img.icons8.com/ios11/512/40C057/ok.png\"\n" +
                "                style=\"border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;\">\n" +
                "\n" +
                "            </img>\n" +
                "            <h1 style=\"color: rgb(64 192 87);\">FROM BAYA</h1>\n" +
                "            <p style=\"color: var(  --color-default);\">Vui lòng kích hoạt tài khoản<br /></p>\n" +
                "\n" +
                "\n" +

                "        </div>\n" +
                "\n" +
                "    </div>\n" +
                "\n" +
                "\n" +
                "\n" +
                "    </div>\n" +
                "\n" +
                "</body>\n" +
                "\n" +
                "</html> Nhấn vào đây: http://localhost:8080/activate?tokens="+tokens+ "&email="+email+"";
    }
//    "                        <a href=\\\"http://localhost:8080/active?tokens=" + tokens + "\" class=\"cmn-btn btn-bg-1\"> Nhấn vào đây để xác thực </a>\n" +
    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public static void main(String[] args) {
        VetifyAccount vetifyAccount = new VetifyAccount("abcxyz", "22130242@st.hcmuaf.edu.vn");
        System.out.println(vetifyAccount.getContent());
    }
}
