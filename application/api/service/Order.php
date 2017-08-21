<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-22
 * Time: 01:22
 */

namespace app\api\service;


use app\api\model\OrderProduct;
use app\api\model\Product;
use app\api\model\UserAddress;
use app\lib\exception\OrderException;
use app\lib\exception\UseException;
use think\Db;
use think\Exception;


class Order
{
    //订单商品列表，也就是客户端传过来的products参数
    protected $oProducts;
    //数据库里真实的商品信息（包括库存量）
    protected $Products;

    protected $uid;

    //下单业务
    public function place($uid, $oProducts)
    {
        //oProducts和Products 做对比（对比库存量）
        //products从数据库中查询出来
        $this->oProducts = $oProducts;
        $this->Products = $this->getProductsByOrder($oProducts);
        $this->uid = $uid;
        $status = $this->getOrderStatus();
        if (!$status['pass']) {
            $status['order_id'] = -1;
            return $status;
        }
        //开始创建订单
        $orderSnap = $this->snapOrder($status);
        $order = $this->createOrder($orderSnap);
        $order['pass'] = true;
        return $order;

    }

    //生成等单数据 并写入数据库
    private function createOrder($snap)
    {
        Db::startTrans();
        try {

            $orderNo = $this->makeOrderNo();
            $order = new \app\api\model\Order();
            $order->user_id = $this->uid;
            $order->order_no = $orderNo;
            $order->total_price = $snap['orderPrice'];
            $order->total_count = $snap['totalCount'];
            $order->snap_img = $snap['snapImg'];
            $order->snap_name = $snap['snapName'];
            $order->snap_address = $snap['snapAddress'];
            $order->snap_items = json_encode($snap['pStatus']);

            $order->save();

            $orderID = $order->id;
            $create_time = $order->create_time;
            foreach ($this->oProducts as &$p) {
                $p['order_id'] = $orderID;
            }
            $orderProduct = new OrderProduct();
            $orderProduct->saveALL($this->oProducts);
            Db::commit();

            return [
                'order_no' => $orderNo,
                'order_id' => $orderID,
                'create_time' => $create_time
            ];
        }
        catch (Exception $ex){
            Db::rollback();
            throw $ex;
        }
    }


    //订单编号生成器
    public static function makeOrderNo()
    {
        $yCode = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J');
        $orderSn =
            $yCode[intval(date('Y')) - 2017] .
            strtoupper(dechex(date('m'))) .
            date('d') .
            substr(time(), -5) .
            substr(microtime(), 2, 5) .
            sprintf('%02d', rand(0, 99));
        return $orderSn;
    }


    //生成订单快照

    private function snapOrder($status)
    {
        $snap = [
            'orderPrice' => 0, //商品价格
            'totalCount' => 0,  //商品总数量
            'pStatus' => [],
            'snapAddress' => null,
            'snapName' => '',
            'snapImg' => ''
        ];
        //赋值
        $snap['orderPrice'] = $status['orderPrice'];
        $snap['totalCount'] = $status['totalCount'];
        $snap['pStatus'] = $status['pStatusArray'];
        $snap['snapAddress'] = json_encode($this->getUserAddress());
        $snap['snapName'] = $this->Products[0]['name'];
        $snap['snapImg'] = $this->Products[0]['main_img_url'];

        if (count($this->Products) > 1) {
            $snap['snapName'] .= '等';
        }
        return $snap;

    }

    private function getUserAddress()
    {
        $userAddress = UserAddress::where('user_id', '=', $this->uid)
            ->find();
        if (!$userAddress) {
            throw new UseException([
                'msg' => '用户收货地址不存在，下单失败',
                'errorCode' => 60001,
            ]);
        }
        return $userAddress->toArray();
    }

    //为pay提供一个外调用接口（库存检测）
    public function checkOrderStock($orderID)
    {
        $oProducts = OrderProduct::where('order_id','=',$orderID)
            ->select();
        $this->oProducts = $oProducts;

        $this->Products = $this->getProductsByOrder($oProducts);
        $status = $this->getOrderStatus();
        return $status;
    }

    private function getOrderStatus()
    {
        $status = [
            'pass' => true,
            'orderPrice' => 0,
            'totalCount' => 0,
            'pStatusArray' => []
        ];

        //循环遍历方法做库存对比
        foreach ($this->oProducts as $oProduct) {
            $pStatus = $this->getProductStatus(
                $oProduct['product_id'], $oProduct['count'], $this->Products
            );
            if (!$pStatus['haveStock']) {
                $status['pass'] = false;
            }
            $status['orderPrice'] += $pStatus['totalPrice'];
            $status['totalCount'] += $pStatus['counts'];
            array_push($status['pStatusArray'], $pStatus);
        }
        return $status;
    }

    private function getProductStatus($oPID, $oCount, $products)
    {

        $pIndex = -1;

        $pStatus = [
            'id' => null,
            'haveStock' => false,
            'counts' => 0,
            'price' =>0,
            'name' => '',
            'totalPrice' => 0,
            'main_img_url' => null
        ];
        for ($i = 0; $i < count($products); $i++) {
            if ($oPID == $products[$i]['id']) {
                $pIndex = $i;
            }
        }
        if ($pIndex == -1) {
            //客户端传过来的product_id有可能是不存在的
            throw new OrderException([
                'msg' => 'id为' . $oPID . '商品不存在，创建订单失败'
            ]);
        } else {
            $product = $products[$pIndex];
            $pStatus['id'] = $product['id'];
            $pStatus['name'] = $product['name'];
            $pStatus['counts'] = $oCount;
            $pStatus['price'] = $product['price'];
            $pStatus['main_img_url'] = $product['main_img_url'];
            $pStatus['totalPrice'] = $product['price'] * $oCount;

            if ($product['stock'] - $oCount >= 0) {
                $pStatus['haveStock'] = true;
            }
        }
        return $pStatus;
    }

    //根据订单信息查找真实的商品信息
    private function getProductsByOrder($oProducts)
    {
        $oPIDs = [];
        foreach ($oProducts as $item) {
            array_push($oPIDs, $item['product_id']);
        }
        $products = Product::all($oPIDs)->visible(['id', 'price', 'stock', 'name', 'main_img_url'])
            ->toArray();
        return $products;
    }
}