<%--
  Created by IntelliJ IDEA.
  User: 24059
  Date: 2020/9/9
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${up}" var="up">
    <form action="/account/update" method="post">
        <input type="hidden" name="id" value="${up.id}">
        <input type="text" name="uid" value="${up.uid}"><br>
        <input type="text"name="money"value="${up.money}"><br>
        <input type="submit">
    </form>
</c:forEach>
</body>
</html>


<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${useruplist}" var="useruplist">
    <form action="/user/update" method="post">
        <input type="hidden" name="id" value="${useruplist.id}">
        <input type="text" name="username" value="${useruplist.username}"><br>
        <input type="text"name="password"value="${useruplist.password}"><br>
        <input type="submit">
    </form>
</c:forEach>
</body>
</html>

<a href="/user/delete?id=${user.id}">删除</a><a href="/user/findup?id=${user.id}">更新</a><br>




<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${userlist}" var="user">
    id:${user.id}
    uid:${user.username}
    money:${user.password} <a href="/user/delete?id=${user.id}">删除</a><a href="/user/findup?id=${user.id}">更新</a><br>
</c:forEach>
</body>
</html>