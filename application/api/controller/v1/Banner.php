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


class Banner
{
    //@id 指明的是Banner表的id号 获取Banner的id 信息
    public function getBanner($id)
    {
        //AOP面向切面编程
        (new IDMustBePostiveInt())->goCheck();

        $banner = BannerModel::getBannerByID($id);

        if (!$banner) {
            throw new BannerMissException();
        }
        $c = config('setting.img_prefix');
        return $banner;
    }
}