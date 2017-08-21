<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-16
 * Time: 09:11
 */

namespace app\lib\exception;


class WeChatExcept extends BaseException
{
    public $code = 400;
    public $msg = '微信服务接口调用失败';
    public $errorCode = 999;
}