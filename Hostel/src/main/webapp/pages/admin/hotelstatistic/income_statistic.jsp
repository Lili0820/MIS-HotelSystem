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
            <div style="display: flex;width: 500px;height:30px;margin-left: 10%">
                <div class="normal-div" style="flex: 2">查询范围
                    <select id="range" class="select">
                        <option value="month">当周</option>
                        <option value="week">当月</option>
                        <option value="day">当天</option>
                    </select>
                </div>
                <div class="normal-div" style="margin-right: 1%">选择日期</div>
                <div class="normal-div" style="flex: 2">
                    <div class="input-append date" id="date" data-date="2018-6-24" data-date-format="yyyy-mm-dd">
                        <input size="16" type="text" value="2018-6-24" readonly>
                    </div>
                </div>
                <div style="flex:1;margin-top: 2%">
                    <button type="button" class="button btn-register right-floated" onclick="confirm()">确定</button>
                </div>
            </div>
            <div style="margin-top: 5%">
                <h3 class="title">本期收益总额 ￥13425</h3>
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
                                data: ['6-22', '6-23', '6-24', '6-25', '6-26', '6-27', '6-28']
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
                    <div id="month_income_chart" style="display:none;width: 600px;height:400px;"></div>
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
                                data: ['5-13', '5-20', '5-27', '6-3', '6-10', '6-17', '6-24']
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
                                    data: [6980, 7020, 7010, 9340, 8900, 8300, 9200]
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
                                    data: [5520, 4432, 5401, 6434, 3090, 7230, 6210]
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
                                    data: [8220, 7182, 6191, 7134, 6290, 7330, 8310]
                                }
                            ]
                        };
                        myChart.setOption(option);
                    </script>
                    <div class="table-container" id="day_income_chart" style="display:none;width:600px">
                        <table id="js-table" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th width="35%">时间</th>
                                <th width="20%">相关订单号</th>
                                <th width="15%">金额</th>
                                <th width="30%">来源</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${planItems}" var="item">
                                <tr>
                                    <td>${item.date}</td>
                                    <td>${item.type}</td>
                                    <td>￥ ${item.price}</td>
                                    <td>${item.available}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div style="margin-top: 2%;margin-bottom:2%;border:solid 0.5px #d6d6d6"></div>
            <div style="margin-top: 5%">
                <h3 class="title">本期营业收入达成率</h3>
                <div class="table-container" id="goal_reach_reate" style="width:600px">
                    <table id="goal-table" class="table table-striped table-bordered">
                        <thead>
                        <%--最后一行数据是合计--%>
                        <tr>
                            <th width="30%">日期</th>
                            <th width="20%">预期收入</th>
                            <th width="20%">目标收入</th>
                            <th width="30%">达成率</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${planItems}" var="item">
                            <tr>
                                <td hidden>${item.planid}</td>
                                <td>￥ ${item.date}</td>
                                <td>￥ ${item.type}</td>
                                <td>${item.price} %</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div style="margin-top: 2%;margin-bottom:2%;border:solid 0.5px #d6d6d6"></div>
            <div style="margin-top: 5%">
                <h3 class="title">收益来源分布</h3>
                <div style="display: flex;width: 700px">
                    <div id="income_source_chart1" style="width:300px;height:200px;flex: 1"></div>
                    <script type="text/javascript">
                        var myChart = echarts.init(document.getElementById("income_source_chart1"));
                        option = {
                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                            },
                            series: [
                                {
                                    name: '收益',
                                    type: 'pie',
                                    radius: '60%',
                                    center: ['30%', '40%'],
                                    data: [
                                        {value: 9400, name: '线上'},
                                        {value: 4025, name: '线下'}
                                    ],
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
                    </script>
                    <div id="income_source_chart2" style="width:300px;height:200px;flex: 1"></div>
                    <script type="text/javascript">
                        var myChart = echarts.init(document.getElementById("income_source_chart2"));
                        option = {
                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                            },
                            series: [
                                {
                                    name: '收益',
                                    type: 'pie',
                                    radius: '60%',
                                    center: ['40%', '40%'],
                                    data: [
                                        {value: 13425-925, name: '正常订单'},
                                        {value: 925, name: '退订手续费'}
                                    ],
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
                    </script>
                </div>
            </div>
        </div>
    </div>
    <%@include file="/pages/common/toaster.jsp" %>
</body>

<script type="text/javascript">
    function confirm() {
        var type=$("#range").val();
        if(type=='month'){
            document.getElementById('per_room_chart').style.display='block';
            //document.getElementById('per_room_chart_day').style.display='none';
            document.getElementById('month_income_chart').style.display='block';
            document.getElementById('week_income_chart').style.display='none';
            document.getElementById("day_income_chart").style.display='none';
        }
        else if(type=='week'){
            document.getElementById("month_income_chart").style.display='none';
            document.getElementById("week_income_chart").style.display='block';
            document.getElementById("day_income_chart").style.display='none';
        }
        else{
            document.getElementById("month_income_chart").style.display='none';
            document.getElementById("week_income_chart").style.display='none';
            document.getElementById("day_income_chart").style.display='block';
        }
    }
</script>

</html>
