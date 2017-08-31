<?php
	namespace app\admin\controller;
	use think\Db;

	use app\common\controller\AdminBase;

	class Theme extends AdminBase{
		/**
		 * 专题列表
		 * @Author   黄传东
		 * @DateTime 2017-08-31T09:17:23+0800
		 * @return   [type]                   [description]
		 */
		public function index(){
			$res=array();
			$map=array();
			if($this->_gly==0){
				$map['a.userid']=$this->_userid;
			}
			$res=Db::table('theme')->where($map)->select();
			$this->assign('lists',$res);
			return $this->fetch();
		}
		/**
		 * 增加主题
		 * @Author   黄传东
		 * @DateTime 2017-08-31T17:10:59+0800
		 */
		public function add(){
			$param=$this->request->param();
			if($this->request->isPost()){
				foreach ($param as $k => $v) {
					if(empty($v)){
						$this->error('请填写完整');
					}
				}
				$topic_pic=$this->request->file('topic_pic');
				if($topic_pic){
					$info=$topic_pic->validate(['ext'=>'jpg,png,gif'])->move(ROOT_PATH . DS . 'uploads');
					if($info){
						//将图片插入
						$toparr['url']=$info->getSavename();
						$toparr['update_time']=time();
						$topres=Db::table('image')->insert($toparr);
						$topid=Db::table('image')->getLastInsID();
						$param['topic_img_id']=$topid;
					}else{
						echo $file->getError();
					}
				}else{
					$this->error('请上传主题图片');
				}
				$head_pic=$this->request->file('head_pic');
				if($head_pic){
					$info=$head_pic->validate(['ext'=>'jpg,png,gif'])->move(ROOT_PATH . DS . 'uploads');
					if($info){
						//将图片插入
						$headarr['url']=$info->getSavename();
						$headarr['update_time']=time();
						$headres=Db::table('image')->insert($headarr);
						$headid=Db::table('image')->getLastInsID();
						$param['head_img_id']=$headid;
					}else{
						echo $file->getError();
					}
				}else{
					$this->error('请上传主题图片');
				}
				$param['update_time']=time();
				$param['userid']=$this->_userid;
				$res=Db::table('theme')->insert($param);
				if($res){
					$this->success('插入主题成功');
				}else{
					$this->error('插入主题失败');
				}
			}else{
				return $this->fetch();
			}
		}
	}

?>