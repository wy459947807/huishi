<?php

namespace app\service;

use app\models\HsTicketCustm;
use app\service\CommonService;
use Yii;
use yii\db\Exception;
class TicketCustmService extends CommonService{
    
    //更新
    public function update($params){
        //添加菜单操作
        $tr = Yii::$app->db->beginTransaction();//事务开始
        try {
            if(empty($params['id'])){
                $module=new HsTicketCustm();
            }else{
                $module= HsTicketCustm::findOne($params['id']);
            }
            
            
            if(!empty($params["ticket"]))           $module->ticket=            (string)$params["ticket"];
            if(!empty($params["brand"]))            $module->brand=             (string)$params["brand"];
            if(!empty($params["buynum"]))           $module->buynum=            (int)$params["buynum"];
            if(!empty($params["storecode"]))        $module->storecode=         (string)$params["storecode"];
            if(!empty($params["storename"]))        $module->storename=         (string)$params["storename"];
            if(!empty($params["zonename"]))         $module->zonename=          (string)$params["zonename"];
            if(!empty($params["regionname"]))       $module->regionname=        (string)$params["regionname"];
            if(!empty($params["physicalcity"]))     $module->physicalcity=      (string)$params["physicalcity"];
            if(!empty($params["custmtype"]))        $module->custmtype=         (string)$params["custmtype"];
            if(!empty($params["custmname"]))        $module->custmname=         (string)$params["custmname"];
            if(!empty($params["signdate"]))         $module->signdate=          $params["signdate"];
            if(!empty($params["lng"]))              $module->lng=               (string)$params["lng"];
            if(!empty($params["lat"]))              $module->lat=               (string)$params["lat"];
            if(!empty($params["sign"]))             $module->sign=              (string)$params["sign"];
            
        
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

            $retInfo=HsTicketCustm::deleteAll(["in",'id',$params['id']]); 
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
        $this->sqlFrom=" hs_ticket_custm ";        
        $this->sqlField=" * ";       
        $this->sqlWhere=" (1=1) ";
        $this->bindValues=array();
        
        if(!empty($params['page'])) $this->page = $params['page'];
        if(!empty($params['pageLimit'])) $this->pageLimit = $params['pageLimit'];
       
        //搜索信息筛选
        if(!empty($params['custmname'])){
            $this->sqlWhere.=" and custmname like '%:custmname%'   ";
            $this->bindValues[':custmname'] = $params['custmname'];
        }

        return $this->getPageList();
    }
    
    
    public function getTop($limit=10){
        $this->sqlFrom=" hs_ticket_custm ";        
        $this->sqlField=" * ";       
        $this->sqlWhere=" (1=1) ";
        $this->sqlLimit=" limit {$limit} ";
        $this->sqlOrder=" order by id desc ";
        return $this->getAll();
    }
    
    public function getInfo($params) {
        $this->sqlFrom=" hs_ticket_custm ";        
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
