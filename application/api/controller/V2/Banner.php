<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-09
 * Time: 下午 2:27
 */

namespace app\api\controller\v2;

use app\api\validate\IDMustBePostivelnt;
use app\api\model\Banner as BannerModel;
use app\lib\exception\BannerMissException;


class Banner
{
    //@id 指明的是Banner表的id号 获取Banner的id 信息
    public function getBanner($id)
    {
        return 'hello word';
    }
}