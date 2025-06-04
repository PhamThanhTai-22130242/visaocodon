function showFormExport(checkbox) {
    var form = document.getElementById('form-bill-export');
    if (checkbox.checked) {
        form.style.display = 'block'
    } else {
        form.style.display = 'none'

    }
}

