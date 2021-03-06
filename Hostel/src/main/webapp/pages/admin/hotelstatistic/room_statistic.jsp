<%--
  Created by IntelliJ IDEA.
  User: CLL
  Date: 18/5/18
  Time: 下午9:21
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
            <div style="display: flex;width: 500px;height:30px;margin-left: 10%;margin-bottom: 5%">
                <div class="normal-div" style="flex: 2">查询范围
                    <select id="range" class="select">
                        <option value="day">当天</option>
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
            <h3 class="title" style="margin-bottom: 5%">本期平均入住率 ${average}%</h3>
            <c:choose>
                <c:when test="${type.equals('month')||type.equals('week')}">
                    <div style="display: flex;width:600px;height:200px;margin-left: 5%">
                        <div id="occupy_rate_1" style="width:200px;height:200px;flex: 1"></div>
                        <script type="text/javascript">
                            var myChart = echarts.init(document.getElementById("occupy_rate_1"));
                            option = {
                                title: {
                                    text: "大床房"
                                },
                                tooltip: {
                                    trigger: 'item',
                                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                                },
                                series: [
                                    {
                                        name: '入住率',
                                        type: 'pie',
                                        radius: '50%',
                                        center: ['10%', '50%'],
                                        label: {
                                            normal: {
                                                position: 'inner'
                                            }
                                        },
                                        data: [
                                            {value: ${occupys.get(0)}, name: '入住'},
                                            {value: ${noOccupys.get(0)}, name: '未入住'}
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
                        <div id="occupy_rate_2" style="width:200px;height:200px;flex: 1"></div>
                        <script type="text/javascript">
                            var myChart = echarts.init(document.getElementById("occupy_rate_2"));
                            option = {
                                title: {
                                    text: "标准间"
                                },

                                tooltip: {
                                    trigger: 'item',
                                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                                },
                                series: [
                                    {
                                        name: '入住率',
                                        type: 'pie',
                                        radius: '50%',
                                        center: ['20%', '50%'],
                                        label: {
                                            normal: {
                                                position: 'inner'
                                            }
                                        },
                                        data: [
                                            {value: ${occupys.get(1)}, name: '入住'},
                                            {value: ${noOccupys.get(1)}, name: '未入住'}
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
                        <div id="occupy_rate_3" style="width:200px;height:200px;flex: 1"></div>
                        <script type="text/javascript">
                            var myChart = echarts.init(document.getElementById("occupy_rate_3"));
                            option = {
                                title: {
                                    text: "套房"
                                },
                                tooltip: {
                                    trigger: 'item',
                                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                                },
                                series: [
                                    {
                                        name: '入住率',
                                        type: 'pie',
                                        radius: '50%',
                                        center: ['30%', '50%'],
                                        label: {
                                            normal: {
                                                position: 'inner'
                                            }
                                        },
                                        data: [
                                            {value:${occupys.get(2)}, name: '入住'},
                                            {value:${noOccupys.get(2)}, name: '未入住'}
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
                </c:when>
                <c:when test="${type.equals('day')}">
                    <div id="day_room_chart" style="width: 600px">
                        <label class="normal-input-label">本日房源</label>
                        <c:choose>
                            <c:when test="${list.size() == 0}">
                                <h4>今日无房源</h4>
                            </c:when>
                            <c:when test="${list.size() > 0}">
                                <div class="table-container">
                                    <table id="js-table" class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th width="30%">房型</th>
                                            <th width="15%">剩余数量</th>
                                            <th width="15%">预定人数</th>
                                            <th width="20%">预定入住</th>
                                            <th width="20%">非预定入住</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${list}" var="item">
                                            <tr>
                                                <td>${item.type}</td>
                                                <td>${item.available}</td>
                                                <td>${item.bookTotal}</td>
                                                <td>${item.bookCheckin}</td>
                                                <td>${item.nonBookCheckin}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:when>
                        </c:choose>
                    </div>
                </c:when>
            </c:choose>
            <div style="margin-top: 2%;margin-bottom:2%;border:solid 0.5px #d6d6d6"></div>
            <c:choose>
                <c:when test="${type.equals('month')||type.equals('week')}">
                    <div>
                        <h3 class="title">入住率变化趋势</h3>
                        <c:choose>
                            <c:when test="${type.equals('month')}">
                                <div id="change_chart_month" style="margin-left:15%;width:500px;height:350px"></div>
                                <script type="text/javascript">
                                    var myChart = echarts.init(document.getElementById("change_chart_month"));
                                    option = {
                                        title: {
                                            text: '入住率',
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
                                            name: '入住率',
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
                                <div id="change_chart_week" style="margin-left:15%;width:500px;height:350px"></div>
                                <script type="text/javascript">
                                    var myChart = echarts.init(document.getElementById("change_chart_week"));
                                    option = {
                                        title: {
                                            text: '入住率',
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
                                            name: '入住率',
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
                        </c:choose>
                    </div>
                </c:when>
            </c:choose>
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
            window.location.href = "/admin/statistics/room/find?type=" + type + "&date=" + date;
        }, 1000);
    }
</script>
</html>
