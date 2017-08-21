<?php
	namespace app\admin\controller;
	use app\common\controller\AdminBase;
	use think\Validate;
	use think\Db;
	class User extends Adminbase{
		/**
		 * 会员管理模块
		 * @Author    黄传东
		 * @DateTime  2017-03-15T16:48:16+0800
		 * @copyright 风险评估中心信息平台
		 * @return    [type]                   [description]
		 */
		public function index(){
			$res=Db::name('user')->where("status",1)->order('userid','desc')->paginate(10);
			$this->assign("lists",$res);
			return $this->fetch();
		}
	}

?>