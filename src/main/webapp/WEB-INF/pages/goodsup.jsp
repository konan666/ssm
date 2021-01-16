<%--
  Created by IntelliJ IDEA.
  User: 24059
  Date: 2020/9/9
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="session.jsp"%>

<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>欢迎页面-X-admin2.1</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="../../css/font.css">
    <link rel="stylesheet" href="../../css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="../../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../js/xadmin.js"></script>
    <script type="text/javascript" src="../../js/cookie.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="x-body">
    <form class="layui-form" action="/goods/up" method="post">
<c:forEach items="${goodsup}" var="goodsup">
    <div class="layui-form-item">
        <label for="id" class="layui-form-label">
            ID
        </label>
        <div class="layui-input-inline">
            <input type="text" id="id" name="id" disabled="" value="${goodsup.id}" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="L_goodsnumber" class="layui-form-label">
            <span class="x-red">*</span>商品数量
        </label>
        <div class="layui-input-item">
            <input type="text" id="L_goodsnumber" name="goodsnumber" required="" lay-verify="goodsnumber"
                   autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item">
        <label  class="layui-form-label">
        </label>
        <button  class="layui-btn" lay-filter="add" lay-submit="">
            提交
        </button>
    </div>
</c:forEach>
    </form>
</div>
<script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;

        //自定义验证规则
        form.verify({
            nikename: function(value){
                if(value.length < 0){
                    return '昵称至少得3个字符啊';
                }
            }
            ,goodsnumber: function(value){
                if($('#L_goodsnumber').val()<1){
                    return '入库数量需大于0';
                }else if($('#L_goodsnumber').val()>10000){
                    return '为了安全，入库数量一次应小于10000';
                }
            }
        });

        //监听提交
        form.on('submit(add)', function(data){
            var data={"id":$("#id").val(),"goodsnumber":$("#L_goodsnumber").val()};
            $.ajax({
                type: "POST",
                url: "/goods/up",
                data:data,
                dataType: "html",
                success: function(response){
                    console.log(response);
                        layer.alert("修改成功", {icon: 6},function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                        });
                }
            });

            return false;
        });


    });
</script>
<script>var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>

</html>
