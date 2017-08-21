<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-21
 * Time: 15:26
 */

namespace app\lib\exception;


class ForbiddenException extends BaseException
{
    public $code = 403;
    public $msg = '权限不够';
    public $errorCode = 10001;
}