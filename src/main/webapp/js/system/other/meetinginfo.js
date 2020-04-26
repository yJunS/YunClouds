$(function () {
    $.getJSON('/other/find.shtml?callback=?', function (data) {

        // Create the chart
        $('#container').highcharts('StockChart', {


            rangeSelector : {
                selected : 0
            },

            title : {
                text : '云视频会议使用统计'
            },
            tooltip:{
                shared:true,
                crosshairs:true,
                dateTimeLabelFormats:{
                    hour:"%A %Y-%m-%e %H:%M",
                    day:"%m-%e",
                    month:"%Y-%m",
                },
            },
            series : [{
                name : '参会方共计',
                data : data,
                type : 'areaspline',
                threshold : null,
                tooltip : {
                    valueDecimals : 0
                },
                fillColor : {
                    linearGradient : {
                        x1: 0,
                        y1: 0,
                        x2: 0,
                        y2: 1
                    },
                    stops : [
                        [0, Highcharts.getOptions().colors[0]],
                        [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                    ]
                }
            }]
        });
    });
});