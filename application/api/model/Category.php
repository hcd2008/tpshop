<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-15
 * Time: 17:32
 */

namespace app\api\model;


class Category extends BaseModel
{
    protected $hidden=['delete_time','category_id','update_time','create_time'];
        public function img(){
            return $this->belongsTo('Image','topic_img_id','id');
        }

    }