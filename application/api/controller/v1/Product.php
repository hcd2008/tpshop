<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-15
 * Time: 16:37
 */

namespace app\api\controller\v1;

use app\api\model\Product as ProductModel;
use app\api\validate\Count;
use app\api\validate\IDMustBePostiveInt;

use app\lib\exception\ProductException;

class Product
{
    //最新商品接口查询
    public function getRecent($count= 15){

        (new Count())->goCheck();
        $products = ProductModel::getMostRecent($count);
        if(!$products){
            throw new ProductException();
        }
        return json($products);
    }

    public function getAllInCategory($id){

        (new IDMustBePostiveInt())->goCheck();

            $products = ProductModel::getProductsByCategoryID($id);{
                if(!$products){
                    throw new ProductException();
                }
               return json($products);
        }
    }
    //商品详情接口
    public function getOne($id){
        (new IDMustBePostiveInt())->goCheck();
            $product = ProductModel::getProductDetail($id);{
                if(!$product){
                    throw new ProductException();
                }
                return json($product);
        }
    }

}