<%--
  Created by IntelliJ IDEA.
  User: CLL
  Date: 18/5/24
  Time: 下午3:53
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
            <div>
                <h3 class="title">会员区域分布</h3>
                <div id="range_chart" style="width: 600px;height: 300px;margin-left: 5%"></div>
                <script type="text/javascript">
                    var chart=echarts.init(document.getElementById("range_chart"));
                    option = {
                        xAxis: {
                            type: 'category',
                            data: ['鼓楼区', '玄武区', '秦淮区', '栖霞区', '江宁区', '浦口区', '建邺区']
                        },
                        yAxis: {
                            type: 'value'
                        },
                        series: [{
                            data: ${vipNums},
                            type: 'bar'
                        }]
                    };
                    chart.setOption(option);
                </script>
            </div>
            <div style="margin-top: 2%;margin-bottom:2%;border:solid 0.5px #d6d6d6"></div>
            <div>
                <h3 class="title">会员价值分析</h3>
                <div style="display: flex;width: 300px;height:30px;margin-left: 5%;margin-bottom: 3%">
                    <div class="normal-div" style="flex: 3">查询区域
                        <select id="range" class="select">
                            <option value="1">鼓楼区</option>
                            <option value="2">秦淮区</option>
                            <option value="3">玄武区</option>
                            <option value="4">栖霞区</option>
                            <option value="5">江宁区</option>
                            <option value="6">浦口区</option>
                            <option value="7">建邺区</option>
                        </select>
                    </div>
                    <div style="flex:1;margin-top: 2%">
                        <button type="button" class="button btn-register right-floated" onclick="confirm()">确定</button>
                    </div>
                </div>
                <div class="table-container" id="rfm_chart" style="width:650px">
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th width="18%">最后购买时间</th>
                            <th width="14%">订单数量</th>
                            <th width="18%">平均订单价格</th>
                            <th width="10%">会员数</th>
                            <th width="25%">此类会员消费总金额</th>
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
                                    text: "各类会员数占比"
                                },
                                tooltip: {
                                    trigger: 'item',
                                    formatter: "{a} <br/>{b} : {c}人 ({d}%)"
                                },
                                legend: {
                                    orient: 'vertical',
                                    left: 'left',
                                    data: [${rfm.get(0).customerNum}, ${rfm.get(1).customerNum}, ${rfm.get(2).customerNum}, ${rfm.get(3).customerNum},
                                        ${rfm.get(4).customerNum}, ${rfm.get(5).customerNum}, ${rfm.get(6).customerNum}, ${rfm.get(7).customerNum}]
                                },
                                series: [
                                    {
                                        name: '会员数占比',
                                        type: 'pie',
                                        radius: '50%',
                                        center: ['22%', '45%'],
                                        label: {},
                                        data: [
                                            {value: ${rfm.get(0).customerNum}, name: '${rfm.get(0).strategy}'},
                                            {value: ${rfm.get(1).customerNum}, name: '${rfm.get(1).strategy}'},
                                            {value: ${rfm.get(2).customerNum}, name: '${rfm.get(2).strategy}'},
                                            {value: ${rfm.get(3).customerNum}, name: '${rfm.get(3).strategy}'},
                                            {value: ${rfm.get(4).customerNum}, name: '${rfm.get(4).strategy}'},
                                            {value: ${rfm.get(5).customerNum}, name: '${rfm.get(5).strategy}'},
                                            {value: ${rfm.get(6).customerNum}, name: '${rfm.get(6).strategy}'},
                                            {value: ${rfm.get(7).customerNum}, name: '${rfm.get(7).strategy}'}
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
                                    text: "各类会员总消费占比"
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
                                        label: {},
                                        data: [
                                            {value: ${rfm.get(0).totalMoney}, name: '${rfm.get(0).strategy}'},
                                            {value: ${rfm.get(1).totalMoney}, name: '${rfm.get(1).strategy}'},
                                            {value: ${rfm.get(2).totalMoney}, name: '${rfm.get(2).strategy}'},
                                            {value: ${rfm.get(3).totalMoney}, name: '${rfm.get(3).strategy}'},
                                            {value: ${rfm.get(4).totalMoney}, name: '${rfm.get(4).strategy}'},
                                            {value: ${rfm.get(5).totalMoney}, name: '${rfm.get(5).strategy}'},
                                            {value: ${rfm.get(6).totalMoney}, name: '${rfm.get(6).strategy}'},
                                            {value: ${rfm.get(7).totalMoney}, name: '${rfm.get(7).strategy}'}
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
</div>
<%@include file="/pages/common/toaster.jsp" %>
</body>
<script type="text/javascript">
    $("#range").val("${region}");
    function confirm() {
        var region = $("#range").val();
        setTimeout(function () {
            window.location.href = "/admin/manager/statistics/vip/find?region=" + region;
        }, 1000);
    }
</script>
</html>
