<%--
  Created by IntelliJ IDEA.
  User: PHAMTAI
  Date: 3/30/2025
  Time: 5:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form method="post" action="/check" onsubmit="return check_2()">
        <input type="text" placeholder="nhap vao day">
        <button >Nhấn dô đây</button>
    </form>
<script>
    function check_2(){
        console.log("chay vao check 2")
        return false
    }

</script>
</body>
</html>
