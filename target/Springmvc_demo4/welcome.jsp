<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="session.jsp"%>
<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-X-admin2.1</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="./css/font.css">
        <link rel="stylesheet" href="./css/xadmin.css">
        <script src="https://cdn.bootcss.com/echarts/3.5.4/echarts.js"></script>
        <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    </head>
    <body>
    <div class="x-body">
        <blockquote class="layui-elem-quote">欢迎管理员：

            <span class="x-red"><%=session.getAttribute("username")%></span>！当前时间:<span id="times"></span>
        </blockquote>
        <fieldset class="layui-elem-field">
            <legend>数据统计</legend>
            <div class="layui-field-box">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body">
                            <div class="layui-carousel x-admin-carousel x-admin-backlog" lay-anim="" lay-indicator="inside" lay-arrow="none" style="width: 100%; height: 90px;">
                                <div carousel-item="">
                                    <ul class="layui-row layui-col-space10 layui-this">
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>商品总个数</h3>
                                                <p>
                                                    <cite><%=session.getAttribute("countsum")%></cite></p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>会员数</h3>
                                                <p>
                                                    <cite><%=session.getAttribute("countuser")%></cite></p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>入库商品个数</h3>
                                                <p>
                                                    <cite><%=session.getAttribute("countgoods")%></cite></p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>出库商品个数</h3>
                                                <p>
                                                    <cite><%=session.getAttribute("countgoodsout")%></cite></p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>入库商品金额</h3>
                                                <c:forEach items="${sessionScope.goodslist}" var="goods" varStatus="g">
                                                    <input type="hidden" value="${goods.goodsprice}">
                                                    <input type="hidden" value="${goods.goodsnumber}">
                                                    <c:set var="sum" value="${sum+(goods.goodsprice*goods.goodsnumber)}"></c:set>

                                                </c:forEach>
                                                <p>
                                                    <cite><c:out value="${sum}"></c:out>元</cite></p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>出库商品金额</h3>
                                                <c:forEach items="${sessionScope.goodsoutlist }" var="goods" varStatus="g">
                                                    <input type="hidden" value="${goods.goodsprice}">
                                                    <input type="hidden" value="${goods.goodsnumber}">
                                                    <c:set var="sum1" value="${sum1+(goods.goodsprice*goods.goodsnumber)}"></c:set>

                                                </c:forEach>
                                                <p>
                                                    <cite><c:out value="${sum1}"></c:out>元</cite></p>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>
        <fieldset class="layui-elem-field">
            <legend>Echarts数据图表</legend>
            <div class="layui-field-box">
                <!-- 饼状图容器 -->
                <div id="pid-div1" style="width:600px; height:400px;float: left"></div>
                <div id="main" style="width:600px; height:400px;float: left"></div>
                <script type="text/javascript">
                    $(function () {
                        // 初始化
                        var myChart = echarts.init($('#main')[0]); // 注意：这里init方法的参数的javascript对象，使用jQuery获取标签时，要将jQuery对象转成JavaScript对象；

                        // 配置图标参数
                        var options = {
                            title: {
                                text: '柱状图',
                                show: true, // 是否显示标题
                                subtext: 'Ajax动态获取数据',
                                x: 'center',
                                textStyle: {
                                    fontSize: 18 // 标题文字大小
                                }
                            },
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: {
                                    type: 'shadow'
                                }
                            },
                            legend: {
                                data: ['年龄']
                            },
                            // X轴
                            xAxis: {
                                data: [] // 异步请求时,这里要置空
                            },
                            // Y轴
                            yAxis: {},
                            series: [{
                                name: '年龄',
                                type: 'bar', // 设置图表类型为柱状图
                                data: [] // 设置纵坐标的刻度(异步请求时,这里要置空)
                            }]
                        };
                        // 给图标设置配置的参数
                        myChart.setOption(options);
                        myChart.showLoading(); // 显示加载动画
// 异步请求加载数据
                        $.ajax({
                            type: "POST",
                            url: "/echarts/outout",
                            dataType: 'json',
                            success: function (data) {
                                var goodscategory = [];
                                var goodsnumber = [];
                                $.each(data, function (index, obj) {
                                    goodscategory.push(obj.goodscategory);
                                    goodsnumber.push(obj.goodsnumber);
                                })

                                myChart.hideLoading(); // 隐藏加载动画
                                myChart.setOption({
                                    legend: {
                                        data: ['年龄']
                                    },
                                    xAxis: {
                                        data: goodscategory
                                    },
                                    series: [{
                                        name: '数量',
                                        type: 'bar', // 设置图表类型为柱状图
                                        data: goodsnumber // 设置纵坐标的刻度
                                    }]
                                });
                            }
                        });
                    });
                </script>


                <script type="text/javascript">
                    $(function () {
                        var myChart1 = echarts.init($('#pid-div1')[0]);
                        var option1 = {
                            title: {
                                text: '饼图',
                                subtext: 'Ajax动态获取数据',
                                x: 'center'
                            },
                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                            },
                            legend: {
                                orient: 'vertical',
                                left: 'left',
                                data: []
                            },
                            series: [
                                {
                                    name: '访问来源',
                                    type: 'pie',
                                    radius: '55%', // 饼状图的大小
                                    center: ['50%', '60%'], // 饼状图的位置
                                    data: [],
                                    itemStyle: {
                                        emphasis: {
                                            shadowBlur: 10,
                                            shadowOffsetX: 0,
                                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                                        }
                                    }
                                }
                            ]
                        };
                        myChart1.setOption(option1);
                        myChart1.showLoading(); // 显示动画

                        $.ajax({
                            url: '/echarts/outout',
                            type: 'post',
                            dataType: 'json',
                            success: function (data) {
                                var goodscategory = [];
                                var goodsnumber = [];
                                $.each(data, function (index, obj) {
                                    goodscategory.push(obj.goodscategory);
                                    goodsnumber.push({name: obj.goodscategory, value: obj.goodsnumber});
                                })
                                myChart1.hideLoading(); // 隐藏加载动画
                                myChart1.setOption({
                                    legend: {
                                        data: goodscategory
                                    },
                                    series: [{
                                        name: goodscategory,
                                        type: 'pie', // 设置图表类型为柱状图
                                        data: goodsnumber // 设置纵坐标的刻度
                                    }]
                                });
                            }
                        });
                    });
                </script>

            </div>
        </fieldset>
        <fieldset class="layui-elem-field">
            <legend>系统信息</legend>
            <div class="layui-field-box">
                <table class="layui-table">
                    <tbody>
                    <tr>
                        <th>layui版本</th>
                        <td>1.0.180420</td></tr>
                    <tr>
                        <th>服务器地址</th>
                        <td><%=request.getRemoteAddr()%></td></tr>
                    <tr>
                        <th>操作系统</th>
                        <td>WINDOWS</td></tr>
                    <tr>
                        <th>运行环境</th>
                        <td><%=request.getHeader("user-agent")%></td></tr>
                    <tr>
                        <th>JDK版本</th>
                        <td>1.8.231</td></tr>
                    <tr>
                        <th>JSP运行方式</th>
                        <td><%=request.getMethod()%></td></tr>
                    <tr>
                        <th>MYSQL版本</th>
                        <td>5.5.53</td></tr>
                    <tr>
                        <th>Spring</th>
                        <td>5.0.3</td></tr>
                    <tr>
                        <th>上传附件限制</th>
                        <td>2M</td></tr>
                    <tr>
                        <th>执行时间限制</th>
                        <td>30s</td></tr>
                    <tr>
                        <th>剩余空间</th>
                        <td>86015.2M</td></tr>
                    </tbody>
                </table>
            </div>
        </fieldset>

        <blockquote class="layui-elem-quote layui-quote-nm">感谢layui,百度Echarts,jquery,本系统由layui提供技术支持。</blockquote>
    </div>
        <script>
            function getDate(){
                //获取当前时间
                var date = new Date();
                //格式化为本地时间格式
                var date1 = date.toLocaleString();
                //获取span标签ID
                var div1 = document.getElementById("times");
                //将时间写入span标签
                div1.innerHTML = date1;
            }
            //使用定时器每秒向div写入当前时间
            setInterval("getDate()",1000);
            var _hmt = _hmt || [];
            (function() {
              var hm = document.createElement("script");
              hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
              var s = document.getElementsByTagName("script")[0];
              s.parentNode.insertBefore(hm, s);
            })();
</script>
    </body>
</html>