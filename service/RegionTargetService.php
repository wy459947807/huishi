<?php

namespace app\service;

use app\models\HsRegionTarget;
use app\service\CommonService;
use Yii;
use yii\db\Exception;
class RegionTargetService extends CommonService{
    
    //更新
    public function update($params){
        //添加菜单操作
        $tr = Yii::$app->db->beginTransaction();//事务开始
        try {
            if(empty($params['id'])){
                $module=new HsRegionTarget();
            }else{
                $module= HsRegionTarget::findOne($params['id']);
            }
            
            if(!empty($params["regionname"]))           $module->regionname=        (string)$params["regionname"];
            if(!empty($params["zonename"]))             $module->zonename=          (string)$params["zonename"];
            if(!empty($params["target"]))               $module->target=            (int)$params["target"];
            if(!empty($params["target_month"]))         $module->target_month=      (string)$params["target_month"];
            if(!empty($params["sign"]))                 $module->sign=              (string)$params["sign"];
            
            if($module->save()){
                $this->result['status']=200;
                $this->result['info']="更新成功！";
            }else{
                $this->result['status']=500;
                $this->result['info']="更新失败！";
            }
            $tr->commit();//事务提交
        } catch (Exception $e) {
            $tr->rollBack();//事务回滚
        }
        return $this->result;
    }
    
    //删除
    public function delete($params){
        //删除菜单操作
        $tr = Yii::$app->db->beginTransaction();//事务开始
        try {

            $retInfo=HsRegionTarget::deleteAll(["in",'id',$params['id']]); 
            if($retInfo){
                $this->result['status']=200;
                $this->result['info']="删除成功！";
            }else{
                $this->result['status']=500;
                $this->result['info']="删除失败！";
            }
            $tr->commit();//事务提交
        } catch (Exception $e) {
            $tr->rollBack();//事务回滚
        }
        
        return $this->result;
    }
    
    //列表
    public function pageList($params){
        $this->sqlFrom=" hs_region_target ";        
        $this->sqlField=" * ";       
        $this->sqlWhere=" (1=1) ";
        $this->bindValues=array();
        
        if(!empty($params['page'])) $this->page = $params['page'];
        if(!empty($params['pageLimit'])) $this->pageLimit = $params['pageLimit'];
       
        //搜索信息筛选
        if(!empty($params['regionname'])){
            $this->sqlWhere.=" and regionname like '%:regionname%'   ";
            $this->bindValues[':regionname'] = $params['regionname'];
        }

        return $this->getPageList();
    }
    
    
    public function getInfo($params) {
        $this->sqlFrom=" hs_region_target ";        
        $this->sqlField=" * ";       
        $this->sqlWhere=" (1=1) ";
        
        //搜索信息筛选
        if(!empty($params['sign'])){
            $this->sqlWhere.=" and sign=:sign   ";
            $this->bindValues[':sign'] = $params['sign'];
        }
        
        return $this->getOne();
    }
    

}
