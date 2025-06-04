<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.baya.baya_project.Model.User" %>
<%@ page import="com.baya.baya_project.Model.UserPrincipal" %><%--
  Created by IntelliJ IDEA.
  User: PHAMTAI
  Date: 12/12/2024
  Time: 9:45 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
    <% User user = (User) session.getAttribute("user"); %>
    <div class="header_main">


        <div class="header_logo">
            <a href="/home"><img src="./assets/images/logo/logo-final (3) (1).png" alt="logo"> </a>
        </div>
        <div href="" class="header_item item_category " onclick="openCategory()" style="opacity: 0">

            <div class="item_box ">
                <i class="fa-solid fa-bars"></i>
            </div>
            <div class="item_content " style="align-content: center">
                <p>Danh mục</p>
            </div>

        </div>

        <div class="input_recom-wrap" style="width: 35%;" id="input_recom-wrap">
            <form class="header_search" method="get" action="/filterProducts">
                <button type="submit" class="search_box search_box_color" id="searchButton">

                    <i class="fa-solid fa-magnifying-glass"></i>

                </button>

                <input type="text" class="search_input " autocomplete="off" id="keySearch" name="keySearch"
                       value="${keySearch}" placeholder="Bạn tìm gì...">
                <input type="hidden" name="o" value="0">
                <input type="hidden" name="f" value="0">
                <input type="hidden" name="p" value="0">
                <input type="hidden" name="m" value="0">
                <input type="hidden" name="pr" value="0">
                <div class="search_recom" id="search_recom">


                </div>
                <script>
                    document.getElementById("keySearch").addEventListener("input", function () {
                        var searchRecom = document.getElementById('searchRecom')

                        console.log('da chay vao function')
                        let query = this.value.trim();


                        fetch("/searchRecom?keyword=" + query, {
                            method: 'GET',
                            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                        })
                            .then(function (response) {
                                return response.json();
                            })
                            .then(function (data) {
                                console.log('chay vao trong fetch');
                                console.log(data);
                                var result = "";
                                for (var i = 0; i < data.list.length; i++) {
                                    var item = data.list[i];
                                    console.log('hien thi item ' + item);
                                    var html = '<a class="recom_item" href="/search?keySearch=' + item + '&o=0&f=10&pi=0">' +
                                        '<p>' + item + '</p>' +
                                        '</a>';
                                    console.log(html);
                                    result += html;
                                }  document.getElementById('search_recom').innerHTML = result;
                            })
                            .catch(function (error) {
                                console.error('Lỗi:', error);
                                alert('Đã xảy ra lỗi, vui lòng thử lại.');
                            });
                    })
                </script>


            </form>

        </div>

        <!-- item header -->

        <a href="cart" class="header_item">
            <div class="item_box ">
                <i class="fa-solid fa-cart-shopping"></i>
            </div>
            <div class="item_content" style="align-content: center">
                <p>Giỏ hàng</p>
            </div>
        </a>
        <%
            if (user != null) {

        %>
        <a href="login" class="header_item">

            <div class="item_box ">
                <i class="fa-regular fa-user color-while"></i>
            </div>

            <div class="item_content" style="align-content: center">
                <p><%= user.getFullName()%>
                </p>
            </div>


        </a>
        <% } else {


        %>
        <a href="login" class="header_item">


            <div class="item_box ">
                <i class="fa-regular fa-user color-while"></i>
            </div>

            <div class="item_content" style="align-content: center">
                <p>Đăng nhập</p>
            </div>


        </a>
        <%} %>
        <a href="storeAddress.jsp" class="header_address ">
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
    <div class="modal" id="modal" style="display: none">
        <div class="modal_overlay" onclick="closeCategory()">

        </div>
        <div class="modal_body-category">
            <div class="top_menu">
                <ul>
                    <c:forEach var="item" items="${categoryDao}">


                        <li>
                            <div class="menu_category" data-category="${item.categoryID}">
                                <p>${item.name}</p>
                                <i class="fa-solid fa-chevron-right"></i>
                            </div>
                        </li>
                    </c:forEach>

                </ul>
            </div>

            <div class="sub_category_wrapper">

                <c:forEach items="${subCategoryList}" var="item">

                    <div class="category_list" id="${item.categoryID}">
                        <a class="category-item" href="productSearch.html">

                            <img src="${item.thumbnail}"
                                 alt="img">
                            <p>${item.name}</p>

                        </a>


                    </div>
                </c:forEach>


            </div>

        </div>
    </div>

</div>
<script src="assets/js/modal.js"></script>
<script>
    $('#keySearch').on('keypress', function (event) {
        if (event.key === 'Enter') {
            const keyword = $('#keySearch').val().trim();
            if (keyword) {

                window.location.href = `/search?keySearch=${keyword}&o=0&f=10&pi=0`;
            }
        }
    });
</script>


</script>