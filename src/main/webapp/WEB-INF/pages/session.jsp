<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/3
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%

    if(session.getAttribute("username")==null)
    {%>
<h1>未登录！</h1>
3秒后跳转到登录页面
<p>
    如果没有跳转，请点<a href="../../login.jsp">这里</a></p>
<%
        response.setHeader("refresh","3;URL=../../login.jsp");
        return;
    }
%>
</body>
</html>
