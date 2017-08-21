<?php
	namespace app\admin\controller;

	use think\Db;

	use app\common\controller\AdminBase;

	use think\Session;

	class Article extends AdminBase{
		/**
		 * 文章列表
		 * @Author   黄传东
		 * @DateTime 2017-06-22T09:14:37+0800
		 * @return   [type]                   [description]
		 */
		public function index(){
			$param=$this->request->param();
			$catid=isset($param['catid'])?$param['catid']:0;
			$title=isset($param['title'])?$param['title']:'';
			if($title!=''){
				$param['title']=array('like','%'.$title.'%');
			}
			$param['status']=1;
			$lists=Db::name('article')->where($param)->order('id desc')->paginate(10,false,['query'=>$param]);
			
			//分类
			$catlist1=Db::name('acategory')->order('paixu')->select();
			foreach ($catlist1 as $k => $v) {
				$catlist[$v['catid']]=$v;
			}
			// print_r($catlist);exit;
			$this->assign('alists',$lists);
			$this->assign('catlist',$catlist);
			$this->assign('catid',$catid);
			return $this->fetch();
			
		}
		/**
		 * 添加文章
		 * @Author   黄传东
		 * @DateTime 2017-06-22T09:44:00+0800
		 */
		public function add(){
			$param=$this->request->param();
			if($this->request->isPost()){
				isset($param['title']) or $this->error('请填写标题');
				isset($param['catid']) or $this->error('请选择分类');
				$param['addtime']=time();
				$file = request()->file('img');
				if($file){
					$info = $file->move(ROOT_PATH . DS . 'uploads');
					if($info){
						$param['img']=$info->getSavename();
					}
				}
				$res=Db::name('article')->insert($param);
				if($res){
					$this->success('添加成功','article/index');
				}else{
					$this->error('添加失败');
				}
			}else{
				$catlist=Db::name('acategory')->where('status',1)->select();

				$this->assign('catlist',$catlist);
				return $this->fetch();
			}
		}
		/**
		 * 编辑文章
		 * @Author   黄传东
		 * @DateTime 2017-06-22T10:37:04+0800
		 * @return   [type]                   [description]
		 */
		public function edit(){
			$param=$this->request->param();
			if($this->request->isPost()){
				isset($param['title']) or $this->error('标题不能为空');
				$file = request()->file('tupian');
				if($file){
					$info = $file->move(ROOT_PATH . DS . 'uploads');
					if($info){
						$param['img']=$info->getSavename();
					}
				}else{
					unset($param['tupian']);
				}
				$res=Db::name('article')->update($param);
				if($res){
					$this->success('更新成功','article/index');
				}else{
					$this->error('更新失败');
				}
			}else{
				isset($param['id']) or $this->error('非法访问');
				$info=Db::name('article')->where('id',$param['id'])->find();
				$catlist=Db::name('acategory')->where('status',1)->order('paixu')->select();
				$this->assign('info',$info);
				$this->assign('catlist',$catlist);
				return $this->fetch();
			}
			
		}
		/**
		 * 文章删除
		 * @Author   黄传东
		 * @DateTime 2017-06-27T08:11:19+0800
		 * @return   [type]                   [description]
		 */
		public function del(){
			$param=$this->request->param();
			isset($param['id']) or $this->error('非法访问');
			$info=Db::name('article')->where('id',$param['id'])->delete();
			if($info){
				$this->success('删除成功');
			}else{
				$this->error('删除失败');
			}
		}
	}

?>