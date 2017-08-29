<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-15
 * Time: 17:31
 */

namespace app\api\controller\v1;
use think\Db;
use app\api\model\Category as CategoryModel;
use app\lib\exception\CategoryException;
use app\api\controller\BaseApi;


class Category extends BaseApi
{
    public function getAllCategories(){

        // $categories = CategoryModel::all([],'img');
        // if($categories->isEmpty()){
        //     throw new CategoryException();
        // }
        // return $categories;
        $map['status']=1;
        $map['userid']=$this->_uid;
    	$res=Db::table('category')->where($map)->order('paixu')->select();
    	return json($res);

    }
}