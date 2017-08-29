<?php
	namespace app\admin\controller;
	use think\Db;
	use app\common\controller\AdminBase;

	class Shops extends AdminBase{
		public function __construct(){
			parent::__construct();
			if($this->_gly==0){
				$this->error('没有管理员权限');
			}
		}
		/**
		 * 商铺列表
		 * @Author   hcd
		 * @DateTime 2017-08-20T09:12:02+0800
		 * @version  [version]
		 * @return   [type]                   [description]
		 */
		public function index(){
			$param=$this->request->param();
			isset($param['name']) or $param['name']='';
			$res=Db::table('shops')->order('id desc')->paginate();
			$this->assign('name',$param['name']);
			$this->assign('lists',$res);
			return $this->fetch();
		}
		/**
		 * 添加商铺
		 * @Author   hcd
		 * @DateTime 2017-08-20T09:12:23+0800
		 * @version  [version]
		 */
		public function add(){
			if($this->request->isPost()){
				$param=$this->request->param();
				foreach ($param as $k => $v) {
					!empty($v) or $this->error('信息请填写完整');
				}
				//验证用户名是否重复
				if($this->usercheck($param['username'])){
					$this->error('后台登录名重复,请更改');
				}
				$param['password']=md5($param['password']);
				$param['addtime']=time();
				$res=Db::table('shops')->insert($param);
				if($res){
					$this->success('添加商铺成功');
				}else{
					$this->error('添加商铺失败');
				}
			}else{
				return $this->fetch();
			}
		}
		/**
		 * 用户名是否重复检测
		 * @Author   黄传东
		 * @DateTime 2017-08-25T10:26:38+0800
		 * @return   [type]                   [description]
		 */
		public function usercheck($username){
			$info=Db::table('shops')->where('username',$username)->count();
			if($info){
				return true;
			}else{
				return false;
			}
		}
		/**
		 * 编辑商城
		 * @Author   hcd
		 * @DateTime 2017-08-20T10:42:01+0800
		 * @version  [version]
		 * @return   [type]                   [description]
		 */
		public function edit(){
			$param=$this->request->param();

			isset($param['id']) or $this->error('非法访问');
			if($this->request->isPost()){
				if(empty($param['password'])){
					unset($param['password']);
				}else{
					$param['password']=md5($param['password']);
				}
				$res=Db::table('shops')->update($param);
				if($res){
					$this->success('修改商铺信息成功');
				}else{
					$this->error('修改商铺信息失败');
				}
			}else{
				$info=Db::table('shops')->where('id',$param['id'])->find();
				$this->assign('info',$info);
				return $this->fetch();
			}
			
		}
	}

?>