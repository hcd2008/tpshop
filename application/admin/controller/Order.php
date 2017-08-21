<?php
	namespace app\admin\controller;
	use app\common\controller\AdminBase;
	use think\Db;

	class Order extends Adminbase{
		public function index(){
			$res=Db::name('order')->order('id desc')->paginate(10);
			$statearr=['已关闭','待付款','待发货','待收货','已完成'];
			$this->assign('statearr',$statearr);
			$this->assign('lists',$res);
			return $this->fetch();
		}
	}
?>