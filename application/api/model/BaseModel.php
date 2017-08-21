<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-12
 * Time: 13:42
 */

namespace app\api\model;


use think\Model;

class BaseModel extends Model
{
    //图片地址拼接读取器 给图片地址加上自己的域名
    protected function prefixImgUrl ($value,$data){
        $finalUrl = $value;
        if($data['from'] ==1){
            $finalUrl = config('setting.img_prefix').$value;
        }
        return $finalUrl;
    }
}