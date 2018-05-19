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
    <script src="${pageContext.request.contextPath}/assets/js/echarts.js"></script>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/plugins/datetimepicker/css/jquery.datetimepicker.css"/>
    <script src="${pageContext.request.contextPath}/assets/plugins/datetimepicker/js/jquery.datetimepicker.js"></script>
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
                        <option value="week">当周</option>
                        <option value="month">当月</option>
                        <option value="day">当天</option>
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
                <div class="normal-div"></div>
                <div style="margin-bottom: 20px; margin-top: 20px;">
                    <c:choose>
                        <c:when test="${type.equals('week')}">
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
                                            data: ${incomeWeekLarge}
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
                                            data: ${incomeWeekDouble}
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
                                            data: ${incomeWeekSuite}
                                        }
                                    ]
                                };
                                myChart.setOption(option);
                            </script>
                        </c:when>
                        <c:when test="${type.equals('month')}">
                            <div id="month_income_chart" style="display:none;width: 600px;height:400px;"></div>
                            <script type="text/javascript">
                                var myChart = echarts.init(document.getElementById('month_income_chart'));
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
                                            data: ${incomeMonthLarge}
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
                                            data: ${incomeMonthDouble}
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
                                            data: ${incomeMonthSuite}
                                        }
                                    ]
                                };
                                myChart.setOption(option);
                            </script>
                        </c:when>
                        <c:when test="${type.equals('day')}">
                            <div class="table-container" id="day_income_chart" style="width:600px">
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
                                    <c:forEach items="${orders}" var="item">
                                        <tr>
                                            <td>${item.booktime}</td>
                                            <td>${item.bookid}</td>
                                            <td>￥ ${item.price}</td>
                                            <td>${item.available}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>
            <div style="margin-top: 2%;margin-bottom:2%;border:solid 0.5px #d6d6d6"></div>
            <div style="margin-top: 5%">
                <h3 class="title">本期营业收入达成率</h3>
                <div class="table-container" id="goal_reach_rate" style="width:600px">
                    <table id="goal-table" class="table table-striped table-bordered">
                        <thead>
                        <%--最后一行数据是合计--%>
                        <tr>
                            <th width="30%">日期</th>
                            <th width="20%">预期收入</th>
                            <th width="20%">实际收入</th>
                            <th width="30%">达成率</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${goals}" var="item">
                            <tr>
                                <td>${item.date}</td>
                                <td>￥ ${item.goalIncome}</td>
                                <td>￥ ${item.actualIncome}</td>
                                <td>${item.rate} %</td>
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
                                        {value: ${incomeSource.get(0)}, name: '线上'},
                                        {value: ${incomeSource.get(1)}, name: '线下'}
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
                                        {value: ${incomeSource.get(2)}, name: '正常订单'},
                                        {value: ${incomeSource.get(3)}, name: '手续费'}
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
    $("#range").val("${type}");
    $('#date').datetimepicker({
        startView: 2,
        minView: 2
    });
    function confirm() {
        var type = $("#range").val();
        var date=$("#date").val();
        setTimeout(function () {
            window.location.href = "/admin/statistics/income/find?type="+type+"&date="+date;
        }, 1000);
    }
</script>

</html>
