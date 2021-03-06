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
    <form class="layui-form" action="/goods/update" method="post">
<c:forEach items="${goodsuplist}" var="goodsuplist">
    <div class="layui-form-item">
        <label for="id" class="layui-form-label">
            ID
        </label>
        <div class="layui-input-inline">
            <input type="text" id="id" name="id" disabled="" value="${goodsuplist.id}" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="goodsname" class="layui-form-label">
            <span class="x-red">*</span>商品名称
        </label>
        <div class="layui-input-inline">
            <input type="text" id="goodsname" name="goodsname" value="${goodsuplist.goodsname}" required="" lay-verify="nikename"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="goodsno" class="layui-form-label">
            <span class="x-red">*</span>商品编号
        </label>
        <div class="layui-input-inline">
            <input type="text" id="goodsno" name="goodsno" required="" lay-verify="pass"
                   autocomplete="off" class="layui-input" value="${goodsuplist.goodsno}">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="goodscs" class="layui-form-label">
            <span class="x-red">*</span>生产厂商
        </label>
        <div class="layui-input-inline">
            <input type="text" id="goodscs" name="goodscs" required="" lay-verify="repass"
                   autocomplete="off" class="layui-input" value="${goodsuplist.goodscs}">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="goodsprice" class="layui-form-label">
            <span class="x-red">*</span>商品价格
        </label>
        <div class="layui-input-inline">
            <input type="text" id="goodsprice" name="goodsprice" required="" lay-verify="nikename"
                   autocomplete="off" class="layui-input" value="${goodsuplist.goodsprice}">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="goodscategory" class="layui-form-label">
            <span class="x-red">*</span>商品类别
        </label>
        <div class="layui-input-inline">
            <input type="text" id="goodscategory" name="goodscategory" required="" lay-verify="nikename"
                   autocomplete="off" class="layui-input" value="${goodsuplist.goodscategory}">
        </div>
    </div>
    <div class="layui-form-inline">
        <label for="goodsnumber" class="layui-form-label">
            <span class="x-red">*</span>商品数量
        </label>
        <div class="layui-input-inline">
            <input type="text" id="goodsnumber" name="goodsnumber" disabled="" value="${goodsuplist.goodsnumber}" class="layui-input">
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
                if(value.length < 2){
                    return '昵称至少得3个字符啊';
                }
            }
            ,password: [/(.+){0,12}$/, '密码必须3到12位']
            ,repass: function(value){
                if($('#password').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
        });

        //监听提交
        form.on('submit(add)', function(data){
            var data={"id":$("#id").val(),"goodsname":$("#goodsname").val(),"goodsno":$("#goodsno").val(),"goodscs":$("#goodscs").val(),"goodsprice":$("#goodsprice").val(),"goodscategory":$("#goodscategory").val(),"goodsnumber":$("#goodsnumber").val()};
            $.ajax({
                type: "POST",
                url: "/goods/update",
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
