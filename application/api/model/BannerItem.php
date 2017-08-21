<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-10
 * Time: 下午 11:28
 */

namespace app\api\model;


use think\Model;

class BannerItem extends BaseModel
{
        //隐藏模型内的字段
        protected $hidden=['id','img_id','banner_id','update_time','delete_time'];
        public  function img(){
                        //belongsTo是模型一对一的
            return $this->belongsTo('Image','img_id','id');
        }

}