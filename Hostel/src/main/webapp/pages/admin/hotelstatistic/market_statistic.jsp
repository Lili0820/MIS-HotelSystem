<%--
  Created by IntelliJ IDEA.
  User: CLL
  Date: 18/5/19
  Time: 上午10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <div>
                <h3 class="title">市场占有率 ${averageRate}%</h3>
                <c:choose>
                    <c:when test="${type.equals('month')}">
                        <div id="market_rate_chart_month" style="margin-left:15%;width:500px;height:350px"></div>
                        <script type="text/javascript">
                            var myChart = echarts.init(document.getElementById("market_rate_chart_month"));
                            option = {
                                title: {
                                    text: '市场占有率',
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
                                    data: ${dates}
                                },
                                yAxis: {
                                    type: 'value',
                                    name: '市场占有率',
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
                    </c:when>
                    <c:when test="${type.equals('week')}">
                        <div id="market_rate_chart_week" style="margin-left:15%;width:500px;height:350px"></div>
                        <script type="text/javascript">
                            var myChart = echarts.init(document.getElementById("market_rate_chart_week"));
                            option = {
                                title: {
                                    text: '市场占有率',
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
                                    data: ${dates}
                                },
                                yAxis: {
                                    type: 'value',
                                    name: '市场占有率',
                                    axisLabel: {
                                        formatter: '{value} %'
                                    }
                                },
                                series: [

                                    {
                                        name: '大床房',
                                        type: 'line',
                                        data: [Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0],
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
                                        data: [Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0],
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
                                        data: [Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0]
                                    },
                                    {
                                        name: '总体',
                                        type: 'line',
                                        data: [Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0, Math.floor(Math.random() * 5000) / 100.0],
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
                    </c:when>
                    <c:when test="${type.equals('day')}">
                        <div id="market_rate_chart_day" style="width: 400px">
                            <div class="table-container">
                                <table id="js-table" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th width="30%">大床房</th>
                                        <th width="30%">标准间</th>
                                        <th width="20%">套房</th>
                                        <th width="20%">总体</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>${rates.get(0)}%</td>
                                        <td>${rates.get(1)}%</td>
                                        <td>${rates.get(2)}%</td>
                                        <td>${rates.get(3)}%</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:when>
                </c:choose>
                <div style="margin-top: 2%;margin-bottom:2%;border:solid 0.5px #d6d6d6"></div>
                <div>
                    <h3 class="title">同地区酒店价格分布</h3>
                    <c:choose>
                        <c:when test="${type.equals('day')}">暂无数据</c:when>
                        <c:when test="${type.equals('month')||type.equals('week')}">
                            <div id="price_chart" style="margin-left:15%;width:500px;height:350px"></div>
                            <script type="text/javascript">
                                var myChart = echarts.init(document.getElementById("price_chart"));
                                function getVirtulData1() {
                                    var dates = ${dates};
                                    var data = [];
                                    for (var i = 0; i < 10; i++) {
                                        data.push([
                                            ${dates.get(0)},
                                            Math.floor(Math.random() * 50000) / 100.0
                                        ]);
                                        data.push([
                                            ${dates.get(1)},
                                            Math.floor(Math.random() * 50000) / 100.0
                                        ]);
                                        data.push([
                                            ${dates.get(2)},
                                            Math.floor(Math.random() * 50000) / 100.0
                                        ]);
                                        data.push([
                                            ${dates.get(3)},
                                            Math.floor(Math.random() * 50000) / 100.0
                                        ]);
                                        data.push([
                                            ${dates.get(4)},
                                            Math.floor(Math.random() * 50000) / 100.0
                                        ]);
                                        data.push([
                                            ${dates.get(5)},
                                            Math.floor(Math.random() * 50000) / 100.0
                                        ]);
                                        data.push([
                                            ${dates.get(6)},
                                            Math.floor(Math.random() * 50000) / 100.0
                                        ]);
                                    }
                                    return data;
                                }
                                function getVirtulData2() {
                                    var dates = ${dates};
                                    var data = [];
                                    for (var i = 0; i < 8; i++) {
                                        data.push([
                                            ${dates.get(0)},
                                            Math.floor(Math.random() * 80000) / 100.0
                                        ]);
                                        data.push([
                                            ${dates.get(1)},
                                            Math.floor(Math.random() * 80000) / 100.0
                                        ]);
                                        data.push([
                                            ${dates.get(3)},
                                            Math.floor(Math.random() * 80000) / 100.0
                                        ]);
                                        data.push([
                                            ${dates.get(5)},
                                            Math.floor(Math.random() * 80000) / 100.0
                                        ]);
                                        data.push([
                                            ${dates.get(6)},
                                            Math.floor(Math.random() * 80000) / 100.0
                                        ]);
                                    }
                                    return data;
                                }
                                function getVirtulData3() {
                                    var dates = ${dates};
                                    var data = [];
                                    for (var i = 0; i < 3; i++) {
                                        data.push([
                                            ${dates.get(0)},
                                            Math.floor(Math.random() * 100000) / 100.0
                                        ]);
                                        data.push([
                                            ${dates.get(2)},
                                            Math.floor(Math.random() * 100000) / 100.0
                                        ]);
                                        data.push([
                                            ${dates.get(3)},
                                            Math.floor(Math.random() * 100000) / 100.0
                                        ]);
                                        data.push([
                                            ${dates.get(4)},
                                            Math.floor(Math.random() * 100000) / 100.0
                                        ]);
                                        data.push([
                                            ${dates.get(6)},
                                            Math.floor(Math.random() * 100000) / 100.0
                                        ]);
                                    }
                                    return data;
                                }
                                option = {
                                    grid: {
                                        left: '3%',
                                        right: '7%',
                                        bottom: '3%',
                                        containLabel: true
                                    },
                                    tooltip: {
                                        // trigger: 'axis',
                                        showDelay: 0,
                                        formatter: function (params) {
                                            if (params.value.length > 1) {
                                                return params.seriesName + ' :<br/>'
                                                        + params.value[0] + ' '
                                                        + params.value[1] + '元 ';
                                            }
                                        },
                                        axisPointer: {
                                            show: true,
                                            type: 'cross',
                                            lineStyle: {
                                                type: 'dashed',
                                                width: 1
                                            }
                                        }
                                    },
                                    brush: {},
                                    legend: {
                                        data: ['大床房', '标准间', '套房'],
                                        left: 'center'
                                    },
                                    xAxis: [
                                        {
                                            type: 'category',
                                            data: ${dates},
                                            scale: true,
                                            splitLine: {
                                                show: false
                                            }
                                        }
                                    ],
                                    yAxis: [
                                        {
                                            type: 'value',
                                            scale: true,
                                            axisLabel: {
                                                formatter: '{value} 元'
                                            },
                                            splitLine: {
                                                show: false
                                            }
                                        }
                                    ],
                                    series: [
                                        {
                                            name: '大床房',
                                            type: 'scatter',
                                            data: getVirtulData1(),
                                            markArea: {
                                                silent: true,
                                                itemStyle: {
                                                    normal: {
                                                        color: 'transparent',
                                                        borderWidth: 1,
                                                        borderType: 'dashed'
                                                    }
                                                },
                                                data: [[{
                                                    name: '大床房分布区间',
                                                    yAxis: 'min'
                                                }, {
                                                    yAxis: 'max'
                                                }]]
                                            },
                                            markPoint: {
                                                data: [
                                                    {type: 'max', name: '最大值'},
                                                    {type: 'min', name: '最小值'}
                                                ]
                                            }
                                        },
                                        {
                                            name: '标准间',
                                            type: 'scatter',
                                            data: getVirtulData2(),
                                            markArea: {
                                                silent: true,
                                                itemStyle: {
                                                    normal: {
                                                        color: 'transparent',
                                                        borderWidth: 1,
                                                        borderType: 'dashed'
                                                    }
                                                },
                                                data: [[{
                                                    name: '标准间分布区间',
                                                    yAxis: 'min'
                                                }, {
                                                    yAxis: 'max'
                                                }]]
                                            },
                                            markPoint: {
                                                data: [
                                                    {type: 'max', name: '最大值'},
                                                    {type: 'min', name: '最小值'}
                                                ]
                                            }
                                        },
                                        {
                                            name: '套房',
                                            type: 'scatter',
                                            data: getVirtulData3(),
                                            markArea: {
                                                silent: true,
                                                itemStyle: {
                                                    normal: {
                                                        color: 'transparent',
                                                        borderWidth: 1,
                                                        borderType: 'dashed'
                                                    }
                                                },
                                                data: [[{
                                                    name: '套房分布区间',
                                                    yAxis: 'min'
                                                }, {
                                                    yAxis: 'max'
                                                }]]
                                            },
                                            markPoint: {
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
                        </c:when>
                    </c:choose>
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
            window.location.href = "/admin/statistics/market/find?type=" + type + "&date=" + date;
        }, 1000);
    }
</script>
</html>
