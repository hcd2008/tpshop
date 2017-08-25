<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

    //动态设置路由
    use think\Route;
     //Route::rule('路由表达式','路由地址','请求类型','路由参数（数组）','变量规则（数组）');

    //请求的几种类型
    //GET,POST,DELETE,PUT,*

    //Route::rule('hello/:id','sample/test/hello','GET',['https'=>false]);
    //两种请求方式
    //Route::rule('hello/:id','sample/test/hello','GET|POST',['https'=>false]);
    //GET的带参数请求
     //Route::get('hello/:id','sample/test/hello');
    //POST的带参数请求
    //Route::post('hello/:id','sample/test/hello');

     //Banner部分                                   //模块/控制器/方法名
    Route::get('api/:version/banner/:id','api/:version.Banner/getBanner');
    //主题部分
    Route::get('api/:version/theme','api/:version.Theme/getSimpleList');
    Route::get('api/:version/theme/:id','api/:version.Theme/getComplexOne');


    //分类列表
    Route::get('api/:version/Category/all','api/:version.Category/getAllCategories');

    //商品详情接口
    Route::get('api/:version/product/:id','api/:version.product/getOne',[],['id'=>'\d+']);
    //最近新品
    Route::get('api/:version/product/recent','api/:version.product/getRecent');
    //分类商品
    Route::get('api/:version/Product/by_category','api/:version.Product/getAllInCategory');

    //***路由分组***
//    Route::group('api/:version/product',function(){
//       Route::get('by_category','api/:version.Product/getAllInCategory');
//    });


    //Token
    Route::post('api/:version/Token/user','api/:version.Token/getToken');

    //Token 检测Token令牌是否有效
    Route::post('api/:version/Token/verify','api/:version.Token/verifyToken');

    //收货地址
    Route::post('api/:version/Address','api/:version.Address/createOrUpdateAddress');
    Route::get('api/:version/Address','api/:version.Address/getUserAddress');

    //订单分页查询

    Route::get('api/:version/order/by_user','api/:version.Order/getSummaryByUser');

    //订单详情查询
    Route::get('api/:version/order/:id','api/:version.Order/getDetail',[],['id'=>'\d+']);

    //订单下单接口（提交信息是以POST方式）
    Route::post('api/:version/Order','api/:version.Order/placeOrder');

    //支付订单接口
    Route::post('api/:version/pay/pre_order','api/:version.Pay/getPreOrder');

    //微信支付回调接口
    Route::post('api/v1/pay/notify','api/v1.Pay/receiveNotify');







