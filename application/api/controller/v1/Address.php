<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-20
 * Time: 23:11
 */

namespace app\api\controller\v1;



use app\api\Controller\BaseController;
use app\api\model\User as UserModel;
use app\api\model\UserAddress;
use app\api\service\Token as TokenService;
use app\api\validate\AddressNew;
use app\lib\exception\SuccessMessage;
use app\lib\exception\UseException;

class Address extends BaseController
{
    protected $beforeActionList = [
        'checkPrimaryScope' => ['only' => 'createOrUpdateAddress,getUserAddress' ]

    ];



    public function getUserAddress(){
        $uid = TokenService::getCurrentUid();
        $userAddress = UserAddress::where('user_id', $uid)
            ->find();
        if(!$userAddress){
            throw new UseException([
                'msg' => '用户地址不存在',
                'errorCode' => 60001
            ]);
        }
        return $userAddress;
    }


    public function createOrUpdateAddress(){

        $validate = new AddressNew();
        $validate->goCheck();

        //根据token获取用户的UID
        //根据uid查找用户数据，判断用户是否存在，如果不存在抛出异常
        //获取用户从客户端提交来的地址信息
        //根据用户地址信息是否存在，从而判断是添加地址还是更新地址

        $uid = TokenService::getCurrentUid();

        //查找用户数据
        $user = UserModel::get($uid);
        if(!$user){
            throw new UseException();
        }


        //获取用户从客户端提交来的地址信息
        $dataArray = $validate->getDataByRule(input('post.'));


        //根据用户地址信息是否存在，从而判断是添加地址还是更新地址
        $userAddress= $user->address;
        if(!$userAddress){
            $user->address()->save($dataArray);   //判断存在保存一条信息
        }else{
            $user->address->save($dataArray);   //不存在就更新一条信息
        }

        return json(new SuccessMessage(), 201);
    }
}