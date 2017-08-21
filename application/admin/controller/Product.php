<?php

	namespace app\admin\controller;

	use think\Db;

	use app\common\controller\AdminBase;

	use think\Session;



	class Product extends AdminBase{

		/**

		 * 产品列表

		 * @Author   黄传东

		 * @DateTime 2017-05-24T18:21:08+0800

		 * @return   [type]                   [description]

		 */

		public function index(){

			$param=$this->param;

			$name=isset($param['name'])?trim($param['name']):'';

			$map['status']=1;
			if($this->_gly==0){
				$map['userid']=$this->_userid;
			}

			if($name!=''){

				$map['name']=array('like','%'.$name.'%');

			}

			$catid=isset($param['catid'])?$param['catid']:0;

			if($catid){

				$map['catid']=$catid;

			}
			$res=Db::table('product')->where($map)->order('id desc')->paginate(10);

			$catarr=Db::table('category')->select();

			foreach ($catarr as $k => $v) {

				$catlist[$v['id']]=$v;

			}
			$this->assign('name',$name);

			$this->assign('catid',$catid);

			$this->assign('catlist',$catlist);

			$this->assign('lists',$res);

			return $this->fetch();

		}

		/**

		 * 添加产品

		 * @Author   hcd

		 * @DateTime 2017-05-25T23:19:43+0800

		 * @version  [version]

		 */

		public function add(){

			$param=$this->request->param();

			if($this->request->isPost()){
				//判断是否是商家
				if($this->_gly==0){
					$param['userid']=$this->_userid;
				}

				$param['create_time']=time();

				$res=Db::table('product')->insert($param);

				$lastId=Db::table('product')->getLastInsID();

				$files = request()->file('imgs');

				$imgs=array();

				if($files){

				    foreach($files as $file){

				        // 移动到框架应用根目录/public/uploads/ 目录下

				        $info = $file->move(ROOT_PATH . DS . 'uploads');

				        if($info){

				            // 成功上传后 获取上传信息

				            $imginfo=$info->getSavename();

				            $arr['product_id']=$lastId;

				            $arr['img']=$imginfo;

				            Db::table('product_image')->insert($arr);

				        }else{

				            // 上传失败获取错误信息

				            echo $file->getError();

				        }    

				    }

				}

				if($res){

					$this->success('添加产品成功');

				}else{

					$this->error('添加产品失败');

				}

			}else{
				$map['status']=1;
				if($this->_gly==0){
					$map['userid']=$this->_userid;
				}
				$catinfo=Db::table('category')->where($map)->select();

				$this->assign('catinfo',$catinfo);

				return $this->fetch();

			}

		}

		/**

		 * 编辑产品

		 * @Author   黄传东

		 * @DateTime 2017-05-26T15:53:25+0800

		 * @return   [type]                   [description]

		 */

		public function edit(){

			$param=$this->request->param();

			//判断是否有权限
			//商家需要判断权限
			if(!$this->auth($param['id'])){
				$this->error('没有权限，非法访问');
			}

			if($this->request->isPost()){

				$res=Db::table('product')->update($param);

				$product_id=$param['id'];

				$files = request()->file('imgs');

				$imgs=array();

				if($files){

					$data['status']=0;

					Db::table('product_image')->where('product_id',$product_id)->update($data);

				    foreach($files as $file){

				        // 移动到框架应用根目录/public/uploads/ 目录下

				        $info = $file->move(ROOT_PATH . DS . 'uploads');

				        if($info){

				            // 成功上传后 获取上传信息

				            $imginfo=$info->getSavename();

				            $arr['product_id']=$product_id;

				            $arr['img']=$imginfo;

				            Db::table('product_image')->insert($arr);

				        }else{

				            // 上传失败获取错误信息

				            echo $file->getError();

				        }    

				    }

				}

				if($res){

					$this->success('编辑产品成功');

				}else{

					$this->error('编辑产品失败');

				}

			}else{

				isset($param['id']) or $this->error('非法访问');



				$info=Db::table('product')->where('id',$param['id'])->find();

				$imglist=array();

				$imglist=Db::table('product_image')->where('product_id',$param['id'])->where('status',1)->order('id')->select();

				$this->assign('catlist',$this->category());

				$this->assign('info',$info);

				$this->assign('imglist',$imglist);
			
				return $this->fetch();

			}

		}
		/**
		 * 判断是否有权限
		 * @Author   黄传东
		 * @DateTime 2017-08-21T17:00:05+0800
		 * @return   [type]                   [description]
		 */
		public function auth($pid){
			if($this->_gly==0){
				$info=Db::table('product')->where('userid',$this->_userid)->where('id',$pid)->count();
				if($info){
					return true;
				}else{
					return false;
				}
			}else{
				return true;
			}
		}

		public function category(){
			if($this->_gly==0){
				$res=Db::table('category')->where('userid',$this->_userid)->order('paixu,id')->select();
			}else{
				$res=Db::table('category')->order('paixu,id')->select();
			}

			

			return $res;

		}

		/**

		 * 删除产品

		 * @Author   黄传东

		 * @DateTime 2017-05-26T16:46:54+0800

		 * @return   [type]                   [description]

		 */

		public function del(){

			$param=$this->param;

			isset($param['id']) or $this->error('非法访问');
			if(!$this->auth($param['id'])){
				$this->error('没有权限,非法访问');
			}

			$arr['status']=0;

			$res=Db::table('product')->where("id",$param['id'])->update($arr);

			if($res){

				$this->success('删除成功');

			}else{

				$this->error('删除失败');

			}

		}
		/**
		 * 删除图片
		 * @Author   hcd
		 * @DateTime 2017-07-24T19:18:52+0800
		 * @version  [version]
		 * @return   [type]                   [description]
		 */
		public function delimg(){
			$param=$this->request->param();
			isset($param['id']) or $this->error('非法访问');
			$arr['id']=$param['id'];
			$arr['status']=0;
			$res=Db::table('product_image')->update($arr);
			if($res){
				$this->success('删除成功');
			}else{
				$this->error('删除失败');
			}
		}

	}

	

?>