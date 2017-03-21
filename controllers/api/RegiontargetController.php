<?php

namespace app\controllers\api;

use app\common\InstanceFactory;
use app\controllers\CommonController;
use app\controllers\CommonInterface;

class RegiontargetController extends CommonController implements CommonInterface {

    public function init() {
        parent::init();
        //注册服务
        $this->serviceList['RegionTargetService']=InstanceFactory::getInstance("app\service\RegionTargetService");
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
            $resultArray['data']="sign校验失败！";;
            return $this->asJson($resultArray);
        }
        
        //验证sign是否重复
        $dataInfo=$this->serviceList['RegionTargetService']->getInfo(array("sign"=>$params['data']['sign']));
        if(!empty($dataInfo['data'])){
            $resultArray['success']='0';
            $resultArray['data']="请不要重复提交！";
            return $this->asJson($resultArray);
        }

        $this->result = $this->serviceList['RegionTargetService']->update($params['data']);
        if($this->result['status']!=200){
            $resultArray['success']='0';
            $resultArray['data']="提交失败";
            return $this->asJson($resultArray);
        }
        return $this->asJson(array("success"=>"1","msg"=>"ok"));
    }
    
    

    //获取参数规则
    public function getRulesArray($ruleIndex) {

        $result['add'] = array(
           
            array('sign', 'required', 'message' => 'sign字段必须.'),
        );
        return $result[$ruleIndex];
    }

}
