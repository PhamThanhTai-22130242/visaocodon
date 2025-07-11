const hamBurger = document.querySelector(".toggle-btn");

hamBurger.addEventListener("click", function () {
    document.querySelector("#sidebar").classList.toggle("expand");
});
//Danh mục

// nút xóa sản phẩm 

document.addEventListener('DOMContentLoaded', function () {
    const deleteButtons = document.querySelectorAll('.btn-delete');
    deleteButtons.forEach(button => {
        button.addEventListener('click', function () {
            console.log("đã ấn vào nút nàyyyyyyyy");  // Kiểm tra xem nút xóa có được nhấn không

            const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
            deleteModal.show();

            const rowToDelete = this.closest('tr');

            document.getElementById('confirmDeleteBtn').addEventListener('click', function () {
                console.log("Confirm delete button clicked!");  // Kiểm tra khi nhấn đồng ý
                rowToDelete.remove();
                deleteModal.hide();
            });
        });
    });
});
// Nút xóa đơn
document.addEventListener('DOMContentLoaded', function () {
    const deleteButtons = document.querySelectorAll('.btn-delete-order');
    deleteButtons.forEach(button => {
        button.addEventListener('click', function () {
            console.log("đã ấn vào nút nàyyyyyyyy");  // Kiểm tra xem nút xóa có được nhấn không

            const deleteModal = new bootstrap.Modal(document.getElementById('deleteOrderModal'));
            deleteModal.show();

            const rowToDelete = this.closest('tr');

            document.getElementById('confirmDeleteBtn').addEventListener('click', function () {
                console.log("Confirm delete button clicked!");  // Kiểm tra khi nhấn đồng ý
                rowToDelete.remove();
                deleteModal.hide();
            });
        });
    });
});
//dropdown sản phẩm trong tạo đơn hàng
// Toggle dropdown visibility
document.getElementById('dropdownMenuButton').addEventListener('click', function () {
    var menu = document.getElementById('dropdownMenu');
    menu.style.display = menu.style.display === 'block' ? 'none' : 'block';
});

// Close dropdown when clicking outside
document.addEventListener('click', function (e) {
    var menu = document.getElementById('dropdownMenu');
    var button = document.getElementById('dropdownMenuButton');
    if (!button.contains(e.target) && !menu.contains(e.target)) {
        menu.style.display = 'none';
    }
});

// Nút chặn người dùng 
document.addEventListener('DOMContentLoaded', function () {
    const openButtons = document.querySelectorAll('.btn-open-user');  // Chọn tất cả nút mở khóa
    const lockButtons = document.querySelectorAll('.btn-lock-user');  // Chọn tất cả nút khóa

    openButtons.forEach(button => {
        button.addEventListener('click', function () {
            console.log("Đã ấn vào nút mở khóammmmmmmmmmmmmmmm");

            // Lấy modal mở khóa
            const lockModal = new bootstrap.Modal(document.getElementById('lockModal'));
            const openModal = new bootstrap.Modal(document.getElementById('openModal'));
            lockModal.show(); // Hiển thị modal mở khóa

            const confirmLockButton = document.getElementById('confirm-lock');
            const confirmOpenButton = document.getElementById('confirm-open');
            const userId = button.getAttribute('data-user-id');

            // Gán sự kiện cho nút "Đồng ý khóa"
            confirmLockButton.onclick = function () {
                console.log("Đã nhấn đồng ý khóa------------------");

                // Thay đổi trạng thái nút khi khóa
                button.querySelector('i').classList.remove('fa-lock-open');
                button.querySelector('i').classList.add('fa-lock');
                button.classList.add('bg-danger');
                button.classList.remove('btn-open-user');
                button.classList.add('btn-lock-user');
                button.setAttribute("data-bs-target", "#openModal");
                lockModal.hide();
                // Xóa backdrop
                const backdrop = document.querySelector('.modal-backdrop');
                if (backdrop) {
                    backdrop.remove();
                }
            };
            //nút mở
            // Gán sự kiện cho nút "Đồng ý mở khóa"
            confirmOpenButton.onclick = function () {
                console.log("Đã nhấn đồng ý mở khóa......................");

                // Thay đổi trạng thái nút khi mở
                button.querySelector('i').classList.add('fa-lock-open');
                button.querySelector('i').classList.remove('fa-lock');
                button.classList.add('bg-infor');
                button.classList.remove('bg-danger');
                button.classList.remove('btn-lock-user');
                button.classList.add('.text-white');
                button.classList.add('btn-open-user');
                button.setAttribute("data-bs-target", "#lockModal");
                openModal.hide();
                lockModal.hide();
                // Xóa backdrop
                const backdrop = document.querySelector('.modal-backdrop');
                const openModal1 = document.getElementById('openModal');
                openModal1.classList.add('hidden');
                if (backdrop && openModal1) {
                    backdrop.remove();
                    openModal1.classList.remove('show');
                }
            };
        });
    });

});
