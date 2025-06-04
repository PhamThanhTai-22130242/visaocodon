package com.baya.baya_project.service;

public class CongratulationMail {
   String subject = "CHỪNG MỪNG BẠN ĐẾN VỚI BAYA";
     String content;
    public CongratulationMail() {
        content ="<html lang=\"en\">\n" +
                "\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n" +
                "    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n" +
                "    <title> Congratulations Page Design By WebJourney - Html Template </title>\n" +
                "    <!-- FontAwesome -->\n" +
                "\n" +
                "    <style>\n" +
                "        .congratulation-wrapper {\n" +
                "\n" +
                "            max-width: 550px;\n" +
                "            margin-inline: auto;\n" +
                "            -webkit-box-shadow: 0 0 20px #f3f3f3;\n" +
                "            box-shadow: 0 0 20px #f3f3f3;\n" +
                "            padding: 30px 20px;\n" +
                "            background-color: #fff;\n" +
                "            border-radius: 10px;\n" +
                "        }\n" +
                "\n" +
                "        .congratulation-contents.center-text .congratulation-contents-icon {\n" +
                "            margin-inline: auto;\n" +
                "        }\n" +
                "\n" +
                "        .congratulation-contents-icon {\n" +
                "\n" +
                "            overflow: hidden;\n" +
                "            border-radius: 50% !important;\n" +
                "            display: -webkit-box;\n" +
                "            display: -ms-flexbox;\n" +
                "            display: flex;\n" +
                "            -webkit-box-align: center;\n" +
                "            -ms-flex-align: center;\n" +
                "            align-items: center;\n" +
                "            -webkit-box-pack: center;\n" +
                "            -ms-flex-pack: center;\n" +
                "            justify-content: center;\n" +
                "            height: 100px;\n" +
                "            width: 100px;\n" +
                "            background-color: #65c18c;\n" +
                "            color: #fff;\n" +
                "            font-size: 50px;\n" +
                "\n" +
                "            margin-bottom: 30px;\n" +
                "        }\n" +
                "\n" +
                "        .congratulation-contents-title {\n" +
                "            text-align: center;\n" +
                "            font-size: 32px;\n" +
                "            line-height: 36px;\n" +
                "            margin: -6px 0 0;\n" +
                "        }\n" +
                "\n" +
                "        .congratulation-contents-para {\n" +
                "            text-align: center;\n" +
                "            font-size: 16px;\n" +
                "            line-height: 24px;\n" +
                "            margin-top: 15px;\n" +
                "        }\n" +
                "\n" +
                "        .btn-wrapper {\n" +
                "            margin: auto;\n" +
                "            display: block;\n" +
                "        }\n" +
                "\n" +
                "        .cmn-btn.btn-bg-1 {\n" +
                "            text-align: center;\n" +
                "            background: #6176f6;\n" +
                "            color: #fff;\n" +
                "            border: 2px solid transparent;\n" +
                "            border-radius: 3px;\n" +
                "            text-decoration: none;\n" +
                "            padding: 5px;\n" +
                "        }\n" +
                "    </style>\n" +
                "</head>\n" +
                "\n" +
                "<body>\n" +
                "    <!-- Congratulations area start -->\n" +
                "    <div class=\"congratulation-area text-center mt-5\">\n" +
                "        <div class=\"container\">\n" +
                "            <div class=\"congratulation-wrapper\">\n" +
                "                <div class=\"congratulation-contents center-text\">\n" +
                "                    <div class=\"congratulation-contents-icon\">\n" +
                "                        <img style=\"width: 100%; height: 100%;\"\n" +
                "                            src=\"https://e7.pngegg.com/pngimages/966/803/png-clipart-check-mark-tick-green-tick-mark-angle-leaf-thumbnail.png\"\n" +
                "                            alt=\"\">\n" +
                "                    </div>\n" +
                "                    <h4 class=\"congratulation-contents-title\"> Chúc mừng! </h4>\n" +
                "                    <p class=\"congratulation-contents-para\"> Chào mừng bạn đã đến với ngôi nhà Baya-Store của chúng tôi.\n" +
                "                    </p>\n" +
                "                    <div class=\"btn-wrapper mt-4\">\n" +
                "                        <a href=\"javascript:void(0)\" class=\"cmn-btn btn-bg-1\"> Đi đến trang chủ </a>\n" +
                "                    </div>\n" +
                "                </div>\n" +
                "            </div>\n" +
                "        </div>\n" +
                "    </div>\n" +
                "    <!-- Congratulations area end -->\n" +
                "\n" +
                "    <!-- Latest compiled JavaScript -->\n" +
                "\n" +
                "</body>\n" +
                "\n" +
                "</html>";
    }

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
}
