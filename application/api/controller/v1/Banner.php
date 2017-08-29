<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-09
 * Time: 下午 2:27
 */

namespace app\api\controller\v1;

use app\api\validate\IDMustBePostiveInt;
use app\api\model\Banner as BannerModel;
use app\lib\exception\BannerMissException;
use app\api\controller\BaseApi;
use think\Db;


class Banner extends BaseApi
{
    //@id 指明的是Banner表的id号 获取Banner的id 信息
    public function getBanner()
    {   
        $map['state']=1;
        $map['userid']=$this->_uid;
        $res=Db::name('banner_item')->where($map)->order('paixu')->select();
        return json($res);
    }
}