<?php
	namespace app\index\controller;
	use app\index\model\Info;

	class Test{
		public function index(){
			$info=Info::get(15);
			echo $info->title_cn;
		}
	}
?>