<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-12
 * Time: 15:51
 */

namespace app\api\validate;


//这是验证器
class IDCollection extends BaseValidate
{
    //首先定义一个要验证的规则
    protected $rule = [
        'ids' => 'require|checkIDs'
    ];
    protected $message = [
        'ids' => 'ids参数必须是以正整数逗号分隔的形式呈现'
    ];
    protected function checkIDs($value){
        $values = explode(',',$value);
        if(empty($values)){
            return false;
        }
        foreach ($values as $id){
            if(!$this->isPositiveInteger($id)){
                return false;
            }
        }
            return true;
    }

}