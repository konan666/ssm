<%--
  Created by IntelliJ IDEA.
  User: 24059
  Date: 2020/9/9
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/account/findAll">查询所有用户</a>
<br>
<form action="/account/save" method="post">
    <input type="text" name="uid"><br>
    <input type="text"name="money"><br>
    <input type="submit">
</form>
</body>
</html>
