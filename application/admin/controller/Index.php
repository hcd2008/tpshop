<?php
	namespace app\admin\controller;
	use app\common\controller\AdminBase;

	class Index extends Adminbase{
		public function index(){
			$param=$this->request->param();
			if($this->request->isPost()){
				print_r($param);
			}else{
				return $this->fetch();
			}
		}
	}
?>