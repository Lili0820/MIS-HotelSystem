<%--
  Created by IntelliJ IDEA.
  User: CLL
  Date: 18/5/18
  Time: 下午12:37
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
            <h3 class="title">过去一周收入情况</h3>
            <div class="normal-div"></div>
            <div style="margin-bottom: 20px; margin-top: 20px;">
                <div id="week_income_chart" style="width: 600px;height:400px;"></div>
                <script type="text/javascript">
                    var myChart = echarts.init(document.getElementById('week_income_chart'));
                    option = {
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                            }
                        },
                        legend: {
                            data: ['大床房', '标准间', '套房']
                        },
                        grid: {
                            left: '3%',
                            right: '4%',
                            bottom: '3%',
                            containLabel: true
                        },
                        xAxis: {
                            type: 'value'
                        },
                        yAxis: {
                            type: 'category',
                            data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
                        },
                        series: [
                            {
                                name: '大床房',
                                type: 'bar',
                                stack: '总量',
                                label: {
                                    normal: {
                                        show: true,
                                        position: 'insideRight'
                                    }
                                },
                                data: [800, 1002, 1301, 1334, 1690, 2330, 1320]
                            },
                            {
                                name: '标准间',
                                type: 'bar',
                                stack: '总量',
                                label: {
                                    normal: {
                                        show: true,
                                        position: 'insideRight'
                                    }
                                },
                                data: [1520, 1432, 1401, 1434, 990, 1230, 1210]
                            },
                            {
                                name: '套房',
                                type: 'bar',
                                stack: '总量',
                                label: {
                                    normal: {
                                        show: true,
                                        position: 'insideRight'
                                    }
                                },
                                data: [2220, 1182, 1191, 2134, 1290, 1330, 1310]
                            }
                        ]
                    };
                    myChart.setOption(option);
                </script>
        </div>
            <div style="margin-top: 2%;margin-bottom:2%;border:solid 0.5px #d6d6d6"></div>
    </div>
</div>
<%@include file="/pages/common/toaster.jsp" %>
</body>

</html>
