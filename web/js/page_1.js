function updataChart(zonename,target,offTarget){
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '当月微信群招募数---MTD维度'
        },
        tooltip: {},
        legend: {
            top: 'bottom',
            left: 'center',
            data: ['MTD规定进度', 'MTD未达标']
        },
        xAxis: {
            data: zonename
        },
        yAxis: {},
        series: [{
                name: 'MTD规定进度',
                type: 'bar',
                data: target,
                itemStyle: {
                    normal: {
                        color: function (params) {
                            return "#FF3F3A";
                        }
                    }
                }

            }, {
                name: 'MTD未达标',
                type: 'bar',
                data: offTarget,
                itemStyle: {
                    normal: {
                        color: function (params) {
                            return "#FFC33F";
                        }
                    }
                }
            }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
}

//更新第一页数据
function updatePage1(){
    var zonename=[];
    var target=[];
    var offTarget=[];

    getTemplate({}, "/api/ticketcustm/getdate","date","date_tpl");//获取日期数据
    getTemplate({}, "/api/ticketcustm/statistics","statistics","statistics_tpl");//获取统计数据
    $(".statistics_item").each(function(index,element){
        zonename.push($(this).find(".zonename").html().toString().trim());
        target.push(parseInt($(this).find(".target").html().trim()));
        offTarget.push(parseInt($(this).find(".off-target").html().trim()));
    });
    updataChart(zonename,target,offTarget);

}

updatePage1();//更新数据






