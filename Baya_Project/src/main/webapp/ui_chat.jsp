<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title>Chatbot </title>
    <link rel="stylesheet" href="./assets/css/pages/ui_chat.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

</head>
<body class="light-mode">

<div class="chat-container">
    <div class="chat-header">
       <div class="chat-item">
           <img  width="40" height="40" src="./assets/images/favicons/chatbot.png">
           <span class="chat-title">Chatbot nè </span>
       </div>
        <button id="btn_toggle">
            <i class="fa-solid fa-moon" ></i>
        </button>
    </div>

    <div class="chat-messages" id="chatMessages">
    </div>

    <div class="chat-input">
        <input type="text" id="userMessage" placeholder="Type your message here..."/>
        <button id="sendBtn">➤</button>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#sendBtn').click(function () {
            const msg = $('#userMessage').val().trim();
            if (msg !== "") {
                $('#chatMessages').append('<div class="message user">' + msg + '</div>');
                $('#userMessage').val("");
                $('#chatMessages').scrollTop($('#chatMessages')[0].scrollHeight);

                setTimeout(() => {
                    $('#chatMessages').append('<div class="message bot">Đây là phản hồi từ bot.</div>');
                    $('#chatMessages').scrollTop($('#chatMessages')[0].scrollHeight);
                }, 500);
            }
        });

        $('#btn_toggle').click(function () {
            $('body').toggleClass('dark-mode light-mode');

            const icon = $(this).find('i');

            if ($('body').hasClass('dark-mode')) {
                icon.removeClass('fa-moon').addClass('fa-sun');
            } else {
                icon.removeClass('fa-sun').addClass('fa-moon');
            }
        });

    });
</script>
</body>
</html>
