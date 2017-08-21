<?php
	namespace app\common\controller;
	use think\Controller;
	use think\Session;
	use think\Validate;
	use think\Db;

	class AdminBase extends Controller{
		protected $param;
		//用户id
		protected $_userid;
		//用户组
		protected $_gly;
		/**
		 * 基本类判断用户登录等
		 * @Author    黄传东
		 * @DateTime  2017-03-15T14:30:03+0800
		 * @copyright 风险评估中心信息平台
		 */
		public function __construct(){
			// $this->isLogin();
			parent::__construct();
			
		}
		public function _initialize(){
			$this->param=$this->request->param();
			$_userid=Session::has('uid')?Session::get('uid'):0;
			$_gly=Session::has('gly')?Session::get('gly'):0;
			$this->_userid=$_userid;
			$this->_gly=$_gly;
			$this->isLogin();
			$this->assign('controller',$this->request->controller());
		}
		/**
		 * 判断是否已登录
		 * @Author    黄传东
		 * @DateTime  2017-03-15T14:22:06+0800
		 * @copyright 风险评估中心信息平台
		 * @return    boolean                  [description]
		 */
		public function isLogin(){
			if(!Session::has('uid')){
				$this->redirect('login/index');
			}
		}
	}
?>