<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-21
 * Time: 22:53
 */

namespace app\api\validate;


use app\lib\exception\ParameterException;

class OrderPlace extends BaseValidate
{
    protected $rule = [
        'products' => 'checkProducts'
    ];

    //数组每个子项的验证规则
    protected $singleRule = [
        'product_id' => 'require|isPositiveInteger',
        'count' => 'require|isPositiveInteger',
    ];

    protected function checkProducts($values)
    {
        if (!is_array($values)) {
            throw new ParameterException([
                'msg' => '商品参数不正确'
            ]);
        }
        if (!$values) {
            throw new ParameterException([
                'msg' => '商品列表不能为空'
            ]);
        }
        //循环遍历
        foreach ($values as $value)
        {
            $this->checkProduct($value);
        }
        return true;
    }
    protected function checkProduct($value)
    {
        $validate = new BaseValidate($this->singleRule);
        $result = $validate->check($value);
        if(!$result){
            throw new ParameterException([
                'msg' => '商品列表不存在'
            ]);
        }
    }

}