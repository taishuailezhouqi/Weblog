<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- END META -->
    <script src="/js/jquery-1.11.3.min.js"></script>
    <script src="/js/echarts.min.js"></script>
    <script src="/js/china.js"></script>


</head>
<body>


<div id="main1" style="width: 100%; height: 400px;"></div>
<script type="text/javascript">
    $(document)
        .ready(
            function () {
                var myChart = echarts
                    .init(document
                        .getElementById('main1'));
                // 显示标题，图例和空的坐标轴
                myChart
                    .setOption({
                        title: {
                            text: '最近7天日平均PV量',
                            subtext: '动态数据'
                        },
                        tooltip: {},
                        legend: {
                            data: ['日平均PV量']
                        },
                        xAxis: {
                            data: []
                        },
                        yAxis: {},
                        series: [{
                            name: '日平均PV量',
                            type: 'bar',
                            data: []
                        }]
                    });
                //loading 动画
                myChart.showLoading();
                // 异步加载数据
                $.get('http://localhost:8083/avgPvNum').done(function (data) {
                    //填入数据
                    myChart.setOption({
                        xAxis: {
                            data: data.dates
                        },
                        series: [{
                            // 根据名字对应到相应的系列
                            name: 'PV量',
                            data: data.data
                        }]
                    });
                    //数据加载完成后再调用 hideLoading 方法隐藏加载动画
                    myChart.hideLoading();
                });
            });
</script>


</body>
</html>


