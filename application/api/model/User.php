<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-16
 * Time: 08:19
 */

namespace app\api\model;


class User extends BaseModel
{
    public static function getByOpenID($openid){
        $user = self::where('openid','=',$openid)->find();
        return $user;
    }

        //用户信息关联
    public function address(){
        return $this->hasOne('UserAddress','user_id','id');
    }

}