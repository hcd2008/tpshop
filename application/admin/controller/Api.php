<?php

	namespace app\admin\controller;

	use think\Db;

	use think\Cache;

	use think\Controller;



	class Api extends Controller{

		/**

		 * 得到公司信息

		 * @Author   hcd

		 * @DateTime 2017-05-29T15:32:33+0800

		 * @version  [version]

		 * @return   [type]                   [description]

		 */

		public function info(){

			$info=Cache::get('info');
			if(isset($info['logoimg'])){
				if($info['logoimg']!=''){

					$info['logoimg']=$this->request->domain()."/uploads/".$info['logoimg'];

				}
			}
			if(isset($info['erweima'])){
				if($info['erweima']!=''){

					$info['erweima']=$this->request->domain()."/uploads/".$info['erweima'];

				}
			}
			if(isset($info['jingwei'])){
				$arr=explode(",", $info['jingwei']);
				// print_r($arr);exit;
				$info['jingdu']=$arr[0];
				$info['weidu']=$arr[1];
			}else{
				$info['jingdu']=37.463822;
				$info['weidu']=121.447935;
			}
			if($info['intro']!=''){
				$info['content']=$this->htmltowxml($info['intro']);
			}
			return json($info);

		}
		/**
		 * html转义为wxml
		 * @Author   黄传东
		 * @DateTime 2017-06-12T15:23:15+0800
		 * @param    [type]                   $content [description]
		 * @return   [type]                            [description]
		 */
		public function htmltowxml($content){
			$_arr = preg_split('/(<img.*?>)/i', $content, -1, PREG_SPLIT_NO_EMPTY | PREG_SPLIT_DELIM_CAPTURE);  
			$_r = array();  
			foreach($_arr as $_txt) {  
			    if(substr($_txt, 0, 4) == '<img') {  
			        $_matchs = array();  
			        preg_match('/<img.*?src="(.*?)"/i', $_txt, $_matchs);  
			        $_txt = $_matchs[1];  
			        if(preg_match('/^\//', $_txt)) $_txt = $this->request->domain().$_txt;  
			        $_r[]= array('type'=>'img', 'data'=>$_txt);  
			    }else {  
			        $_txt = preg_replace('/&.*?;/', ' ', $_txt);  
			        $_txt = preg_replace('/\s+/', ' ', $_txt);  
			        $_txt = preg_replace(array('/<br.*?>/i', '/<p.*?>/i', '/<li.*?>/i', '/<div.*?>/i', '/<tr.*?>/i', '/<th.*?>/i'),  
			                        "\n", $_txt);  
			        $_txt = preg_replace('/<.*?>/', '', $_txt);  
			        $_r[]= array('type'=>'txt', 'data'=>$_txt);  
			    }  
			}  
			return $_r; 
		}
		/**
		 * 分类列表及数量
		 * @Author   hcd
		 * @DateTime 2017-06-11T18:01:03+0800
		 * @version  [version]
		 * @return   [type]                   [description]
		 */
		function catlist(){
			$res=Db::name('category')->where('status',1)->order('paixu,catid')->select();
			$lists=array();
			foreach ($res as $k => $v) {
				$info=Db::name('product')->where('catid',$v['catid'])->where('status',1)->count();
				$v['sum']=$info;
				$lists[]=$v;
			}
			return json($lists);
		}

		/**

		 * 获取分类列表

		 * @Author   hcd

		 * @DateTime 2017-05-29T17:17:33+0800

		 * @version  [version]

		 * @return   [type]                   [description]

		 */

		public function category(){

			$res=Db::name('category')->where('status',1)->select();

			return json($res);

		}

		/**

		 * 产品信息

		 * @Author   hcd

		 * @DateTime 2017-05-30T22:08:29+0800

		 * @version  [version]

		 * @return   [type]                   [description]

		 */

		public function product(){

			$param=$this->request->param();

			$map['status']=1;
			$mpa['state']=1;

			//产品搜素

			if(isset($param['keyword'])){

				$map['name']=array('like','%'.$param['keyword'].'%');

			}
			//分类搜索
			if(isset($param['catid'])){
				if($param['catid']){
					$map['catid']=$param['catid'];
				}
				
			}

			$page=isset($param['page'])?$param['page']:1;

			$pagesize=10;

			$offset=($page-1)*$pagesize;

			$res=Db::name('product')->where($map)->order('id desc')->limit($offset,$pagesize)->select();
			$lists=array();

			foreach ($res as $k => $v) {

				$pid=$v['id'];

				$imgres=Db::name('product_img')->where('pid',$pid)->where('status',1)->select();

				foreach ($imgres as $kk => $vv) {

					$newimg=$this->request->domain()."/uploads/".$vv['img'];

					$vv['img']=$newimg;

					$imgres1[$kk]=$vv;

				}

				//封面图

				$v['fengmian']=$imgres1[0]['img'];

				$v['addtime']=date('Y-m-d H:i:s',$v['addtime']);

				$v['img']=$imgres1;

				$lists[$k]=$v;

			}
			//总数量
			$sumarr=Db::name('product')->where($map)->count();
			$jglist['sum']=$sumarr;
			$jglist['lists']=$lists;

			return json($jglist);

		}

		/**

		 * 产品详情

		 * @Author   hcd

		 * @DateTime 2017-06-07T23:33:59+0800

		 * @version  [version]

		 * @return   [type]                   [description]

		 */

		public function show(){

			$param=$this->request->param();

			isset($param['id']) or $this->error('非法访问');

			$id=$param['id'];

			$info=Db::name('product')->where('id',$id)->find();

			$imgs=Db::name('product_img')->where('pid',$id)->where('status',1)->select();

			foreach ($imgs as $kk => $vv) {

				$newimg=$this->request->domain()."/uploads/".$vv['img'];

				$vv['img']=$newimg;

				$imgres[$kk]=$vv;

			}
			if($info['content']!=''){
					$info['content']=$this->htmltowxml($info['content']);
				}

			$info['imgs']=$imgres;

			return json($info);

		}

		public function adduser(){

			$param=$this->request->param();

			if(!isset($param['openid'])||!isset($param['key'])){

				$arr['status']=0;

				$arr['info']='传入参数错误';

				return json($arr);exit;

			}

			$key=$param['key'];

			if($key!='dajiao'){

				$arr['status']=0;

				$arr['info']='传入参数错误';

				return json($arr);exit;

			}

			$openid=$param['openid'];

			$res=Db::name('user')->where('openid',$openid)->count();

			if($res){

				$arr['status']=2;

				$arr['info']='已有该用户';

				return json($arr);exit;

			}else{

				$data['openid']=$openid;

				Db::name('user')->insert($data);

				$lastId=Db::name('user')->getLastInsID();

				$arr['status']=1;

				$arr['info']='保存用户信息成功';

				return json($arr);exit;

			}

		}

		/**

		 * 更新用户信息

		 * @Author   hcd

		 * @DateTime 2017-05-30T23:40:30+0800

		 * @version  [version]

		 * @return   [type]                   [description]

		 */

		public function updateuser(){

			$param=$this->request->param();

			if(!isset($param['openid'])||!isset($param['key'])){

				$arr['status']=0;

				$arr['info']='传入参数错误';

				return json($arr);exit;

			}

			$openid=$param['openid'];

			$key=$param['key'];

			if($key!='dajiao'){

				$arr['status']=0;

				$arr['info']='传入参数错误';

				return json($arr);exit;

			}

			$name=isset($param['name'])?$param['name']:'';

			$phone=isset($param['phone'])?$param['phone']:'';

			$shname=isset($param['shname'])?$param['shname']:'';

			$shphone=isset($param['shphone'])?$param['shphone']:'';

			$data=array();

			if($name!=''){

				$data['name']=$name;

			}

			if($phone!=''){

				$data['phone']=$phone;

			}

			if($shname!=''){

				$data['shname']=$shname;

			}

			if($shphone!=''){

				$data['shphone']=$shphone;

			}

			if(count($data)){

				Db::name('user')->where('openid',$openid)->update($data);

				$arr['status']=1;

				$arr['info']='更新成功';

				return json($arr);

			}else{

				$arr['status']=0;

				$arr['info']='未更新任何内容';

				return json($arr);

			}

			

		}

	}

?>