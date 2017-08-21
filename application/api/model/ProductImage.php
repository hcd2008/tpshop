<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-18
 * Time: 18:01
 */

namespace app\api\model;


class ProductImage  extends  BaseModel
{
    protected $hidden=['img_id','delete_time','product_id'];

    public function imgUrl(){

        return $this->belongsTo('Image',"img_id",'id');
    }
}