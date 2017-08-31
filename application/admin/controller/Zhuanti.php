<?php
	namespace app\admin\controller;
	use think\Db;

	use app\common\controller\AdminBase;

	class Zhuanti extends AdminBase{
		/**
		 * 专题列表
		 * @Author   黄传东
		 * @DateTime 2017-08-31T09:17:23+0800
		 * @return   [type]                   [description]
		 */
		public function index(){

			$res=array();
			if($this->_gly==0){
				$res=Db::table('theme')->where('userid',$this->_userid)->paginate(10);
			}else{
				$res=Db::table('theme')->select();
			}
			$this->assign('lists',$res);
			return $this->fetch();
		}
	}

?>