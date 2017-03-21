<div class="new-mtd">
    <div class="new-top">
        <div class="topword">当月微信群招募数---MTD维度</div>
    </div>
    <div class="new-line" id="statistics">
        <script type="text/html" id="statistics_tpl" >
        
        <ul class="line-list">
            <!--[{{i=1}}]-->
            <!--[{{color='hb'}}]-->
            {{each data as val key}}
            <li class="list{{i}} statistics_item">
                <p class="mtd" style="padding-top:60px">
                    <span class="{{color}} off-target" >{{val.off_target}}</span>MTD未达标
                </p>
                <p class="mtd line-h"></p>
                <p class="mtd"><span class="{{color}} target">{{val.target}}</span>MTD规定进度</p>
                <p class="mtd ear zonename">{{key}}</p>
                <!--[{{if i==1}}
                    {{i=2}}{{color='yellow'}}
                {{else}}
                    {{i=1}}{{color='hb'}}
                {{/if}}]-->
            </li>
            {{/each}}
        </ul>
        <div class="clear"></div>
        </script>
    </div>

    <div class="line-chart">
        <div id="main" style="width:100%;height: 300px"></div>
        <!--<img src="/images/line.jpg">-->
    </div>
    <div class="date" id="date">
        <script type="text/html" id="date_tpl">
            <div class="date-img">
                <p class="nian">{{data.month}}</p>
                <p class="hao">{{data.date}}</p>
            </div>
            <div class="clear"></div>
        </script>
    </div>
</div>


