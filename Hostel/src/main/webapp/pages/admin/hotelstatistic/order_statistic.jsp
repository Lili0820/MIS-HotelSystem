<%--
  Created by IntelliJ IDEA.
  User: CLL
  Date: 18/5/18
  Time: 上午10:49
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugins/datetimepicker/css/jquery.datetimepicker.css"/>
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
                        <option value="month">当月</option>
                        <option value="week">当周</option>
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
                <h3 class="title">预订总量   134</h3>
                <div id="order_num_chart_month" style="margin-left:16%;width:500px;height:310px"></div>
                <script type="text/javascript">
                    var myChart = echarts.init(document.getElementById('order_num_chart_month'));
                    function getVirtulData(year) {
                        year = year || '2018';
                        var date = +echarts.number.parseDate(year + '-01-01');
                        var end = +echarts.number.parseDate((+year + 1) + '-01-01');
                        var dayTime = 3600 * 24 * 1000;
                        var data = [];
                        for (var time = date; time < end; time += dayTime) {
                            data.push([
                                echarts.format.formatTime('yyyy-MM-dd', time),
                                Math.floor(Math.random() * 20)
                            ]);
                        }
                        return data;
                    }


                    var graphData = [];

                    var links = graphData.map(function (item, idx) {
                        return {
                            source: idx,
                            target: idx + 1
                        };
                    });
                    links.pop();

                    option = {
                        tooltip: {
                            position: 'top'
                        },
                        visualMap: [{
                            min: 0,
                            max: 20,
                            calculable: true,
                            seriesIndex: [1],
                            orient: 'horizontal',
                            left: '50%',
                            bottom: '0%'
                        }],

                        calendar: [
                            {
                                orient: 'vertical',
                                yearLabel: {
                                    margin: 40
                                },
                                monthLabel: {
                                    nameMap: 'cn',
                                    margin: 20
                                },
                                dayLabel: {
                                    firstDay: 1,
                                    nameMap: 'cn'
                                },
                                cellSize: 40,
                                range: '2018-06'
                            }],

                        series: [{
                            type: 'graph',
                            edgeSymbol: ['none'],
                            coordinateSystem: 'calendar',
                            links: links,
                            symbolSize: 10,
                            calendarIndex: 0,
                            data: graphData
                        }, {
                            type: 'heatmap',
                            coordinateSystem: 'calendar',
                            data: getVirtulData(2018)
                        }]
                    };
                    myChart.setOption(option);
                </script>
                <div id="order_num_chart_week" style="display:none;margin-left:16%;width:500px;height:300px"></div>
                <script type="text/javascript">
                    var myChart=echarts.init(document.getElementById("order_num_chart_week"));
                    option = {
                        tooltip : {
                            trigger: 'axis'
                        },
                        legend: {
                            data:['大床房','标准间','套房']
                        },
                        xAxis : [
                            {
                                type : 'category',
                                data : ['周一','周二','周三','周四','周五','周六','周日']
                            }
                        ],
                        yAxis : [
                            {
                                type : 'value'
                            }
                        ],
                        series : [
                            {
                                name:'大床房',
                                type:'bar',
                                data:[10, 22, 11, 14, 20, 23, 19]
                            },
                            {
                                name:'标准间',
                                type:'bar',
                                data:[22, 23, 20, 23, 29, 13, 11]
                            },
                            {
                                name:'套房',
                                type:'bar',
                                data:[2, 1, 3, 4, 2, 3, 3]
                            },
                            {
                                name:'大床房',
                                type:'bar',
                                stack: '总计',
                                data:[10, 22, 11, 14, 20, 23, 19]
                            },
                            {
                                name:'标准间',
                                type:'bar',
                                stack: '总计',
                                data:[22, 23, 20, 23, 29, 13, 11]
                            },
                            {
                                name:'套房',
                                type:'bar',
                                stack: '总计',
                                data:[2, 1, 3, 4, 2, 3, 3]
                            }
                        ]
                    };
                    myChart.setOption(option);
                </script>
                <div class="table-container" id="order_num_chart_day" style="display:none;width:600px">
                    <table id="js-table" class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th width="20%">订单编号</th>
                            <th width="25%">入住日期</th>
                            <th width="15%">房型</th>
                            <th width="15%">总额</th>
                            <th width="20%">订单状态</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${planItems}" var="item">
                            <tr>
                                <td hidden>${item.planid}</td>
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
            <div style="margin-top: 2%;margin-bottom:2%;border:solid 0.5px #d6d6d6"></div>
            <div>
            <h3 class="title">订单交易状态</h3>
                <div id="success_rate_chart" style="margin-left:15%;width:500px;height:350px"></div>
                <script type="text/javascript">
                    var myChart = echarts.init(document.getElementById("success_rate_chart"));
                    option = {
                        title: {
                            text: '交易成功率',
                            x: 'center'
                        },
                        tooltip: {
                            trigger: 'axis',
                            formatter: '{b}<br/>{a0}: {c0}%<br />{a1}: {c1}%<br />{a2}: {c2}%<br/>{a3}: {c3}%'
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                dataZoom: {},
                                dataView: {readOnly: false},
                                magicType: {type: ['line', 'bar']},
                                restore: {}
                            }
                        },
                        xAxis: {
                            type: 'category',
                            name: '周',
                            data: ['5-13', '5-20', '5-27', '6-3', '6-10', '6-17', '6-24']
                        },
                        yAxis: {
                            type: 'value',
                            name: '交易成功率',
                            axisLabel: {
                                formatter: '{value} %'
                            }
                        },
                        series: [

                            {
                                name: '大床房',
                                type: 'line',
                                data: [Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0],
                                markPoint: {
                                    label: {
                                        show: true,
                                        formatter: '{c}%'
                                    }
                                }
                            },
                            {
                                name: '标准间',
                                type: 'line',
                                lineStyle: {
                                    type: 'dashed'
                                },
                                data: [Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0],
                                markPoint: {
                                    label: {
                                        formatter: '{c}%'
                                    },
                                    data: [
                                        {type: 'max', name: '最大值'},
                                        {type: 'min', name: '最小值'}
                                    ]
                                }
                            },

                            {
                                name: '套房',
                                lineStyle: {
                                    type: 'dotted'
                                },
                                type: 'line',
                                markPoint: {
                                    label: {
                                        formatter: '{c}%'
                                    },
                                    data: [
                                        {type: 'max', name: '最大值'},
                                        {type: 'min', name: '最小值'}
                                    ]
                                },
                                data: [Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0]
                            },
                            {
                                name: '总体',
                                type: 'line',
                                data: [Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0],
                                markPoint: {
                                    label: {
                                        show: true,
                                        formatter: '{c}%'
                                    },
                                    data: [
                                        {type: 'max', name: '最大值'},
                                        {type: 'min', name: '最小值'}
                                    ]
                                }
                            }
                        ]
                    };
                    myChart.setOption(option);
                </script>
                <div id="success_rate_chart_week" style="display:none;margin-left:15%;width:500px;height:350px"></div>
                <script type="text/javascript">
                    var myChart = echarts.init(document.getElementById("success_rate_chart_week"));
                    option = {
                        title: {
                            text: '交易成功率',
                            x: 'center'
                        },
                        tooltip: {
                            trigger: 'axis',
                            formatter: '{b}<br/>{a0}: {c0}%<br />{a1}: {c1}%<br />{a2}: {c2}%<br/>{a3}: {c3}%'
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                dataZoom: {},
                                dataView: {readOnly: false},
                                magicType: {type: ['line', 'bar']},
                                restore: {}
                            }
                        },
                        xAxis: {
                            type: 'category',
                            name: '日',
                            data: ['6-22', '6-23', '6-24', '6-25', '6-26', '6-27', '6-28']
                        },
                        yAxis: {
                            type: 'value',
                            name: '交易成功率',
                            axisLabel: {
                                formatter: '{value} %'
                            }
                        },
                        series: [

                            {
                                name: '大床房',
                                type: 'line',
                                data: [Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0],
                                markPoint: {
                                    label: {
                                        show: true,
                                        formatter: '{c}%'
                                    }
                                }
                            },
                            {
                                name: '标准间',
                                type: 'line',
                                lineStyle: {
                                    type: 'dashed'
                                },
                                data: [Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0],
                                markPoint: {
                                    label: {
                                        formatter: '{c}%'
                                    },
                                    data: [
                                        {type: 'max', name: '最大值'},
                                        {type: 'min', name: '最小值'}
                                    ]
                                }
                            },

                            {
                                name: '套房',
                                lineStyle: {
                                    type: 'dotted'
                                },
                                type: 'line',
                                markPoint: {
                                    label: {
                                        formatter: '{c}%'
                                    },
                                    data: [
                                        {type: 'max', name: '最大值'},
                                        {type: 'min', name: '最小值'}
                                    ]
                                },
                                data: [Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0]
                            },
                            {
                                name: '总体',
                                type: 'line',
                                data: [Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0, Math.floor(Math.random() * 10000) / 100.0],
                                markPoint: {
                                    label: {
                                        show: true,
                                        formatter: '{c}%'
                                    },
                                    data: [
                                        {type: 'max', name: '最大值'},
                                        {type: 'min', name: '最小值'}
                                    ]
                                }
                            }
                        ]
                    };
                    myChart.setOption(option);
                </script>
                <div id="success_rate_chart_day" style="display:none;margin-left:5%;">
                   <h5>交易成功率————暂无数据</h5>
                </div>
                <div  style="width:650px;height:320px;display: flex;margin-top: 5%">
                    <div id="cancel_chart_1" style="width:300px;height:200px"></div>
                    <script type="text/javascript">
                        var myChart = echarts.init(document.getElementById("cancel_chart_1"));
                        option = {
                            title: {
                                text: '取消时间分布',
                                x: 'center'
                            },
                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                            },
                            legend: {
                                orient: 'vertical',
                                left: 'left',
                                data: ['一日前', '三日前', '七日前']
                            },
                            series: [
                                {
                                    name: '取消时间',
                                    type: 'pie',
                                    radius: '55%',
                                    center: ['50%', '60%'],
                                    data: [
                                        {value: 7, name: '一日前'},
                                        {value: 2, name: '三日前'},
                                        {value: 5, name: '七日前'}
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
                    <div id="cancel_chart_2" style="width:250px;height:300px;flex:1"></div>
                    <script type="text/javascript">
                        var myChart = echarts.init(document.getElementById("cancel_chart_2"));
                        option = {
                            title: {
                                text: '取消房型分布',
                                x: 'center'
                            },
                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                            },
                            legend: {
                                x: 'center',
                                y: 'bottom',
                                data: ['大床房', '标准间', '套房']
                            },
                            toolbox: {
                                show: true,
                                feature: {
                                    mark: {show: true},
                                    dataView: {show: true, readOnly: false},
                                    magicType: {
                                        show: true,
                                        type: ['pie', 'funnel']
                                    },
                                    restore: {show: true},
                                    saveAsImage: {show: true}
                                }
                            },
                            calculable: true,
                            series: [
                                {
                                    name: '面积模式',
                                    type: 'pie',
                                    radius: [30, 110],
                                    roseType: 'area',
                                    data: [
                                        {value: 2, name: '大床房'},
                                        {value: 5, name: '标准间'},
                                        {value: 1, name: '套房'}
                                    ]
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
<script type="text/javascript">
    $('#date').datetimepicker({
        startView: 2,
        minView: 2
    });

    function confirm() {
        var type=$("#range").val();
        if(type=='month'){
            document.getElementById('success_rate_chart').style.display='block';
            document.getElementById('success_rate_chart_week').style.display='none';
            document.getElementById('success_rate_chart_day').style.display='none';
            document.getElementById('order_num_chart_month').style.display='block';
            document.getElementById('order_num_chart_week').style.display='none';
            document.getElementById("order_num_chart_day").style.display='none';
        }
        else if(type=='week'){
            document.getElementById("success_rate_chart").style.display='none';
            document.getElementById("success_rate_chart_week").style.display='block';
            document.getElementById("success_rate_chart_day").style.display='none';
            document.getElementById("order_num_chart_month").style.display='none';
            document.getElementById("order_num_chart_week").style.display='block';
            document.getElementById("order_num_chart_day").style.display='none';
        }
        else{
            document.getElementById("success_rate_chart").style.display='none';
            document.getElementById("success_rate_chart_week").style.display='none';
            document.getElementById("success_rate_chart_day").style.display='block';
            document.getElementById("order_num_chart_month").style.display='none';
            document.getElementById("order_num_chart_week").style.display='none';
            document.getElementById("order_num_chart_day").style.display='block';
        }
    }
</script>
</html>
