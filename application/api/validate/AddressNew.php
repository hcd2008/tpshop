<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-20
 * Time: 23:15
 */

namespace app\api\validate;


class AddressNew extends BaseValidate
{
    //验证用户信息 定义规则
    protected  $rule = [
        'name' => 'require|isNotEmpty',  //
        'mobile' => 'require|isMobile',
        'province' =>'require|isNotEmpty',
        'city' => 'require|isNotEmpty',
        'country' => 'require|isNotEmpty',
        'detail' => 'require|isNotEmpty',
    ];
}