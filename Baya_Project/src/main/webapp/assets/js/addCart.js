function AddCart(id,event,quantity=1){
    event.stopPropagation();

    if(quantity==0){
        return ;
    }
    fetch('/cart-handler', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: 'action=add&quatity=1&productId='+id
    })
        .then(response => {
            return response.json();
        })
        .then(data => {

            const notyf = new Notyf();
            notyf.success(`Thêm vào giỏ hàng thành công`);
        })
        .catch(error => console.error('Error:', error));

}


function AddOrder(id){
    alert(id)
    location.href = '/repruchase?orderId='+id
}