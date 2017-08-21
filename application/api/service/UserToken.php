<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-16
 * Time: 08:21
 */

namespace app\api\service;


use app\lib\enum\ScopeEnum;
use app\lib\exception\TokenException;
use app\lib\exception\WeChatExcept;
use think\Exception;
use app\api\model\User as UserModel;

class UserToken extends Token
{
    // 向控制器提供一个接口方法
    protected $code;
    protected $wxAppID;
    protected $wxAppSecret;
    protected $wxLoginUrl;


    function __construct($code)
    {
        $this->code = $code;
        $this->wxAppID = config('wx.app_id');
        $this->wxAppSecret = config('wx.app_secret');
        $this->wxLoginUrl = sprintf(config('wx.login_url'),
            $this->wxAppID,$this->wxAppSecret,$this->code);
    }

    public function get(){
       $result =  curl_get($this->wxLoginUrl);
       //将字符串变为数组
       $wxResult = json_decode($result,true);
       if(empty($wxResult)){
           throw new Exception('获取session_及openID异常，微信内部错误');
       }else{
           $loginFail = array_key_exists('errcode',$wxResult);
           if($loginFail){
                $this->processLoginError($wxResult);
           }else{
               return $this->grantToken($wxResult);
           }
       }
    }
    protected function grantToken($wxResult){
        //拿到openid
        //到数据里看下，这个openid是不是已经存在
        //如果存在则不处理 如果不存在那么新增一条记录
        //准备缓存数据 写入缓存
        //把令牌返回到客户端去
        //key:令牌
        //value:wxResult,uid用户唯一标识,scope访问权限;
        $openid = $wxResult['openid'];
        $user = UserModel::getByOpenID($openid);
        if($user){
            $uid = $user->id;

        }else{
            $uid = $this->newUser($openid);
        }
        $cachedValue = $this->prepareCachedValue($wxResult,$uid);
        $token = $this->saveToCache($cachedValue);
        return $token;
    }

    //写入缓存方法
    private function saveToCache($cachedValue){
        $key = self::generateToken();
        $value = json_encode($cachedValue);
        $expire_in = config('setting.token_expire_in');

        $request = cache($key,$value,$expire_in);
        if(!$request){
            throw new TokenException([
                'msg' =>'服务器缓存异常',
                'errorCode' =>10005
            ]);
        }
        return $key;
    }

    protected function prepareCachedValue($wxResult,$uid){
        $cachedValue = $wxResult;
        $cachedValue['uid'] = $uid;
        $cachedValue['scope'] = ScopeEnum::User;
        return $cachedValue;

    }
    protected function newUser($openid){
        $user = UserModel::create([
            'openid'=>$openid
        ]);
        return $user->id;
    }
    protected function processLoginError($wxResult){
        throw new WeChatExcept([
            'msg' =>$wxResult['errmsg'],
            'errorCode' =>$wxResult['errcode']
        ]);
    }
}