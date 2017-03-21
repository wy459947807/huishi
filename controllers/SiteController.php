<?php

namespace app\controllers;

use app\common\InstanceFactory;
use app\common\ValidateCode;
use Yii;
class SiteController extends CommonController implements CommonInterface{

    public function init(){
        parent::init();
        //注册服务
        $this->serviceList['TicketCustmService']=InstanceFactory::getInstance("app\service\TicketCustmService");//用户服务
        $this->serviceList['StatisticsService']=InstanceFactory::getInstance("app\service\StatisticsService");//用户服务 
    }
    
    
    public function actionIndex(){
        $dataInfo=array();
        return $this->render('index.tpl',$dataInfo);
    }
    

    
    //测试页面
    public function actionTest() {
        
        $testArray=array(
            "sign"=>"ed238f2a44410af26e5fec52e7c381e595d18d2d1",
        );
        $aaa= $this->serviceList['TicketCustmService']->getInfo($testArray);
        
        var_dump($aaa);
        exit;
        
        
        
        $map= Yii::$app->params['map'];
        $testArray=array(
            "address"=>"北京",
            "output"=>"json",
            "ak"=>$map['ak'],
        );
        $mapArray=$this->remoteRequest($map['url'],$testArray);  
        
        echo var_dump($mapArray);
        exit;
       
        echo Yii::$app->params['apiKey'];
        exit;
        
        $aaa1="token=&ticket=&brand=启赋1&buynum=1.00000&storecode=test001&storename=测试店面&zonename=华北区&regionname=北京&physicalcity=北京&custmtype=MT NKA&custmname=沃尔玛&signdate=2017-03-20 13:53:00&noncestr=37103648&timestamp=1489996092&key=666777";
        
        $aaa2="token=82154966&ticket=821549660237893052&brand=启赋1&buynum=1.00000&storecode=test001&storename=测试店面&zonename=华北区&regionname=北京&physicalcity=北京&custmtype=MT NKA&custmname=沃尔玛&signdate=2017-03-20 13:53:00&noncestr=82154966&timestamp=1489997207&key=666777";
        
        //"token=82154966&ticket=821549660237893052&brand=%e5%90%af%e8%b5%8b1&buynum=1.00000&storecode=test001&storename=%e6%b5%8b%e8%af%95%e5%ba%97%e9%9d%a2&zonename=%e5%8d%8e%e5%8c%97%e5%8c%ba&regionname=%e5%8c%97%e4%ba%ac&physicalcity=%e5%8c%97%e4%ba%ac&custmtype=MT%20NKA&custmname=%e6%b2%83%e5%b0%94%e7%8e%9b&signdate=2017-03-20%2013%3a53%3a00&noncestr=82154966&timestamp=1489997207&sign=ed238f2a44410af26e5fec52e7c381e595d18d2d"
        
        $test333= $this->getParams();
        

        echo var_dump($test333);
        echo sha1($aaa2);
        exit;
        
        
        $array=array(
            "ticket"=>"ticket",
            );
        
        echo $this->getSign($array);
        exit;
        
        
        
  
        if($params['sign']!=$sign){
            echo "error";
        }
        var_dump($sign);
        exit;
        
        
        
        $url = Yii::$app->params['host']['localhost'];
        $url.="/api/ticketcustm/getdate";
        $test=$this->remoteRequest($url,array());
        
        var_dump($test);
        exit;
        
        $dataInfo=array();
        return $this->render('test.tpl',$dataInfo);
    }

    //错误页面
    public function actionError(){
        //return $this->render('error.tpl',array());
    }

    //验证码
    public function actionCaptcha(){
        $ValidateCode = new ValidateCode();  //实例化一个对象
        $ValidateCode->doimg(); 
        Yii::$app->session['ValidateCode']=$ValidateCode->getCode();
    }

    //获取参数规则
    public function getRulesArray($ruleIndex){
        $result['index']=array(   
           
        );
        
        return $result[$ruleIndex];
    }
   
}
