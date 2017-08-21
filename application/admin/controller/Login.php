<?php
	namespace app\admin\controller;
	use think\Controller;
	use think\Session;
	use think\Db;

	class Login extends Controller{
		/**
		 * 登录界面
		 * @Author    黄传东
		 * @DateTime  2017-03-15T14:44:06+0800
		 * @copyright 风险评估中心信息平台
		 * @return    [type]                   [description]
		 */
		public function index(){
			$this->view->engine->layout(false);
			return $this->fetch();
		}
		public function login(){
			if($this->request->isPost()){
				$param=$this->request->param();
				$param['username']!='' or $this->error('用户名不能为空');
				$param['password']!='' or $this->error('密码不能为空');
				$res=$this->user_login($param['username'],$param['password']);
				if($this->user_login($param['username'],$param['password'])){
					$this->success("登录成功","product/index");
				}else{
					$this->error("账号或密码错误");
				}
			}
		}
		/**
		 * 验证用户名 密码
		 * @Author    黄传东
		 * @DateTime  2017-03-22T16:51:06+0800
		 * @copyright 风险评估中心信息平台
		 * @return    [type]                   [description]
		 */
		public function user_login($username,$password){
			$user=Db::name("member")->where('username',$username)->find();
			if($user['userid']){
				$passsalt=$user['passsalt'];
				$password=dpassword($password,$passsalt);
				$res=Db::name('member')->where('username',$username)->where('password',$password)->find();
				if($res){
					Session::set('uid',$res['userid']);
					Session::set('uname',$res['username']);
					return true;
				}else{
					return false;
				}
			}else{
				return false;
			}
			
		}
		/**
		 * 退出登录
		 * @Author   黄传东
		 * @DateTime 2017-04-10T14:42:42+0800
		 * @return   [type]                   [description]
		 */
		public function logout(){
			Session::clear();
			$this->success("您已安全退出","index/login");
		}
	}
?>