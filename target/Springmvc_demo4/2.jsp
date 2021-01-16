<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <!-- 引入 echarts.js -->
    <script src="https://cdn.bootcss.com/echarts/3.5.4/echarts.js"></script>
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
<h3>
    <a class="btn btn-primary" href="${path}/">返回首页</a>
</h3>

<div id="main" style="width:600px; height:400px;"></div>

<script type="text/javascript">
    $(function () {
        // 初始化
        var myChart = echarts.init($('#main')[0]); // 注意：这里init方法的参数的javascript对象，使用jQuery获取标签时，要将jQuery对象转成JavaScript对象；

        // 配置图标参数
        var options = {
            title: {
                text: '姓名和年龄关系图之柱状图',
                show: true, // 是否显示标题
                subtext: '测试数据',
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
                        name: '年龄',
                        type: 'bar', // 设置图表类型为柱状图
                        data: goodsnumber // 设置纵坐标的刻度
                    }]
                });
            }
        });
    });
</script>


<%--<!-- 饼状图容器 -->--%>
<div id="pid-div" style="width:600px; height:400px;"></div>

<script type="text/javascript">
    $(function () {
        var myChart = echarts.init($('#pid-div')[0]);
        var option = {
            title: {
                text: '姓名和年龄关系图之饼图',
                subtext: '测试数据',
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
        myChart.setOption(option);
        myChart.showLoading(); // 显示动画

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

                myChart.hideLoading(); // 隐藏加载动画
                myChart.setOption({
                    legend: {
                        data: goodscategory
                    },
                    series: [{
                        name: '年龄',
                        type: 'pie', // 设置图表类型为柱状图
                        data: goodsnumber // 设置纵坐标的刻度
                    }]
                });
            }
        });
    });
</script>
<div class="page-container">
    <div id="myChart" style="width: 600px;height:400px;"></div>
</div>
<%--<div class="page-container">--%>
<%--    <div id="myChart1" style="width: 600px;height:400px;"></div>--%>
<%--</div>--%>
<%--<div class="page-container">--%>
<%--    <div id="myChart2" style="width: 600px;height:400px;"></div>--%>
<%--</div>--%>
<%--<div class="page-container">--%>
<%--    <div id="myChart3" style="width: 600px;height:400px;"></div>--%>
<%--</div>--%>
<%--<div class="page-container">--%>
<%--    <div id="myChart4" style="width: 600px;height:400px;"></div>--%>
<%--</div>--%>
<%--<div class="page-container">--%>
<%--    <div id="myChart5" style="width: 600px;height:400px;"></div>--%>
<%--</div>--%>
<script th:inline="javascript">
    jQuery(document).ready(function() {
        var myChart = echarts.init(document.getElementById('myChart'));
        var options = {
            title: {
                text: 'X均值',
                show: true,
                subtext: '数据',
                textStyle: {
                    fontSize: 18
                }
            },
            tooltip: {},
            legend: {
                data: ['X1均值','X2均值']
            },
            xAxis: {
                data: []
            },
            yAxis: {},
            series: [{
                name: '数量',
                type: 'line', // 设置图表类型
                data: [] // 设置纵坐标的刻度(异步请求时,这里要置空)
            }]
        };
        myChart.setOption(options);
        myChart.showLoading(); // 显示加载动画
        $.ajax({
            url: '/echarts/outout2',
            type: 'post',
            dataType: 'json',
            success: function(data) {
                var xavg = [];
                var xavg1=[];
                var count = [];
                $.each(data, function(index, obj) {
                    xavg1.push(obj.xavg1);
                    xavg.push(obj.xavg);
                    count.push(obj.count);
                })
                myChart.hideLoading(); // 隐藏加载动画
                myChart.setOption({
                    legend: {
                        data: ['X1均值','X2均值']
                    },
                    xAxis: {
                        data: count
                    },
                    series: [{
                        name: 'X1均值',
                        type: 'line', // 设置图表类型为折线图
                        data: xavg, // 设置纵坐标的刻度
                        label: {
                            normal: {
                                show: true,
                                position: 'top',
                                textStyle: {
                                    color: 'red'
                                }
                            }
                        }

                    },{name: 'X2均值',
                        type: 'line', // 设置图表类型为折线图
                        data: xavg1, // 设置纵坐标的刻度
                        label: {
                            normal: {
                                show: true,
                                position: 'top',
                                textStyle: {
                                    color: 'blue'
                                }
                            }
                        }}]
                });
            }
        });
    });
