<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-22
 * Time: 18:06
 */

namespace app\api\model;


class Order extends BaseModel
{
    protected $hidden = ['user_id','delete_time','update_time'];
    //自动写入时间戳
    protected $autoWriteTimestamp = true;
   // protected $createTime = 'create_timestamp';

    //读取器转换json数据格式
    public function getSnapItemsAttr($value)
    {
        if(empty($value)){
            return null;
        }
        return json_decode($value);
    }
    public function getSnapAddressAttr($value)
    {
        if(empty($value)){
            return null;
        }
        return json_decode($value);
    }





    public static function getSummaryByUser($uid,$page=1,$size=15)
    {
        $pagingData = self::where('user_id','=',$uid)
            ->order('create_time desc ')
            ->paginate($size,true,['page' => $page]);
        return $pagingData;
    }

}

