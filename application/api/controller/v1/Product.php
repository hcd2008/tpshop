<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-15
 * Time: 16:37
 */

namespace app\api\controller\v1;
use think\Db;

use app\api\model\Product as ProductModel;
use app\api\validate\Count;
use app\api\validate\IDMustBePostiveInt;

use app\lib\exception\ProductException;
use app\api\controller\BaseApi;

class Product extends BaseApi
{
    //最新商品接口查询
    public function getRecent($count= 15){

        // (new Count())->goCheck();
        // $products = ProductModel::getMostRecent($count);
        // if(!$products){
        //     throw new ProductException();
        // }
        // return json($products);
        $map['a.state']=1;
        $map['a.status']=1;
        $map['a.userid']=$this->_uid;
        $res=Db::table('product')->field('a.*,b.img')->alias('a')->join('product_image b','a.id=b.product_id')->where($map)->order('a.id desc,b.id')->limit($count)->select();
        return json($res);
    }

    public function getAllInCategory($id=1){

        // (new IDMustBePostiveInt())->goCheck();

        //     $products = ProductModel::getProductsByCategoryID($id);{
        //         if(!$products){
        //             throw new ProductException();
        //         }
        //        return json($products);
        // }
        $map['a.status']=1;
        $map['a.catid']=$id;
        $map['a.userid']=$this->_uid;
        $res=Db::table('product')->field('a.*,b.img')->alias('a')->join('product_image b','a.id=b.product_id','LEFT')->where($map)->order('a.id desc,b.id')->limit(20)->select();
        //分类图片
        $info=Db::table('category')->where('id',$id)->find();
        $res['catimg']=$info['img'];
        return json($res);
    }
    //商品详情接口
    public function getOne($id){
        // (new IDMustBePostiveInt())->goCheck();
        //     $product = ProductModel::getProductDetail($id);{
        //         if(!$product){
        //             throw new ProductException();
        //         }
        //         return json($product);
        // }
        $map['a.userid']=$this->_uid;
        $map['a.id']=$id;
        $res=Db::table('product')->alias('a')->field('a.*,b.img')->join('product_image b','a.id=b.product_id','LEFT')->where($map)->order('b.id')->find();
        $imgres=Db::table('product_image')->where('product_id',$id)->order('id')->select();
        $res['imp']=$imgres;
        return json($res);
    }

}