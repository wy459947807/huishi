
//初始化数据
var mapChart = echarts.init(document.getElementById('mapChart'));
getTemplate({}, "/api/ticketcustm/toplist","topList","top_list");//更新新学员数据
var city='北京';
var position={city:'北京',location:[116.4551, 40.2539]}
var cityData = $("#scrollDiv").find(".city:first").attr("data-city");
var lngData  = $("#scrollDiv").find(".city:first").attr("data-lng");
var latData  = $("#scrollDiv").find(".city:first").attr("data-lat");
if(cityData){
   position['city']=cityData;
   position['location']=[lngData,latData];
}
var BJData = [[{name: '北京'}, {name:position['city'], value: 100}]];
var series = {
    name: '北京 Top10',
    type: 'effectScatter',
    coordinateSystem: 'geo',
    zlevel: 2,
    rippleEffect: {
        brushType: 'stroke'
    },
    label: {
        normal: {
            show: true,
            position: 'top',
            formatter: '{b}',
            textStyle: {
                fontSize: 20,
                color: "#000000",
            }
        }
    },
    symbolSize: 15,
    itemStyle: {
        normal: {
            color: "#FFDF33",
        }
    },
    data: BJData.map(function (dataItem) {
        return {
            name: position['city'],
            value: position['location'],
        };
    })
};

mapOption = {
    geo: {
        map: 'china',
        label: {
            emphasis: {
                show: false
            }
        },
        roam: true,
        itemStyle: {
            normal: {
                areaColor: '#FF625D',
                borderColor: '#ffffff',
            },
            emphasis: {
                areaColor: '#eeeeee'
            }
        }
    },
    series: series
};

mapChart.setOption(mapOption);//初始化地图

//设置地图城市
function setMap(val,lng,lat) {
    position['city']=val;
    position['location']=[lng,lat];

    mapChart.setOption({
        series: [{
                name: '北京 Top10',
                type: 'effectScatter',
                coordinateSystem: 'geo',
                zlevel: 2,
                rippleEffect: {
                    brushType: 'stroke'
                },
                label: {
                    normal: {
                        show: true,
                        position: 'top',
                        formatter: '{b}',
                        textStyle: {
                            fontSize: 20,
                            color: "#000000",
                        }
                    }
                },
                symbolSize: 15,
                itemStyle: {
                    normal: {
                        color: "#FFDF33",
                    }
                },
                data: BJData.map(function (dataItem) {
                    return {
                        name: position['city'],
                        value: position['location'],
                    };
                })
            }]
    });
}


//文字滚动效果
(function ($) {
    $.fn.extend({
        Scroll: function (opt, callback) {
            //参数初始化
            if (!opt)
                var opt = {};
            var _btnUp = $("#" + opt.up);//Shawphy:向上按钮
            var _btnDown = $("#" + opt.down);//Shawphy:向下按钮
            var timerID;
            var _this = this.eq(0).find("table:first");
            var lineH = _this.find("tr:first").height(), //获取行高
                line = opt.line ? parseInt(opt.line, 10) : parseInt(this.height() / lineH, 10), //每次滚动的行数，默认为一屏，即父容器高度
                speed = opt.speed ? parseInt(opt.speed, 10) : 500; //卷动速度，数值越大，速度越慢（毫秒）
                timer = opt.timer //?parseInt(opt.timer,10):3000; //滚动的时间间隔（毫秒）
            if (line == 0)
                line = 1;
            var upHeight = 0 - line * lineH;
            //滚动函数
            var scrollUp = function () {
                _btnUp.unbind("click", scrollUp); //Shawphy:取消向上按钮的函数绑定
                _this.animate({
                    marginTop: upHeight
                }, speed, function () {
                    for (i = 1; i <= line; i++) {
                        _this.find("tr:first").appendTo(_this);
                        _this.find(".cy").removeClass('cy');
                        _this.find("tr:first").addClass('cy');
                        var city = _this.find(".city:first").attr("data-city");
                        var lng  = _this.find(".city:first").attr("data-lng");
                        var lat  = _this.find(".city:first").attr("data-lat");
                        setMap(city,lng,lat);
                    }
                    _this.css({marginTop: 0});
                    _btnUp.bind("click", scrollUp); //Shawphy:绑定向上按钮的点击事件
                });

            }
            //Shawphy:向下翻页函数
            var scrollDown = function () {
                _btnDown.unbind("click", scrollDown);
                for (i = 1; i <= line; i++) {
                    _this.find("tr:last").show().prependTo(_this);
                }
                _this.css({marginTop: upHeight});
                _this.animate({
                    marginTop: 0
                }, speed, function () {
                    _btnDown.bind("click", scrollDown);
                });
            }
            //Shawphy:自动播放
            var autoPlay = function () {
                if (timer)
                    timerID = window.setInterval(scrollUp, timer);
            };
            var autoStop = function () {
                if (timer)
                    window.clearInterval(timerID);
            };
            //鼠标事件绑定
            _this.hover(autoStop, autoPlay).mouseout();
            _btnUp.css("cursor", "pointer").click(scrollUp).hover(autoStop, autoPlay);//Shawphy:向上向下鼠标事件绑定
            _btnDown.css("cursor", "pointer").click(scrollDown).hover(autoStop, autoPlay);

        }
    })
})(jQuery);


$(document).ready(function () {
    $("#scrollDiv").Scroll({line: 1, speed: 500, timer: 2000, up: "but_up", down: "but_down"});
});

//更新第二页数据
function updatePage2(){
    getTemplate({}, "/api/ticketcustm/toplist","topList","top_list");
}







