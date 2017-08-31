<?php
	namespace app\admin\controller;
	use think\Db;
	use app\common\controller\AdminBase;

	class Category extends Adminbase{
		public function index(){
			$map['status']=1;
			//如果是商家
			if($this->_gly==0){
				$map['userid']=$this->_userid;
			}
			$res=Db::table('category')->where($map)->order('paixu')->select();
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
				isset($param['name']) or $this->error('分类名不能为空');
				$param['update_time']=time();
				$param['userid']=$this->_userid;
				$file=$this->request->file('img');
				if($file){
					$info=$file->validate(['ext'=>'jpg,png,gif'])->move(ROOT_PATH . DS . 'uploads');
					if($info){
						$param['img']=$info->getSaveName();
					}else{
						echo $file->getError();
					}
				}else{
					$this->error('请上传分类图片');
				}
				$res=Db::table('category')->insert($param);
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

				$file=$this->request->file('img');
				if($file){
					$info=$file->validate(['ext'=>'jpg,png,gif'])->move(ROOT_PATH . DS . 'uploads');
					if($info){
						$param['img']=$info->getSaveName();
					}else{
						echo $file->getError();
					}
				}
				$res=Db::table('category')->update($param);
				if($res){
					$this->success('编辑分类成功');
				}else{
					$this->error('编辑分类失败');
				}
			}else{
				$map['id']=$param['id'];
				$map['userid']=$this->_userid;
				$info=Db::table('category')->where($map)->find();
				if($info){
					$this->assign('info',$info);
					return $this->fetch();
				}else{
					$this->error('非法访问');
				}
				
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
			isset($param['id']) or $this->error('非法访问');
			if(!$this-> usercheck($param['id'])){
				$this->error('没有权限，非法访问');
			}
			$arr['status']=0;
			$info=Db::table('product')->where('id',$param['id'])->count();
			if($info>0){
				$this->error('此分类下已有产品，不能删除');
				exit;
			}
			$res=Db::table('category')->where('id',$param['id'])->update($arr);
			if($res){
				$this->success('删除分类成功');
			}else{
				$this->error('删除分类失败');
			}
		}
		/**
		 * 权限判断
		 * @Author   黄传东
		 * @DateTime 2017-08-31T08:53:16+0800
		 * @return   [type]                   [description]
		 */
		public function usercheck($id){
			if($this->_gly==0){
				$map['id']=$id;
				$map['userid']=$this->_userid;
				$res=Db::table('category')->where($map)->count();
				if($res){
					return true;
				}else{
					return false;
				}
			}else{
				return true;
			}
		}
		
	}

?>