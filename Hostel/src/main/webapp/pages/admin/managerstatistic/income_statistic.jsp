<%--
  Created by IntelliJ IDEA.
  User: CLL
  Date: 18/5/24
  Time: 下午3:52
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
            <div style="display: flex;width: 500px;height:30px;margin-left: 10%">
                <div class="normal-div" style="flex: 2">查询范围
                    <select id="range" class="select">
                        <option value="week">当周</option>
                        <option value="month">当月</option>
                    </select>
                </div>
                <div class="normal-div" style="margin-right: 1%">选择日期</div>
                <div class="normal-div" style="flex: 2">
                    <div class="input-append date" id="datepicker">
                        <input id="date" size="16" type="text" data-date-format="yyyy-mm-dd" value=${nowDate}>
                        <span
                                class="add-on calendarIcon"><i
                                class="icon-calendar glyphicon glyphicon-th"></i></span>
                    </div>
                </div>
                <div style="flex:1;margin-top: 2%">
                    <button type="button" class="button btn-register right-floated" onclick="confirm()">确定</button>
                </div>
            </div>
            <div style="margin-top: 5%">
                <h3 class="title">本期收益总额 ￥${incomeTotal}</h3>
                <div style="margin-top: 5%">
                    <div id="income_chart" style="width:500px;height:300px;"></div>
                    <script type="text/javascript">
                        var myChart = echarts.init(document.getElementById("income_chart"));
                        option = {
                            title: {
                                text: "收益变化",
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
                                data: ${dates}
                            },
                            yAxis: {
                                type: 'value',
                                name: '收益额'
                            },
                            series: [{
                                data: ${incomeList},
                                type: 'line'
                            }]
                        };
                        myChart.setOption(option);
                    </script>
                </div>
            </div>
            <div style="margin-top: 2%;margin-bottom:2%;border:solid 0.5px #d6d6d6"></div>
            <div style="margin-top: 5%">
                <h3 class="title">地区收益排行榜(从高到低)</h3>
                <div class="table-container" id="rfm_chart" style="width:500px">
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th width="30%">名称</th>
                            <th width="35%">本期收益</th>
                            <th width="35%">增长率</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${rankItems}" var="item">
                            <tr>
                                <td>${item.region}</td>
                                <td>${item.incomeTotal}元</td>
                                <td>${item.upRate}%</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/pages/common/toaster.jsp" %>
</body>
<script type="text/javascript">
    $("#range").val("${type}");
    $('#datepicker').datetimepicker({
        minView: "month", //选择日期后，不会再跳转去选择时分秒
        language: 'zh-CN',
        format: 'yyyy-mm-dd',
        todayBtn: 1,
        autoclose: 1,
        timepicker: false,
        inputMask: true
    });

    function confirm() {
        var type = $("#range").val();
        var date = $("#date").val();
        setTimeout(function () {
            window.location.href = "/admin/manager/statistics/income/find?type=" + type + "&date=" + date;
        }, 1000);
    }
</script>
</html>
