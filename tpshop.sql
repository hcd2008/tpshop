/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : tpshop

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-08-30 17:25:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT 'Banner名称，通常作为标识',
  `description` varchar(255) DEFAULT NULL COMMENT 'Banner描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='banner管理表';

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', '首页置顶', '首页轮播图', null, null);

-- ----------------------------
-- Table structure for banner_item
-- ----------------------------
DROP TABLE IF EXISTS `banner_item`;
CREATE TABLE `banner_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `img` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片地址',
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态1正常 0隐藏',
  `userid` int(10) unsigned NOT NULL COMMENT '用户id',
  `pid` int(10) unsigned DEFAULT NULL COMMENT '关联的产品id',
  `update_time` int(11) DEFAULT NULL,
  `paixu` int(10) unsigned DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='banner子项表';

-- ----------------------------
-- Records of banner_item
-- ----------------------------
INSERT INTO `banner_item` VALUES ('1', '首页大图', '20170825/5c42a3ee2ab5fb68f60e4132a7276ec1.png', '1', '2', '11', null, '100');
INSERT INTO `banner_item` VALUES ('2', null, '/banner-2a.png', '1', '2', null, null, '100');
INSERT INTO `banner_item` VALUES ('3', null, '/banner-3a.png', '1', '2', null, null, '100');
INSERT INTO `banner_item` VALUES ('5', null, '/banner-1a.png', '1', '2', null, null, '100');
INSERT INTO `banner_item` VALUES ('6', '小米Mix', '20170829/6d72b3bc6264e2abbfa10b73658cc7fa.jpg', '1', '4', '0', '1503965747', '100');
INSERT INTO `banner_item` VALUES ('7', '小米笔记本', '20170829/4ac3326159867e5ed42744e62d204c37.jpg', '1', '4', '0', '1503965761', '100');
INSERT INTO `banner_item` VALUES ('8', '小米电视', '20170829/a3aaf88607a648c000223e5f0b26f41c.jpg', '1', '4', '0', '1503965777', '100');
INSERT INTO `banner_item` VALUES ('9', '红米手机', '20170829/a8b140bf88bc6f7ca67dd5e930b73b80.jpg', '1', '4', '0', '1503965793', '100');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `topic_img_id` int(11) DEFAULT NULL COMMENT '外键，关联image表',
  `img` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '分类图片',
  `delete_time` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `update_time` int(11) DEFAULT NULL,
  `paixu` int(10) unsigned DEFAULT '100' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态1正常0已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='商品类目';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('2', '2', '果味', '6', '/category-dryfruit.png', null, null, null, '100', '1');
INSERT INTO `category` VALUES ('3', '2', '蔬菜', '5', '/category-vg.png', null, null, null, '100', '1');
INSERT INTO `category` VALUES ('4', '2', '炒货', '7', '/category-fry-a.png', null, null, null, '100', '1');
INSERT INTO `category` VALUES ('5', '2', '点心', '4', '/category-cake.png', null, null, null, '100', '1');
INSERT INTO `category` VALUES ('6', '2', '粗茶', '8', '/category-tea.png', null, null, null, '100', '1');
INSERT INTO `category` VALUES ('7', '2', '淡饭', '9', '/category-rice.png', null, null, null, '100', '1');
INSERT INTO `category` VALUES ('8', '2', '测试分类', null, '20170828/49a4dc273d024a7d790789693904cd39.jpg', null, null, '1503133423', '100', '1');
INSERT INTO `category` VALUES ('9', '2', '坚果Pro手机', null, '20170828/49a4dc273d024a7d790789693904cd39.jpg', null, null, '1503304996', '111', '1');
INSERT INTO `category` VALUES ('10', '2', '锤子T2', null, '20170828/49a4dc273d024a7d790789693904cd39.jpg', null, null, '1503305032', '88', '1');
INSERT INTO `category` VALUES ('11', '2', '坚果手机', null, '20170828/49a4dc273d024a7d790789693904cd39.jpg', null, null, '1503305043', '88', '1');
INSERT INTO `category` VALUES ('12', '2', '锤子T1', null, '20170828/49a4dc273d024a7d790789693904cd39.jpg', null, null, '1503305053', '100', '1');
INSERT INTO `category` VALUES ('13', '6', '哈哈哈', null, '20170828/7e6ed0806cdaea3ca970b20eb0c084bc.png', null, null, '1503908988', '100', '1');
INSERT INTO `category` VALUES ('14', '4', '小米手机', null, '20170829/8317c1e7951cf8a2342c0aab6752892e.jpg', null, null, '1503965832', '100', '1');
INSERT INTO `category` VALUES ('15', '4', '红米手机', null, '20170829/d8d40b5f6efda68d5b5709654cd0fc6c.jpg', null, null, '1503965870', '100', '1');
INSERT INTO `category` VALUES ('16', '4', '小米电视', null, '20170829/7f6f6119bc701a9d0f9ce4a8000db47f.jpg', null, null, '1503965907', '100', '1');

-- ----------------------------
-- Table structure for demand
-- ----------------------------
DROP TABLE IF EXISTS `demand`;
CREATE TABLE `demand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `name` varchar(30) DEFAULT NULL COMMENT '用户名',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `content` varchar(200) DEFAULT NULL COMMENT '需求',
  `addtime` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `state` tinyint(1) unsigned DEFAULT '0' COMMENT '状态0未处理 1已处理',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of demand
-- ----------------------------
INSERT INTO `demand` VALUES ('1', null, '低调的华丽', '13022731091', '烟台市芝罘区港城西大街', '请联系我，我需要装修', '1504080078', '1');

