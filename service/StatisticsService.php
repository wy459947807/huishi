<?php

namespace app\service;

use app\models\HsTicketCustm;
use app\models\HsRegionTarget;
use app\service\CommonService;
use Yii;
use yii\db\Exception;
class StatisticsService extends CommonService{
    
    //获取统计信息
    public function getStatistics($params){
        $this->sqlFrom=" hs_region_target as r
                        LEFT JOIN hs_ticket_custm as t ON t.regionname=r.regionname ";  
        $this->sqlField=" r.*,COUNT(t.`id`) as custm_number";       
        $this->sqlWhere=" (1=1) ";
        $this->sqlGroupby=" GROUP BY r.`regionname` ";
        $this->bindValues=array();
        $resultData = $this->getAll();
        $returnData=array();
        
        //搜索信息筛选
        if(!empty($params['data'])){
            $this->sqlWhere.=" AND DATE_FORMAT(r.target_month,'%Y-%m')=':target_month' "
                           . " AND DATE_FORMAT(t.signdate,'%Y-%m')=':target_month' ";
            $this->bindValues[':target_month'] = $params['data'];
        }
        
        //计算数据
        foreach($resultData['data'] as $key=>$val){
            if(!isset($returnData[$val['zonename']])){
                $returnData[$val['zonename']]=array();
                $returnData[$val['zonename']]['target']=0;
                $returnData[$val['zonename']]['off_target']=0;
                $returnData[$val['zonename']]['custm_number']=0;
                $returnData[$val['zonename']]['list']=array();
            }
            
            $val["off_target"]=0;//未达标数量
            $val["target_rate"]=100;//达标率
            if($val['target']>$val['custm_number']){
                $val["off_target"]=$val['target']-$val['custm_number'];
                $val["target_rate"]=(int)(($val['custm_number']/$val['target'])*100);
            }
    
            $returnData[$val['zonename']]['target']+=$val['target'];//区域指标
            $returnData[$val['zonename']]['custm_number']+=$val['custm_number'];//已达成数量
            $returnData[$val['zonename']]['off_target']+=$val['off_target'];//未达标数量
            $returnData[$val['zonename']]['list'][]=$val;
        }
        $resultData['data']=$returnData;
        return $resultData;
        
    }
    
    
    
   

    
}
