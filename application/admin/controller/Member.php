<?php
	namespace app\admin\controller;
	use app\common\controller\AdminBase;
	use think\Validate;
	use think\Db;
	class Member extends Adminbase{
		/**
		 * 会员管理模块
		 * @Author    黄传东
		 * @DateTime  2017-03-15T16:48:16+0800
		 * @copyright 风险评估中心信息平台
		 * @return    [type]                   [description]
		 */
		public function index(){
			$res=Db::name('member')->where("status",3)->order('userid','desc')->paginate(10);
			$this->assign("lists",$res);
			return $this->fetch();
		}
		/**
		 * 添加会员
		 * @Author    黄传东
		 * @DateTime  2017-03-15T17:23:11+0800
		 * @copyright 风险评估中心信息平台
		 */
		public function addUser(){
			if($this->request->isPost()){
				$param=$this->request->param();
				$rule=[
					'username'=>'require',
					'roleid'=>'require'
				];
				$msg=[
					'username.require'=>'用户名必填',
					'roleid.require'=>'角色必选'
				];
				$validate=new Validate($rule,$msg);
				if(!$validate->check($param)){
					$this->error($validate->getError());
				}
				//验证用户名重复
				if($this->checkUser($param['username'])){
					$this->error("用户名重复");
				}
				$param['regtime']=time();
				$param['passsalt']=random(8);
				isset($param['password']) or $param['password']='foodmate123';
				$param['password']=dpassword($param['password'],$param['passsalt']);
				$res=Db::name('member')->insert($param);
				if($res){
					$this->success("添加用户成功","member/index");
				}else{
					$this->error("添加用户失败");
				}
			}else{
				$rolelist=$this->roleList();
				$this->assign("rolelist",$rolelist);
				return $this->fetch();
			}
		}
		/**
		 * 检测用户名是否重复
		 * @Author    黄传东
		 * @DateTime  2017-03-21T13:48:10+0800
		 * @copyright 风险评估中心信息平台
		 * @return    [type]                   [description]
		 */
		public function checkUser($username,$id=0){
			if($id){
				$res=Db::name('member')->where('username',$username)->where("userid","<>",$id)->count();
			}else{
				$res=Db::name('member')->where('username',$username)->count();
			}
			return $res;
		}
		/**
		 * 角色列表
		 * @Author    黄传东
		 * @DateTime  2017-03-21T14:30:06+0800
		 * @copyright 风险评估中心信息平台
		 * @return    [type]                   [description]
		 */
		public function roleList(){
			$res=Db::name('role')->where('status',1)->order("sort")->select();
			return $res;
		}

		public function editMember(){
			if($this->request->isPost()){
				$param=$this->request->param();
				if($param['password']!=''){
					$param['passsalt']=random(8);
					$param['password']=dpassword($param['password'],$param['passsalt']);
				}else{
					unset($param['password']);
				}
				$res=Db::name('member')->update($param);
				if($res){
					$this->success("编辑用户信息成功","member/index");
				}else{
					$this->error("编辑用户信息失败");
				}

			}else{
				$param=$this->request->param();
				isset($param['userid']) or $this->error('非法访问');
				$res=Db::name('member')->where('userid',$param['userid'])->find();
				$this->assign("info",$res);
				return $this->fetch();
			}
		}
		public function delMember(){
			$param=$this->request->param();
			isset($param['userid']) or $this->error('非法访问');
			$userid=$param['userid'];
			if($userid==6){
				$this->error("admin用户无法被删除");
			}
			$res=Db::name('member')->where('userid',$param['userid'])->delete();
			if($res){
				$this->success("删除成功");
			}else{
				$this->error("删除失败");
			}
		}
	}

?>