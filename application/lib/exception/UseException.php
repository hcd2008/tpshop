<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-21
 * Time: 00:10
 */

namespace app\lib\exception;


class UseException extends BaseException
{
        public $code = 404;
        public $msg = '用户不存在';
        public $errorCode = 60000;
}