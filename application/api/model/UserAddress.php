<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-21
 * Time: 01:14
 */

namespace app\api\model;


class UserAddress extends BaseModel
{
    protected $hidden = ['id','delete_time','user_id'];
}