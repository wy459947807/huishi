<?php

namespace app\controllers\api;

use app\common\InstanceFactory;
use app\controllers\CommonController;
use app\controllers\CommonInterface;

class TicketcustmController extends CommonController implements CommonInterface {

    public function init() {
        parent::init();
        //注册服务
        $this->serviceList['TicketCustmService']=InstanceFactory::getInstance("app\service\TicketCustmService");//用户服务
        $this->serviceList['StatisticsService']=InstanceFactory::getInstance("app\service\StatisticsService");//用户服务 
    }

    public function actionIndex() {
        return;
    }
    
    public function actionAdd(){
        $params=$this->getValidateParams('add');
        if($params['status']!=200){
            $resultArray['success']='0';
            $resultArray['data']=$params['info'];
            return $this->asJson($resultArray);
        }
        
        //校验sign值
        $sign =  $this->getSign($params['data']);//获取标识
        if($params['data']['sign']!=$sign){
            $resultArray['success']='0';
            $resultArray['data']="sign校验失败！";
            return $this->asJson($resultArray);
        }
        
        //验证sign是否重复
        $dataInfo=$this->serviceList['TicketCustmService']->getInfo(array("sign"=>$params['data']['sign']));
        if(!empty($dataInfo['data'])){
            $resultArray['success']='0';
            $resultArray['data']="请不要重复提交！";
            return $this->asJson($resultArray);
        }
        
        
        if(empty($params['data']['physicalcity'])){
            $params['data']['physicalcity']="北京市";
        }
        
        $mapInfo=$this->getMapInfo($params['data']['physicalcity']);
        $params['data']['lng']=$mapInfo["result"]["location"]["lng"];
        $params['data']['lat']=$mapInfo["result"]["location"]["lat"];
        
        $this->result = $this->serviceList['TicketCustmService']->update($params['data']);
        if($this->result['status']!=200){
            $resultArray['success']='0';
            $resultArray['data']="提交失败";
            return $this->asJson($resultArray);
        }
        return $this->asJson(array("success"=>"1","msg"=>"ok"));
    }
    
    //获取前十条数据
    public function actionToplist(){
        $dataInfo = $this->serviceList['TicketCustmService']->getTop(10);
        foreach($dataInfo['data'] as $key=>$val){
            $dataInfo['data'][$key]['signdate']=date("Y-m-d",strtotime($val['signdate']));
        }
        $this->result=$dataInfo;
        return $this->asJson($this->result);
    }
    
    public function actionStatistics(){
        $params['data']=date("Y-m");//获取本月数据统计
        $this->result=$this->serviceList['StatisticsService']->getStatistics($params);
        return $this->asJson($this->result);
    }
    
    public function actionGetdate(){
        $dataInfo['month']=date("Y年m月");
        $dataInfo['date']=date("d");
        $this->result['data']=$dataInfo;
        return $this->asJson($this->result);
    }

    //获取参数规则
    public function getRulesArray($ruleIndex) {

        $result['add'] = array(
            
            array('sign', 'required', 'message' => 'sign字段必须.'),
        );
        return $result[$ruleIndex];
    }

}
