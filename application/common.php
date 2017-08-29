<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
function getquanxian($qx,$conf,$fenge='|'){
	$quanxian=explode(",",$qx);
	$str='';
	foreach ($quanxian as $k => $v) {
		$str.=$conf[$v].$fenge;
	}
	return $str;
}
/**
 * 密码加密算法
 * @Author    黄传东
 * @DateTime  2017-03-21T14:07:19+0800
 * @copyright 风险评估中心信息平台
 * @param     [type]                   $password [description]
 * @param     [type]                   $salt     [description]
 * @return    [type]                             [description]
 */
function dpassword($password, $salt) {
	return md5(md5($password).$salt);
}
/**
 * 生成随机字符串
 * @Author    黄传东
 * @DateTime  2017-03-21T14:12:18+0800
 * @copyright 风险评估中心信息平台
 * @param     [type]                   $length [description]
 * @param     string                   $chars  [description]
 * @return    [type]                           [description]
 */
function random($length, $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz') {
	$hash = '';
	$max = strlen($chars) - 1;
	for($i = 0; $i < $length; $i++)	{
		$hash .= $chars[mt_rand(0, $max)];
	}
	return $hash;
}
// 应用公共文件
/**
 * @param string $url get请求地址
 * @param int $httpCode 返回状态码
 * @param mixed
 */
function curl_get($url,&$httpCode = 0){
    $ch = curl_init();
    curl_setopt($ch,CURLOPT_URL,$url);
    curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);

    //不做证书校验，部署在linux环境下请改位true
    curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,false);
    curl_setopt($ch,CURLOPT_CONNECTTIMEOUT,10);
    $file_contents = curl_exec($ch);
    $httpCode = curl_getinfo($ch,CURLINFO_HTTP_CODE);
    curl_close($ch);
    return $file_contents;
}


function getRandChar($length)
{
    $str = null;
    $strPol = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
    $max = strlen($strPol) - 1;

    for ($i = 0;
         $i < $length;
         $i++) {
        $str .= $strPol[rand(0, $max)];
    }

    return $str;
}
