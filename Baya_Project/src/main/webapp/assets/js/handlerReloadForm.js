$(document).ready(function() {
    let isReloading = false;

    $("input, textarea, select").on("input change", function() {
        const $element = $(this);
        const name = $element.attr("name");
        const value = $element.val();

        if (name && value !== undefined) {
            sessionStorage.setItem(name, value);

            if (name === "province" && value) {
                sessionStorage.removeItem("district");
                sessionStorage.removeItem("ward");
            } else if (name === "district" && value) {
                sessionStorage.removeItem("ward");
            }
        }
    });

    $("input, textarea, select").each(function() {
        const $element = $(this);
        const name = $element.attr("name");

        if (name) {
            const savedValue = sessionStorage.getItem(name);
            if (savedValue !== null) {
                $element.val(savedValue).trigger('change');
            }
        }
    });

    document.addEventListener("visibilitychange", function() {
        isTabClosed = document.hidden;
    });

    window.addEventListener('keydown', function(e) {
        if (e.key === 'F5' || (e.ctrlKey && e.key === 'r')) {
            isReloading = true;
        }
    });

    window.addEventListener('beforeunload', function() {
        if (!isReloading) {
            sessionStorage.clear();
            console.log("Đã xóa sessionStorage (đóng tab)");
        }
    });
});