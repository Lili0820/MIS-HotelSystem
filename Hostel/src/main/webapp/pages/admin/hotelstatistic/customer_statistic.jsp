<%--
  Created by IntelliJ IDEA.
  User: CLL
  Date: 18/5/18
  Time: 下午8:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>经营状况 - HOSTEL</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/datatables/datatables.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/datatables/datatables.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/echarts.min.js"></script>
</head>

<body class="admin-body">
<%@include file="../../common/admin_navbar.jsp" %>
<div class="wrapper">
    <div class="content">
        <%@include file="../../common/admin_statistic_dashboard_left.jsp" %>
        <div class="right-content">
            <div>
                <h3 class="title">顾客数量统计</h3>
                <div class="table-container" id="day_income_chart" style="width:600px">
                    <table id="js-table" class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th width="20%">本期顾客总数</th>
                            <th width="25%">本期新增顾客数</th>
                            <th width="30%">回头客数（二次光顾）</th>
                            <th width="20%">回头客率</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>42</td>
                            <td>12</td>
                            <td>18</td>
                            <td>48.6%</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div style="margin-top: 2%;margin-bottom:2%;border:solid 0.5px #d6d6d6"></div>
            <div style="margin-top: 5%">
                <h3 class="title">顾客满意度</h3>

                <div id="remark_chart" style="width:400px;height:300px;"></div>
                <script type="text/javascript">
                    var myChart = echarts.init(document.getElementById("remark_chart"));
                    option = {
                        title:{
                            text: "近一月评分变化",
                            x: 'center'
                        },
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                            }
                        },
                        xAxis: {
                            type: 'category',
                            name: '日期',
                            data: ['5-13', '5-20', '5-27', '6-3', '6-10', '6-17', '6-24']
                        },
                        yAxis: {
                            type: 'value',
                            name: '评分',
                            max:5,
                            min:0
                        },
                        series: [{
                            data: [4.4, 4.3, 4.4, 4.5, 4.5, 4.4, 4.5],
                            type: 'line'
                        }]
                    };
                    myChart.setOption(option);
                </script>
            </div>
        </div>
    </div>
    <%@include file="/pages/common/toaster.jsp" %>
</body>

</body>
</html>
