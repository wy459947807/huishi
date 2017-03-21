<div class="new-mtd" id='page3'>
    <script type="text/html" id="page3_tpl">
        <div class="new-top">
            <div class="topword">分区域当月新学员进度---MTD维度</div>
        </div>
        <ul id="tabs">
            <!--[{{i=1}}]-->
            {{each data as val key}}
            <li> <a href="#" title="tab{{i}}">
                    <p class="po shu">{{val.target}}</p>
                    <p class="po lib"></p>
                    <p class="po zhi">{{key}}指标</p>
                </a>
            </li>
            <!--[{{i=i+1}}]-->
            {{/each}}

            <li>
                <div class="date-hu" style=" height: 100px;" id='page3_date'>

                </div>
            </li>
        </ul>
        <div id="content">


            <!--[{{i=1}}]-->
            {{each data as val key}}
            <div id="tab{{i}}">
                <table cellpadding="0" cellspacing="0" width="1000">
                    <thead>
                        <tr>
                            <td align="center" width="200">区域名</td>
                            <td align="center" width="200">MTD达成</td>
                            <td align="center" width="200">MTD目标</td>
                            <td align="center" width="500">达成率</td>
                        </tr>
                    </thead>
                    <tbody>

                        {{each val.list as v k}}
                        {{if v.target_rate<80}}
                        <tr>
                            <td width="200" align="center"><span>{{v.regionname}}</span></td>
                            <td width="200" align="center"><span  class="cen">{{v.custm_number}}</span></td>
                            <td width="200" align="center"><span>{{v.target}}</span></td>
                            <td width="500" align="center"><div class="zong" style=" float:left;">
                                <div class="progress" style=" float:left; width:400px;">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="display:block !important;width: {{v.target_rate}}%;"></div>
                                </div>
                                <div style="float:left; margin-left:15px;"><span class="sr-only">{{v.target_rate}}%</span></div>
                            </td>
                        </tr>
                        {{else}}
                        <tr>
                            <td width="200" align="center"><span>{{v.regionname}}</span></td>
                            <td width="200" align="center"><span class="cen" id="one">{{v.custm_number}}</span></td>
                            <td width="200" align="center"><span>{{v.target}}</span></td>
                            <td width="500" align="center"><div class="zong" style="display:block !important; float:left;">
                                <div class="progress" style="display:block !important; float:left; width:400px;">
                                    <div class="progress-bar" id="one2" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="display:block !important;width: {{v.target_rate}}%;"></div>
                                </div>
                                <div style="display:block !important; float:left; margin-left:15px;"><span class="sr-only">{{v.target_rate}}%</span></div>
                            </td>
                        </tr>
                        {{/if}}
                        {{/each}}
                    </tbody>
                </table>
            </div>
            <!--[{{i=i+1}}]-->
            {{/each}}






        </div>
    </script>

</div>

<script type="text/html" id="page3_date_tpl">
    <p class="nian">{{data.month}}</p>
    <p class="hao2" style=" margin-top: 7px">{{data.date}}</p>
</script>
