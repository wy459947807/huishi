<script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/lib/jquery.form/jquery.form.min.js"></script>
<script type="text/javascript" src="/lib/jquery/1.9.1/jquery.metadata.js"></script>
<script type="text/javascript" src="/lib/jquery.validation/1.9.0/jquery.validate.min.js"></script>
<script type="text/javascript" src="/lib/jquery.validation/1.9.0/validate-methods.js"></script>
<script type="text/javascript" src="/lib/jquery.validation/1.9.0/messages_zh.js"></script>
<script type="text/javascript" src="/lib/artTemplate/artTemplate.js"></script>
<script type="text/javascript" src="/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="/lib/public/common.js"></script> 
<script type="text/javascript" src="/lib/public/commonp.plug.js"></script> 

<script src="/lib/bootstrap/bootstrap.min.js"></script>
<script src="/lib/power-point/impress.js"></script>
<script src="/lib/echarts/3.4.0/echarts.min.js"></script>
<script src="/lib/echarts/3.4.0/china.js"></script>

<script src="/js/page_1.js"></script>
<script src="/js/page_2.js"></script>
<script src="/js/page_3.js"></script>

<script>
    impress().init();

    setInterval(loopUpdata,10000);//循环更新
    function loopUpdata(){
        impress().next();
        updatePage1();
        updatePage2();
        updatePage3();
    }

</script>