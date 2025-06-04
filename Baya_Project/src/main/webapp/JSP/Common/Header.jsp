<div class="header_main">


    <div class="header_logo">
        <a href="index.html"><img src="./assets/images/logo/logo-final (3) (1).png" alt="logo"> </a>
    </div>
    <div href="" class="header_item item_category " onclick="openCategory()">

        <div class="item_box ">
            <i class="fa-solid fa-bars"></i>
        </div>
        <div class="item_content">
            <p>Danh mục</p>
        </div>

    </div>

    <div class="header_search">
        <button type="submit" class="search_box search_box_color">
            <i class="fa-solid fa-magnifying-glass"></i>

        </button>

        <input type="text" class="search_input " placeholder="Bạn tìm gì...">


    </div>

    <!-- item header -->

    <a href="cart.html" class="header_item">
        <div class="item_box ">
            <i class="fa-solid fa-cart-shopping"></i>
        </div>
        <div class="item_content">
            <p>Giỏ hàng</p>
        </div>
    </a>

    <a href="login.html" class="header_item">

        <div class="item_box ">
            <i class="fa-regular fa-user color-while"></i>
        </div>
        <div class="item_content">
            <p>Đăng nhập</p>
        </div>

    </a>
    <a href="storeAddress.html" class="header_address ">
        <div class="address_alpha">
            <div class="item_box ">
                <i class="fa-solid fa-location-dot"></i>
            </div>
            <div class="item_content">
                <p>Tp. Hồ Chí Minh</p>
            </div>
        </div>

        <div class="item_box address_beta ">
            <i class="fa-solid fa-angle-right"></i>
        </div>
    </a>


</div>
</div>
<div class="modal" id="modal">
    <div class="modal_overlay" onclick="closeCategory()">

    </div>
    <div class="modal_body-category">
        <div class="top_menu">
            <ul>
                <li>
                    <div class="menu_category" data-category="phong-lam-viec">
                        <p>Phòng làm việc</p>
                        <i class="fa-solid fa-chevron-right"></i>
                    </div>
                </li>
                <li>
                    <div class="menu_category" data-category="phong-khach">
                        <p>Phòng khách</p>
                        <i class="fa-solid fa-chevron-right"></i>
                    </div>
                </li>
                <li>
                    <div class="menu_category" data-category="phong-ngu">
                        <p>Phòng ngủ</p>
                        <i class="fa-solid fa-chevron-right"></i>
                    </div>
                </li>
                <li>
                    <div class="menu_category" data-category="tu-bep">
                        <p>Tủ bếp</p>
                        <i class="fa-solid fa-chevron-right"></i>
                    </div>
                </li>
                <li>
                    <div class="menu_category" data-category="phong-an">
                        <p>Phòng ăn</p>
                        <i class="fa-solid fa-chevron-right"></i>
                    </div>
                </li>

            </ul>
        </div>

        <div class="sub_category_wrapper">
            <div class="category_list" id="phong-lam-viec">
                <a class="category-item" href="productSearch.html">

                    <img src="https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bdc5094c1d0a4520b209c54ea88e10ba_master.jpg"
                         alt="img">
                    <p>Bàn làm việc</p>

                </a>
                <a class="category-item" href="productSearch.html">

                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG-buIdH3shs3NaAiqPwff0BSvhRDRVGKfaA&s"
                         alt="img">
                    <p>Ghế văn phòng</p>

                </a>
                <a class="category-item" href="productSearch.html">

                    <img src="https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bdc5094c1d0a4520b209c54ea88e10ba_master.jpg"
                         alt="img">
                    <p>Tủ-kệ</p>

                </a>


            </div>
            <div class="category_list" id="phong-khach">
                <a class="category-item" href="productSearch.html">

                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG-buIdH3shs3NaAiqPwff0BSvhRDRVGKfaA&s"
                         alt="img">
                    <p>Ghế Sofa</p>

                </a>
                <a class="category-item" href="productSearch.html">

                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG-buIdH3shs3NaAiqPwff0BSvhRDRVGKfaA&s"
                         alt="img">
                    <p>Bàn </p>

                </a>
            </div>
            <div class="category_list" id="phong-ngu">

            </div>
            <div class="category_list" id="tu-bep">

            </div>
            <div class="category_list" id="phong-an">

            </div>
        </div>
    </div>
</div>
<script src="./assets/js/modal.js"></script>