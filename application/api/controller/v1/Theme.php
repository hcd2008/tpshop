<?php
/**
 * Created by 七月.
 * Author: 七月
 * Date: 2017/5/12
 * Time: 15:22
 */

namespace app\api\controller\v1;

use think\Db;
use app\api\validate\IDCollection;
use app\api\model\Theme as ThemeModel;
use app\api\validate\IDMustBePostiveInt;
use app\lib\exception\ThemeException;
use app\api\controller\BaseApi;


class Theme extends BaseApi
{

    /**
     * @url /theme?ids=id1,id2,id3,....
     * @return 一组theme模型
     */
    public function getSimpleList(){
        // (new IDCollection())->goCheck();
        // $ids = explode(',', $ids);
        // $result = ThemeModel::with('topicImg,headImg')
        //     ->select($ids);
        // if($result->isEmpty()){
        //     throw new ThemeException();
        // }
        // return $result;
        // $map['a.userid']=$this->_uid;
        $res=Db::table('theme')->field('a.*,b.url')->alias('a')->join('image b','a.topic_img_id=b.id','LEFT')->select();
        return json($res);
    }

    /**
     * @url /theme/:id
     */
    public function getComplexOne($id){
        (new IDMustBePostiveInt())->goCheck();
        $theme = ThemeModel::getThemeWithProducts($id);
        if(!$theme){
            throw new ThemeException();
        }
        return $theme;
    }
}