-- ----------------------------
-- Table structure for hcd_info
-- ----------------------------
DROP TABLE IF EXISTS `hcd_info`;
CREATE TABLE `hcd_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(100) DEFAULT NULL COMMENT '公司名',
  `company_en` varchar(100) DEFAULT NULL COMMENT '公司英文名',
  `comp` varchar(100) DEFAULT NULL COMMENT '公司简称',
  `comp_en` varchar(100) DEFAULT NULL COMMENT '公司简称英文',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `address_en` varchar(200) DEFAULT NULL COMMENT '英文地址',
  `jingwei` varchar(100) DEFAULT NULL COMMENT '坐标经纬度',
  `man` varchar(100) DEFAULT NULL COMMENT '联系人',
  `man_en` varchar(100) DEFAULT NULL COMMENT '联系人英文',
  `phone` varchar(100) DEFAULT NULL COMMENT '固话',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机',
  `logoimg` varchar(100) DEFAULT NULL COMMENT 'logo图片',
  `erweima` varchar(100) DEFAULT NULL COMMENT '二维码',
  `intro` text COMMENT '公司简介',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hcd_info
-- ----------------------------
INSERT INTO `hcd_info` VALUES ('1', '深圳市大脚机械有限公司', 'ShenZhen DaJiao', '大脚机械', 'Dajiao Jixie', '深圳市宝安25区前进一路华丰商务大厦315', 'ShenZhen', '113.734670,23.005360', '文小姐', 'DaJiao0', '0769-22272323', '13902695631', '20170705/588a73edb3f2ce47fefbb25e198ab5a7.jpg', '20170705/8515c00508a658c37958d2298dc994fd.jpg', '<p>大脚机械是深圳市德瑞发电机组联盟有限公司旗下的一款小程序，专注打造专业的机械生产、销售服务平台。</p><p><br/></p><p>此小程序作为演示，详情请联系：13902695631（文小姐）</p><p><br/></p><p><img src=\"/ueditor/php/upload/image/20170705/1499249275142241.jpg\" title=\"1499249275142241.jpg\" alt=\"basicprofile.jpg\"/></p><p><br/></p>');

-- ----------------------------
-- Table structure for hcd_user_copy
-- ----------------------------
DROP TABLE IF EXISTS `hcd_user_copy`;
CREATE TABLE `hcd_user_copy` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `openid` varchar(100) DEFAULT NULL COMMENT '微信openid',
  `wxname` varchar(100) DEFAULT NULL COMMENT '微信昵称',
  `name` varchar(100) DEFAULT NULL COMMENT '收货人姓名',
  `phone` varchar(100) DEFAULT NULL COMMENT '联系电话',
  `shname` varchar(50) DEFAULT NULL COMMENT '收货人姓名',
  `shphone` varchar(50) DEFAULT NULL COMMENT '收货人电话',
  `address` varchar(200) DEFAULT NULL COMMENT '收货地址',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '0删除1正常',
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hcd_user_copy
-- ----------------------------
INSERT INTO `hcd_user_copy` VALUES ('1', null, null, 'hcd', '13022731091', null, null, '深圳市龙华区', '1');

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL COMMENT '图片路径',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 来自本地，2 来自公网',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COMMENT='图片总表';

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', '/banner-1a.png', '1', null, null);
INSERT INTO `image` VALUES ('2', '/banner-2a.png', '1', null, null);
INSERT INTO `image` VALUES ('3', '/banner-3a.png', '1', null, null);
INSERT INTO `image` VALUES ('4', '/category-cake.png', '1', null, null);
INSERT INTO `image` VALUES ('5', '/category-vg.png', '1', null, null);
INSERT INTO `image` VALUES ('6', '/category-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('7', '/category-fry-a.png', '1', null, null);
INSERT INTO `image` VALUES ('8', '/category-tea.png', '1', null, null);
INSERT INTO `image` VALUES ('9', '/category-rice.png', '1', null, null);
INSERT INTO `image` VALUES ('10', '/product-dryfruit@1.png', '1', null, null);
INSERT INTO `image` VALUES ('13', '/product-vg@1.png', '1', null, null);
INSERT INTO `image` VALUES ('14', '/product-rice@6.png', '1', null, null);
INSERT INTO `image` VALUES ('16', '/1@theme.png', '1', null, null);
INSERT INTO `image` VALUES ('17', '/2@theme.png', '1', null, null);
INSERT INTO `image` VALUES ('18', '/3@theme.png', '1', null, null);
INSERT INTO `image` VALUES ('19', '/detail-1@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('20', '/detail-2@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('21', '/detail-3@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('22', '/detail-4@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('23', '/detail-5@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('24', '/detail-6@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('25', '/detail-7@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('26', '/detail-8@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('27', '/detail-9@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('28', '/detail-11@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('29', '/detail-10@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('31', '/product-rice@1.png', '1', null, null);
INSERT INTO `image` VALUES ('32', '/product-tea@1.png', '1', null, null);
INSERT INTO `image` VALUES ('33', '/product-dryfruit@2.png', '1', null, null);
INSERT INTO `image` VALUES ('36', '/product-dryfruit@3.png', '1', null, null);
INSERT INTO `image` VALUES ('37', '/product-dryfruit@4.png', '1', null, null);
INSERT INTO `image` VALUES ('38', '/product-dryfruit@5.png', '1', null, null);
INSERT INTO `image` VALUES ('39', '/product-dryfruit-a@6.png', '1', null, null);
INSERT INTO `image` VALUES ('40', '/product-dryfruit@7.png', '1', null, null);
INSERT INTO `image` VALUES ('41', '/product-rice@2.png', '1', null, null);
INSERT INTO `image` VALUES ('42', '/product-rice@3.png', '1', null, null);
INSERT INTO `image` VALUES ('43', '/product-rice@4.png', '1', null, null);
INSERT INTO `image` VALUES ('44', '/product-fry@1.png', '1', null, null);
INSERT INTO `image` VALUES ('45', '/product-fry@2.png', '1', null, null);
INSERT INTO `image` VALUES ('46', '/product-fry@3.png', '1', null, null);
INSERT INTO `image` VALUES ('47', '/product-tea@2.png', '1', null, null);
INSERT INTO `image` VALUES ('48', '/product-tea@3.png', '1', null, null);
INSERT INTO `image` VALUES ('49', '/1@theme-head.png', '1', null, null);
INSERT INTO `image` VALUES ('50', '/2@theme-head.png', '1', null, null);
INSERT INTO `image` VALUES ('51', '/3@theme-head.png', '1', null, null);
INSERT INTO `image` VALUES ('52', '/product-cake@1.png', '1', null, null);
INSERT INTO `image` VALUES ('53', '/product-cake@2.png', '1', null, null);
INSERT INTO `image` VALUES ('54', '/product-cake-a@3.png', '1', null, null);
INSERT INTO `image` VALUES ('55', '/product-cake-a@4.png', '1', null, null);
INSERT INTO `image` VALUES ('56', '/product-dryfruit@8.png', '1', null, null);
INSERT INTO `image` VALUES ('57', '/product-fry@4.png', '1', null, null);
INSERT INTO `image` VALUES ('58', '/product-fry@5.png', '1', null, null);
INSERT INTO `image` VALUES ('59', '/product-rice@5.png', '1', null, null);
INSERT INTO `image` VALUES ('60', '/product-rice@7.png', '1', null, null);
INSERT INTO `image` VALUES ('62', '/detail-12@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('63', '/detail-13@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('65', '/banner-4a.png', '1', null, null);
INSERT INTO `image` VALUES ('66', '/product-vg@4.png', '1', null, null);
INSERT INTO `image` VALUES ('67', '/product-vg@5.png', '1', null, null);
INSERT INTO `image` VALUES ('68', '/product-vg@2.png', '1', null, null);
INSERT INTO `image` VALUES ('69', '/product-vg@3.png', '1', null, null);

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(40) NOT NULL COMMENT '用户名',
  `passsalt` varchar(15) NOT NULL COMMENT '随机字符串，用来加密密码',
  `password` varchar(80) NOT NULL COMMENT '密码',
  `regtime` int(10) unsigned NOT NULL COMMENT '注册时间',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `logintimes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `truename` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `phone` varchar(20) DEFAULT NULL COMMENT '固定电话',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '3' COMMENT '用户状态 1已禁用 2待审核3正常',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('6', 'admin', 'u1yPvhJU', 'cae7d0e74cbef20a930dba1575f055ee', '1491805726', '0', '0', '管理员', '', '', '', '3');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `pid` int(10) unsigned DEFAULT NULL COMMENT '产品id',
  `uid` int(10) unsigned DEFAULT NULL COMMENT '购买者id',
  `number` varchar(100) DEFAULT NULL COMMENT '订单编号',
  `cost` varchar(30) DEFAULT NULL COMMENT '订单金额',
  `paymethod` varchar(100) DEFAULT NULL COMMENT '付款方式',
  `wxname` varchar(100) DEFAULT NULL COMMENT '买家昵称',
  `ordertime` int(10) unsigned DEFAULT NULL COMMENT '下单时间',
  `fktime` int(10) unsigned DEFAULT NULL COMMENT '付款时间',
  `shinfo` varchar(200) DEFAULT NULL COMMENT '收货信息',
  `fhtime` int(10) unsigned DEFAULT NULL COMMENT '发货时间',
  `kuaidi` varchar(200) DEFAULT NULL COMMENT '快递信息',
  `status` tinyint(2) unsigned DEFAULT '1' COMMENT '订单状态待付款1、待发货2、待收货3、已完成4、已关闭0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', null, null, '2121221', '600', '支付宝', '大脚', '1232323', null, null, null, '', '1');

-- ----------------------------
-- Table structure for order11
-- ----------------------------
DROP TABLE IF EXISTS `order11`;
CREATE TABLE `order11` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '外键，用户id，注意并不是openid',
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `total_price` decimal(6,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:未支付， 2：已支付，3：已发货 , 4: 已支付，但库存不足',
  `snap_img` varchar(255) DEFAULT NULL COMMENT '订单快照图片',
  `snap_name` varchar(80) DEFAULT NULL COMMENT '订单快照名称',
  `total_count` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) DEFAULT NULL,
  `snap_items` text COMMENT '订单其他信息快照（json)',
  `snap_address` varchar(500) DEFAULT NULL COMMENT '地址快照',
  `prepay_id` varchar(100) DEFAULT NULL COMMENT '订单微信支付的预订单id（用于发送模板消息）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order11
