<%--
  Created by IntelliJ IDEA.
  User: CLL
  Date: 18/5/24
  Time: 下午2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>网站统计 - HOSTEL</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/datatables/datatables.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/datatables/datatables.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/echarts.js"></script>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/plugins/datetimepicker/css/jquery.datetimepicker.css"/>
    <script src="${pageContext.request.contextPath}/assets/plugins/datetimepicker/js/jquery.datetimepicker.js"></script>
</head>
<body class="admin-body">
<%@include file="../../common/manager_navbar.jsp" %>
<div class="wrapper">
    <div class="content">
        <%@include file="../../common/manager_statistic_dashboard_left.jsp" %>
        <div class="right-content">
            <h3 class="title">已注册酒店数</h3>
            <div id="region_chart" style="width: 600px">
                <div class="table-container">
                    <table id="js-table" class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th width="12%">鼓楼区</th>
                            <th width="12%">秦淮区</th>
                            <th width="12%">玄武区</th>
                            <th width="12%">栖霞区</th>
                            <th width="12%">江宁区</th>
                            <th width="12%">浦口区</th>
                            <th width="12%">建邺区</th>
                            <th width="12%">总计</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${regionNum.get(0)}</td>
                                <td>${regionNum.get(1)}</td>
                                <td>${regionNum.get(2)}</td>
                                <td>${regionNum.get(3)}</td>
                                <td>${regionNum.get(4)}</td>
                                <td>${regionNum.get(5)}</td>
                                <td>${regionNum.get(6)}</td>
                                <td>${
                                regionNum.stream().reduce(0,(a,b)->a+b)
                                }</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>
            <div style="margin-top: 2%;margin-bottom:2%;border:solid 0.5px #d6d6d6"></div>
            <div id="level_chart" style="margin-left:5%;width:600px;height:300px"></div>
            <script type="text/javascript">
                var myChart = echarts.init(document.getElementById("level_chart"));
                option = {
                    title: {
                        text: '酒店区域星级分布'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['三星以下', '四星', '五星']
                    },
                    xAxis: [
                        {
                            type: 'category',
                            data: ['鼓楼', '秦淮', '玄武', '栖霞', '江宁', '浦口', '建邺']
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value'
                        }
                    ],
                    series: [
                        {
                            name: '三星以下',
                            type: 'bar',
                            data:${levelList.get(0)}
                        },
                        {
                            name: '四星',
                            type: 'bar',
                            data:${levelList.get(1)}
                        },
                        {
                            name: '五星',
                            type: 'bar',
                            data:${levelList.get(2)}
                        }
                    ]
                };
                myChart.setOption(option);
            </script>
            <div id="price_chart" style="margin-left:5%;width:600px;height:300px"></div>
            <script type="text/javascript">
                var myChart = echarts.init(document.getElementById("price_chart"));
                option = {
                    title: {
                        text: '酒店区域价格分布'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['200元以下', '200-300元', '300-500元', '500-1000元', '1000元以上'],
                        left: '28%'
                    },
                    xAxis: [
                        {
                            type: 'category',
                            data: ['鼓楼', '秦淮', '玄武', '栖霞', '江宁', '浦口', '建邺']
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value'
                        }
                    ],
                    series: [
                        {
                            name: '200元以下',
                            type: 'bar',
                            data:${priceList.get(0)}
                        },
                        {
                            name: '200-300元',
                            type: 'bar',
                            data:${priceList.get(1)}
                        },
                        {
                            name: '300-500元',
                            type: 'bar',
                            data:${priceList.get(2)}
                        },
                        {
                            name: '500-1000元',
                            type: 'bar',
                            data:${priceList.get(3)}
                        },
                        {
                            name: '1000元以上',
                            type: 'bar',
                            data:${priceList.get(4)}
                        }
                    ]
                };
                myChart.setOption(option);
            </script>
        </div>
    </div>
</div>
<%@include file="/pages/common/toaster.jsp" %>
</body>
</html>
