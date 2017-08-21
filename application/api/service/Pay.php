<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-23
 * Time: 16:16
 */

namespace app\api\service;


use app\api\model\Order as OrderModel;
use app\api\service\Order as OrderService;
use app\lib\exception\OrderException;
use app\lib\exception\TokenException;
use think\Exception;
use think\Loader;
use think\Log;

//extend/WxPay/WxPay.Api.php
Loader::import('WxPay.WxPay', EXTEND_PATH, '.Api.php');

class Pay
{
    private $orderID;
    private $orderNO;

    function __construct($orderID)
    {
        if (!$orderID) {
            throw new Exception('订单号不允许为NULL');
        }
        $this->orderID = $orderID;
    }

    public function pay()
    {
        //检测订单号是否存在
        //检测订单号与当前客户是否匹配
        //检测订单是否被支付过
        //进行库存量检测
        $this->checkOrderValid();
        $orderService = new OrderService();
        $status = $orderService->checkOrderStock($this->orderID);
        if (!$status['pass']) {
            return $status;
        }
         return $this->makeWxPreOrder($status['orderPrice']);
    }

    //向微信发送支付请求
    private function makeWxPreOrder($totalPrice)
    {
        //获取用户的openid拿到用户的订单信息
        $openid = Token::getCurrentTokenVar('openid');
        if (!$openid) {
            throw new TokenException();
        }
        $wxOrderData = new \WxPayUnifiedOrder();
        $wxOrderData->SetOut_trade_no($this->orderNO);//订单号
        $wxOrderData->SetTrade_type('JSAPI');//校验类型
        $wxOrderData->SetTotal_fee($totalPrice * 100);//总金额
        $wxOrderData->SetBody('商家名称');
        $wxOrderData->SetOpenid($openid);//openid
        $wxOrderData->SetNotify_url(config('secure.pay_back_url'));//接收微信支付回调结果
        return $this->getPaySignature($wxOrderData);
    }

    //调用微信接口
    private function getPaySignature($wxOrderDate)
    {
        $wxOrder = \WxPayApi::unifiedOrder($wxOrderDate);
        if ($wxOrder['return_code'] != 'SUCCESS' ||
            $wxOrder['return_code'] != 'SUCCESS')
        {
            Log::record($wxOrder,'error');
            Log::record('获取订单支付失败','error');
        }
        //prepay_id
            $this->recordPreOrder($wxOrder);
            $signature = $this->sign($wxOrder);
        return  $signature;
    }

    //微信支付签名方法
    private function sign($wxOrder)
    {
        $jsApiPayData = new \WxPayJsApiPay();
        $jsApiPayData->SetAppid(config('wx.app_id'));
        $jsApiPayData->SetTimeStamp((string)time());

        $rand = md5(time() . mt_rand(0,1000));
        $jsApiPayData->SetNonceStr($rand);

        $jsApiPayData->SetPackage('prepay_id='.$wxOrder['prepay_id']);
        $jsApiPayData->SetSignType('md5');

        $sign = $jsApiPayData->MakeSign();
        $rawValues = $jsApiPayData->GetValues();
        $rawValues['paySign'] =$sign;

        //把appid从数组$rawValues中删除
        unset($rawValues['appId']);

        return $rawValues;
    }

    private function recordPreOrder($wxOrder)
    {
        OrderModel::where('id', '=', $this->orderID)
            ->update(['prepay_id' => $wxOrder['prepay_id']]);
        

//        OrderModel::where('id','=',$this->orderID)
//            ->Update(['prepay_id'=>$wxOrder['prepay_id']]);
    }

    private function checkOrderValid()
    {
        $order = OrderModel::where('id', '=', $this->orderID)
            ->find();
        if (!$order) {
            throw new OrderException();
        }
        if (!Token::isValidOperate($order->user_id)) {
            throw new TokenException([
                'msg' => '订单与用户不匹配',
                'errorCode' => 10003
            ]);
        }
        //1代表待支付
        if ($order->status != 1) {
            throw new OrderException([
                'msg' => '订单已支付',
                'errorCode' => 80003,
                'code' => 400
            ]);
        }
        $this->orderNO = $order->order_no;
        return true;
    }
}