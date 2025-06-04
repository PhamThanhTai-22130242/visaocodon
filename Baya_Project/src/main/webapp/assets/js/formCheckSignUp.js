function checkFormSignUp() {

    var password = document.getElementById('password').value;
    var passwordContinue = document.getElementById('passwordC').value;
    var fullName = document.getElementById('fullName').value;
    var phoneNumber = document.getElementById('phoneNumber').value;
    var email = document.getElementById('email').value;

    if (!fullName.trim() || !phoneNumber.trim() || !email.trim() || !password.trim() || !passwordContinue.trim()) {
        document.getElementById('block_error').style.display = 'flex'
        document.getElementById('error_text').innerHTML = 'Các trường dữ liệu không được bỏ trống'
        return
    }
    if (password.length < 10) {
        document.getElementById('block_error').style.display = 'flex'
        document.getElementById('error_text').innerHTML = 'Mật khẩu phải ít nhất 10 kí tự'
        return
    }
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        document.getElementById('block_error').style.display = 'flex';
        document.getElementById('error_text').innerHTML = 'Email không hợp lệ';
        return;
    }
    if (password != passwordContinue) {
        document.getElementById('block_error').style.display = 'flex'
        document.getElementById('error_text').innerHTML = 'Mật khẩu không khớp. Vui lòng nhập lại'
        return
    }
    else {
        var url = "/login.jsp";
        window.location.href = url;
        return
    }





}