
function updatePage3(){
    getTemplate({}, "/api/ticketcustm/statistics","page3","page3_tpl");//获取统计数据
    getTemplate({}, "/api/ticketcustm/getdate","page3_date","page3_date_tpl");//获取日期数据
    bindEvent();
}

function bindEvent(){
    $("#content div").hide(); // Initially hide all content
    $("#tab1 div").show();
    $("#tabs li:first").attr("id", "current"); // Activate first tab
    $("#content div:first").fadeIn(); // Show first tab content

    $('#tabs a').click(function (e) {
        e.preventDefault();
        $("#content div").hide(); //Hide all content
        $("#tabs li").attr("id", ""); //Reset id's
        $(this).parent().attr("id", "current"); // Activate this
        $('#' + $(this).attr('title')).fadeIn(); // Show content for current tab
        $("#" + $(this)[0].title + " div").show();
    });
}

updatePage3();