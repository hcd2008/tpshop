<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-12
 * Time: 15:25
 */

namespace app\api\model;

use app\api\model\Product as ProductModel;

class Product extends BaseModel
{
    protected $hidden=['main_img_id','from','delete_time','category_id',
        'update_time','create_time','pivot'];


    public  function getMainImgUrlAttr($value, $data)
    {
        //读取器 给图片地址默认加上http
        return $this->prefixImgUrl($value,$data);
    }

    //商品详情“数据表”关联定义
    public function imp(){

        return $this->hasMany('ProductImage','product_id','id');
    }

    //商品的属性（商品参数）
    public function properties(){

        return $this->hasMany('ProductProperty','product_id','id');
    }

    //最近新品 的接口查询 以倒序的方式查询

    public static function getMostRecent($count){
        $products = self::limit($count)->order('create_time desc')->select();
        return $products;
    }
      //分类商品查询
    public static function getProductsByCategoryID($categoryID){

        $products = self::where('category_id','=',$categoryID)->select();

        return $products;

    }
    //商品详情查询
    public static function getProductDetail($id){

        $product = self::with('imp.imgUrl,properties')
            ->find($id);
        return $product;
    }
}