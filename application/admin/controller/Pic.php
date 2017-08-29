<?php
	namespace app\admin\controller;
	use app\common\controller\AdminBase;
	use think\Db;

	class Pic extends AdminBase{
		/**
		 * 大图首页
		 * @Author   黄传东
		 * @DateTime 2017-08-25T10:37:00+0800
		 * @return   [type]                   [description]
		 */
		public function index(){
			$map['a.state']=1;
			if($this->_gly==0){
				$map['a.userid']=$this->_userid;
			}
			$res=Db::table('banner_item')->field('a.*,b.name')->alias('a')->join('product b','a.pid=b.id','LEFT')->where($map)->order('a.paixu')->select();
			// print_r($res);exit;
			$this->assign('lists',$res);
			return $this->fetch();
		}
		/**
		 * 添加
		 * @Author   黄传东
		 * @DateTime 2017-08-25T14:04:14+0800
		 */
		public function add(){
			$param=$this->request->param();
			if($this->request->isPost()){
				$file=$this->request->file('img');
				if($file){
					$info=$file->move(ROOT_PATH . DS . 'uploads');
					if($info){
						$param['img']=$info->getSavename();
					}else{
						echo $file->getError();
					}
				}else{
					$this->error('请上传图片');
				}
				if($this->_gly==0){
					$param['userid']=$this->_userid;
				}
				$param['update_time']=time();
				$res=Db::name('banner_item')->insert($param);
				if($res){
					$this->success('添加成功');
				}else{
					$this->error('添加失败');
				}
			}else{
				return $this->fetch();
			}
		}
		/**
		 * 编辑大图信息
		 * @Author   黄传东
		 * @DateTime 2017-08-25T11:27:35+0800
		 * @return   [type]                   [description]
		 */
		public function edit(){
			$param=$this->request->param();
			isset($param['id']) or $this->error('非法访问');
			if(!$this->usercheck($param['id'])){
				$this->error('请勿越权访问');
			}
			if($this->request->isPost()){
				$file=$this->request->file('img');
				if($file){
					$info=$file->move(ROOT_PATH . DS . 'uploads');
					if($info){
						$param['img']=$info->getSavename();
					}else{
						echo $file->getError();
					}
				}
				$res=Db::name('banner_item')->update($param);
				if($res){
					$this->success('编辑成功');
				}else{
					$this->error('编辑失败');
				}

			}else{
				$map['id']=$param['id'];
				if($this->_gly==0){
					$map['userid']=$this->_userid;
				}
				$info=Db::table('banner_item')->where($map)->find();
				// print_r($info);exit;
				$this->assign('info',$info);
				return $this->fetch();
			}
		}
		/**
		 * 判断权限
		 * @Author   黄传东
		 * @DateTime 2017-08-25T11:29:19+0800
		 * @return   [type]                   [description]
		 */
		public function usercheck($id){
			if($this->_gly==0){
				$map['userid']=$this->_userid;
				$map['id']=$id;
				$res=Db::table('banner_item')->where($map)->count();
				if($res){
					return true;
				}else{
					return false;
				}
			}else{
				return false;
			}
		}
		/**
		 * 删除
		 * @Author   黄传东
		 * @DateTime 2017-08-25T11:53:26+0800
		 * @return   [type]                   [description]
		 */
		public function del(){
			$param=$this->request->param();
			isset($param['id']) or $this->error('非法访问');
			if(!$this->usercheck($param['id'])){
				$this->error('没有权限');
			}
			$res=Db::table('banner_item')->where('id',$param['id'])->delete();
			
			if($res){
				$this->success('删除成功');
			}else{
				$this->error('删除失败');
			}
		}
	}

?>