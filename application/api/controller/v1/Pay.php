<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-23
 * Time: 15:53
 */

namespace app\api\controller\v1;


use app\api\Controller\BaseController;
use app\api\service\Pay as PayService;
use app\api\service\WxNotify;
use app\api\validate\IDMustBePostiveInt;

class Pay extends BaseController
{
    //权限控制
    protected $beforeActionList = [

        'checkExclusiveScope' => ['only'=>'getPreOrder']
    ];


    public function getPreOrder($id='')
    {
        //验证要求传进来的ID是正整数
        (new IDMustBePostiveInt())->goCheck();
            $pay = new PayService($id);
           return $pay->pay();
    }

    public function receiveNotify()
    {
        //1.检查库存量，是否超卖
        //2.更新这个订单支付状态
        //3.支付完减库存
        //4.回调下单和支付结果
        $notify = new WxNotify();
        $notify->Handle();
    }

}