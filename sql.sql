DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
  `slides_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图ID：',
  `title` varchar(64) DEFAULT NULL COMMENT '标题：',
  `content` varchar(255) DEFAULT NULL COMMENT '内容：',
  `url` varchar(255) DEFAULT NULL COMMENT '链接：',
  `img` varchar(255) DEFAULT NULL COMMENT '轮播图：',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`slides_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图';
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID：',
  `user_group` varchar(64) DEFAULT NULL COMMENT '用户组：',
  `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名：',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名：',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题：',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径：',
  `position` varchar(32) DEFAULT NULL COMMENT '位置：',
  `mode` varchar(32) NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加：',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除：',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改：',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看：',
  `field_add` text COMMENT '添加字段：',
  `field_set` text COMMENT '修改字段：',
  `field_get` text COMMENT '查询字段：',
  `table_nav_name` varchar(500) DEFAULT NULL COMMENT '跨表导航名称：',
  `table_nav` varchar(500) DEFAULT NULL COMMENT '跨表导航：',
  `option` text COMMENT '配置：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户权限管理';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件上传';
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id：',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：',
  `content` longtext COMMENT '正文：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告';
insert into `notice` values ('1','网站公告','<p>公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
insert into `notice` values ('2','关于我们','<p>       一个网站要取得成功，要有先进的理念、先进的思想，更为重要的是抢占先机，及时行动。网络世界可谓一日千里、 日新月异，一个网站只有把握先机，抓住机遇，才</p><p>可能有更多的机会获得成功，可能处于网络行业发展的致高点，可能创建出成功的网站，才能能获得成功。要知道一种网站新模式在网络上只有保持几天的优势,因为人们很容易“COPY" 和模仿，因此，唯有不</p><p>断创新，不失时机地推出新的服务、新的模式、新的思想，网站才可能长久立于不败之地。</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
insert into `notice` values ('3','联系方式','<h3>网站内容及品牌合作</h3><p>Email：xxxx@qq.com</p><h3>商务合作</h3><p>电话：010-xxxxxxx</p><p>Email：xxxx@qq.com</p><h3><br></h3><h3><br></h3><p><br></p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
insert into `notice` values ('4','网站介绍','<p>此处可上传文字、图片、视频、超链接、表格等内容区</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `praise_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点赞状态:1为点赞，0已取消',
  PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='点赞';
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='登陆访问时长';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('101','84e31b291f2bde6b7ceb27af5fe8eee3',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='用户点击';
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论人ID：',
  `reply_to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复评论ID：空为0',
  `content` longtext COMMENT '内容：',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称：',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论';
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏ID：',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏人ID：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `title` varchar(255) DEFAULT NULL COMMENT '标题：',
  `img` varchar(255) DEFAULT NULL COMMENT '封面：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收藏';
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员','2023-03-31 18:21:49.0',null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/admin_avatar.jpg','2023-03-31 17:35:13.0');
DROP TABLE IF EXISTS `swimming_hall_information`;
CREATE TABLE `swimming_hall_information`(swimming_hall_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '泳馆信息ID',
`no_of_swimming_pool` varchar(64) comment '泳馆编号',
`name_of_swimming_pool` varchar(64) comment '泳馆名称',
`cover` varchar(255) comment '封面',
`location_of_swimming_pool` varchar(64) comment '泳馆位置',
`capacity` int(11) DEFAULT 0 comment '容纳人数',
`reservation_unit_price` int(11) DEFAULT 0 comment '预约单价',
`details_of_swimming_pool` longtext comment '泳馆详情',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`timer_title` varchar(64) DEFAULT NULL comment '计时器标题',
`timing_start_time` datetime DEFAULT NULL COMMENT '计时开始时间',
`timing_end_time` datetime DEFAULT NULL COMMENT '计时结束时间',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (swimming_hall_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '泳馆信息';
insert into `swimming_hall_information` values (1,'泳馆编号1','泳馆名称1','/api/upload/1626779081460678656.jpg','泳馆位置1',1,1,'此处可上传文字、图片、视频、超链接、表格等内容区1',0,'计时器标题1','2023-02-28','2024-02-28','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `swimming_hall_information` values (2,'泳馆编号2','泳馆名称2','/api/upload/1626779227598618624.jpg','泳馆位置2',2,2,'此处可上传文字、图片、视频、超链接、表格等内容区2',0,'计时器标题2','2023-02-28','2024-02-28','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `swimming_hall_information` values (3,'泳馆编号3','泳馆名称3','/api/upload/1626779191737319424.jpg','泳馆位置3',3,3,'此处可上传文字、图片、视频、超链接、表格等内容区3',0,'计时器标题3','2023-02-28','2024-02-28','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `swimming_hall_information` values (4,'泳馆编号4','泳馆名称4','/api/upload/1626779123600850944.jpg','泳馆位置4',4,4,'此处可上传文字、图片、视频、超链接、表格等内容区4',0,'计时器标题4','2023-02-28','2024-02-28','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `swimming_hall_information` values (5,'泳馆编号5','泳馆名称5','/api/upload/1626779417210519552.jpg','泳馆位置5',5,5,'此处可上传文字、图片、视频、超链接、表格等内容区5',0,'计时器标题5','2023-02-28','2024-02-28','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `swimming_hall_information` values (6,'泳馆编号6','泳馆名称6','/api/upload/1626779281583505409.jpg','泳馆位置6',6,6,'此处可上传文字、图片、视频、超链接、表格等内容区6',0,'计时器标题6','2023-02-28','2024-02-28','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `swimming_hall_information` values (7,'泳馆编号7','泳馆名称7','/api/upload/1626779042218770432.jpg','泳馆位置7',7,7,'此处可上传文字、图片、视频、超链接、表格等内容区7',0,'计时器标题7','2023-02-28','2024-02-28','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `swimming_hall_information` values (8,'泳馆编号8','泳馆名称8','/api/upload/1626778663108214784.jpg','泳馆位置8',8,8,'此处可上传文字、图片、视频、超链接、表格等内容区8',0,'计时器标题8','2023-02-28','2024-02-28','2023-02-28 15:26:50','2023-02-28 15:26:50');

DROP TABLE IF EXISTS `venue_reservation`;
CREATE TABLE `venue_reservation`(venue_reservation_id int(11) NOT NULL AUTO_INCREMENT COMMENT '场馆预约ID',
`appointment_no` varchar(64) comment '预约号',
`no_of_swimming_pool` varchar(64) comment '泳馆编号',
`name_of_swimming_pool` varchar(64) comment '泳馆名称',
`cover` varchar(255) comment '封面',
`location_of_swimming_pool` varchar(64) comment '泳馆位置',
`order_date` date comment '下单日期',
`reservation_unit_price` int(11) DEFAULT 0 comment '预约单价',
`ordinary_users` int(11) DEFAULT 0 comment '普通用户',
`number_of_appointments` int(11) DEFAULT 0 comment '预约人数',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`qrcode_img` varchar(255) DEFAULT '' NOT NULL comment '二维码图片',
`qrcode_title` varchar(64) DEFAULT '' NOT NULL comment '二维码标题',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (venue_reservation_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '场馆预约';
insert into `venue_reservation` values (1,'预约号1','泳馆编号1','泳馆名称1','/api/upload/1626779081460678656.jpg','泳馆位置1','2023-02-28',1,0,1,'未审核','',0,'二维码图片1','二维码标题1','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `venue_reservation` values (2,'预约号2','泳馆编号2','泳馆名称2','/api/upload/1626779417210519552.jpg','泳馆位置2','2023-02-28',2,0,2,'未审核','',0,'二维码图片2','二维码标题2','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `venue_reservation` values (3,'预约号3','泳馆编号3','泳馆名称3','/api/upload/1626779227598618624.jpg','泳馆位置3','2023-02-28',3,0,3,'未审核','',0,'二维码图片3','二维码标题3','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `venue_reservation` values (4,'预约号4','泳馆编号4','泳馆名称4','/api/upload/1626779042218770432.jpg','泳馆位置4','2023-02-28',4,0,4,'未审核','',0,'二维码图片4','二维码标题4','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `venue_reservation` values (5,'预约号5','泳馆编号5','泳馆名称5','/api/upload/1626779123600850944.jpg','泳馆位置5','2023-02-28',5,0,5,'未审核','',0,'二维码图片5','二维码标题5','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `venue_reservation` values (6,'预约号6','泳馆编号6','泳馆名称6','/api/upload/1626779191737319424.jpg','泳馆位置6','2023-02-28',6,0,6,'未审核','',0,'二维码图片6','二维码标题6','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `venue_reservation` values (7,'预约号7','泳馆编号7','泳馆名称7','/api/upload/1626779281583505409.jpg','泳馆位置7','2023-02-28',7,0,7,'未审核','',0,'二维码图片7','二维码标题7','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `venue_reservation` values (8,'预约号8','泳馆编号8','泳馆名称8','/api/upload/1626778663108214784.jpg','泳馆位置8','2023-02-28',8,0,8,'未审核','',0,'二维码图片8','二维码标题8','2023-02-28 15:26:50','2023-02-28 15:26:50');

DROP TABLE IF EXISTS `payment_information`;
CREATE TABLE `payment_information`(payment_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '支付信息ID',
`appointment_no` varchar(64) NOT NULL UNIQUE comment '预约号',
`no_of_swimming_pool` varchar(64) comment '泳馆编号',
`name_of_swimming_pool` varchar(64) comment '泳馆名称',
`cover` varchar(255) comment '封面',
`location_of_swimming_pool` varchar(64) comment '泳馆位置',
`order_date` date comment '下单日期',
`reservation_unit_price` int(11) DEFAULT 0 comment '预约单价',
`ordinary_users` int(11) DEFAULT 0 comment '普通用户',
`number_of_appointments` int(11) DEFAULT 0 comment '预约人数',
`payment_amount` varchar(64) comment '支付金额',
`remarks` varchar(64) comment '备注',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`qrcode_img` varchar(255) DEFAULT '' NOT NULL comment '二维码图片',
`qrcode_title` varchar(64) DEFAULT '' NOT NULL comment '二维码标题',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (payment_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '支付信息';
insert into `payment_information` values (1,'预约号1','泳馆编号1','泳馆名称1','/api/upload/1626779042218770432.jpg','泳馆位置1','2023-02-28',1,0,1,'支付金额1','备注1',0,'二维码图片1','二维码标题1','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `payment_information` values (2,'预约号2','泳馆编号2','泳馆名称2','/api/upload/1626779123600850944.jpg','泳馆位置2','2023-02-28',2,0,2,'支付金额2','备注2',0,'二维码图片2','二维码标题2','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `payment_information` values (3,'预约号3','泳馆编号3','泳馆名称3','/api/upload/1626779081460678656.jpg','泳馆位置3','2023-02-28',3,0,3,'支付金额3','备注3',0,'二维码图片3','二维码标题3','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `payment_information` values (4,'预约号4','泳馆编号4','泳馆名称4','/api/upload/1626779191737319424.jpg','泳馆位置4','2023-02-28',4,0,4,'支付金额4','备注4',0,'二维码图片4','二维码标题4','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `payment_information` values (5,'预约号5','泳馆编号5','泳馆名称5','/api/upload/1626779227598618624.jpg','泳馆位置5','2023-02-28',5,0,5,'支付金额5','备注5',0,'二维码图片5','二维码标题5','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `payment_information` values (6,'预约号6','泳馆编号6','泳馆名称6','/api/upload/1626779417210519552.jpg','泳馆位置6','2023-02-28',6,0,6,'支付金额6','备注6',0,'二维码图片6','二维码标题6','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `payment_information` values (7,'预约号7','泳馆编号7','泳馆名称7','/api/upload/1626779281583505409.jpg','泳馆位置7','2023-02-28',7,0,7,'支付金额7','备注7',0,'二维码图片7','二维码标题7','2023-02-28 15:26:50','2023-02-28 15:26:50');
insert into `payment_information` values (8,'预约号8','泳馆编号8','泳馆名称8','/api/upload/1626778663108214784.jpg','泳馆位置8','2023-02-28',8,0,8,'支付金额8','备注8',0,'二维码图片8','二维码标题8','2023-02-28 15:26:50','2023-02-28 15:26:50');

DROP TABLE IF EXISTS `user_wallet`;
CREATE TABLE `user_wallet`(user_wallet_id int(11) NOT NULL AUTO_INCREMENT COMMENT '用户钱包ID',
`ordinary_users` int(11) DEFAULT 0 comment '普通用户',
`wallet_amount` int(11) DEFAULT 0 comment '钱包金额',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (user_wallet_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '用户钱包';
insert into `user_wallet` values (1,0,1,0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `user_wallet` values (2,0,2,0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `user_wallet` values (3,0,3,0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `user_wallet` values (4,0,4,0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `user_wallet` values (5,0,5,0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `user_wallet` values (6,0,6,0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `user_wallet` values (7,0,7,0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `user_wallet` values (8,0,8,0,'2023-02-28 15:26:51','2023-02-28 15:26:51');

DROP TABLE IF EXISTS `recharge_information`;
CREATE TABLE `recharge_information`(recharge_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '充值信息ID',
`recharge_number` varchar(64) comment '充值号',
`ordinary_users` int(11) DEFAULT 0 comment '普通用户',
`recharge_amount` int(11) DEFAULT 0 comment '充值金额',
`recharge_date` date comment '充值日期',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`pay_state` varchar(16) DEFAULT '未支付' NOT NULL comment '支付状态',
`pay_type` varchar(16) DEFAULT '' comment '支付类型: 微信、支付宝、网银',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (recharge_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '充值信息';
insert into `recharge_information` values (1,'充值号1',0,1,'2023-02-28','未审核','','未支付','支付宝',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `recharge_information` values (2,'充值号2',0,2,'2023-02-28','未审核','','未支付','支付宝',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `recharge_information` values (3,'充值号3',0,3,'2023-02-28','未审核','','未支付','支付宝',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `recharge_information` values (4,'充值号4',0,4,'2023-02-28','未审核','','未支付','支付宝',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `recharge_information` values (5,'充值号5',0,5,'2023-02-28','未审核','','未支付','支付宝',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `recharge_information` values (6,'充值号6',0,6,'2023-02-28','未审核','','未支付','支付宝',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `recharge_information` values (7,'充值号7',0,7,'2023-02-28','未审核','','未支付','支付宝',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `recharge_information` values (8,'充值号8',0,8,'2023-02-28','未审核','','未支付','支付宝',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');

DROP TABLE IF EXISTS `recharge_confirmation`;
CREATE TABLE `recharge_confirmation`(recharge_confirmation_id int(11) NOT NULL AUTO_INCREMENT COMMENT '充值确认ID',
`recharge_number` varchar(64) NOT NULL UNIQUE comment '充值号',
`ordinary_users` int(11) DEFAULT 0 comment '普通用户',
`recharge_amount` int(11) DEFAULT 0 comment '充值金额',
`recharge_date` date comment '充值日期',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (recharge_confirmation_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '充值确认';
insert into `recharge_confirmation` values (1,'充值号1',0,1,'2023-02-28',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `recharge_confirmation` values (2,'充值号2',0,2,'2023-02-28',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `recharge_confirmation` values (3,'充值号3',0,3,'2023-02-28',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `recharge_confirmation` values (4,'充值号4',0,4,'2023-02-28',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `recharge_confirmation` values (5,'充值号5',0,5,'2023-02-28',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `recharge_confirmation` values (6,'充值号6',0,6,'2023-02-28',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `recharge_confirmation` values (7,'充值号7',0,7,'2023-02-28',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `recharge_confirmation` values (8,'充值号8',0,8,'2023-02-28',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');

DROP TABLE IF EXISTS `food_information`;
CREATE TABLE `food_information`(food_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '美食信息ID',
`food_name` varchar(64) comment '美食名称',
`cover` varchar(255) comment '封面',
`food_unit_price` int(11) DEFAULT 0 comment '美食单价',
`flavor` varchar(64) comment '口味',
`food_materials` varchar(64) comment '美食材料',
`details` longtext comment '详情介绍',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (food_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '美食信息';
insert into `food_information` values (1,'美食名称1','/api/upload/1572764222100602881.jpg',1,'口味1','美食材料1','此处可上传文字、图片、视频、超链接、表格等内容区1',665,709,0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `food_information` values (2,'美食名称2','/api/upload/1572764164340842497.jpg',2,'口味2','美食材料2','此处可上传文字、图片、视频、超链接、表格等内容区2',171,377,0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `food_information` values (3,'美食名称3','/api/upload/1572763983172075521.jpg',3,'口味3','美食材料3','此处可上传文字、图片、视频、超链接、表格等内容区3',629,956,0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `food_information` values (4,'美食名称4','/api/upload/1572764089124388865.jpg',4,'口味4','美食材料4','此处可上传文字、图片、视频、超链接、表格等内容区4',930,991,0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `food_information` values (5,'美食名称5','/api/upload/1572764339742441472.jpg',5,'口味5','美食材料5','此处可上传文字、图片、视频、超链接、表格等内容区5',613,867,0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `food_information` values (6,'美食名称6','/api/upload/1572764034195783680.jpg',6,'口味6','美食材料6','此处可上传文字、图片、视频、超链接、表格等内容区6',592,350,0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `food_information` values (7,'美食名称7','/api/upload/1572764264941223936.jpg',7,'口味7','美食材料7','此处可上传文字、图片、视频、超链接、表格等内容区7',759,259,0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `food_information` values (8,'美食名称8','/api/upload/1572763932278390784.jpg',8,'口味8','美食材料8','此处可上传文字、图片、视频、超链接、表格等内容区8',660,79,0,'2023-02-28 15:26:51','2023-02-28 15:26:51');

DROP TABLE IF EXISTS `food_order`;
CREATE TABLE `food_order`(food_order_id int(11) NOT NULL AUTO_INCREMENT COMMENT '美食订单ID',
`order_number` varchar(64) comment '订单号',
`food_name` varchar(64) comment '美食名称',
`cover` varchar(255) comment '封面',
`food_unit_price` int(11) DEFAULT 0 comment '美食单价',
`flavor` varchar(64) comment '口味',
`food_materials` varchar(64) comment '美食材料',
`order_date` date comment '下单日期',
`ordinary_users` int(11) DEFAULT 0 comment '普通用户',
`purchase_quantity` int(11) DEFAULT 0 comment '购买数量',
`payment_amount` varchar(64) comment '支付金额',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (food_order_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '美食订单';
insert into `food_order` values (1,'订单号1','美食名称1','/api/upload/1572764164340842497.jpg',1,'口味1','美食材料1','2023-02-28',0,1,'支付金额1','未审核','',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `food_order` values (2,'订单号2','美食名称2','/api/upload/1572764034195783680.jpg',2,'口味2','美食材料2','2023-02-28',0,2,'支付金额2','未审核','',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `food_order` values (3,'订单号3','美食名称3','/api/upload/1572764339742441472.jpg',3,'口味3','美食材料3','2023-02-28',0,3,'支付金额3','未审核','',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `food_order` values (4,'订单号4','美食名称4','/api/upload/1572764089124388865.jpg',4,'口味4','美食材料4','2023-02-28',0,4,'支付金额4','未审核','',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `food_order` values (5,'订单号5','美食名称5','/api/upload/1572764264941223936.jpg',5,'口味5','美食材料5','2023-02-28',0,5,'支付金额5','未审核','',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `food_order` values (6,'订单号6','美食名称6','/api/upload/1572764222100602881.jpg',6,'口味6','美食材料6','2023-02-28',0,6,'支付金额6','未审核','',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `food_order` values (7,'订单号7','美食名称7','/api/upload/1572763983172075521.jpg',7,'口味7','美食材料7','2023-02-28',0,7,'支付金额7','未审核','',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');
insert into `food_order` values (8,'订单号8','美食名称8','/api/upload/1572763932278390784.jpg',8,'口味8','美食材料8','2023-02-28',0,8,'支付金额8','未审核','',0,'2023-02-28 15:26:51','2023-02-28 15:26:51');

DROP TABLE IF EXISTS `ordinary_users`;
CREATE TABLE `ordinary_users`(ordinary_users_id int(11) NOT NULL AUTO_INCREMENT COMMENT '普通用户ID',
`user_name` varchar(64) comment '用户姓名',
`gender` varchar(64) comment '性别',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (ordinary_users_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '普通用户';

insert into `auth` values ('1','管理员','泳馆信息','swimming_hall_information','泳馆信息','/swimming_hall_information/table','','_blank','1','1','1','1','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool',null,'0','{"can_show_comment":true}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('2','管理员','泳馆信息','swimming_hall_information','泳馆信息详情','/swimming_hall_information/view','','_blank','1','1','1','1','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('3','管理员','泳馆信息','swimming_hall_information','泳馆信息','/swimming_hall_information/list','top','_blank','1','1','1','1','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('4','管理员','泳馆信息','swimming_hall_information','泳馆信息详情','/swimming_hall_information/details','','_blank','1','1','1','1','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool',null,'0','{"can_comment":true,"can_show_comment":true}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('5','管理员','场馆预约','venue_reservation','场馆预约','/venue_reservation/table','','_blank','1','1','1','1','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments',null,'0','{"examine":true}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('6','管理员','场馆预约','venue_reservation','场馆预约详情','/venue_reservation/view','','_blank','1','1','1','1','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('7','管理员','场馆预约','venue_reservation','场馆预约','/venue_reservation/edit','','_blank','1','1','1','1','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('8','管理员','支付信息','payment_information','支付信息','/payment_information/table','','_blank','1','1','1','1','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('9','管理员','支付信息','payment_information','支付信息详情','/payment_information/view','','_blank','1','1','1','1','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('10','管理员','支付信息','payment_information','支付信息','/payment_information/edit','','_blank','1','1','1','1','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('11','管理员','用户钱包','user_wallet','用户钱包','/user_wallet/table','','_blank','1','1','1','1','ordinary_users,wallet_amount','ordinary_users,wallet_amount','ordinary_users,wallet_amount',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('12','管理员','用户钱包','user_wallet','用户钱包详情','/user_wallet/view','','_blank','1','1','1','1','ordinary_users,wallet_amount','ordinary_users,wallet_amount','ordinary_users,wallet_amount',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('13','管理员','充值信息','recharge_information','充值信息','/recharge_information/table','','_blank','1','1','1','1','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date',null,'0','{"examine":true,"pay":true}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('14','管理员','充值信息','recharge_information','充值信息详情','/recharge_information/view','','_blank','1','1','1','1','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('15','管理员','充值信息','recharge_information','充值信息','/recharge_information/edit','','_blank','1','1','1','1','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('16','管理员','充值确认','recharge_confirmation','充值确认','/recharge_confirmation/table','','_blank','1','1','1','1','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('17','管理员','充值确认','recharge_confirmation','充值确认详情','/recharge_confirmation/view','','_blank','1','1','1','1','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('18','管理员','充值确认','recharge_confirmation','充值确认','/recharge_confirmation/edit','','_blank','1','1','1','1','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('19','管理员','美食信息','food_information','美食信息','/food_information/table','','_blank','1','1','1','1','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details',null,'0','{"can_show_comment":true}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('20','管理员','美食信息','food_information','美食信息详情','/food_information/view','','_blank','1','1','1','1','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('21','管理员','美食信息','food_information','美食信息','/food_information/list','top','_blank','1','1','1','1','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('22','管理员','美食信息','food_information','美食信息详情','/food_information/details','','_blank','1','1','1','1','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details',null,'0','{"can_comment":true,"can_show_comment":true}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('23','管理员','美食订单','food_order','美食订单','/food_order/table','','_blank','1','1','1','1','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount',null,'0','{"examine":true}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('24','管理员','美食订单','food_order','美食订单详情','/food_order/view','','_blank','1','1','1','1','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('25','管理员','美食订单','food_order','美食订单','/food_order/edit','','_blank','1','1','1','1','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('26','管理员','普通用户','ordinary_users','普通用户','/ordinary_users/table','','_blank','1','1','1','1','user_name,gender','user_name,gender','user_name,gender',null,'0','{"examine":true}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('27','管理员','普通用户','ordinary_users','普通用户详情','/ordinary_users/view','','_blank','1','1','1','1','user_name,gender','user_name,gender','user_name,gender',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('28','管理员','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('29','管理员','评论','comment','评论列表','/comment/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('30','管理员','评论','comment','评论详情','/comment/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('31','管理员','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('32','管理员','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('33','管理员','公告','notice','公告列表','/notice/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('34','管理员','公告','notice','公告详情','/notice/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('35','管理员','公告','notice','公告','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('36','管理员','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('37','游客','泳馆信息','swimming_hall_information','泳馆信息','/swimming_hall_information/table','','_blank','0','0','0','0','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool',null,'0','{"can_show_comment":false}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('38','游客','泳馆信息','swimming_hall_information','泳馆信息详情','/swimming_hall_information/view','','_blank','0','0','0','0','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('39','游客','泳馆信息','swimming_hall_information','泳馆信息','/swimming_hall_information/list','top','_blank','0','0','0','1','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('40','游客','泳馆信息','swimming_hall_information','泳馆信息详情','/swimming_hall_information/details','','_blank','0','0','0','1','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool',null,'0','{"can_comment":false,"can_show_comment":true}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('41','游客','场馆预约','venue_reservation','场馆预约','/venue_reservation/table','','_blank','0','0','0','0','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments',null,'0','{"examine":false}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('42','游客','场馆预约','venue_reservation','场馆预约详情','/venue_reservation/view','','_blank','0','0','0','0','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('43','游客','场馆预约','venue_reservation','场馆预约','/venue_reservation/edit','','_blank','0','0','0','0','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('44','游客','支付信息','payment_information','支付信息','/payment_information/table','','_blank','0','0','0','0','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('45','游客','支付信息','payment_information','支付信息详情','/payment_information/view','','_blank','0','0','0','0','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('46','游客','支付信息','payment_information','支付信息','/payment_information/edit','','_blank','0','0','0','0','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('47','游客','用户钱包','user_wallet','用户钱包','/user_wallet/table','','_blank','0','0','0','0','ordinary_users,wallet_amount','ordinary_users,wallet_amount','ordinary_users,wallet_amount',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('48','游客','用户钱包','user_wallet','用户钱包详情','/user_wallet/view','','_blank','0','0','0','0','ordinary_users,wallet_amount','ordinary_users,wallet_amount','ordinary_users,wallet_amount',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('49','游客','充值信息','recharge_information','充值信息','/recharge_information/table','','_blank','0','0','0','0','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date',null,'0','{"examine":false,"pay":false}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('50','游客','充值信息','recharge_information','充值信息详情','/recharge_information/view','','_blank','0','0','0','0','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('51','游客','充值信息','recharge_information','充值信息','/recharge_information/edit','','_blank','0','0','0','0','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('52','游客','充值确认','recharge_confirmation','充值确认','/recharge_confirmation/table','','_blank','0','0','0','0','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('53','游客','充值确认','recharge_confirmation','充值确认详情','/recharge_confirmation/view','','_blank','0','0','0','0','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('54','游客','充值确认','recharge_confirmation','充值确认','/recharge_confirmation/edit','','_blank','0','0','0','0','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('55','游客','美食信息','food_information','美食信息','/food_information/table','','_blank','0','0','0','0','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details',null,'0','{"can_show_comment":false}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('56','游客','美食信息','food_information','美食信息详情','/food_information/view','','_blank','0','0','0','0','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('57','游客','美食信息','food_information','美食信息','/food_information/list','top','_blank','0','0','0','1','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('58','游客','美食信息','food_information','美食信息详情','/food_information/details','','_blank','0','0','0','1','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details',null,'0','{"can_comment":false,"can_show_comment":true}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('59','游客','美食订单','food_order','美食订单','/food_order/table','','_blank','0','0','0','0','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount',null,'0','{"examine":false}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('60','游客','美食订单','food_order','美食订单详情','/food_order/view','','_blank','0','0','0','0','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('61','游客','美食订单','food_order','美食订单','/food_order/edit','','_blank','0','0','0','0','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('62','游客','普通用户','ordinary_users','普通用户','/ordinary_users/table','','_blank','1','0','0','0','user_name,gender','user_name,gender','user_name,gender',null,'0','{"examine":false}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('63','游客','普通用户','ordinary_users','普通用户详情','/ordinary_users/view','','_blank','1','0','0','0','user_name,gender','user_name,gender','user_name,gender',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('64','游客','我的收藏','collect','我的收藏','/collect/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('65','游客','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('66','游客','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('67','游客','评论','comment','我的评论','/comment/list','','_blank','0','0','0','1','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('68','游客','评论','comment','评论详情','/comment/details','','_blank','0','0','0','1','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('69','游客','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('70','游客','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('71','游客','公告','notice','公告','/notice/list','','_blank','0','0','0','1','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('72','游客','公告','notice','公告详情','/notice/details','','_blank','0','0','0','1','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('73','普通用户','泳馆信息','swimming_hall_information','泳馆信息','/swimming_hall_information/table','','_blank','0','0','0','0','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool',null,'0','{"can_show_comment":false}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('74','普通用户','泳馆信息','swimming_hall_information','泳馆信息详情','/swimming_hall_information/view','','_blank','0','0','0','0','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('75','普通用户','泳馆信息','swimming_hall_information','泳馆信息','/swimming_hall_information/list','top','_blank','1','1','1','1','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('76','普通用户','泳馆信息','swimming_hall_information','泳馆信息详情','/swimming_hall_information/details','','_blank','1','1','1','1','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool','no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,capacity,reservation_unit_price,details_of_swimming_pool',null,'0','{"can_comment":true,"can_show_comment":true}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('77','普通用户','场馆预约','venue_reservation','场馆预约','/venue_reservation/table','','_blank','0','0','0','1','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments',null,'0','{"examine":false}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('78','普通用户','场馆预约','venue_reservation','场馆预约详情','/venue_reservation/view','','_blank','0','0','0','1','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('79','普通用户','场馆预约','venue_reservation','场馆预约','/venue_reservation/edit','','_blank','1','1','1','1','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('80','普通用户','支付信息','payment_information','支付信息','/payment_information/table','','_blank','1','0','0','1','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('81','普通用户','支付信息','payment_information','支付信息详情','/payment_information/view','','_blank','1','0','0','1','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('82','普通用户','支付信息','payment_information','支付信息','/payment_information/edit','','_blank','1','1','1','1','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks','appointment_no,no_of_swimming_pool,name_of_swimming_pool,cover,location_of_swimming_pool,order_date,reservation_unit_price,ordinary_users,number_of_appointments,payment_amount,remarks',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('83','普通用户','用户钱包','user_wallet','用户钱包','/user_wallet/table','','_blank','0','0','0','1','ordinary_users,wallet_amount','ordinary_users,wallet_amount','ordinary_users,wallet_amount',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('84','普通用户','用户钱包','user_wallet','用户钱包详情','/user_wallet/view','','_blank','0','0','0','1','ordinary_users,wallet_amount','ordinary_users,wallet_amount','ordinary_users,wallet_amount',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('85','普通用户','充值信息','recharge_information','充值信息','/recharge_information/table','','_blank','1','0','0','1','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date',null,'0','{"examine":false,"pay":true}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('86','普通用户','充值信息','recharge_information','充值信息详情','/recharge_information/view','','_blank','1','0','0','1','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('87','普通用户','充值信息','recharge_information','充值信息','/recharge_information/edit','','_blank','1','1','1','1','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('88','普通用户','充值确认','recharge_confirmation','充值确认','/recharge_confirmation/table','','_blank','0','0','0','1','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('89','普通用户','充值确认','recharge_confirmation','充值确认详情','/recharge_confirmation/view','','_blank','0','0','0','1','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('90','普通用户','充值确认','recharge_confirmation','充值确认','/recharge_confirmation/edit','','_blank','0','0','0','0','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date','recharge_number,ordinary_users,recharge_amount,recharge_date',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('91','普通用户','美食信息','food_information','美食信息','/food_information/table','','_blank','0','0','0','0','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details',null,'0','{"can_show_comment":false}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('92','普通用户','美食信息','food_information','美食信息详情','/food_information/view','','_blank','0','0','0','0','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('93','普通用户','美食信息','food_information','美食信息','/food_information/list','top','_blank','1','1','1','1','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('94','普通用户','美食信息','food_information','美食信息详情','/food_information/details','','_blank','1','1','1','1','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details','food_name,cover,food_unit_price,flavor,food_materials,details',null,'0','{"can_comment":true,"can_show_comment":true}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('95','普通用户','美食订单','food_order','美食订单','/food_order/table','','_blank','0','0','0','1','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount',null,'0','{"examine":false}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('96','普通用户','美食订单','food_order','美食订单详情','/food_order/view','','_blank','0','0','0','1','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('97','普通用户','美食订单','food_order','美食订单','/food_order/edit','','_blank','1','1','1','1','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount','order_number,food_name,cover,food_unit_price,flavor,food_materials,order_date,ordinary_users,purchase_quantity,payment_amount',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('98','普通用户','普通用户','ordinary_users','普通用户','/ordinary_users/table','','_blank','0','0','0','0','user_name,gender','user_name,gender','user_name,gender',null,'0','{"examine":false}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('99','普通用户','普通用户','ordinary_users','普通用户详情','/ordinary_users/view','','_blank','0','0','0','0','user_name,gender','user_name,gender','user_name,gender',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('100','普通用户','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('101','普通用户','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('102','普通用户','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('103','普通用户','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('104','普通用户','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('105','普通用户','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('106','普通用户','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('107','普通用户','公告','notice','公告','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `auth` values ('108','普通用户','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `user_group` values ('1','100','管理员',null,'','','0','0','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `user_group` values ('2','100','游客',null,'','','0','0','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `user_group` values ('3','100','普通用户',null,'ordinary_users','ordinary_users_id','0','3','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `slides` values ('1','轮播图1','内容1','/article/details?article=1','/api/upload/1626776059447869440.jpg','37','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `slides` values ('2','轮播图2','内容2','/article/details?article=2','/api/upload/1626777371665235969.jpg','431','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
insert into `slides` values ('3','轮播图3','内容3','/article/details?article=3','/api/upload/1626776435576274944.jpg','124','2023-02-28 15:26:51.0','2023-02-28 15:26:51.0');
