<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-21
 * Time: 21:43
 */

namespace app\api\Controller;


use think\Controller;
use app\api\service\Token as TokenService;

class BaseController extends Controller
{
    //用户和CMS管理员都可以访问的权限
    protected function checkPrimaryScope()
    {
        TokenService::needPrimaryScope();
    }

    //只有用户才可以访问的权限
    protected function checkExclusiveScope()
    {
        TokenService::needExclusiveScope();
    }
}