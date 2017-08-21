<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-24
 * Time: 16:11
 */

namespace app\api\service;

use app\api\model\Order as OrderModel;
use app\api\model\Product;
use app\api\service\Order as OrderService;
use app\lib\enum\OrderStatusEnum;
use think\Db;
use think\Exception;
use think\Loader;
use think\Log;


Loader::import('WxPay.WxPay',EXTEND_PATH,'.Api.php');

//支付完成后成功的回调
class WxNotify extends \WxPayNotify
{
    public function NotifyProcess($data, &$msg)
    {
        if($data['result_code'] == 'SUCCESS')
        {
            $orderNo = $data['out_true_no'];
            Db::startTrans();
            try{
                $order = OrderModel::where('order_no','=',$orderNo)
                    ->find();
                if($order->status == 1)
                {
                    $service = new OrderService();
                    $stockStatus = $service->checkOrderStock($order->id);
                    if($stockStatus['pass'])
                    {
                        $this->updateOrderStatus($order->id,true);
                        $this->reduceStock($stockStatus);
                    }
                    else{
                        $this->updateOrderStatus($order->id,false);
                    }
                }
                Db::commit();
                return true;
            }
            catch (Exception $ex)
            {
                Db::rollback();
                Log::error($ex);
                return false;
            }
        }
        else{
            return true;
        }
    }
    //消减库存量方法
    private function reduceStock($stockStatus)
    {
        foreach ($stockStatus['pStatusArray'] as $singlePStatus)
        {
            Product::where('id','=',$singlePStatus['id'])
                ->setDec('stock',$singlePStatus['count']);
        }
    }
    //更新支付状态方法
    private function updateOrderStatus($orderID,$success)
    {
        $status = $success?OrderStatusEnum::PAID : OrderStatusEnum::PAID_BUT_OUT_OF;
        OrderModel::where('id',$orderID)->update(['status'=> $status]);
    }

}