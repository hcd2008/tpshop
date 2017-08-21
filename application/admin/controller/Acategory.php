<?php
	namespace app\admin\controller;
	use think\Db;
	use app\common\controller\AdminBase;

	class Acategory extends Adminbase{
		public function index(){
			$res=Db::name('acategory')->where('status',1)->order('paixu')->select();
			$this->assign('lists',$res);
			return $this->fetch();
		}
		/**
		 * 添加分类
		 * @Author   hcd
		 * @DateTime 2017-05-29T16:17:36+0800
		 * @version  [version]
		 */
		public function add(){
			if($this->request->isPost()){
				$param=$this->request->param();
				isset($param['catname']) or $this->error('分类名不能为空');
				$res=Db::name('acategory')->insert($param);
				if($res){
					$this->success('添加分类成功');
				}else{
					$this->error('添加分类失败');
				}
			}else{
				return $this->fetch();
			}
		}
		/**
		 * 编辑分类
		 * @Author   hcd
		 * @DateTime 2017-05-29T16:30:21+0800
		 * @version  [version]
		 * @return   [type]                   [description]
		 */
		public function edit(){
			$param=$this->request->param();
			if($this->request->isPost()){
				$res=Db::name('acategory')->update($param);
				if($res){
					$this->success('编辑分类成功');
				}else{
					$this->error('编辑分类失败');
				}
			}else{
				$catid=$param['catid'];
				$info=Db::name('acategory')->where('catid',$catid)->find();
				$this->assign('info',$info);
				return $this->fetch();
			}
		}
		/**
		 * 删除分类
		 * @Author   hcd
		 * @DateTime 2017-05-29T16:38:00+0800
		 * @version  [version]
		 * @return   [type]                   [description]
		 */
		public function del(){
			$param=$this->request->param();
			isset($param['catid']) or $this->error('非法访问');
			$arr['status']=0;
			$info=Db::name('article')->where('catid',$param['catid'])->count();
			if($info>0){
				$this->error('此分类下已有产品，不能删除');
				exit;
			}
			$res=Db::name('acategory')->where('catid',$param['catid'])->update($arr);
			if($res){
				$this->success('删除分类成功');
			}else{
				$this->error('删除分类失败');
			}
		}
	}

?>