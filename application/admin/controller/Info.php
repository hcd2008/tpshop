<?php
	namespace app\admin\controller;
	use app\common\controller\AdminBase;
	use think\Cache;
	use think\Db;

	class Info extends Adminbase{
		public function index(){
			$param=$this->request->param();
			if($this->request->isPost()){
				unset($param['update']);
				// foreach ($param as $k => $v) {
				// 	if(trim($v)==''){
				// 		$this->error('每项必填！');
				// 	}
				// }
				$file = request()->file('logoimg');
				if($file){
				    // 移动到框架应用根目录/public/uploads/ 目录下
					$info = $file->move(ROOT_PATH . DS . 'uploads');
					if($info){
					    $param['logoimg']= $info->getSaveName();
					}else{
					    // 上传失败获取错误信息
					    echo $file->getError();
					}
				}
				$file = request()->file('erweima');
				if($file){
				    // 移动到框架应用根目录/public/uploads/ 目录下
					$info = $file->move(ROOT_PATH . DS . 'uploads');
					if($info){
					    $param['erweima']= $info->getSaveName();
					}else{
					    // 上传失败获取错误信息
					    echo $file->getError();
					}
				}
				//加入缓存
				Cache::set('info',$param);
				//更新数据库
				Db::name('info')->where('id',1)->update($param);
				$this->success('企业信息更新成功');
			}else{
				$info=Cache::get('info');
				if($info==''){
					$info=Db::name('info')->where('id',1)->find();
					Cache::set('info',$info);
				}
				isset($info['erweima']) or $info['erweima']='';
				isset($info['logoimg']) or $info['logoimg']='';
				// print_r($info);exit;
				$this->assign('info',$info);
				return $this->fetch();
			}
		}
	}
	
?>