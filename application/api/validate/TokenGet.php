<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-16
 * Time: 08:07
 */

namespace app\api\validate;


class TokenGet extends BaseValidate
{
    protected $rule = [
        'code'=>'require|isNotEmpty'
    ];

    protected $message = [
        'code'=> '没有Code无法获取Token'
    ];
}