-- ----------------------------
INSERT INTO `order11` VALUES ('26', 'A723958082417959', '1', null, '1500795808', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500795808', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('27', 'A723958496991698', '1', null, '1500795849', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500795849', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('28', 'A723142604852027', '1', null, '1500814260', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500814260', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('29', 'A723143330983586', '1', null, '1500814333', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500814333', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('30', 'A723143516114142', '1', null, '1500814351', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500814351', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('31', 'A723145055372299', '1', null, '1500814505', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500814505', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('32', 'A723145071813178', '1', null, '1500814507', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500814507', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('33', 'A723145646756038', '1', null, '1500814564', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500814564', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('34', 'A723145889319902', '1', null, '1500814588', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500814588', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('35', 'A723145946423113', '1', null, '1500814594', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500814594', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('36', 'A723146469673163', '1', null, '1500814646', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500814646', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('37', 'A723149639864431', '1', null, '1500814963', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500814963', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('38', 'A723150835682869', '1', null, '1500815083', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500815083', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('39', 'A723151616237471', '1', null, '1500815161', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500815161', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('40', 'A723155363431865', '1', null, '1500815536', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500815536', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('41', 'A723155764254761', '1', null, '1500815576', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500815576', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('42', 'A723156098323803', '1', null, '1500815609', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500815609', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('43', 'A723156179408447', '1', null, '1500815617', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500815617', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('44', 'A723156622553820', '1', null, '1500815662', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500815662', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('45', 'A723162008741801', '1', null, '1500816200', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500816200', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('46', 'A723162766355286', '1', null, '1500816276', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500816276', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('47', 'A723165037325130', '1', null, '1500816503', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500816503', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('48', 'A723170893200083', '1', null, '1500817089', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500817089', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('49', 'A723170973404669', '1', null, '1500817097', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500817097', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('50', 'A723171089271264', '1', null, '1500817108', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500817108', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('51', 'A723171716407102', '1', null, '1500817171', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500817171', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('52', 'A723171944990254', '1', null, '1500817194', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500817194', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('53', 'A723172308721014', '1', null, '1500817230', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500817230', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('54', 'A723173164959937', '1', null, '1500817316', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500817316', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('55', 'A723173650567757', '1', null, '1500817364', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500817364', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('56', 'A723188019679631', '1', null, '1500818801', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500818801', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('57', 'A723188406841734', '1', null, '1500818840', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500818840', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('58', 'A723188754851663', '1', null, '1500818875', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500818875', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('59', 'A723188968953966', '1', null, '1500818896', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500818896', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('60', 'A723190741735347', '1', null, '1500819074', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500819074', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('61', 'A723191146918575', '1', null, '1500819114', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500819114', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('62', 'A723192276383153', '1', null, '1500819227', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500819227', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('63', 'A723192420301352', '1', null, '1500819241', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500819241', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('64', 'A724271590829698', '1', null, '1500827158', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500827158', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('65', 'A724272384195009', '1', null, '1500827238', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500827238', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('66', 'A724272709593694', '1', null, '1500827270', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500827270', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('67', 'A724273445765719', '1', null, '1500827344', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500827344', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('68', 'A724273944874202', '1', null, '1500827394', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500827394', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('69', 'A724274526867546', '1', null, '1500827452', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500827452', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('70', 'A724274645254330', '1', null, '1500827464', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500827464', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('71', 'A724275047637371', '1', null, '1500827504', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500827504', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('72', 'A724275553276223', '1', null, '1500827555', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500827555', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('73', 'A724277635545320', '1', null, '1500827763', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500827763', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('74', 'A724278729647932', '1', null, '1500827872', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500827872', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('75', 'A724279924556240', '1', null, '1500827992', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500827992', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('76', 'A724280143058796', '1', null, '1500828014', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500828014', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('77', 'A724280224793478', '1', null, '1500828022', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500828022', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('78', 'A724284735391410', '1', null, '1500828473', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500828473', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('79', 'A724308129469549', '1', null, '1500830812', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500830812', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('80', 'A724308876632206', '1', null, '1500830887', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500830887', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('81', 'A724310021167717', '1', null, '1500831002', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500831002', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('82', 'A724310481974023', '1', null, '1500831048', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500831048', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('83', 'A724310505955468', '1', null, '1500831050', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500831050', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('84', 'A724310647013586', '1', null, '1500831064', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500831064', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', '');
INSERT INTO `order11` VALUES ('85', 'A724317401589850', '1', null, '1500831740', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500831740', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('86', 'A724318472791157', '1', null, '1500831847', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500831847', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('87', 'A724321918678232', '1', null, '1500832191', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500832191', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('88', 'A724322467899624', '1', null, '1500832246', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500832246', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('89', 'A724322652450128', '1', null, '1500832265', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500832265', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('90', 'A724322937626485', '1', null, '1500832293', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500832293', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('91', 'A724324615262411', '1', null, '1500832461', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500832461', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('92', 'A724327488076704', '1', null, '1500832748', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500832748', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('93', 'A724327801924752', '1', null, '1500832780', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500832780', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('94', 'A724328032617901', '1', null, '1500832803', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500832803', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx201707240203560c983697ff0766874746');
INSERT INTO `order11` VALUES ('95', 'A724328134923726', '1', null, '1500832813', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500832813', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx201707240204443504ca5f040829918818');
INSERT INTO `order11` VALUES ('96', 'A724329640099866', '1', null, '1500832963', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500832963', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx20170724020636d2f1527a7a0754377843');
INSERT INTO `order11` VALUES ('97', 'A724329987829733', '1', null, '1500832998', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500832998', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx201707240207118ec4df72570851646786');
INSERT INTO `order11` VALUES ('98', 'A724377339546448', '1', null, '1500837733', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500837733', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx2017072403260643a7609da30488034580');
INSERT INTO `order11` VALUES ('99', 'A724814277454046', '1', null, '1500881427', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500881427', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx20170724153421abf46ec51e0109361190');
INSERT INTO `order11` VALUES ('100', 'A724897218747912', '1', null, '1500889721', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500889721', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx20170724175235ff276dcfed0001401593');
INSERT INTO `order11` VALUES ('101', 'A724900977092954', '1', null, '1500890097', '0.05', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '5', '1500890097', '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx20170724175851f56e4861050705825910');
INSERT INTO `order11` VALUES ('102', 'A724903378020283', '1', null, '1500890337', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1500890337', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx201707241802516d008b9f540915678341');
INSERT INTO `order11` VALUES ('103', 'A724905827450312', '1', null, '1500890582', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1500890582', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"qiyue\",\"mobile\":\"15209583253\",\"province\":\"\\u827e\\u6cfd\\u62c9d\\u65af\",\"city\":\"\\u66b4\\u98ce\\u57ce\",\"country\":\"\\u95ea\\u91d1\\u9547\",\"detail\":\"\\u5931\\u671b\\u4e4b\\u65c5\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx2017072418065621479608eb0009482488');
INSERT INTO `order11` VALUES ('104', 'A807620058788480', '1', null, '1502062005', '0.05', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '5', '1502062005', '[{\"id\":2,\"haveStock\":true,\"count\":5,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.05}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('105', 'A807620105051079', '1', null, '1502062010', '0.05', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '5', '1502062010', '[{\"id\":2,\"haveStock\":true,\"count\":5,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.05}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('106', 'A807620130942522', '1', null, '1502062013', '0.05', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '5', '1502062013', '[{\"id\":2,\"haveStock\":true,\"count\":5,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.05}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('107', 'A807620304222464', '1', null, '1502062030', '0.05', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '5', '1502062030', '[{\"id\":2,\"haveStock\":true,\"count\":5,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.05}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('108', 'A807620358095595', '1', null, '1502062035', '0.05', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '5', '1502062035', '[{\"id\":2,\"haveStock\":true,\"count\":5,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.05}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('109', 'A807620846743531', '1', null, '1502062084', '0.05', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '5', '1502062084', '[{\"id\":2,\"haveStock\":true,\"count\":5,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.05}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('110', 'A807621032864177', '1', null, '1502062103', '0.05', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '5', '1502062103', '[{\"id\":2,\"haveStock\":true,\"count\":5,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.05}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('111', 'A807621060525725', '1', null, '1502062105', '0.05', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '5', '1502062105', '[{\"id\":2,\"haveStock\":true,\"count\":5,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.05}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('112', 'A807621122199297', '1', null, '1502062112', '0.05', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '5', '1502062112', '[{\"id\":2,\"haveStock\":true,\"count\":5,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.05}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('113', 'A807621163931699', '1', null, '1502062116', '0.05', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '5', '1502062116', '[{\"id\":2,\"haveStock\":true,\"count\":5,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.05}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('114', 'A807622003499699', '1', null, '1502062200', '0.05', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '5', '1502062200', '[{\"id\":2,\"haveStock\":true,\"count\":5,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.05}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('115', 'A807622617724809', '1', null, '1502062261', '0.06', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个等', '6', '1502062261', '[{\"id\":2,\"haveStock\":true,\"count\":5,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.05},{\"id\":9,\"haveStock\":true,\"count\":1,\"name\":\"\\u51ac\\u6728\\u7ea2\\u67a3 500\\u514b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('116', 'A807623801492564', '1', null, '1502062380', '0.06', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个等', '6', '1502062380', '[{\"id\":2,\"haveStock\":true,\"count\":5,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.05},{\"id\":9,\"haveStock\":true,\"count\":1,\"name\":\"\\u51ac\\u6728\\u7ea2\\u67a3 500\\u514b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('117', 'A807624025275341', '1', null, '1502062402', '0.01', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502062402', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('118', 'A807631627960174', '1', null, '1502063162', '10.01', '1', 'http://my.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1502063162', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":10},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx2017080707500538101ddfd80859578392');
INSERT INTO `order11` VALUES ('119', 'A807631829761718', '1', null, '1502063182', '0.01', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502063182', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('120', 'A809738816209367', '1', null, '1502273881', '0.01', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502273881', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('121', 'A809738829380098', '1', null, '1502273882', '0.01', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502273882', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('122', 'A809738834980330', '1', null, '1502273883', '0.01', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502273883', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('123', 'A809738864902085', '1', null, '1502273886', '0.01', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502273886', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order11` VALUES ('124', 'A809764344339420', '1', null, '1502276434', '0.01', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502276434', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx201708091904388abe8d80480957935975');
INSERT INTO `order11` VALUES ('125', 'A809764362300498', '1', null, '1502276436', '0.01', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502276436', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx20170809190439968404841a0773023498');
INSERT INTO `order11` VALUES ('126', 'A809764936903344', '1', null, '1502276493', '0.01', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502276493', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx201708091905369445ff10b50675504450');
INSERT INTO `order11` VALUES ('127', 'A809769937869317', '1', null, '1502276993', '0.01', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502276993', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx20170809191356bf42dab1ff0203448378');
INSERT INTO `order11` VALUES ('128', 'A810037040651062', '1', null, '1502303703', '0.01', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502303703', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx2017081002390731f55d3bf90026214732');
INSERT INTO `order11` VALUES ('129', 'A810039628719102', '1', null, '1502303962', '0.01', '1', 'http://my.cn/images/product-dryfruit-a@6.png', '贵妃笑 100克', '1', '1502303962', '[{\"id\":11,\"haveStock\":true,\"count\":1,\"name\":\"\\u8d35\\u5983\\u7b11 100\\u514b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx20170810024326481f99477d0794777310');
INSERT INTO `order11` VALUES ('130', 'A810040059033742', '1', null, '1502304005', '0.01', '1', 'http://my.cn/images/product-cake@2.png', '小红的猪耳朵 120克', '1', '1502304005', '[{\"id\":6,\"haveStock\":true,\"count\":1,\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx20170810024409d1d6a177370251643582');
INSERT INTO `order11` VALUES ('131', 'A810041604182184', '1', null, '1502304160', '0.01', '1', 'http://my.cn/images/product-cake@2.png', '小红的猪耳朵 120克', '1', '1502304160', '[{\"id\":6,\"haveStock\":true,\"count\":1,\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx201708100246443213d19d520261677402');
INSERT INTO `order11` VALUES ('132', 'A810042155023637', '1', null, '1502304215', '0.01', '1', 'http://my.cn/images/product-cake@2.png', '小红的猪耳朵 120克', '1', '1502304215', '[{\"id\":6,\"haveStock\":true,\"count\":1,\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx20170810024739d8109a14db0207935178');
INSERT INTO `order11` VALUES ('133', 'A810042857333738', '1', null, '1502304285', '0.01', '1', 'http://my.cn/images/product-cake@2.png', '小红的猪耳朵 120克', '1', '1502304285', '[{\"id\":6,\"haveStock\":true,\"count\":1,\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx20170810024849b01dd561140064971295');
INSERT INTO `order11` VALUES ('134', 'A810063782230619', '1', null, '1502306378', '0.01', '1', 'http://my.cn/images/product-cake@2.png', '小红的猪耳朵 120克', '1', '1502306378', '[{\"id\":6,\"haveStock\":true,\"count\":1,\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx20170810032341f33eda21450348648794');
INSERT INTO `order11` VALUES ('135', 'A810064923665958', '1', null, '1502306492', '0.01', '1', 'http://my.cn/images/product-dryfruit@2.png', '春生龙眼 500克', '1', '1502306492', '[{\"id\":5,\"haveStock\":true,\"count\":1,\"name\":\"\\u6625\\u751f\\u9f99\\u773c 500\\u514b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx20170810032535a12991d8330146396777');
INSERT INTO `order11` VALUES ('136', 'A810068646038848', '1', null, '1502306864', '0.01', '1', 'http://my.cn/images/product-dryfruit-a@6.png', '贵妃笑 100克', '1', '1502306864', '[{\"id\":11,\"haveStock\":true,\"count\":1,\"name\":\"\\u8d35\\u5983\\u7b11 100\\u514b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx20170810033147033188a6bd0455332446');
INSERT INTO `order11` VALUES ('137', 'A810069651526356', '1', null, '1502306965', '0.01', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502306965', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx20170810033328a8b2c8c8cd0664816423');
INSERT INTO `order11` VALUES ('138', 'A810129593374806', '1', null, '1502312959', '10.01', '1', 'http://my.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1502312959', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01},{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":10}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx201708100513225c01a6c3820970672496');
INSERT INTO `order11` VALUES ('139', 'A810130174878065', '1', null, '1502313017', '0.01', '1', 'http://my.cn/images/product-cake@2.png', '小红的猪耳朵 120克', '1', '1502313017', '[{\"id\":6,\"haveStock\":true,\"count\":1,\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx20170810051420d679fe19f00609521264');
INSERT INTO `order11` VALUES ('140', 'A810133991116306', '1', null, '1502313399', '0.01', '1', 'http://my.cn/images/product-cake@2.png', '小红的猪耳朵 120克', '1', '1502313399', '[{\"id\":6,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx20170810052042d3ae7631a90896074765');
INSERT INTO `order11` VALUES ('141', 'A810134332335846', '1', null, '1502313433', '0.01', '1', 'http://my.cn/images/product-cake@2.png', '小红的猪耳朵 120克', '1', '1502313433', '[{\"id\":6,\"haveStock\":true,\"counts\":0,\"price\":\"0.01\",\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01,\"count\":1}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx201708100521163857ed09100270533238');
INSERT INTO `order11` VALUES ('142', 'A810135820911066', '1', null, '1502313582', '0.01', '1', 'http://my.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502313582', '[{\"id\":10,\"haveStock\":true,\"counts\":1,\"price\":\"0.01\",\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-dryfruit@5.png\"}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx201708100523459e6aa069ee0368141688');
INSERT INTO `order11` VALUES ('143', 'A810136870681039', '1', null, '1502313686', '0.08', '1', 'http://my.cn/images/product-vg@2.png', '泥蒿 半斤等', '8', '1502313686', '[{\"id\":7,\"haveStock\":true,\"counts\":1,\"price\":\"0.01\",\"name\":\"\\u6ce5\\u84bf \\u534a\\u65a4\",\"totalPrice\":0.01,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-vg@2.png\"},{\"id\":8,\"haveStock\":true,\"counts\":4,\"price\":\"0.01\",\"name\":\"\\u590f\\u65e5\\u8292\\u679c 3\\u4e2a\",\"totalPrice\":0.04,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-dryfruit@3.png\"},{\"id\":11,\"haveStock\":true,\"counts\":3,\"price\":\"0.01\",\"name\":\"\\u8d35\\u5983\\u7b11 100\\u514b\",\"totalPrice\":0.03,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-dryfruit-a@6.png\"}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx201708100525304f0e66400a0843966165');
INSERT INTO `order11` VALUES ('144', 'A810139930586051', '1', null, '1502313992', '0.01', '1', 'http://my.cn/images/product-rice@2.png', '绿豆 125克', '1', '1502313992', '[{\"id\":13,\"haveStock\":true,\"counts\":1,\"price\":\"0.01\",\"name\":\"\\u7eff\\u8c46 125\\u514b\",\"totalPrice\":0.01,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-rice@2.png\"}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx201708100530365b53cdec3b0719854305');
INSERT INTO `order11` VALUES ('145', 'A813672517425260', '1', null, '1502567251', '0.01', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502567251', '[{\"id\":2,\"haveStock\":true,\"counts\":1,\"price\":\"0.01\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-dryfruit@1.png\"}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx20170813035136467fe81f3a0212054395');
INSERT INTO `order11` VALUES ('146', 'A813676894435558', '1', null, '1502567689', '0.01', '1', 'http://my.cn/images/product-rice@1.png', '素米 327克', '1', '1502567689', '[{\"id\":3,\"haveStock\":true,\"counts\":1,\"price\":\"0.01\",\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"totalPrice\":0.01,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-rice@1.png\"}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx20170813035854ebd7b7d65f0400240712');
INSERT INTO `order11` VALUES ('147', 'A814608124514964', '1', null, '1502660812', '10.00', '1', 'http://my.cn/images/product-vg@1.png', '芹菜 半斤', '1', '1502660812', '[{\"id\":1,\"haveStock\":true,\"counts\":1,\"price\":\"10.00\",\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":10,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-vg@1.png\"}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx20170814055058c3aabef2f90406306623');
INSERT INTO `order11` VALUES ('148', 'A815380238296263', '1', null, '1502738023', '0.01', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502738023', '[{\"id\":2,\"haveStock\":true,\"counts\":1,\"price\":\"0.01\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-dryfruit@1.png\"}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx201708150317512d9acec0450779135233');
INSERT INTO `order11` VALUES ('149', 'A815380907894561', '1', null, '1502738090', '0.02', '1', 'http://my.cn/images/product-rice@1.png', '素米 327克等', '2', '1502738090', '[{\"id\":3,\"haveStock\":true,\"counts\":1,\"price\":\"0.01\",\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"totalPrice\":0.01,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-rice@1.png\"},{\"id\":8,\"haveStock\":true,\"counts\":1,\"price\":\"0.01\",\"name\":\"\\u590f\\u65e5\\u8292\\u679c 3\\u4e2a\",\"totalPrice\":0.01,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-dryfruit@3.png\"}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx2017081503185886c1cfbb3d0263330214');
INSERT INTO `order11` VALUES ('150', 'A815381125447035', '1', null, '1502738112', '0.01', '1', 'http://my.cn/images/product-dryfruit@3.png', '夏日芒果 3个', '1', '1502738112', '[{\"id\":8,\"haveStock\":true,\"counts\":1,\"price\":\"0.01\",\"name\":\"\\u590f\\u65e5\\u8292\\u679c 3\\u4e2a\",\"totalPrice\":0.01,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-dryfruit@3.png\"}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx201708150319199afb8546500249680556');
INSERT INTO `order11` VALUES ('151', 'A815422106500901', '1', null, '1502742210', '0.01', '1', 'http://my.cn/images/product-cake@2.png', '小红的猪耳朵 120克', '1', '1502742210', '[{\"id\":6,\"haveStock\":true,\"counts\":1,\"price\":\"0.01\",\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-cake@2.png\"}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx201708150427374b5b4a29fb0653362621');
INSERT INTO `order11` VALUES ('152', 'A815426499142212', '1', null, '1502742649', '0.03', '1', 'http://my.cn/images/product-vg@2.png', '泥蒿 半斤等', '3', '1502742649', '[{\"id\":7,\"haveStock\":true,\"counts\":1,\"price\":\"0.01\",\"name\":\"\\u6ce5\\u84bf \\u534a\\u65a4\",\"totalPrice\":0.01,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-vg@2.png\"},{\"id\":11,\"haveStock\":true,\"counts\":1,\"price\":\"0.01\",\"name\":\"\\u8d35\\u5983\\u7b11 100\\u514b\",\"totalPrice\":0.01,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-dryfruit-a@6.png\"},{\"id\":14,\"haveStock\":true,\"counts\":1,\"price\":\"0.01\",\"name\":\"\\u829d\\u9ebb 50\\u514b\",\"totalPrice\":0.01,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-rice@3.png\"}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx201708150434572a8defd87c0535323504');
INSERT INTO `order11` VALUES ('153', 'A815445304857857', '1', null, '1502744530', '0.02', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个等', '2', '1502744530', '[{\"id\":9,\"haveStock\":true,\"counts\":1,\"price\":\"0.01\",\"name\":\"\\u51ac\\u6728\\u7ea2\\u67a3 500\\u514b\",\"totalPrice\":0.01,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-dryfruit@4.png\"},{\"id\":2,\"haveStock\":true,\"counts\":1,\"price\":\"0.01\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-dryfruit@1.png\"}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx201708150522272e71ebeb910378497986');
INSERT INTO `order11` VALUES ('154', 'A815844709219099', '1', null, '1502784470', '0.01', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502784470', '[{\"id\":2,\"haveStock\":true,\"counts\":1,\"price\":\"0.01\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-dryfruit@1.png\"}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx2017081516115877f1321e670282353487');
INSERT INTO `order11` VALUES ('155', 'A815849193295546', '1', null, '1502784919', '0.01', '1', 'http://my.cn/images/product-tea@1.png', '红袖枸杞 6克*3袋', '1', '1502784919', '[{\"id\":4,\"haveStock\":true,\"counts\":1,\"price\":\"0.01\",\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-tea@1.png\"}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx201708151619270524304c5d0205930483');
INSERT INTO `order11` VALUES ('156', 'A815852501504715', '1', null, '1502785250', '0.02', '1', 'http://my.cn/images/product-cake@2.png', '小红的猪耳朵 120克', '2', '1502785250', '[{\"id\":6,\"haveStock\":true,\"counts\":2,\"price\":\"0.01\",\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.02,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-cake@2.png\"}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx20170815162457c2ebbfc05e0774959505');
INSERT INTO `order11` VALUES ('157', 'A815856391707218', '1', null, '1502785639', '0.01', '1', 'http://my.cn/images/product-rice@1.png', '素米 327克', '1', '1502785639', '[{\"id\":3,\"haveStock\":true,\"counts\":1,\"price\":\"0.01\",\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"totalPrice\":0.01,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-rice@1.png\"}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx201708151631261292d8bc7e0655627475');
INSERT INTO `order11` VALUES ('158', 'A817291407999001', '1', null, '1502929140', '0.01', '1', 'http://my.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502929140', '[{\"id\":2,\"haveStock\":true,\"counts\":1,\"price\":\"0.01\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01,\"main_img_url\":\"http:\\/\\/my.cn\\/images\\/product-dryfruit@1.png\"}]', '{\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx2017081708230981e0ce222f0235021976');

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `order_id` int(11) NOT NULL COMMENT '联合主键，订单id',
  `product_id` int(11) NOT NULL COMMENT '联合主键，商品id',
  `count` int(11) NOT NULL COMMENT '商品数量',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order_product
-- ----------------------------
INSERT INTO `order_product` VALUES ('26', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('27', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('28', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('29', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('30', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('31', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('32', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('33', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('34', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('35', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('36', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('37', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('38', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('39', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('40', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('41', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('42', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('43', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('44', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('45', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('46', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('47', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('48', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('49', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('50', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('51', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('52', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('53', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('54', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('55', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('56', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('57', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('58', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('59', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('60', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('61', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('62', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('63', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('64', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('65', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('66', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('67', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('68', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('69', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('70', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('71', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('72', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('73', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('74', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('75', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('76', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('77', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('78', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('79', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('80', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('81', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('82', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('83', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('84', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('85', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('86', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('87', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('88', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('89', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('90', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('91', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('92', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('93', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('94', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('95', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('96', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('97', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('98', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('99', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('100', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('101', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('102', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('103', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('118', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('138', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('147', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('26', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('27', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('28', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('29', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('30', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('31', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('32', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('33', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('34', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('35', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('36', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('37', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('38', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('39', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('40', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('41', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('42', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('43', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('44', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('45', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('46', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('47', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('48', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('49', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('50', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('51', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('52', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('53', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('54', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('55', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('56', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('57', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('58', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('59', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('60', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('61', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('62', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('63', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('64', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('65', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('66', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('67', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('68', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('69', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('70', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('71', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('72', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('73', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('74', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('75', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('76', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('77', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('78', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('79', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('80', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('81', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('82', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('83', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('84', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('85', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('86', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('87', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('88', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('89', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('90', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('91', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('92', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('93', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('94', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('95', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('96', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('97', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('98', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('99', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('100', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('101', '2', '3', null, null);
INSERT INTO `order_product` VALUES ('102', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('103', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('104', '2', '5', null, null);
INSERT INTO `order_product` VALUES ('105', '2', '5', null, null);
INSERT INTO `order_product` VALUES ('106', '2', '5', null, null);
INSERT INTO `order_product` VALUES ('107', '2', '5', null, null);
INSERT INTO `order_product` VALUES ('108', '2', '5', null, null);
INSERT INTO `order_product` VALUES ('109', '2', '5', null, null);
INSERT INTO `order_product` VALUES ('110', '2', '5', null, null);
INSERT INTO `order_product` VALUES ('111', '2', '5', null, null);
INSERT INTO `order_product` VALUES ('112', '2', '5', null, null);
INSERT INTO `order_product` VALUES ('113', '2', '5', null, null);
INSERT INTO `order_product` VALUES ('114', '2', '5', null, null);
INSERT INTO `order_product` VALUES ('115', '2', '5', null, null);
INSERT INTO `order_product` VALUES ('116', '2', '5', null, null);
INSERT INTO `order_product` VALUES ('117', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('118', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('119', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('120', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('121', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('122', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('123', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('124', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('125', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('126', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('127', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('128', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('137', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('138', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('145', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('148', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('153', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('154', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('158', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('146', '3', '1', null, null);
INSERT INTO `order_product` VALUES ('149', '3', '1', null, null);
INSERT INTO `order_product` VALUES ('157', '3', '1', null, null);
INSERT INTO `order_product` VALUES ('155', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('135', '5', '1', null, null);
INSERT INTO `order_product` VALUES ('130', '6', '1', null, null);
INSERT INTO `order_product` VALUES ('131', '6', '1', null, null);
INSERT INTO `order_product` VALUES ('132', '6', '1', null, null);
INSERT INTO `order_product` VALUES ('133', '6', '1', null, null);
INSERT INTO `order_product` VALUES ('134', '6', '1', null, null);
INSERT INTO `order_product` VALUES ('139', '6', '1', null, null);
INSERT INTO `order_product` VALUES ('140', '6', '1', null, null);
INSERT INTO `order_product` VALUES ('141', '6', '1', null, null);
INSERT INTO `order_product` VALUES ('151', '6', '1', null, null);
INSERT INTO `order_product` VALUES ('156', '6', '2', null, null);
INSERT INTO `order_product` VALUES ('143', '7', '1', null, null);
INSERT INTO `order_product` VALUES ('152', '7', '1', null, null);
INSERT INTO `order_product` VALUES ('143', '8', '4', null, null);
INSERT INTO `order_product` VALUES ('149', '8', '1', null, null);
INSERT INTO `order_product` VALUES ('150', '8', '1', null, null);
INSERT INTO `order_product` VALUES ('115', '9', '1', null, null);
INSERT INTO `order_product` VALUES ('116', '9', '1', null, null);
INSERT INTO `order_product` VALUES ('153', '9', '1', null, null);
INSERT INTO `order_product` VALUES ('142', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('129', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('136', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('143', '11', '3', null, null);
INSERT INTO `order_product` VALUES ('152', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('144', '13', '1', null, null);
INSERT INTO `order_product` VALUES ('152', '14', '1', null, null);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned DEFAULT NULL COMMENT '商家id',
  `name` varchar(80) NOT NULL COMMENT '商品名称',
  `desc` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `price` decimal(6,2) NOT NULL COMMENT '价格,单位：分',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存量',
  `sold` int(10) unsigned DEFAULT '0' COMMENT '售出数量',
  `delete_time` int(11) DEFAULT NULL,
  `catid` int(11) DEFAULT NULL,
  `main_img_url` varchar(255) DEFAULT NULL COMMENT '主图ID号，这是一个反范式设计，有一定的冗余',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '图片来自 1 本地 ，2公网',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL,
  `summary` varchar(50) DEFAULT NULL COMMENT '摘要',
  `img_id` int(11) DEFAULT NULL COMMENT '图片外键',
  `content` text CHARACTER SET utf8 COMMENT '产品详情',
  `state` tinyint(1) unsigned DEFAULT '1' COMMENT '1上架0下架',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态1正常0已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '2', '芹菜 半斤', null, '10.00', '984', null, null, '3', '/product-vg@1.png', '1', null, null, null, '13', null, '1', '1');
INSERT INTO `product` VALUES ('2', '2', '梨花带雨 3个', null, '0.01', '984', null, null, '2', '/product-dryfruit@1.png', '1', null, null, null, '10', null, '1', '1');
INSERT INTO `product` VALUES ('3', '2', '素米 327克', null, '0.01', '996', null, null, '7', '/product-rice@1.png', '1', null, null, null, '31', null, '1', '1');
INSERT INTO `product` VALUES ('4', '2', '红袖枸杞 6克*3袋', null, '0.01', '998', null, null, '6', '/product-tea@1.png', '1', null, null, null, '32', null, '1', '1');
INSERT INTO `product` VALUES ('5', '2', '春生龙眼 500克', null, '0.01', '995', null, null, '2', '/product-dryfruit@2.png', '1', null, null, null, '33', null, '1', '1');
INSERT INTO `product` VALUES ('6', '2', '小红的猪耳朵 120克', null, '0.01', '997', null, null, '5', '/product-cake@2.png', '1', null, null, null, '53', null, '1', '1');
INSERT INTO `product` VALUES ('7', '2', '泥蒿 半斤', null, '0.01', '998', null, null, '3', '/product-vg@2.png', '1', null, null, null, '68', null, '1', '1');
INSERT INTO `product` VALUES ('8', '2', '夏日芒果 3个', null, '0.01', '995', null, null, '2', '/product-dryfruit@3.png', '1', null, null, null, '36', null, '1', '1');
INSERT INTO `product` VALUES ('9', '2', '冬木红枣 500克', null, '0.01', '996', null, null, '2', '/product-dryfruit@4.png', '1', null, null, null, '37', null, '1', '1');
INSERT INTO `product` VALUES ('10', '2', '万紫千凤梨 300克', null, '0.01', '996', null, null, '2', '/product-dryfruit@5.png', '1', null, null, null, '38', null, '1', '1');
INSERT INTO `product` VALUES ('11', '2', '贵妃笑 100克', null, '0.01', '994', null, null, '2', '/product-dryfruit-a@6.png', '1', null, null, null, '39', null, '1', '1');
INSERT INTO `product` VALUES ('12', '2', '珍奇异果 3个', null, '0.01', '999', null, null, '2', '/product-dryfruit@7.png', '1', null, null, null, '40', null, '1', '1');
INSERT INTO `product` VALUES ('13', '2', '绿豆 125克', null, '0.01', '999', null, null, '7', '/product-rice@2.png', '1', null, null, null, '41', null, '1', '1');
INSERT INTO `product` VALUES ('14', '2', '芝麻 50克', null, '0.01', '999', null, null, '7', '/product-rice@3.png', '1', null, null, null, '42', null, '1', '1');
INSERT INTO `product` VALUES ('15', '2', '猴头菇 370克', null, '0.01', '999', null, null, '7', '/product-rice@4.png', '1', null, null, null, '43', null, '1', '1');
INSERT INTO `product` VALUES ('16', '2', '西红柿 1斤', null, '0.01', '999', null, null, '3', '/product-vg@3.png', '1', null, null, null, '69', null, '1', '1');
INSERT INTO `product` VALUES ('17', '2', '油炸花生 300克', null, '0.01', '999', null, null, '4', '/product-fry@1.png', '1', null, null, null, '44', null, '1', '1');
INSERT INTO `product` VALUES ('18', '2', '春泥西瓜子 128克', null, '0.01', '997', null, null, '4', '/product-fry@2.png', '1', null, null, null, '45', null, '1', '1');
INSERT INTO `product` VALUES ('19', '2', '碧水葵花籽 128克', null, '0.01', '999', null, null, '4', '/product-fry@3.png', '1', null, null, null, '46', null, '1', '1');
INSERT INTO `product` VALUES ('20', '2', '碧螺春 12克*3袋', null, '0.01', '999', null, null, '6', '/product-tea@2.png', '1', null, null, null, '47', null, '1', '1');
INSERT INTO `product` VALUES ('21', '2', '西湖龙井 8克*3袋', null, '0.01', '998', null, null, '6', '/product-tea@3.png', '1', null, null, null, '48', null, '1', '1');
INSERT INTO `product` VALUES ('22', '2', '梅兰清花糕 1个', null, '0.01', '997', null, null, '5', '/product-cake-a@3.png', '1', null, null, null, '54', null, '1', '1');
INSERT INTO `product` VALUES ('23', '2', '清凉薄荷糕 1个', null, '0.01', '998', null, null, '5', '/product-cake-a@4.png', '1', null, null, null, '55', null, '1', '1');
INSERT INTO `product` VALUES ('25', '2', '小明的妙脆角 120克', null, '0.01', '999', null, null, '5', '/product-cake@1.png', '1', null, null, null, '52', null, '1', '1');
INSERT INTO `product` VALUES ('26', '2', '红衣青瓜 混搭160克', null, '0.01', '999', null, null, '2', '/product-dryfruit@8.png', '1', null, null, null, '56', null, '1', '1');
INSERT INTO `product` VALUES ('27', '2', '锈色瓜子 100克', null, '0.01', '998', null, null, '4', '/product-fry@4.png', '1', null, null, null, '57', null, '1', '1');
INSERT INTO `product` VALUES ('28', '2', '春泥花生 200克', null, '0.01', '999', null, null, '4', '/product-fry@5.png', '1', null, null, null, '58', null, '1', '1');
INSERT INTO `product` VALUES ('29', '2', '冰心鸡蛋 2个', null, '0.01', '999', null, null, '7', '/product-rice@5.png', '1', null, null, null, '59', null, '1', '1');
INSERT INTO `product` VALUES ('30', '2', '八宝莲子 200克', null, '0.01', '999', null, null, '7', '/product-rice@6.png', '1', null, null, null, '14', null, '1', '1');
INSERT INTO `product` VALUES ('31', '2', '深涧木耳 78克', null, '0.01', '999', null, null, '7', '/product-rice@7.png', '1', null, null, null, '60', null, '1', '1');
INSERT INTO `product` VALUES ('32', '2', '土豆 半斤', null, '0.01', '999', null, null, '3', '/product-vg@4.png', '1', null, null, null, '66', null, '1', '1');
INSERT INTO `product` VALUES ('33', '2', '青椒 半斤', null, '0.01', '999', null, null, '3', '/product-vg@5.png', '1', null, null, null, '67', null, '1', '1');
INSERT INTO `product` VALUES ('34', '2', '测试产品11', '极品产品', '100.00', '999', '21', null, '2', null, '1', '1503136668', null, null, null, '<p>产品详情说明</p><p>哈哈哈</p><p><br/></p><p>\r\n						</p>', '1', '1');
INSERT INTO `product` VALUES ('35', '2', '坚果pro 64G', '64g 双卡双待', '1799.00', '999', '0', null, '9', null, '1', '1503305578', null, null, null, '<p>就是好看！</p>', '1', '1');
INSERT INTO `product` VALUES ('36', '2', '锤子T1手机11', '经典就是漂亮!', '3200.00', '777', '111', null, '12', null, '1', '1503305690', null, null, null, '<p>121212</p><p>\r\n						</p>', '1', '1');
INSERT INTO `product` VALUES ('37', '4', '小米mix', '全面屏概念手机', '2699.00', '999', '145', null, '14', null, '1', '1503965967', null, null, null, '<p>产品详情<br/></p>', '1', '1');
INSERT INTO `product` VALUES ('38', '4', '小米note2', '双曲面手机', '2499.00', '888', '111', null, '14', null, '1', '1503966048', null, null, null, '<p>113131<br/></p>', '1', '1');
INSERT INTO `product` VALUES ('39', '4', '红米note4A', '超高性价比', '899.00', '777', '111', null, '15', null, '1', '1503966108', null, null, null, '<p>33333<br/></p>', '1', '1');
INSERT INTO `product` VALUES ('40', '4', '小米电视4', '大屏幕就是爽', '4999.00', '888', '111', null, '16', null, '1', '1503966148', null, null, null, '<p>555<br/></p>', '1', '1');

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) DEFAULT NULL COMMENT '外键，关联图片表',
  `img` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片',
  `delete_time` int(11) DEFAULT NULL COMMENT '状态，主要表示是否删除，也可以扩展其他状态',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '图片排序序号',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1正常0已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES ('4', '19', '/detail-1@1-dryfruit.png', null, '1', '11', '1');
INSERT INTO `product_image` VALUES ('5', '20', '/detail-2@1-dryfruit.png', null, '2', '11', '1');
INSERT INTO `product_image` VALUES ('6', '21', '/detail-3@1-dryfruit.png', null, '3', '11', '1');
INSERT INTO `product_image` VALUES ('7', '22', '/detail-4@1-dryfruit.png', null, '4', '11', '1');
INSERT INTO `product_image` VALUES ('8', '23', '/detail-5@1-dryfruit.png', null, '5', '11', '1');
INSERT INTO `product_image` VALUES ('9', '24', '/detail-6@1-dryfruit.png', null, '6', '11', '1');
INSERT INTO `product_image` VALUES ('10', '25', '/detail-7@1-dryfruit.png', null, '7', '11', '1');
INSERT INTO `product_image` VALUES ('11', '26', '/detail-8@1-dryfruit.png', null, '8', '11', '1');
INSERT INTO `product_image` VALUES ('12', '27', '/detail-9@1-dryfruit.png', null, '9', '11', '1');
INSERT INTO `product_image` VALUES ('13', '28', '/detail-11@1-dryfruit.png', null, '11', '11', '1');
INSERT INTO `product_image` VALUES ('14', '29', '/detail-10@1-dryfruit.png', null, '10', '11', '1');
INSERT INTO `product_image` VALUES ('18', '62', '/detail-12@1-dryfruit.png', null, '12', '11', '1');
INSERT INTO `product_image` VALUES ('19', '63', '/detail-13@1-dryfruit.png', null, '13', '11', '1');
INSERT INTO `product_image` VALUES ('20', null, '20170819/660513a80823fa2c06737dabb1357c04.jpg', null, '0', '34', '1');
INSERT INTO `product_image` VALUES ('21', null, '20170819/4785acb2c408cc117fc2f4fa41210663.jpg', null, '0', '34', '1');
INSERT INTO `product_image` VALUES ('22', null, '20170821/62e5505769ecc49d55bfefd6c97f7508.jpg', null, '0', '35', '1');
INSERT INTO `product_image` VALUES ('23', null, '20170821/b58926ea619b1e7299a554e18e1d1a19.png', null, '0', '35', '1');
INSERT INTO `product_image` VALUES ('24', null, '20170821/c9feedee72daa43d7f65b12aafb03dee.png', null, '0', '36', '1');
INSERT INTO `product_image` VALUES ('25', null, '20170829/675ee956c1da60e1a3529e7affbb3259.png', null, '0', '37', '1');
INSERT INTO `product_image` VALUES ('26', null, '20170829/10450a0c8f7011499bbc30d24155b8b4.png', null, '0', '38', '1');
INSERT INTO `product_image` VALUES ('27', null, '20170829/7aa68ef5c78216d78ea8ba0ff5023073.png', null, '0', '38', '1');
INSERT INTO `product_image` VALUES ('28', null, '20170829/0464cddb42fd1b1655dffe2c85ee57d9.png', null, '0', '39', '1');
INSERT INTO `product_image` VALUES ('29', null, '20170829/cc923907bab8e1a5b11c15b5866e1f15.png', null, '0', '40', '1');

-- ----------------------------
-- Table structure for product_property
-- ----------------------------
DROP TABLE IF EXISTS `product_property`;
CREATE TABLE `product_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT '' COMMENT '详情属性名称',
  `detail` varchar(255) NOT NULL COMMENT '详情属性',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_property
-- ----------------------------
INSERT INTO `product_property` VALUES ('1', '品名', '杨梅', '11', null, null);
INSERT INTO `product_property` VALUES ('2', '口味', '青梅味 雪梨味 黄桃味 菠萝味', '11', null, null);
INSERT INTO `product_property` VALUES ('3', '产地', '火星', '11', null, null);
INSERT INTO `product_property` VALUES ('4', '保质期', '180天', '11', null, null);
INSERT INTO `product_property` VALUES ('5', '品名', '梨子', '2', null, null);
INSERT INTO `product_property` VALUES ('6', '产地', '金星', '2', null, null);
INSERT INTO `product_property` VALUES ('7', '净含量', '100g', '2', null, null);
INSERT INTO `product_property` VALUES ('8', '保质期', '10天', '2', null, null);

-- ----------------------------
-- Table structure for shops
-- ----------------------------
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `name` varchar(60) DEFAULT NULL COMMENT '店铺名称',
  `username` varchar(10) DEFAULT NULL COMMENT '店主账号',
  `sellername` varchar(40) DEFAULT NULL COMMENT '店主卖家账号',
  `password` varchar(100) DEFAULT NULL COMMENT '登录密码',
  `appid` varchar(40) DEFAULT NULL,
  `appstr` varchar(50) DEFAULT NULL COMMENT '用户识别码',
  `secret` varchar(60) DEFAULT NULL,
  `mch_id` varchar(60) DEFAULT NULL,
  `api_key` varchar(60) DEFAULT NULL,
  `state` tinyint(1) unsigned DEFAULT '1' COMMENT '状态1正常0禁用',
  `addtime` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shops
-- ----------------------------
INSERT INTO `shops` VALUES ('1', 'thinkpad旗舰店', '695847482@', 'hcd', 'c9931d32a96d5936d264fb7d37acb4e7', '213jldjflajflcc', null, 'fjaljojx', 'fjaljflx', 'fjljxljxss', '1', '1503196688');
INSERT INTO `shops` VALUES ('2', '锤子旗舰店', 'smart', 'laoluo', '670b14728ad9902aecba32e22fa4f6bd', 'wxec0a16db0f2b2986', null, '222', '333', '4444', '1', '1503303823');
INSERT INTO `shops` VALUES ('3', '诺基亚旗舰店', 'nokia', 'nuo jiya', '670b14728ad9902aecba32e22fa4f6bd', 'afa', null, '2', '2', '2', '1', '1503628379');
INSERT INTO `shops` VALUES ('4', '小米官方旗舰店', 'xiaomi', 'xiaomi', '670b14728ad9902aecba32e22fa4f6bd', 'xiaomi123', null, '1212', 'wewe', 'afaf', '1', '1503965568');

-- ----------------------------
-- Table structure for theme
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '专题名称',
  `description` varchar(255) DEFAULT NULL COMMENT '专题描述',
  `topic_img_id` int(11) NOT NULL COMMENT '主题图，外键',
  `delete_time` int(11) DEFAULT NULL,
  `head_img_id` int(11) NOT NULL COMMENT '专题列表页，头图',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='主题信息表';

-- ----------------------------
-- Records of theme
-- ----------------------------
INSERT INTO `theme` VALUES ('1', '专题栏位一', '美味水果世界', '16', null, '49', null);
INSERT INTO `theme` VALUES ('2', '专题栏位二', '新品推荐', '17', null, '50', null);
INSERT INTO `theme` VALUES ('3', '专题栏位三', '做个干物女', '18', null, '18', null);

-- ----------------------------
-- Table structure for theme_product
-- ----------------------------
DROP TABLE IF EXISTS `theme_product`;
CREATE TABLE `theme_product` (
  `theme_id` int(11) NOT NULL COMMENT '主题外键',
  `product_id` int(11) NOT NULL COMMENT '商品外键',
  PRIMARY KEY (`theme_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='主题所包含的商品';

-- ----------------------------
-- Records of theme_product
-- ----------------------------
INSERT INTO `theme_product` VALUES ('1', '2');
INSERT INTO `theme_product` VALUES ('1', '5');
INSERT INTO `theme_product` VALUES ('1', '8');
INSERT INTO `theme_product` VALUES ('1', '10');
INSERT INTO `theme_product` VALUES ('1', '12');
INSERT INTO `theme_product` VALUES ('2', '1');
INSERT INTO `theme_product` VALUES ('2', '2');
INSERT INTO `theme_product` VALUES ('2', '3');
INSERT INTO `theme_product` VALUES ('2', '5');
INSERT INTO `theme_product` VALUES ('2', '6');
INSERT INTO `theme_product` VALUES ('2', '16');
INSERT INTO `theme_product` VALUES ('2', '33');
INSERT INTO `theme_product` VALUES ('3', '15');
INSERT INTO `theme_product` VALUES ('3', '18');
INSERT INTO `theme_product` VALUES ('3', '19');
INSERT INTO `theme_product` VALUES ('3', '27');
INSERT INTO `theme_product` VALUES ('3', '30');
INSERT INTO `theme_product` VALUES ('3', '31');

-- ----------------------------
-- Table structure for third_app
-- ----------------------------
DROP TABLE IF EXISTS `third_app`;
CREATE TABLE `third_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(64) NOT NULL COMMENT '应用app_id',
  `app_secret` varchar(64) NOT NULL COMMENT '应用secret',
  `app_description` varchar(100) DEFAULT NULL COMMENT '应用程序描述',
  `scope` varchar(20) NOT NULL COMMENT '应用权限',
  `scope_description` varchar(100) DEFAULT NULL COMMENT '权限描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='访问API的各应用账号密码表';

-- ----------------------------
-- Records of third_app
-- ----------------------------
INSERT INTO `third_app` VALUES ('1', 'starcraft', '777*777', 'CMS', '32', 'Super', null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `ownid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商家id',
  `openid` varchar(100) DEFAULT NULL COMMENT '微信openid',
  `wxname` varchar(100) DEFAULT NULL COMMENT '微信昵称',
  `name` varchar(100) DEFAULT NULL COMMENT '收货人姓名',
  `phone` varchar(100) DEFAULT NULL COMMENT '联系电话',
  `shname` varchar(50) DEFAULT NULL COMMENT '收货人姓名',
  `shphone` varchar(50) DEFAULT NULL COMMENT '收货人电话',
  `address` varchar(200) DEFAULT NULL COMMENT '收货地址',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '0删除1正常',
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '0', null, null, 'hcd', '13022731091', null, null, '深圳市龙华区', '1');

-- ----------------------------
-- Table structure for user11
-- ----------------------------
DROP TABLE IF EXISTS `user11`;
CREATE TABLE `user11` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `extend` varchar(255) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '注册时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user11
-- ----------------------------
INSERT INTO `user11` VALUES ('1', 'oBh7u0OAVKDdzW3c-6RGfcBS2z2A', null, null, null, null, null);

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '收获人姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `province` varchar(20) DEFAULT NULL COMMENT '省',
  `city` varchar(20) DEFAULT NULL COMMENT '市',
  `country` varchar(20) DEFAULT NULL COMMENT '区',
  `detail` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `delete_time` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL COMMENT '外键',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES ('1', '张三', '18888888888', '广东省', '广州市', '天河区', '某巷某号', null, '1', null);
