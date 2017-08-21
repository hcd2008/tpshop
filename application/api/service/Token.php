<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-18
 * Time: 14:16
 */

namespace app\api\service;


use app\lib\enum\ScopeEnum;
use app\lib\exception\ForbiddenException;
use app\lib\exception\TokenException;
use think\Cache;
use think\Exception;
use think\Request;

class Token
{
    public static function  generateToken(){
        //选取32个字符组成一组随机字符串
        $randChars = getRandChar(32);
        //用三组字符串，进行md5加密
        $timestamp = $_SERVER['REQUEST_TIME_FLOAT'];
        //salt 盐
        $salt = config('secure.token_salt');
        //合并字符串进行加密
        return md5($randChars.$timestamp.$salt);
    }

    public static function getCurrentTokenVar($key){
        //获取用户的TOKEN
        $token = Request::instance()->header('token');
        $vars = Cache::get($token);
        if(!$vars){
            throw new TokenException();
        }else{
            if(!is_array($vars)){

                $vars = json_decode($vars,true);
            }
                if(array_key_exists($key,$vars)) {
                return $vars[$key];
            }else {
                throw new Exception('尝试获取Token变量并不存在');
                }
        }
    }

    //从token获取用户UID
    public static function getCurrentUid(){

        $uid = self::getCurrentTokenVar('uid');
        return $uid;
    }


    //访问下单接口权限**//用户和管理员都可以访问的权限
    public static function needPrimaryScope()
    {
        $scope = self::getCurrentTokenVar('scope');
        if($scope){
            if($scope == ScopeEnum::User){
                return true;
            }else{
                throw new ForbiddenException();
            }
        }else{
            throw new TokenException();
        }
    }

    //只有用户才可以访问的接口权限
    public static function needExclusiveScope(){
        $scope = self::getCurrentTokenVar('scope');
        if($scope){
            if($scope == ScopeEnum::User){
                return true;
            }else{
                throw new ForbiddenException();
            }
        }else{
            throw new TokenException();
        }

    }
    public static function isValidOperate($checkedUID)
    {
        if(!$checkedUID){
            throw new Exception('检测UID时必须传入一个被检查的UID');
        }
        $currentOperateUID = self::getCurrentUid();
        if($currentOperateUID == $checkedUID){
            return true;
        }
        return false;
    }

    //检测令牌是否有效方法
    public static function verifyToken($token)
    {
        $exist = Cache::get($token);
        if($exist){
            return true;
        }
        else{
            return false;
        }
    }
}