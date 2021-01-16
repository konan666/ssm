<%--
  Created by IntelliJ IDEA.
  User: 24059
  Date: 2020/12/11
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
<script>

    function checkname(){
        var f=false;
        //javascript所有的变量都是以var定义的
        //javascript的变量属于弱类型
        //获取用户输入的用户名
        var name = document.getElementById("username").value;
        //去除字符串两端空格
        name=name.trim();
        //判断是否为空
        if(name==""){
            document.getElementById("username_span").innerHTML="用户名不能为空";
        }else if(name.length<1||name.length>16){
            document.getElementById("username_span").innerHTML="用户名的长度为1-16位";
        }
        else{
            document.getElementById("username_span").innerHTML="";
            //校验用户名是否存在
            //使用ajax异步校验用户名
            $.ajax({
                url:"/echarts/login",
                type:"post",
                data:{"username":name},//json数据格式的用户名从jsp传递给controller
                dataType:"json",
                async:false,//让ajax执行代码顺序同步
                success:function(data){
                    if(data.msg=="false"){
                        document.getElementById("username_span").innerHTML="用户名已存在";
                    }else{
                        document.getElementById("username_span").innerHTML="用户名可用";
                        f=true;
                    }
                }
            });

        }
        return f;
    }
</script>
<form action="reg.action" method="post" onsubmit="return check()" id="registform">
    <input type="hidden" name="method" value="regist">
    <table>
        <tr>
            <td>用户名:</td>
            <td>
                <input type="text" name="username" id="username"  onblur="checkname()">
                <span id="username_span"></span>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
