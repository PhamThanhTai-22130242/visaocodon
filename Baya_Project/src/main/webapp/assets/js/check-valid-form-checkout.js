function checkErrorEmail() {
    var email = document.getElementById("email");
    var error_email = document.getElementById("error_email");
    if (!email.checkValidity()) {

        error_email.innerHTML = `<p style="color:red;margin-top :0.5rem"> Nhập đúng định dạng email </p>`;
    } else {
            alert('emailtrue')
        error_email.innerHTML = "";
    }
}

function checkErrorPhone() {
    alert('erorphone');
    var phone = document.getElementById("phone");
    var phone_email = document.getElementById("error_phone");

    if (!isValidTelephone(phone.value)) {
        phone_email.innerHTML = `<p style="color:red;margin-top :0.5rem">  Nhập số điện thoại trên 8 số </p>`;
    } else {

        phone_email.innerHTML = "";
    }


}

function checkErrorAddress() {
    alert('check')
    var address = document.getElementById("address");
    var err = document.getElementById("error_address");
    if (address.value == "") {
        err.innerHTML = `<p style="color:red;margin-top :0.5rem">  Vui lòng nhập địa chỉ </p>`;
        return false;
    }

    err.innerHTML = "";
    return true;
}




