<script type="text/html" id="top_list">
    {{each data as val key}}
        {{if key==0}}
        <tr class="gao cy">
        {{else}}
        <tr class="gao">
        {{/if}}
            <td width="60"  align="center">{{val.signdate}}</td>
            <td width="60"  align="center">{{val.zonename}}</td>
            <td width="60"  align="center" class="city" data-city="{{val.physicalcity}}" data-lng="{{val.lng}}" data-lat="{{val.lat}}">
                {{val.physicalcity}}
            </td>
            <td width="60"  align="center">{{val.custmname}}</td>
            <td width="150" align="center">完成{{val.brand}}类型课程</td>
        </tr>
    {{/each}}
</script>
        
  