</script>
<%--<script th:inline="javascript">--%>
<%--    jQuery(document).ready(function() {--%>
<%--        var myChart = echarts.init(document.getElementById('myChart2'));--%>
<%--        var options = {--%>
<%--            title: {--%>
<%--                text: 'Z均值',--%>
<%--                show: true,--%>
<%--                subtext: '数据',--%>
<%--                textStyle: {--%>
<%--                    fontSize: 18--%>
<%--                }--%>
<%--            },--%>
<%--            tooltip: {},--%>
<%--            legend: {--%>
<%--                data: ['Z1均值','Z2均值']--%>
<%--            },--%>
<%--            xAxis: {--%>
<%--                data: []--%>
<%--            },--%>
<%--            yAxis: {},--%>
<%--            series: [{--%>
<%--                name: '数量',--%>
<%--                type: 'line', // 设置图表类型--%>
<%--                data: [] // 设置纵坐标的刻度(异步请求时,这里要置空)--%>
<%--            }]--%>
<%--        };--%>
<%--        myChart.setOption(options);--%>
<%--        myChart.showLoading(); // 显示加载动画--%>
<%--        $.ajax({--%>
<%--            url: '/echarts/outout2',--%>
<%--            type: 'post',--%>
<%--            dataType: 'json',--%>
<%--            success: function(data) {--%>
<%--                var zavg = [];--%>
<%--                var zavg1=[];--%>
<%--                var count = [];--%>
<%--                $.each(data, function(index, obj) {--%>
<%--                    zavg1.push(obj.zavg1);--%>
<%--                    zavg.push(obj.zavg);--%>
<%--                    count.push(obj.count);--%>
<%--                })--%>
<%--                myChart.hideLoading(); // 隐藏加载动画--%>
<%--                myChart.setOption({--%>
<%--                    legend: {--%>
<%--                        data: ['Y1均值','Y2均值']--%>
<%--                    },--%>
<%--                    xAxis: {--%>
<%--                        data: count--%>
<%--                    },--%>
<%--                    series: [{--%>
<%--                        name: '数量',--%>
<%--                        type: 'line', // 设置图表类型为折线图--%>
<%--                        data: zavg, // 设置纵坐标的刻度--%>
<%--                        label: {--%>
<%--                            normal: {--%>
<%--                                show: true,--%>
<%--                                position: 'top',--%>
<%--                                textStyle: {--%>
<%--                                    color: 'red'--%>
<%--                                }--%>
<%--                            }--%>
<%--                        }--%>

<%--                    },{name: '数量1',--%>
<%--                        type: 'line', // 设置图表类型为折线图--%>
<%--                        data: zavg1, // 设置纵坐标的刻度--%>
<%--                        label: {--%>
<%--                            normal: {--%>
<%--                                show: true,--%>
<%--                                position: 'top',--%>
<%--                                textStyle: {--%>
<%--                                    color: 'blue'--%>
<%--                                }--%>
<%--                            }--%>
<%--                        }}]--%>
<%--                });--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
<%--<script th:inline="javascript">--%>
<%--    jQuery(document).ready(function() {--%>
<%--        var myChart = echarts.init(document.getElementById('myChart1'));--%>
<%--        var options = {--%>
<%--            title: {--%>
<%--                text: 'Y均值',--%>
<%--                show: true,--%>
<%--                subtext: '数据',--%>
<%--                textStyle: {--%>
<%--                    fontSize: 18--%>
<%--                }--%>
<%--            },--%>
<%--            tooltip: {},--%>
<%--            legend: {--%>
<%--                data: ['Y1均值','Y2均值']--%>
<%--            },--%>
<%--            xAxis: {--%>
<%--                data: []--%>
<%--            },--%>
<%--            yAxis: {},--%>
<%--            series: [{--%>
<%--                name: '数量',--%>
<%--                type: 'line', // 设置图表类型--%>
<%--                data: [] // 设置纵坐标的刻度(异步请求时,这里要置空)--%>
<%--            }]--%>
<%--        };--%>
<%--        myChart.setOption(options);--%>
<%--        myChart.showLoading(); // 显示加载动画--%>
<%--        $.ajax({--%>
<%--            url: '/echarts/outout2',--%>
<%--            type: 'post',--%>
<%--            dataType: 'json',--%>
<%--            success: function(data) {--%>
<%--                var yavg = [];--%>
<%--                var yavg1=[];--%>
<%--                var count = [];--%>
<%--                $.each(data, function(index, obj) {--%>
<%--                    yavg1.push(obj.yavg1);--%>
<%--                    yavg.push(obj.yavg);--%>
<%--                    count.push(obj.count);--%>
<%--                })--%>
<%--                myChart.hideLoading(); // 隐藏加载动画--%>
<%--                myChart.setOption({--%>
<%--                    legend: {--%>
<%--                        data: ['Y1均值','Y2均值']--%>
<%--                    },--%>
<%--                    xAxis: {--%>
<%--                        data: count--%>
<%--                    },--%>
<%--                    series: [{--%>
<%--                        name: '数量',--%>
<%--                        type: 'line', // 设置图表类型为折线图--%>
<%--                        data: yavg, // 设置纵坐标的刻度--%>
<%--                        label: {--%>
<%--                            normal: {--%>
<%--                                show: true,--%>
<%--                                position: 'top',--%>
<%--                                textStyle: {--%>
<%--                                    color: 'red'--%>
<%--                                }--%>
<%--                            }--%>
<%--                        }--%>

<%--                    },{name: '数量1',--%>
<%--                        type: 'line', // 设置图表类型为折线图--%>
<%--                        data: yavg1, // 设置纵坐标的刻度--%>
<%--                        label: {--%>
<%--                            normal: {--%>
<%--                                show: true,--%>
<%--                                position: 'top',--%>
<%--                                textStyle: {--%>
<%--                                    color: 'blue'--%>
<%--                                }--%>
<%--                            }--%>
<%--                        }}]--%>
<%--                });--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
<%--<script th:inline="javascript">--%>
<%--    jQuery(document).ready(function() {--%>
<%--        var myChart = echarts.init(document.getElementById('myChart3'));--%>
<%--        var options = {--%>
<%--            title: {--%>
<%--                text: 'X方差',--%>
<%--                show: true,--%>
<%--                subtext: '数据',--%>
<%--                textStyle: {--%>
<%--                    fontSize: 18--%>
<%--                }--%>
<%--            },--%>
<%--            tooltip: {},--%>
<%--            legend: {--%>
<%--                data: ['Y1均值','Y2均值']--%>
<%--            },--%>
<%--            xAxis: {--%>
<%--                data: []--%>
<%--            },--%>
<%--            yAxis: {},--%>
<%--            series: [{--%>
<%--                name: '数量',--%>
<%--                type: 'line', // 设置图表类型--%>
<%--                data: [] // 设置纵坐标的刻度(异步请求时,这里要置空)--%>
<%--            }]--%>
<%--        };--%>
<%--        myChart.setOption(options);--%>
<%--        myChart.showLoading(); // 显示加载动画--%>
<%--        $.ajax({--%>
<%--            url: '/echarts/outout2',--%>
<%--            type: 'post',--%>
<%--            dataType: 'json',--%>
<%--            success: function(data) {--%>
<%--                var xfc = [];--%>
<%--                var xfc1=[];--%>
<%--                var count = [];--%>
<%--                $.each(data, function(index, obj) {--%>
<%--                    xfc1.push(obj.xfc1);--%>
<%--                    xfc.push(obj.xfc);--%>
<%--                    count.push(obj.count);--%>
<%--                })--%>
<%--                myChart.hideLoading(); // 隐藏加载动画--%>
<%--                myChart.setOption({--%>
<%--                    legend: {--%>
<%--                        data: ['Y1均值','Y2均值']--%>
<%--                    },--%>
<%--                    xAxis: {--%>
<%--                        data: count--%>
<%--                    },--%>
<%--                    series: [{--%>
<%--                        name: '数量',--%>
<%--                        type: 'line', // 设置图表类型为折线图--%>
<%--                        data: xfc, // 设置纵坐标的刻度--%>
<%--                        label: {--%>
<%--                            normal: {--%>
<%--                                show: true,--%>
<%--                                position: 'top',--%>
<%--                                textStyle: {--%>
<%--                                    color: 'red'--%>
<%--                                }--%>
<%--                            }--%>
<%--                        }--%>

<%--                    },{name: '数量1',--%>
<%--                        type: 'line', // 设置图表类型为折线图--%>
<%--                        data: xfc1, // 设置纵坐标的刻度--%>
<%--                        label: {--%>
<%--                            normal: {--%>
<%--                                show: true,--%>
<%--                                position: 'top',--%>
<%--                                textStyle: {--%>
<%--                                    color: 'blue'--%>
<%--                                }--%>
<%--                            }--%>
<%--                        }}]--%>
<%--                });--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
<%--<script th:inline="javascript">--%>
<%--    jQuery(document).ready(function() {--%>
<%--        var myChart = echarts.init(document.getElementById('myChart4'));--%>
<%--        var options = {--%>
<%--            title: {--%>
<%--                text: 'Y方差',--%>
<%--                show: true,--%>
<%--                subtext: '数据',--%>
<%--                textStyle: {--%>
<%--                    fontSize: 18--%>
<%--                }--%>
<%--            },--%>
<%--            tooltip: {},--%>
<%--            legend: {--%>
<%--                data: ['Y1均值','Y2均值']--%>
<%--            },--%>
<%--            xAxis: {--%>
<%--                data: []--%>
<%--            },--%>
<%--            yAxis: {},--%>
<%--            series: [{--%>
<%--                name: '数量',--%>
<%--                type: 'line', // 设置图表类型--%>
<%--                data: [] // 设置纵坐标的刻度(异步请求时,这里要置空)--%>
<%--            }]--%>
<%--        };--%>
<%--        myChart.setOption(options);--%>
<%--        myChart.showLoading(); // 显示加载动画--%>
<%--        $.ajax({--%>
<%--            url: '/echarts/outout2',--%>
<%--            type: 'post',--%>
<%--            dataType: 'json',--%>
<%--            success: function(data) {--%>
<%--                var yfc1 = [];--%>
<%--                var yfc=[];--%>
<%--                var count = [];--%>
<%--                $.each(data, function(index, obj) {--%>
<%--                    yfc1.push(obj.yfc1);--%>
<%--                    yfc.push(obj.yfc);--%>
<%--                    count.push(obj.count);--%>
<%--                })--%>
<%--                myChart.hideLoading(); // 隐藏加载动画--%>
<%--                myChart.setOption({--%>
<%--                    legend: {--%>
<%--                        data: ['Y1均值','Y2均值']--%>
<%--                    },--%>
<%--                    xAxis: {--%>
<%--                        data: count--%>
<%--                    },--%>
<%--                    series: [{--%>
<%--                        name: '数量',--%>
<%--                        type: 'line', // 设置图表类型为折线图--%>
<%--                        data: yfc, // 设置纵坐标的刻度--%>
<%--                        label: {--%>
<%--                            normal: {--%>
<%--                                show: true,--%>
<%--                                position: 'top',--%>
<%--                                textStyle: {--%>
<%--                                    color: 'red'--%>
<%--                                }--%>
<%--                            }--%>
<%--                        }--%>

<%--                    },{name: '数量1',--%>
<%--                        type: 'line', // 设置图表类型为折线图--%>
<%--                        data: yfc1, // 设置纵坐标的刻度--%>
<%--                        label: {--%>
<%--                            normal: {--%>
<%--                                show: true,--%>
<%--                                position: 'top',--%>
<%--                                textStyle: {--%>
<%--                                    color: 'blue'--%>
<%--                                }--%>
<%--                            }--%>
<%--                        }}]--%>
<%--                });--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
<%--<script th:inline="javascript">--%>
<%--    jQuery(document).ready(function() {--%>
<%--        var myChart = echarts.init(document.getElementById('myChart5'));--%>
<%--        var options = {--%>
<%--            title: {--%>
<%--                text: 'Z方差',--%>
<%--                show: true,--%>
<%--                subtext: '数据',--%>
<%--                textStyle: {--%>
<%--                    fontSize: 18--%>
<%--                }--%>
<%--            },--%>
<%--            tooltip: {},--%>
<%--            legend: {--%>
<%--                data: ['Y1均值','Y2均值']--%>
<%--            },--%>
<%--            xAxis: {--%>
<%--                data: []--%>
<%--            },--%>
<%--            yAxis: {},--%>
<%--            series: [{--%>
<%--                name: '数量',--%>
<%--                type: 'line', // 设置图表类型--%>
<%--                data: [] // 设置纵坐标的刻度(异步请求时,这里要置空)--%>
<%--            }]--%>
<%--        };--%>
<%--        myChart.setOption(options);--%>
<%--        myChart.showLoading(); // 显示加载动画--%>
<%--        $.ajax({--%>
<%--            url: '/echarts/outout2',--%>
<%--            type: 'post',--%>
<%--            dataType: 'json',--%>
<%--            success: function(data) {--%>
<%--                var zfc = [];--%>
<%--                var zfc1=[];--%>
<%--                var count = [];--%>
<%--                $.each(data, function(index, obj) {--%>
<%--                    zfc1.push(obj.zfc1);--%>
<%--                    zfc.push(obj.zfc);--%>
<%--                    count.push(obj.count);--%>
<%--                })--%>
<%--                myChart.hideLoading(); // 隐藏加载动画--%>
<%--                myChart.setOption({--%>
<%--                    legend: {--%>
<%--                        data: ['Y1均值','Y2均值']--%>
<%--                    },--%>
<%--                    xAxis: {--%>
<%--                        data: count--%>
<%--                    },--%>
<%--                    series: [{--%>
<%--                        name: '数量',--%>
<%--                        type: 'line', // 设置图表类型为折线图--%>
<%--                        data: zfc, // 设置纵坐标的刻度--%>
<%--                        label: {--%>
<%--                            normal: {--%>
<%--                                show: true,--%>
<%--                                position: 'top',--%>
<%--                                textStyle: {--%>
<%--                                    color: 'red'--%>
<%--                                }--%>
<%--                            }--%>
<%--                        }--%>

<%--                    },{name: '数量1',--%>
<%--                        type: 'line', // 设置图表类型为折线图--%>
<%--                        data: zfc1, // 设置纵坐标的刻度--%>
<%--                        label: {--%>
<%--                            normal: {--%>
<%--                                show: true,--%>
<%--                                position: 'top',--%>
<%--                                textStyle: {--%>
<%--                                    color: 'blue'--%>
<%--                                }--%>
<%--                            }--%>
<%--                        }}]--%>
<%--                });--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>
<%--// </script>--%>
</body>
</html>