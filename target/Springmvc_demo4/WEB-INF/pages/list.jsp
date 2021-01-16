<%--
  Created by IntelliJ IDEA.
  User: 24059
  Date: 2020/9/9
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${list}" var="account">
    id:${account.id}
    uid:${account.uid}
    money:${account.money} <a href="/account/delete?id=${account.id}">删除</a><a href="/account/findup?id=${account.id}">更新</a><br>
</c:forEach>
</body>
</html>
