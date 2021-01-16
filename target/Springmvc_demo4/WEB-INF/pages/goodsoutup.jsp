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
<c:forEach items="${goodsoutup}" var="goodsoutup">
    <div class="layui-form-item">
        <label for="id" class="layui-form-label">
            ID
        </label>
        <div class="layui-input-inline">
            <input type="text" id="id" name="id" disabled="" value="${goodsoutup.id}" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="goodsnumber" class="layui-form-label">
            <span class="x-red">*</span>商品数量
        </label>
        <div class="layui-input-item">
            <input type="text" id="goodsnumber" name="goodsnumber" required="" lay-verify="goodsnumber"
                   autocomplete="off" class="layui-input" value="${goodsoutup.goodsnumber}">
        </div>
    </div>
    <div class="layui-form-item">
    <label for="L_goodsnumber1" class="layui-form-label">

    </label>
    <div class="layui-input-item">
        <input type="hidden" id="L_goodsnumber1" name="goodsnumber1" required="" lay-verify="goodsnumber1"
               autocomplete="off" class="layui-input" value="${goodsoutup.goodsnumber}">
        <input type="hidden" id="goodsname" name="goodsname" required="" lay-verify="goodsname"
               autocomplete="off" class="layui-input" value="${goodsoutup.goodsname}">
        <input type="hidden" id="goodsprice" name="goodsprice" required="" lay-verify="goodsprice"
               autocomplete="off" class="layui-input" value="${goodsoutup.goodsprice}">
        <input type="hidden" id="goodsno" name="goodsno" required="" lay-verify="goodsno"
               autocomplete="off" class="layui-input" value="${goodsoutup.goodsno}">
        <input type="hidden" id="goodscategory" name="goodscategory" required="" lay-verify="goodscategory"
               autocomplete="off" class="layui-input" value="${goodsoutup.goodscategory}">
        <input type="hidden" id="goodscs" name="goodscs" required="" lay-verify="goodscs"
               autocomplete="off" class="layui-input" value="${goodsoutup.goodscs}">
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
            ,goodsnumber: [/(.+){0,12}$/, '密码必须3到12位']
            ,goodsnumber1: function(value){
                if($('#L_goodsnumber1').val()<$('#goodsnumber').val()){
                    return '出库数量需小于或等于原数量';
                }if($('#goodsnumber').val()<0){
                    return '出库数量需大于0';
                }
            }
        });

        //监听提交
        form.on('submit(add)', function(data){
            var data={"id":$("#id").val(),"goodsname":$("#goodsname").val(),"goodsno":$("#goodsno").val(),"goodscs":$("#goodscs").val(),"goodsprice":$("#goodsprice").val(),"goodscategory":$("#goodscategory").val(),"goodsnumber":$("#goodsnumber").val()};
            $.ajax({
                type: "POST",
                url: "/goods/outup",
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
</body>

</html>
