<?php
	namespace app\admin\controller;
	use think\Db;
	use app\common\controller\AdminBase;

	class Shops extends AdminBase{
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
		 * 编辑商城
		 * @Author   hcd
		 * @DateTime 2017-08-20T10:42:01+0800
		 * @version  [version]
		 * @return   [type]                   [description]
		 */
		public function edit(){
			$param=$this->request->param();
			isset($param['id']) or $this->error('非法访问');
			$info=Db::table('shops')->where('id',$param['id'])->find();
			$this->assign('info',$info);
			return $this->fetch();
		}
	}

?>