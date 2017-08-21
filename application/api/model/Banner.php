<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-09
 * Time: 下午 10:22
 */

namespace app\api\model;


use think\Model;

class Banner extends Model
{
    //隐藏模型内的字段
    protected $hidden = ['delete_time','update_time'];
    public function items(){
                                    //所要关联的模型名称          关联模型的外键       当前模型的主键id
        return $this->hasMany('BannerItem','banner_id','id');
    }

    public static function getBannerByID($id)
    {
        $banner = self::with(['items','items.img'])->find($id);

        return $banner;
    }
}