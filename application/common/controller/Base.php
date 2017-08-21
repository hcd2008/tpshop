<?php
	namespace app\common\controller;
	use think\Controller;
	use think\Session;
	use think\Db;
	use think\Config;

	class Base extends Controller{
		protected $qx;
		/**
		 * 基本类判断用户登录等
		 * @Author    黄传东
		 * @DateTime  2017-03-15T14:30:03+0800
		 * @copyright 风险评估中心信息平台
		 */
		public function __construct(){
			parent::__construct();

		}
		public function _initialize(){
			$this->assign('controller',$this->request->controller());
		}
	}
?>