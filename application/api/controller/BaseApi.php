<?php
	namespace app\api\controller;
	use think\Db;
	use think\Controller;

	class BaseApi extends Controller{
		protected $_uid;
		public function __construct(){
			parent::__construct();
			if(isset($this->request->param()['uaid'])){
				$uaid=$this->request->param()['uaid'];
				$userinfo=Db::table('shops')->where('appid',$uaid)->find();
				if(!empty($userinfo['id'])){
					$this->_uid=$userinfo['id'];
				}else{
					$info['state']=0;
					$info['error']='未查询到该商户的appid';
					echo json_encode($info);
					exit;
				}
			}else{
				$info['state']=0;
				$info['error']='非法的用户appid';
				echo json_encode($info);
				exit;
			}
		}
	}
?>