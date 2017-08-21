<?php
	namespace app\index\controller;
	use think\Controller;
	use think\Db;
	use think\Session;

	class Login extends Controller{
		public function index(){
			if(Session::has('uid')){
				$this->success("您已登录",'index/index');
			}
			return $this->fetch();
		}
		/**
		 * 用户登录
		 * @Author    黄传东
		 * @DateTime  2017-03-22T16:45:00+0800
		 * @copyright 风险评估中心信息平台
		 * @return    [type]                   [description]
		 */
		public function login(){
			if($this->request->isPost()){
				$param=$this->request->param();
				$param['username']!='' or $this->error('用户名不能为空');
				$param['password']!='' or $this->error('密码不能为空');
				$res=$this->user_login($param['username'],$param['password']);
				if($this->user_login($param['username'],$param['password'])){
					$this->success("登录成功","index/index");
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
					$roleid=$res['roleid'];
					$rolearr=Db::name('role')->where('id',$roleid)->find();
					if($rolearr['status']!=1){
						$this->error('您的用户组已禁用，请联系管理员','login/index');
					}
					Session::set('uid',$res['userid']);
					Session::set('uname',$res['username']);
					Session::set('roleid',$res['roleid']);
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
		 * @DateTime 2017-03-27T10:01:11+0800
		 * @return   [type]                   [description]
		 */
		public function logout(){
			Session::clear();
			$this->success("您已安全退出","index/login");
		}
	}
?>