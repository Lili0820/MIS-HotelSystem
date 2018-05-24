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
                <div style="display: flex;width: 500px;height:30px;margin-left: 10%;margin-bottom: 5%">
                    <div class="normal-div" style="flex: 2">查询范围
                        <select id="range" class="select">
                            <option value="month">当月</option>
                            <option value="week">当周</option>
                            <option value="day">当天</option>
                        </select>
                    </div>
                    <div class="normal-div" style="margin-right: 1%">选择日期</div>
                    <div class="normal-div" style="flex: 2">
                        <div class="input-append date" id="datepicker">
                            <input id="date" size="16" type="text"  data-date-format="yyyy-mm-dd" value=${nowDate}>
                            <span
                                    class="add-on calendarIcon"><i
                                    class="icon-calendar glyphicon glyphicon-th"></i></span>
                        </div>
                    </div>
                    <div style="flex:1;margin-top: 2%">
                        <button type="button" class="button btn-register right-floated" onclick="confirm()">确定</button>
                    </div>
                </div>
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
                            <td>${total}</td>
                            <td>${add}</td>
                            <td>${repeat}</td>
                            <td>${rate}%</td>
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
                            data: ${dates}
                        },
                        yAxis: {
                            type: 'value',
                            name: '评分',
                            max:5,
                            min:0
                        },
                        series: [{
                            data: ${remarks},
                            type: 'line'
                        }]
                    };
                    myChart.setOption(option);
                </script>
            </div>
            <div style="margin-top: 2%;margin-bottom:2%;border:solid 0.5px #d6d6d6"></div>
            <div>
                <h3 class="title">顾客价值分析</h3>
                <div class="table-container" id="rfm_chart" style="width:650px">
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th width="18%">最后购买时间</th>
                            <th width="14%">订单数量</th>
                            <th width="18%">平均订单价格</th>
                            <th width="10%">顾客数</th>
                            <th width="25%">此类顾客消费总金额</th>
                            <th width="15%">策略</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${rfm}" var="item">
                            <tr>
                                <td>${item.lastOrderTime}</td>
                                <td>${item.orderNum}</td>
                                <td>${item.perOrderPrice}元</td>
                                <td>${item.customerNum}</td>
                                <td>${item.totalMoney}元</td>
                                <td>${item.strategy}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <div style="display: flex;width:600px;height:300px;margin-left: 5%">
                        <div id="customer_rate_1" style="width:300px;height:300px;flex: 1"></div>
                        <script type="text/javascript">
                            var myChart = echarts.init(document.getElementById("customer_rate_1"));
                            option = {
                                title: {
                                    text: "各类顾客数占比"
                                },
                                tooltip: {
                                    trigger: 'item',
                                    formatter: "{a} <br/>{b} : {c}人 ({d}%)"
                                },
                                legend: {
                                    orient: 'vertical',
                                    left: 'left',
                                    data: [${rfm.get(0).customerNum},${rfm.get(1).customerNum},${rfm.get(2).customerNum},${rfm.get(3).customerNum},
                                        ${rfm.get(4).customerNum},${rfm.get(5).customerNum},${rfm.get(6).customerNum},${rfm.get(7).customerNum}]
                                },
                                series: [
                                    {
                                        name: '顾客数占比',
                                        type: 'pie',
                                        radius: '50%',
                                        center: ['22%', '45%'],
                                        label: {

                                        },
                                        data: [
                                            {value: ${rfm.get(0).customerNum}, name:'${rfm.get(0).strategy}'},
                                            {value: ${rfm.get(1).customerNum}, name:'${rfm.get(1).strategy}'},
                                            {value: ${rfm.get(2).customerNum}, name:'${rfm.get(2).strategy}'},
                                            {value: ${rfm.get(3).customerNum}, name:'${rfm.get(3).strategy}'},
                                            {value: ${rfm.get(4).customerNum}, name:'${rfm.get(4).strategy}'},
                                            {value: ${rfm.get(5).customerNum}, name:'${rfm.get(5).strategy}'},
                                            {value: ${rfm.get(6).customerNum}, name:'${rfm.get(6).strategy}'},
                                            {value: ${rfm.get(7).customerNum}, name:'${rfm.get(7).strategy}'}
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
                        <div id="customer_rate_2" style="width:300px;height:300px;flex: 1"></div>
                        <script type="text/javascript">
                            var myChart = echarts.init(document.getElementById("customer_rate_2"));
                            option = {
                                title: {
                                    text: "各类顾客总消费占比"
                                },
                                tooltip: {
                                    trigger: 'item',
                                    formatter: "{a} <br/>{b} : {c}元 ({d}%)"
                                },

                                series: [
                                    {
                                        name: '总消费占比',
                                        type: 'pie',
                                        radius: '50%',
                                        center: ['50%', '45%'],
                                        label: {

                                        },
                                        data: [
                                            {value: ${rfm.get(0).totalMoney}, name:'${rfm.get(0).strategy}'},
                                            {value: ${rfm.get(1).totalMoney}, name:'${rfm.get(1).strategy}'},
                                            {value: ${rfm.get(2).totalMoney}, name:'${rfm.get(2).strategy}'},
                                            {value: ${rfm.get(3).totalMoney}, name:'${rfm.get(3).strategy}'},
                                            {value: ${rfm.get(4).totalMoney}, name:'${rfm.get(4).strategy}'},
                                            {value: ${rfm.get(5).totalMoney}, name:'${rfm.get(5).strategy}'},
                                            {value: ${rfm.get(6).totalMoney}, name:'${rfm.get(6).strategy}'},
                                            {value: ${rfm.get(7).totalMoney}, name:'${rfm.get(7).strategy}'}
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
        var date=$("#date").val();
        setTimeout(function () {
            window.location.href = "/admin/statistics/customer/find?type="+type+"&date="+date;
        }, 1000);
    }
</script>
</html>
