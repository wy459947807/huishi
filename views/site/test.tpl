<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jquery文本向上滚动代码带上下翻转按钮的jQuery插件-懒人建站</title>
<meta name="keywords" content="jquery特效,JS代码,js特效代码大全,js特效广告代码,导航菜单代码" />
<meta name="description" content="懒人建站为您提供-JS代码，js特效代码大全，js特效广告代码，下拉菜单，下拉菜单代码，导航菜单代码和基于jquery的各种特效与jquery插件。" />
<style type="text/css">
body{ color:#333; font-size:13px;}
h3,ul,li{margin:0;padding:0; list-style:none;}
.scrollbox{width:400px; padding:10px;border:#ccc 1px solid;}
#scrollDiv{width:400px;height:180px; overflow:hidden;}/*这里的高度和超出隐藏是必须的*/
#scrollDiv li{height:25px;line-height:25px; vertical-align:bottom; zoom:1; border-bottom:#CCC dashed 1px;}
#scrollDiv li a{ color:#333; text-decoration:none;}
#scrollDiv li a:hover{ color:#FF0000; text-decoration:underline;}

.scroltit{ height:26px; line-height:26px; border-bottom:#CCC dashed 1px; padding-bottom:4px; margin-bottom:4px;}
.scroltit h3{ width:100px; float:left;}
.scroltit small{float:right; font-size:13px;}
</style>
<script src="/lib/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
<script src="/js/jq_scroll.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
        $("#scrollDiv").Scroll({line:1,speed:500,timer:3000,up:"but_up",down:"but_down"});
});
</script>
</head>

<body>
<h1>基于jquery文本向上滚动代码带上下翻转按钮的jQuery插件</h1>
<div class="scrollbox">
	<div class="scroltit"><h3><a href="#">Jquery 特效</a></h3><small id="but_up">↑向上</small><small id="but_down">↓向下</small></div>
    <div id="scrollDiv">
        <ul>
            <li>[<a href='http://www.51xuediannao.com/js/texiao/'>网页特效</a>] <a href="http://www.51xuediannao.com/js/texiao/642.html" title="为网站增加圣诞节祝福动画百度的圣诞老人动画" class="linktit">为网站增加圣诞节祝福动画百度的圣诞老人动画</a></li>
            <li>[<a href='http://www.51xuediannao.com/yumenba/'>郁闷吧</a>] <a href="http://www.51xuediannao.com/yumenba/606.html" title="2011最简单最给力的兼职网赚项目" class="linktit">2011最简单最给力的兼职网赚项目</a></li>
            <li>[<a href='http://www.51xuediannao.com/yumenba/'>郁闷吧</a>] <a href="http://www.51xuediannao.com/yumenba/yuwangmen_heti.html" title="90后富家二小姐渔网妹欲造合体门(多图)" class="linktit">90后富家二小姐渔网妹欲造合体门(多图)</a></li>
            <li>[<a href='http://www.51xuediannao.com/yumenba/'>郁闷吧</a>] <a href="http://www.51xuediannao.com/yumenba/google.html" title="关于谷歌中国的最新声明(来自谷歌)" class="linktit">关于谷歌中国的最新声明(来自谷歌)</a></li>
            <li>[<a href='http://www.51xuediannao.com/jiqiao/'>建站技巧</a>] <a href="http://www.51xuediannao.com/jiqiao/chuangyi.html" title="设计创意究竟是怎么练出来的？" class="linktit">设计创意究竟是怎么练出来的？</a></li>
            <li>[<a href='http://www.51xuediannao.com/weike/'>威客网排行榜</a>] <a href="http://www.51xuediannao.com/weike/weike_daxuesheng.html" title="大三学生做威客一边学习一边赚生活费" class="linktit">大三学生做威客一边学习一边赚生活费</a></li>
            <li>[<a href='http://www.51xuediannao.com/js/texiao/'>网页特效</a>] <a href="http://www.51xuediannao.com/js/texiao/js-riqi.html" title="日期时间带星期农历js代码特效" class="linktit">日期时间带星期农历js代码特效</a></li>
            <li>[<a href='http://www.51xuediannao.com/html+css/htmlcssjq/'>html+css技巧</a>] <a href="http://www.51xuediannao.com/html+css/htmlcssjq/IE6 min.html" title="IE6最小高度最小宽度最大高度最大宽度css写法" class="linktit">IE6最小高度最小宽度最大高度最大宽度css写法</a></li>
        </ul>
    </div>
</div>

<p>基于jquery文本向上滚动代码带上下翻转按钮的jQuery插件，这个jquery文本向上滚动代码可自动滚动，也可以以点击向上向下按钮进行滚动。</p>
<p>这里的演示样式简单的写了一个框架，vertical-align:bottom; zoom:1; 这东西是用来解决IE6下li的bug的，你再制作NX的样式时，最好参考使用一下。</p>
<p>特别说明：当前页面js代码中的 line:1 是配置一次滚动几行的</p>


<!--下面只是说明与程序代码无关-->
<div style="width:95%; height:auto; display:block; margin:0 auto; margin-top:30px; font-size:10pt; line-height:150%;">
<span>本代码由<a href="http://www.51xuediannao.com/" style="color:#F00;">懒人建站</a>网 收集整理 我要学电脑.COM →51xuediannao.com</span><br>

<a href="http://www.51xuediannao.com/">懒人建站 http://www.51xuediannao.com/</a><br /><br/>
<span>我们为您提供-
<a href="http://www.51xuediannao.com/html+css/">HTML+CSS模板</a>，
<a href="http://www.51xuediannao.com/js/">Jquery 特效</a>，
<a href="http://www.51xuediannao.com/js/">JS代码</a>，
<a href="http://www.51xuediannao.com/js/texiao/">网页特效</a>，

<a href="http://www.51xuediannao.com/js/nav/">导航菜单</a>，
<a href="http://www.51xuediannao.com/js/Slide/">焦点幻灯片<a>，
<a href="http://www.51xuediannao.com/js/jiqiao/css/">CSS技巧</a>；</span><br />

<span>懒人建站只收录实用和能提高用户体验的代码</span><br />
<span>我们只想解放出你的部分写代码时间来思考更高层次的设计，而不是要你懒惰、拼凑。</span>
</div>
</body>
</html>
