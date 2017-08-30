<?php
	namespace app\admin\controller;

	use think\Db;
	use app\common\controller\AdminBase;

	class Demand extends AdminBase{

		public function index(){
			$res=Db::table('demand')->order('id')->paginate();
			$this->assign('lists',$res);
			return $this->fetch();
		}
		/**
		 * 设置为已处理
		 * @Author   黄传东
		 * @DateTime 2017-08-30T17:06:29+0800
		 * @return   [type]                   [description]
		 */
		public function edit(){
			$param=$this->request->param();
			isset($param['id']) or $this->error('非法访问');
			$param['state']=1;
			$res=Db::table('demand')->update($param);
			if($res){
				$this->success('设置成功');
			}else{
				$this->error('设置失败');
			}
		}
		/**
		 * 删除留言
		 * @Author   黄传东
		 * @DateTime 2017-08-30T17:10:01+0800
		 * @return   [type]                   [description]
		 */
		public function del(){
			$param=$this->request->param();
			isset($param['id']) or $this->error('非法访问');
			$res=Db::table('demand')->where('id',$param['id'])->delete();
			if($res){
				$this->success('删除成功');
			}else{
				$this->error('删除失败');
			}
		}
	}
?>