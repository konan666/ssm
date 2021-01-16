<%--
  Created by IntelliJ IDEA.
  User: 24059
  Date: 2020/9/9
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="session.jsp"%>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
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
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">订单管理</a>
        <a>
          <cite>出库订单</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">

    <xblock>
        <c:forEach items="${goodsoutlist}" begin="1" end="1" step="1">
        <span class="x-right" style="line-height:40px">共计：${fn:length(goodsoutlist)}条数据</span>
        </c:forEach>
    </xblock>
    <table class="layui-table x-admin">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>ID</th>
            <th>商品名称</th>
            <th>商品编号</th>
            <th>生产厂商</th>
            <th>商品价格</th>
            <th>商品类别</th>
            <th>商品数量</th>
            <th>操作</th></tr>
        </thead>
        <tbody>
        <c:forEach items="${goodsoutlist}" var="goods" varStatus="g">
        <tr>

            <td>
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>${g.count}</td>
            <td>${goods.goodsname}</td>
            <td>${goods.goodsno}</td>
            <td>${goods.goodscs}</td>
            <td>${goods.goodsprice}</td>
            <td>${goods.goodscategory}</td>
            <td>${goods.goodsnumber}</td>
            <c:set var="sum" value="${sum+(goods.goodsprice*goods.goodsnumber)}"></c:set>
            <td class="td-manage">
                <a title="删除" onclick="member_del(this,'${goods.id}')" href="javascript:;">
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>

        </tr>
        </c:forEach>
        <tr>
            <td>总计</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td><c:out value="${sum}"></c:out>元</td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        </tbody>
    </table>
    <div class="page">
        <div>
            <a class="prev" href="">&lt;&lt;</a>
            <a class="num" href="">1</a>
            <span class="current">2</span>
            <a class="num" href="">3</a>
            <a class="num" href="">489</a>
            <a class="next" href="">&gt;&gt;</a>
        </div>
    </div>

</div>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });

    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type: "POST",
                url: "/goods/deleteout",
                data: "id=" + id,
                async: true,
                dataType: "text",
                success: function (data) {

                        $(obj).parents("tr").remove();
                        layer.msg('已删除!', {icon: 1, time: 1000});



                }
            });
        });
    }



    function delAll (argument) {

        var data = tableCheck.getData();

        console.log(data);
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type: "POST",
                url: "/goods/deletes",
                data: "ids="+data,
                async: true,
                dataType: "text",
                success: function (data) {
                        layer.msg('已删除!', {icon: 1, time: 1000});
                    $(".layui-form-checked").not('.header').parents('tr').remove();
                }
            });
        });
    }
</script>

</body>

</html>
