<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-21
 * Time: 15:41
 */

namespace app\api\controller\v1;


use app\api\Controller\BaseController;
use app\api\validate\IDMustBePostiveInt;
use app\api\validate\OrderPlace;
use app\api\service\Token as TokenService;
use app\api\service\Order as OrderService;
use app\api\validate\PagingParameter;
use app\api\model\Order as OrderModel;
use app\api\service\Token;
use app\lib\exception\OrderException;


class Order extends BaseController
{
    // 用户在选择商品后，向API提交包含他所选的相关信息
    //API在接受到信息后，需检查订单相关商品的库存量
    //有库存，把订单数据存入数据库中=下单成功了，并且返回客户端信息，告诉客户端可以支付了
    //此时就调用我们的支付接口 进行支付
    //在支付时还需要再次进行库存量检测
    //服务器这边就可以调用微信支付接口进行支付
    //支付完成接收微信返回支付结果
    //成功:支付成功了 也需要进行库存量的检测
    //支付成功：进行库存量的扣除；支付失败：返回一个支付失败的结果


   protected $beforeActionList = [
        'checkExclusiveScope' => ['only'=>'placeOrder'],
        'checkPrimaryScope' => ['only'=>'getDetail,getSummaryByUser'],
    ];

   //订单分页查询
    public function getSummaryByUser($page=1,$size=15){

        (new PagingParameter())->goCheck();
        $uid = Token::getCurrentUid();
        $pagingOrders = OrderModel::getSummaryByUser($uid,$page,$size);
        if($pagingOrders->isEmpty()){
            return [
                'data' =>[],
                'current_page' => $pagingOrders->getCurrentPage()
            ];
        }
        $data = $pagingOrders->hidden(['snap_items','snap_address','prepay_id'])-> toArray();
            return[
                'data' =>$data,
                'current_page' => $pagingOrders->getcurrentPage()
            ];
    }

    //订单详情接口
    public function getDetail($id)
    {
        (new IDMustBePostiveInt())->goCheck();
        $orderDetail = OrderModel::get($id);
        if(!$orderDetail)
        {
            throw new OrderException();
        }
        return $orderDetail ->hidden(['prepay_id']);
    }



    //订单 下单接口
    public function placeOrder(){
        (new OrderPlace())->goCheck();
        $products = input('post.products/a');
        $uid = TokenService::getCurrentUid();

        $order = new OrderService();
        $status = $order->place($uid,$products);

        return $status;

    }

}