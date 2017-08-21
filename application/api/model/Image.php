<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-11
 * Time: 下午 9:44
 */

namespace app\api\model;


use think\Model;

class Image extends BaseModel
{
    //隐藏模型内的字段
    protected $hidden=['id','from','delete_time','update_time'];

    public  function getUrlAttr($value, $data)
    {
        //读取器 给图片地址默认加上http
        return $this->prefixImgUrl($value,$data);
    }
}

