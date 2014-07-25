/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.40-community : Database - zhishu
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zhishu` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `zhishu`;

/*Table structure for table `cms_article_data` */

DROP TABLE IF EXISTS `cms_article_data`;

CREATE TABLE `cms_article_data` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `content` text COMMENT '文章内容',
  `copyfrom` varchar(255) DEFAULT NULL COMMENT '文章来源',
  `relation` varchar(255) DEFAULT NULL COMMENT '相关文章',
  `allow_comment` char(1) DEFAULT NULL COMMENT '是否允许评论',
  PRIMARY KEY (`id`),
  KEY `cms_article_data_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章详表';

/*Data for the table `cms_article_data` */

insert  into `cms_article_data`(`id`,`content`,`copyfrom`,`relation`,`allow_comment`) values ('1','<p>\r\n	<strong>文章内容内容内容内容</strong>，<span style=\"background-color:#ffd700;\">大娃娃的啊dad啊啊</span></p>','来源','1,2,3,','1'),('10','文章内容内容内容内容','来源','1,2,3','1'),('11','文章内容内容内容内容','来源','1,2,3','1'),('12','文章内容内容内容内容','来源','1,2,3','1'),('13','文章内容内容内容内容','来源','1,2,3','1'),('14','文章内容内容内容内容','来源','1,2,3','1'),('15','文章内容内容内容内容','来源','1,2,3','1'),('16','文章内容内容内容内容','来源','1,2,3','1'),('17','文章内容内容内容内容','来源','1,2,3','1'),('18','文章内容内容内容内容','来源','1,2,3','1'),('19','文章内容内容内容内容','来源','1,2,3','1'),('2','文章内容内容内容内容','来源','1,2,3','1'),('20','文章内容内容内容内容','来源','1,2,3','1'),('21','文章内容内容内容内容','来源','1,2,3','1'),('22','文章内容内容内容内容','来源','1,2,3','1'),('23','文章内容内容内容内容','来源','1,2,3','1'),('24','文章内容内容内容内容','来源','1,2,3','1'),('25','文章内容内容内容内容','来源','1,2,3','1'),('26','文章内容内容内容内容','来源','1,2,3','1'),('27','文章内容内容内容内容','来源','1,2,3','1'),('28','文章内容内容内容内容','来源','1,2,3','1'),('29','文章内容内容内容内容','来源','1,2,3','1'),('3','文章内容内容内容内容','来源','1,2,3','1'),('30','文章内容内容内容内容','来源','1,2,3','1'),('31','文章内容内容内容内容','来源','1,2,3','1'),('32','文章内容内容内容内容','来源','1,2,3','1'),('33','文章内容内容内容内容','来源','1,2,3','1'),('34','文章内容内容内容内容','来源','1,2,3','1'),('35','文章内容内容内容内容','来源','1,2,3','1'),('36','文章内容内容内容内容','来源','1,2,3','1'),('37','文章内容内容内容内容','来源','1,2,3','1'),('38','文章内容内容内容内容','来源','1,2,3','1'),('39','文章内容内容内容内容','来源','1,2,3','1'),('4','文章内容内容内容内容','来源','1,2,3','1'),('40','文章内容内容内容内容','来源','1,2,3','1'),('41','文章内容内容内容内容','来源','1,2,3','1'),('42','文章内容内容内容内容','来源','1,2,3','1'),('43','文章内容内容内容内容','来源','1,2,3','1'),('44','文章内容内容内容内容','来源','1,2,3','1'),('45','文章内容内容内容内容','来源','1,2,3','1'),('46','文章内容内容内容内容','来源','1,2,3','1'),('47','文章内容内容内容内容','来源','1,2,3','1'),('48','文章内容内容内容内容','来源','1,2,3','1'),('49','文章内容内容内容内容','来源','1,2,3','1'),('5','文章内容内容内容内容','来源','1,2,3','1'),('50','文章内容内容内容内容','来源','1,2,3','1'),('51','文章内容内容内容内容','来源','1,2,3','1'),('52','文章内容内容内容内容','来源','1,2,3','1'),('53','文章内容内容内容内容','来源','1,2,3','1'),('6','文章内容内容内容内容','来源','1,2,3','1'),('7','文章内容内容内容内容','来源','1,2,3','1'),('8','文章内容内容内容内容','来源','1,2,3','1'),('9','文章内容内容内容内容','来源','1,2,3','1');

/*Table structure for table `factory_product` */

DROP TABLE IF EXISTS `factory_product`;

CREATE TABLE `factory_product` (
  `id` varchar(64) NOT NULL,
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` varchar(64) DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` varchar(64) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  `other_test` varchar(20) DEFAULT NULL COMMENT '测试名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `factory_product` */

insert  into `factory_product`(`id`,`name`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`other_test`) values ('060e4f31ef414632be210526360462cc','dedadad','0bff2462495042f79bbabeb109e20b28','2014-07-16 14:46:14','0bff2462495042f79bbabeb109e20b28','2014-07-16 14:46:14','hahahahahhahahah哈哈哈','0','adaeda'),('1','hahah',NULL,NULL,NULL,NULL,NULL,'0',NULL),('4aeb6d700b174539b44e1395f185c240','打打我','1','2014-05-29 13:41:22','1','2014-05-29 13:41:22','大王大啊','1',NULL),('57c353c8e696459c9fd43d3cfca1bede','大王大','0bff2462495042f79bbabeb109e20b28','2014-06-03 16:52:18','0bff2462495042f79bbabeb109e20b28','2014-06-05 16:01:09','付费了，大王大啊啊','0','2'),('801c784af10748f99e1aeb3c79a76803','dada','0bff2462495042f79bbabeb109e20b28','2014-06-03 09:43:04','0bff2462495042f79bbabeb109e20b28','2014-06-05 16:00:58','付费了adawd a','0','2'),('907854cbe6cf4d6aa5207f375a8334b6','hjghj','0bff2462495042f79bbabeb109e20b28','2014-07-22 11:27:19','0bff2462495042f79bbabeb109e20b28','2014-07-22 11:27:19','hahahah哈哈哈哈哈','0','jgyjg'),('c609f2a3e70a4903b43b2f5c1359eb19','00749','0bff2462495042f79bbabeb109e20b28','2014-06-03 17:41:22','0bff2462495042f79bbabeb109e20b28','2014-06-05 16:00:46','大大大大大大大大，没付费','0','1'),('c73ba56f34724b7d991dd1ac640dd732','dawd','0bff2462495042f79bbabeb109e20b28','2014-06-05 15:56:07','0bff2462495042f79bbabeb109e20b28','2014-06-05 16:00:35','adawdad,没付费','0','1');

/*Table structure for table `mgt_banji` */

DROP TABLE IF EXISTS `mgt_banji`;

CREATE TABLE `mgt_banji` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `no` varchar(100) NOT NULL COMMENT '班级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `grade` char(1) NOT NULL DEFAULT '0' COMMENT '年级',
  `year` datetime DEFAULT NULL COMMENT '年份',
  `type` char(1) NOT NULL DEFAULT '0' COMMENT '类型',
  `school_id` varchar(500) DEFAULT NULL COMMENT '所在学校',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='班级';

/*Data for the table `mgt_banji` */

insert  into `mgt_banji`(`id`,`no`,`name`,`grade`,`year`,`type`,`school_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','2014112','三年级二班','3',NULL,'1','1','10','2014-07-25 13:57:15','10','2014-07-25 13:57:15','','0');

/*Table structure for table `mgt_parents` */

DROP TABLE IF EXISTS `mgt_parents`;

CREATE TABLE `mgt_parents` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `no` varchar(100) NOT NULL COMMENT '家长编号',
  `login_name` varchar(100) DEFAULT NULL COMMENT '登录名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `gender` varchar(2) DEFAULT NULL COMMENT '性别',
  `email` varchar(100) DEFAULT NULL COMMENT 'email',
  `mobile` varchar(100) DEFAULT NULL COMMENT '电话',
  `phone` varchar(100) DEFAULT NULL COMMENT '手机号',
  `student_name` varchar(100) NOT NULL COMMENT '学生姓名',
  `student_no` varchar(100) NOT NULL COMMENT '学生学号',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='家长';

/*Data for the table `mgt_parents` */

/*Table structure for table `mgt_school` */

DROP TABLE IF EXISTS `mgt_school`;

CREATE TABLE `mgt_school` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `no` varchar(100) NOT NULL COMMENT '学校编号',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `type` char(1) NOT NULL DEFAULT '0' COMMENT '类型',
  `address` varchar(500) DEFAULT NULL COMMENT '地址',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学校';

/*Data for the table `mgt_school` */

insert  into `mgt_school`(`id`,`no`,`name`,`type`,`address`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','110110','师大附小','1','北京市哈哈哈哈哈哈哈哈哈哈哈','10','2014-07-25 13:56:20','10','2014-07-25 13:56:20','','0');

/*Table structure for table `mgt_teacher` */

DROP TABLE IF EXISTS `mgt_teacher`;

CREATE TABLE `mgt_teacher` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `no` varchar(100) NOT NULL COMMENT '老师编号',
  `login_name` varchar(100) DEFAULT NULL COMMENT '登录名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(100) DEFAULT NULL COMMENT 'email',
  `phone` varchar(100) DEFAULT NULL COMMENT '手机号',
  `mobile` varchar(100) DEFAULT NULL COMMENT '电话',
  `type` char(1) NOT NULL DEFAULT '0' COMMENT '类型',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='老师';

/*Data for the table `mgt_teacher` */

/*Table structure for table `sys_area` */

DROP TABLE IF EXISTS `sys_area`;

CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `name` varchar(100) NOT NULL COMMENT '区域名称',
  `type` char(1) DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_parent_ids` (`parent_ids`(255)),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

/*Data for the table `sys_area` */

insert  into `sys_area`(`id`,`parent_id`,`parent_ids`,`code`,`name`,`type`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','0','0,','100000','中国','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','8','0,1,2,','370532','历城区','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('11','8','0,1,2,','370533','历城区','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('12','8','0,1,2,','370534','历下区','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('13','8','0,1,2,','370535','天桥区','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','8','0,1,2,','370536','槐荫区','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('2','1','0,1,','110000','北京市','2','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','110101','东城区','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','2','0,1,2,','110102','西城区','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','2','0,1,2,','110103','朝阳区','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','2','0,1,2,','110104','丰台区','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','2','0,1,2,','110105','海淀区','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','1','0,1,','370000','山东省','2','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('9','8','0,1,2,','370531','济南市','3','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1');

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` int(11) NOT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`label`,`value`,`type`,`description`,`sort`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','正常','0','del_flag','删除标记',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','黄色','yellow','color','颜色值',40,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','橙色','orange','color','颜色值',50,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','默认主题','default','theme','主题方案',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','天蓝主题','cerulean','theme','主题方案',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','橙色主题','readable','theme','主题方案',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','红色主题','united','theme','主题方案',40,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','Flat主题','flat','theme','主题方案',60,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','国家','1','sys_area_type','区域类型',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','省份、直辖市','2','sys_area_type','区域类型',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','地市','3','sys_area_type','区域类型',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','删除','1','del_flag','删除标记',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','区县','4','sys_area_type','区域类型',40,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','公司','1','sys_office_type','机构类型',60,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','部门','2','sys_office_type','机构类型',70,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','一级','1','sys_office_grade','机构等级',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','二级','2','sys_office_grade','机构等级',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','三级','3','sys_office_grade','机构等级',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','四级','4','sys_office_grade','机构等级',40,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','所有数据','1','sys_data_scope','数据范围',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','所在公司及以下数据','2','sys_data_scope','数据范围',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','所在公司数据','3','sys_data_scope','数据范围',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','显示','1','show_hide','显示/隐藏',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','所在部门及以下数据','4','sys_data_scope','数据范围',40,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','所在部门数据','5','sys_data_scope','数据范围',50,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','仅本人数据','8','sys_data_scope','数据范围',90,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','按明细设置','9','sys_data_scope','数据范围',100,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','系统管理','1','sys_user_type','用户类型',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','部门经理','2','sys_user_type','用户类型',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','普通用户','3','sys_user_type','用户类型',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','基础主题','basic','cms_theme','站点主题',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','蓝色主题','blue','cms_theme','站点主题',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('39','红色主题','red','cms_theme','站点主题',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('4','隐藏','0','show_hide','显示/隐藏',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','文章模型','article','cms_module','栏目模型',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','图片模型','picture','cms_module','栏目模型',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('42','下载模型','download','cms_module','栏目模型',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('43','链接模型','link','cms_module','栏目模型',40,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('44','专题模型','special','cms_module','栏目模型',50,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('45','默认展现方式','0','cms_show_modes','展现方式',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','首栏目内容列表','1','cms_show_modes','展现方式',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('47','栏目第一条内容','2','cms_show_modes','展现方式',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('48','发布','0','cms_del_flag','内容状态',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('49','删除','1','cms_del_flag','内容状态',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','是','1','yes_no','是/否',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','审核','2','cms_del_flag','内容状态',15,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','首页焦点图','1','cms_posid','推荐位',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','栏目页文章推荐','2','cms_posid','推荐位',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','咨询','1','cms_guestbook','留言板分类',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('54','建议','2','cms_guestbook','留言板分类',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('55','投诉','3','cms_guestbook','留言板分类',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('56','其它','4','cms_guestbook','留言板分类',40,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('57','公休','1','oa_leave_type','请假类型',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('58','病假','2','oa_leave_type','请假类型',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('59','事假','3','oa_leave_type','请假类型',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','否','0','yes_no','是/否',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','调休','4','oa_leave_type','请假类型',40,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('61','婚假','5','oa_leave_type','请假类型',60,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('62','接入日志','1','sys_log_type','日志类型',30,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('63','异常日志','2','sys_log_type','日志类型',40,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('64','单表增删改查','single','prj_template_type','代码模板',10,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('65','所有entity和dao','entityAndDao','prj_template_type','代码模板',20,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('7','红色','red','color','颜色值',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','绿色','green','color','颜色值',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','蓝色','blue','color','颜色值',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

/*Data for the table `sys_log` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '菜单名称',
  `href` varchar(255) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `sort` int(11) NOT NULL COMMENT '排序（升序）',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_parent_ids` (`parent_ids`(255)),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parent_id`,`parent_ids`,`name`,`href`,`target`,`icon`,`sort`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('0673eaa850b846d7a7fcb12b2d37917e','6fef8abc64124554aabde20168f92b8f','0,1,27,6fef8abc64124554aabde20168f92b8f,','家长信息','/mgt/parents','','',50,'1','','1','2014-07-24 09:28:43','1','2014-07-24 10:04:18',NULL,'0'),('074bed4b7f3b40bda7bba30488e8ce24','d757dc58db014883851682be45f8a945','0,1,27,d757dc58db014883851682be45f8a945,','到校离校记录','/mgt/sign','','',30,'1','','1','2014-07-24 09:46:00','1','2014-07-24 10:26:50',NULL,'0'),('1','0','0,','顶级菜单',NULL,NULL,NULL,0,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','3','0,1,2,3,','字典管理','/sys/dict/',NULL,'th-list',60,'1',NULL,'1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:04',NULL,'0'),('1027caa25a414f2b917027ddb1195744','712a19a7b8fb477eaffc36ca03b7ec0e','0,1,27,a54dc2c282674995ac7ee5478fc9a637,712a19a7b8fb477eaffc36ca03b7ec0e,','查看','','','',30,'0','mgt:school:view','1','2014-07-24 10:19:04','1','2014-07-24 10:19:48',NULL,'0'),('11','10','0,1,2,3,10,','查看',NULL,NULL,NULL,30,'0','sys:dict:view','1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:04',NULL,'0'),('12','10','0,1,2,3,10,','修改',NULL,NULL,NULL,30,'0','sys:dict:edit','1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:05',NULL,'0'),('13','2','0,1,2,','机构用户',NULL,NULL,NULL,970,'1',NULL,'1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:01',NULL,'0'),('14','13','0,1,2,13,','区域管理','/sys/area/',NULL,'th',50,'1',NULL,'1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:03',NULL,'0'),('15','14','0,1,2,13,14,','查看',NULL,NULL,NULL,30,'0','sys:area:view','1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:03',NULL,'0'),('16','14','0,1,2,13,14,','修改',NULL,NULL,NULL,30,'0','sys:area:edit','1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:03',NULL,'0'),('17','13','0,1,2,13,','机构管理','/sys/office/',NULL,'th-large',40,'1',NULL,'1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:02',NULL,'1'),('18','17','0,1,2,13,17,','查看',NULL,NULL,NULL,30,'0','sys:office:view','1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:02',NULL,'1'),('19','17','0,1,2,13,17,','修改',NULL,NULL,NULL,30,'0','sys:office:edit','1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:02',NULL,'1'),('2','1','0,1,','系统设置',NULL,NULL,NULL,900,'1',NULL,'1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:01',NULL,'0'),('20','13','0,1,2,13,','用户管理','/sys/user/',NULL,'user',30,'1',NULL,'1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:02',NULL,'0'),('21','20','0,1,2,13,20,','查看',NULL,NULL,NULL,30,'0','sys:user:view','1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:02',NULL,'0'),('22','20','0,1,2,13,20,','修改',NULL,NULL,NULL,30,'0','sys:user:edit','1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:02',NULL,'0'),('227b037cb5104e1788c0663983168fa6','074bed4b7f3b40bda7bba30488e8ce24','0,1,27,d757dc58db014883851682be45f8a945,074bed4b7f3b40bda7bba30488e8ce24,','查看','','','',30,'0','mgt:sign:view','1','2014-07-24 09:46:47','1','2014-07-24 10:27:11',NULL,'0'),('24453261ba094e47926654ecbe46deb5','6fef8abc64124554aabde20168f92b8f','0,1,27,6fef8abc64124554aabde20168f92b8f,','管理员信息','/mgt/operator','','',30,'1','','1','2014-06-03 09:25:39','1','2014-07-24 16:22:50',NULL,'0'),('27','1','0,1,','我的面板',NULL,NULL,NULL,100,'1',NULL,'1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:09:55',NULL,'0'),('28','27','0,1,27,','个人信息','','','',30,'1','','1','2013-05-27 08:00:00','1','2014-06-03 09:36:28',NULL,'0'),('29','28','0,1,27,28,','个人信息','/sys/user/info',NULL,'user',30,'1',NULL,'1','2013-05-27 08:00:00','1','2014-06-03 09:36:28',NULL,'0'),('2aa78fa366da466e998709fb1de5d4e2','a54dc2c282674995ac7ee5478fc9a637','0,1,27,a54dc2c282674995ac7ee5478fc9a637,','课表管理','/mgt/coursetable','','',50,'1','','1','2014-07-24 09:41:17','1','2014-07-24 10:15:31',NULL,'0'),('2f26a0bdfc1c46d3a7353a0aa3878545','5f5793afa6ed4112ac448dca26367cb5','0,1,27,d757dc58db014883851682be45f8a945,5f5793afa6ed4112ac448dca26367cb5,','查看','','','',30,'0','mgt:template:view','1','2014-07-24 10:29:49','1','2014-07-24 10:29:49',NULL,'0'),('3','2','0,1,2,','系统设置',NULL,NULL,NULL,980,'1',NULL,'1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:03',NULL,'0'),('30','28','0,1,27,28,','修改密码','/sys/user/modifyPwd',NULL,'lock',40,'1',NULL,'1','2013-05-27 08:00:00','1','2014-06-03 09:36:28',NULL,'0'),('31','1','0,1,','内容管理',NULL,NULL,NULL,500,'1',NULL,'1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:09:56',NULL,'0'),('3cc2e6987c134265b765ec1da4789110','2aa78fa366da466e998709fb1de5d4e2','0,1,27,a54dc2c282674995ac7ee5478fc9a637,2aa78fa366da466e998709fb1de5d4e2,','修改','','','',40,'0','mgt:coursetable:edit','1','2014-07-24 10:22:57','1','2014-07-24 10:22:57',NULL,'0'),('4','3','0,1,2,3,','菜单管理','/sys/menu/',NULL,'list-alt',30,'1',NULL,'1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:03',NULL,'0'),('40','31','0,1,31,','内容管理',NULL,NULL,NULL,500,'1','cms:view','1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:09:56',NULL,'0'),('5','4','0,1,2,3,4,','查看',NULL,NULL,NULL,30,'0','sys:menu:view','1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:04',NULL,'0'),('54864b5235a94c448b3b143b89f798b2','d757dc58db014883851682be45f8a945','0,1,27,d757dc58db014883851682be45f8a945,','内部消息记录','/mgt/message','','',40,'1','','1','2014-07-24 09:48:50','1','2014-07-24 10:27:35',NULL,'0'),('56','40','0,1,31,40,','文件管理','/../static/ckfinder/ckfinder.html',NULL,'folder-open',90,'1',NULL,'1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:09:59',NULL,'0'),('57','56','0,1,31,40,56,','查看',NULL,NULL,NULL,30,'0','cms:ckfinder:view','1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:09:59',NULL,'0'),('58','56','0,1,31,40,56,','上传',NULL,NULL,NULL,30,'0','cms:ckfinder:upload','1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:09:59',NULL,'0'),('59','56','0,1,31,40,56,','修改',NULL,NULL,NULL,30,'0','cms:ckfinder:edit','1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:00',NULL,'0'),('5f5793afa6ed4112ac448dca26367cb5','d757dc58db014883851682be45f8a945','0,1,27,d757dc58db014883851682be45f8a945,','消息模版','/mgt/template','','',50,'1','','1','2014-07-24 10:09:56','1','2014-07-24 10:29:21',NULL,'0'),('6','4','0,1,2,3,4,','修改',NULL,NULL,NULL,30,'0','sys:menu:edit','1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:03',NULL,'0'),('62182f288aae448bbe721008effd25d4','a54dc2c282674995ac7ee5478fc9a637','0,1,27,a54dc2c282674995ac7ee5478fc9a637,','班级信息','/mgt/banji','','',40,'1','','1','2014-07-24 09:33:13','1','2014-07-24 10:13:23',NULL,'0'),('64e753d986b8432eb3e180e04149cfaf','2aa78fa366da466e998709fb1de5d4e2','0,1,27,a54dc2c282674995ac7ee5478fc9a637,2aa78fa366da466e998709fb1de5d4e2,','查看','','','',30,'0','mgt:coursetable:view','1','2014-07-24 10:22:01','1','2014-07-24 10:22:01',NULL,'0'),('67','2','0,1,2,','日志查询',NULL,NULL,NULL,985,'1',NULL,'1','2013-06-03 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:05',NULL,'0'),('68','67','0,1,2,67,','日志查询','/sys/log',NULL,'pencil',30,'1','sys:log:view','1','2013-06-03 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:05',NULL,'0'),('6f4c55045fc94ff6b246a6764efde640','9bbfafbaac3d45aa8b7034163396234d','0,1,27,acaf879d6ce24f129b2b44031327b570,9bbfafbaac3d45aa8b7034163396234d,','查看','','','',30,'0','factory:product:view','1','2014-06-03 09:41:47','1','2014-07-24 09:42:53',NULL,'0'),('6fef8abc64124554aabde20168f92b8f','27','0,1,27,','用户管理','','','',40,'1','','1','2014-06-03 09:23:40','1','2014-06-03 09:23:40',NULL,'0'),('7','3','0,1,2,3,','角色管理','/sys/role/',NULL,'lock',50,'1',NULL,'1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:04',NULL,'0'),('70d185241c87477c9a1faeb3e92096f8','712a19a7b8fb477eaffc36ca03b7ec0e','0,1,27,a54dc2c282674995ac7ee5478fc9a637,712a19a7b8fb477eaffc36ca03b7ec0e,','修改','','','',40,'0','mgt:school:edit','1','2014-07-24 10:19:04','1','2014-07-24 10:19:32',NULL,'0'),('712a19a7b8fb477eaffc36ca03b7ec0e','a54dc2c282674995ac7ee5478fc9a637','0,1,27,a54dc2c282674995ac7ee5478fc9a637,','学校信息','/mgt/school','','',30,'1','','1','2014-07-24 09:32:58','1','2014-07-24 10:13:02',NULL,'0'),('73','32','0,1,31,32','模板管理','/cms/template',NULL,'pencil',40,'1',NULL,'1','2013-12-12 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:09:56',NULL,'0'),('76d40fb305c24ac8a62847ac46efb58d','8f715dcce4ba48478801f8baaabc6f2c','0,1,27,6fef8abc64124554aabde20168f92b8f,8f715dcce4ba48478801f8baaabc6f2c,','修改','','','',40,'0','mgt:teacher:edit','1','2014-07-24 10:02:09','1','2014-07-24 10:02:09',NULL,'0'),('7b0fb67b482f4d2dbc6371d8feacd462','62182f288aae448bbe721008effd25d4','0,1,27,a54dc2c282674995ac7ee5478fc9a637,62182f288aae448bbe721008effd25d4,','修改','','','',40,'0','mgt:banji:edit','1','2014-07-24 10:21:06','1','2014-07-24 10:21:06',NULL,'0'),('7c747113e6124d0a9f047dbbfcfb7e87','0673eaa850b846d7a7fcb12b2d37917e','0,1,27,6fef8abc64124554aabde20168f92b8f,0673eaa850b846d7a7fcb12b2d37917e,','查看','','','',30,'0','mgt:parents:view','1','2014-07-24 10:04:52','1','2014-07-24 17:47:24',NULL,'0'),('8','7','0,1,2,3,7,','查看',NULL,NULL,NULL,30,'0','sys:role:view','1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:04',NULL,'0'),('82dc325ec9134bf297af8ed48131b9b2','8f715dcce4ba48478801f8baaabc6f2c','0,1,27,6fef8abc64124554aabde20168f92b8f,8f715dcce4ba48478801f8baaabc6f2c,','查看','','','',30,'0','mgt:teacher:view','1','2014-07-24 10:01:32','1','2014-07-24 10:01:32',NULL,'0'),('87def6b7602a425cab4d6bdf0f794dde','62182f288aae448bbe721008effd25d4','0,1,27,a54dc2c282674995ac7ee5478fc9a637,62182f288aae448bbe721008effd25d4,','查看','','','',30,'0','mgt:banji:view','1','2014-07-24 10:20:29','1','2014-07-24 10:20:29',NULL,'0'),('8f715dcce4ba48478801f8baaabc6f2c','6fef8abc64124554aabde20168f92b8f','0,1,27,6fef8abc64124554aabde20168f92b8f,','教师信息','/mgt/teacher','','',40,'1','','1','2014-07-23 17:41:17','1','2014-07-24 10:00:19',NULL,'0'),('9','7','0,1,2,3,7,','修改',NULL,NULL,NULL,30,'0','sys:role:edit','1','2013-05-27 08:00:00','0bff2462495042f79bbabeb109e20b28','2014-05-29 10:10:04',NULL,'0'),('9bbb894a16ce403c8a28e8c18ccf47d5','0673eaa850b846d7a7fcb12b2d37917e','0,1,27,6fef8abc64124554aabde20168f92b8f,0673eaa850b846d7a7fcb12b2d37917e,','修改','','','',30,'0','mgt:parents:edit','1','2014-07-24 10:05:27','1','2014-07-24 10:05:27',NULL,'0'),('9bbfafbaac3d45aa8b7034163396234d','acaf879d6ce24f129b2b44031327b570','0,1,27,acaf879d6ce24f129b2b44031327b570,','设备信息','/factory/product','','',30,'1','','1','2014-06-03 09:40:44','1','2014-07-24 09:42:53',NULL,'0'),('a54dc2c282674995ac7ee5478fc9a637','27','0,1,27,','班级管理','','','',50,'1','','1','2014-07-24 09:32:28','1','2014-07-24 09:32:28',NULL,'0'),('ac28ca49b756411d9aba1f5de2a316a1','24453261ba094e47926654ecbe46deb5','0,1,27,6fef8abc64124554aabde20168f92b8f,24453261ba094e47926654ecbe46deb5,','查看','','','',30,'0','mgt:operator:view','1','2014-06-03 09:28:10','1','2014-07-24 16:23:36',NULL,'0'),('acaf879d6ce24f129b2b44031327b570','27','0,1,27,','设备管理','','','',80,'1','','1','2014-06-03 09:38:58','1','2014-07-24 09:42:53',NULL,'0'),('ae987afd2c104ee097cf266ea223278d','9bbfafbaac3d45aa8b7034163396234d','0,1,27,acaf879d6ce24f129b2b44031327b570,9bbfafbaac3d45aa8b7034163396234d,','修改','','','',40,'0','factory:product:edit','1','2014-06-03 09:42:13','1','2014-07-24 09:42:53',NULL,'0'),('d4d78bb2bd4940f69bfb30456ff054e3','54864b5235a94c448b3b143b89f798b2','0,1,27,d757dc58db014883851682be45f8a945,54864b5235a94c448b3b143b89f798b2,','查看','','','',30,'0','mgt:message:view','1','2014-07-24 10:28:07','1','2014-07-24 10:28:07',NULL,'0'),('d757dc58db014883851682be45f8a945','27','0,1,27,','消息管理','','','',60,'1','','1','2014-07-24 09:42:27','1','2014-07-24 09:42:27',NULL,'0'),('d98b6827131a478f95b26e809b8329e6','5f5793afa6ed4112ac448dca26367cb5','0,1,27,d757dc58db014883851682be45f8a945,5f5793afa6ed4112ac448dca26367cb5,','修改','','','',40,'0','mgt:template:edit','1','2014-07-24 10:30:44','1','2014-07-24 10:30:44',NULL,'0'),('e5f301a0531a4fd3b03cb37b5a1ad296','24453261ba094e47926654ecbe46deb5','0,1,27,6fef8abc64124554aabde20168f92b8f,24453261ba094e47926654ecbe46deb5,','修改','','','',30,'0','mgt:operator:edit','1','2014-06-03 09:28:28','1','2014-07-24 16:23:51',NULL,'0'),('e840b609d64346ca87c3e7f60eafd68b','acaf879d6ce24f129b2b44031327b570','0,1,27,acaf879d6ce24f129b2b44031327b570,','激活设备信息','/factory/product/?otherTest=2','','',40,'1','','1','2014-06-05 16:04:58','1','2014-07-24 09:42:53',NULL,'0');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `role` varchar(50) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`role`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','超级管理员','superadmin','1','2013-05-27 08:00:00','1','2014-06-05 16:05:19',NULL,'0'),('2','运营管理员','admin','1','2013-05-27 08:00:00','1','2014-07-24 10:31:30',NULL,'0'),('3','班主任',NULL,'1','2013-05-27 08:00:00','1','2014-07-23 16:57:52',NULL,'0'),('4','普通老师',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','学生家长',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','test',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values ('1','1'),('1','24453261ba094e47926654ecbe46deb5'),('1','27'),('1','28'),('1','29'),('1','30'),('1','6f4c55045fc94ff6b246a6764efde640'),('1','6fef8abc64124554aabde20168f92b8f'),('1','9bbfafbaac3d45aa8b7034163396234d'),('1','ac28ca49b756411d9aba1f5de2a316a1'),('1','acaf879d6ce24f129b2b44031327b570'),('1','ae987afd2c104ee097cf266ea223278d'),('1','e5f301a0531a4fd3b03cb37b5a1ad296'),('1','e840b609d64346ca87c3e7f60eafd68b'),('2','0673eaa850b846d7a7fcb12b2d37917e'),('2','074bed4b7f3b40bda7bba30488e8ce24'),('2','1'),('2','1027caa25a414f2b917027ddb1195744'),('2','227b037cb5104e1788c0663983168fa6'),('2','24453261ba094e47926654ecbe46deb5'),('2','27'),('2','28'),('2','29'),('2','2aa78fa366da466e998709fb1de5d4e2'),('2','2f26a0bdfc1c46d3a7353a0aa3878545'),('2','30'),('2','3cc2e6987c134265b765ec1da4789110'),('2','54864b5235a94c448b3b143b89f798b2'),('2','5f5793afa6ed4112ac448dca26367cb5'),('2','62182f288aae448bbe721008effd25d4'),('2','64e753d986b8432eb3e180e04149cfaf'),('2','6fef8abc64124554aabde20168f92b8f'),('2','70d185241c87477c9a1faeb3e92096f8'),('2','712a19a7b8fb477eaffc36ca03b7ec0e'),('2','76d40fb305c24ac8a62847ac46efb58d'),('2','7b0fb67b482f4d2dbc6371d8feacd462'),('2','7c747113e6124d0a9f047dbbfcfb7e87'),('2','82dc325ec9134bf297af8ed48131b9b2'),('2','87def6b7602a425cab4d6bdf0f794dde'),('2','8f715dcce4ba48478801f8baaabc6f2c'),('2','9bbb894a16ce403c8a28e8c18ccf47d5'),('2','a54dc2c282674995ac7ee5478fc9a637'),('2','ac28ca49b756411d9aba1f5de2a316a1'),('2','d4d78bb2bd4940f69bfb30456ff054e3'),('2','d757dc58db014883851682be45f8a945'),('2','d98b6827131a478f95b26e809b8329e6'),('2','e5f301a0531a4fd3b03cb37b5a1ad296'),('22a9013fa1594ab09f2ba01a62f4cc7e','1'),('22a9013fa1594ab09f2ba01a62f4cc7e','10'),('22a9013fa1594ab09f2ba01a62f4cc7e','11'),('22a9013fa1594ab09f2ba01a62f4cc7e','12'),('22a9013fa1594ab09f2ba01a62f4cc7e','13'),('22a9013fa1594ab09f2ba01a62f4cc7e','14'),('22a9013fa1594ab09f2ba01a62f4cc7e','15'),('22a9013fa1594ab09f2ba01a62f4cc7e','16'),('22a9013fa1594ab09f2ba01a62f4cc7e','17'),('22a9013fa1594ab09f2ba01a62f4cc7e','18'),('22a9013fa1594ab09f2ba01a62f4cc7e','19'),('22a9013fa1594ab09f2ba01a62f4cc7e','2'),('22a9013fa1594ab09f2ba01a62f4cc7e','20'),('22a9013fa1594ab09f2ba01a62f4cc7e','21'),('22a9013fa1594ab09f2ba01a62f4cc7e','22'),('22a9013fa1594ab09f2ba01a62f4cc7e','23'),('22a9013fa1594ab09f2ba01a62f4cc7e','24'),('22a9013fa1594ab09f2ba01a62f4cc7e','25'),('22a9013fa1594ab09f2ba01a62f4cc7e','26'),('22a9013fa1594ab09f2ba01a62f4cc7e','27'),('22a9013fa1594ab09f2ba01a62f4cc7e','28'),('22a9013fa1594ab09f2ba01a62f4cc7e','29'),('22a9013fa1594ab09f2ba01a62f4cc7e','3'),('22a9013fa1594ab09f2ba01a62f4cc7e','30'),('22a9013fa1594ab09f2ba01a62f4cc7e','31'),('22a9013fa1594ab09f2ba01a62f4cc7e','32'),('22a9013fa1594ab09f2ba01a62f4cc7e','33'),('22a9013fa1594ab09f2ba01a62f4cc7e','34'),('22a9013fa1594ab09f2ba01a62f4cc7e','35'),('22a9013fa1594ab09f2ba01a62f4cc7e','36'),('22a9013fa1594ab09f2ba01a62f4cc7e','37'),('22a9013fa1594ab09f2ba01a62f4cc7e','38'),('22a9013fa1594ab09f2ba01a62f4cc7e','39'),('22a9013fa1594ab09f2ba01a62f4cc7e','4'),('22a9013fa1594ab09f2ba01a62f4cc7e','40'),('22a9013fa1594ab09f2ba01a62f4cc7e','41'),('22a9013fa1594ab09f2ba01a62f4cc7e','42'),('22a9013fa1594ab09f2ba01a62f4cc7e','43'),('22a9013fa1594ab09f2ba01a62f4cc7e','44'),('22a9013fa1594ab09f2ba01a62f4cc7e','45'),('22a9013fa1594ab09f2ba01a62f4cc7e','46'),('22a9013fa1594ab09f2ba01a62f4cc7e','47'),('22a9013fa1594ab09f2ba01a62f4cc7e','48'),('22a9013fa1594ab09f2ba01a62f4cc7e','49'),('22a9013fa1594ab09f2ba01a62f4cc7e','5'),('22a9013fa1594ab09f2ba01a62f4cc7e','50'),('22a9013fa1594ab09f2ba01a62f4cc7e','51'),('22a9013fa1594ab09f2ba01a62f4cc7e','52'),('22a9013fa1594ab09f2ba01a62f4cc7e','53'),('22a9013fa1594ab09f2ba01a62f4cc7e','54'),('22a9013fa1594ab09f2ba01a62f4cc7e','55'),('22a9013fa1594ab09f2ba01a62f4cc7e','56'),('22a9013fa1594ab09f2ba01a62f4cc7e','57'),('22a9013fa1594ab09f2ba01a62f4cc7e','58'),('22a9013fa1594ab09f2ba01a62f4cc7e','59'),('22a9013fa1594ab09f2ba01a62f4cc7e','6'),('22a9013fa1594ab09f2ba01a62f4cc7e','60'),('22a9013fa1594ab09f2ba01a62f4cc7e','61'),('22a9013fa1594ab09f2ba01a62f4cc7e','62'),('22a9013fa1594ab09f2ba01a62f4cc7e','63'),('22a9013fa1594ab09f2ba01a62f4cc7e','64'),('22a9013fa1594ab09f2ba01a62f4cc7e','65'),('22a9013fa1594ab09f2ba01a62f4cc7e','66'),('22a9013fa1594ab09f2ba01a62f4cc7e','67'),('22a9013fa1594ab09f2ba01a62f4cc7e','68'),('22a9013fa1594ab09f2ba01a62f4cc7e','69'),('22a9013fa1594ab09f2ba01a62f4cc7e','7'),('22a9013fa1594ab09f2ba01a62f4cc7e','70'),('22a9013fa1594ab09f2ba01a62f4cc7e','71'),('22a9013fa1594ab09f2ba01a62f4cc7e','73'),('22a9013fa1594ab09f2ba01a62f4cc7e','74'),('22a9013fa1594ab09f2ba01a62f4cc7e','75'),('22a9013fa1594ab09f2ba01a62f4cc7e','8'),('22a9013fa1594ab09f2ba01a62f4cc7e','9'),('22a9013fa1594ab09f2ba01a62f4cc7e','d2b1ccb18e1849afbdc3df97c5f31301'),('3','1'),('3','27'),('3','28'),('3','29'),('3','30'),('3','31'),('3','40'),('3','56'),('3','57'),('3','58'),('3','59'),('3','6f4c55045fc94ff6b246a6764efde640'),('3','9bbfafbaac3d45aa8b7034163396234d'),('3','acaf879d6ce24f129b2b44031327b570'),('3','ae987afd2c104ee097cf266ea223278d'),('3','e840b609d64346ca87c3e7f60eafd68b'),('4','1'),('4','10'),('4','11'),('4','12'),('4','13'),('4','14'),('4','15'),('4','16'),('4','17'),('4','18'),('4','19'),('4','2'),('4','20'),('4','21'),('4','22'),('4','23'),('4','24'),('4','25'),('4','26'),('4','27'),('4','28'),('4','29'),('4','3'),('4','30'),('4','31'),('4','32'),('4','33'),('4','34'),('4','35'),('4','36'),('4','37'),('4','38'),('4','39'),('4','4'),('4','40'),('4','41'),('4','42'),('4','43'),('4','44'),('4','45'),('4','46'),('4','47'),('4','48'),('4','49'),('4','5'),('4','50'),('4','51'),('4','52'),('4','53'),('4','54'),('4','55'),('4','56'),('4','57'),('4','58'),('4','59'),('4','6'),('4','60'),('4','61'),('4','62'),('4','63'),('4','64'),('4','65'),('4','66'),('4','67'),('4','68'),('4','69'),('4','7'),('4','70'),('4','8'),('4','9'),('5','1'),('5','10'),('5','11'),('5','12'),('5','13'),('5','14'),('5','15'),('5','16'),('5','17'),('5','18'),('5','19'),('5','2'),('5','20'),('5','21'),('5','22'),('5','23'),('5','24'),('5','25'),('5','26'),('5','27'),('5','28'),('5','29'),('5','3'),('5','30'),('5','31'),('5','32'),('5','33'),('5','34'),('5','35'),('5','36'),('5','37'),('5','38'),('5','39'),('5','4'),('5','40'),('5','41'),('5','42'),('5','43'),('5','44'),('5','45'),('5','46'),('5','47'),('5','48'),('5','49'),('5','5'),('5','50'),('5','51'),('5','52'),('5','53'),('5','54'),('5','55'),('5','56'),('5','57'),('5','58'),('5','59'),('5','6'),('5','60'),('5','61'),('5','62'),('5','63'),('5','64'),('5','65'),('5','66'),('5','67'),('5','68'),('5','69'),('5','7'),('5','70'),('5','8'),('5','9'),('6','1'),('6','10'),('6','11'),('6','12'),('6','13'),('6','14'),('6','15'),('6','16'),('6','17'),('6','18'),('6','19'),('6','2'),('6','20'),('6','21'),('6','22'),('6','23'),('6','24'),('6','25'),('6','26'),('6','27'),('6','28'),('6','29'),('6','3'),('6','30'),('6','31'),('6','32'),('6','33'),('6','34'),('6','35'),('6','36'),('6','37'),('6','38'),('6','39'),('6','4'),('6','40'),('6','41'),('6','42'),('6','43'),('6','44'),('6','45'),('6','46'),('6','47'),('6','48'),('6','49'),('6','5'),('6','50'),('6','51'),('6','52'),('6','53'),('6','54'),('6','55'),('6','56'),('6','57'),('6','58'),('6','59'),('6','6'),('6','60'),('6','61'),('6','62'),('6','63'),('6','64'),('6','65'),('6','66'),('6','67'),('6','68'),('6','69'),('6','7'),('6','70'),('6','8'),('6','9'),('7','1'),('7','10'),('7','11'),('7','12'),('7','13'),('7','14'),('7','15'),('7','16'),('7','17'),('7','18'),('7','19'),('7','2'),('7','20'),('7','21'),('7','22'),('7','23'),('7','24'),('7','25'),('7','26'),('7','27'),('7','28'),('7','29'),('7','3'),('7','30'),('7','31'),('7','32'),('7','33'),('7','34'),('7','35'),('7','36'),('7','37'),('7','38'),('7','39'),('7','4'),('7','40'),('7','41'),('7','42'),('7','43'),('7','44'),('7','45'),('7','46'),('7','47'),('7','48'),('7','49'),('7','5'),('7','50'),('7','51'),('7','52'),('7','53'),('7','54'),('7','55'),('7','56'),('7','57'),('7','58'),('7','59'),('7','6'),('7','60'),('7','61'),('7','62'),('7','63'),('7','64'),('7','65'),('7','66'),('7','67'),('7','68'),('7','69'),('7','7'),('7','70'),('7','71'),('7','8'),('7','9');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `gender` varchar(3) DEFAULT NULL COMMENT '性别',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `student_no` varchar(100) DEFAULT NULL COMMENT '学生学号',
  `student_name` varchar(100) DEFAULT NULL COMMENT '学生姓名',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`login_name`,`password`,`no`,`name`,`gender`,`email`,`phone`,`mobile`,`student_no`,`student_name`,`login_ip`,`login_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('0bff2462495042f79bbabeb109e20b28','csyay1','3305d2df48eab70744487bf74176ca7d76376201521e396bb6a3bdb5','2012110974','余',NULL,'','','',NULL,NULL,'127.0.0.1','2014-07-23 16:12:02','2','2014-05-27 19:17:52','1','2014-06-03 09:31:18','','0'),('1','superadmin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0001','程序猿',NULL,'chengxuyuan@163.com','8675','8675',NULL,NULL,'127.0.0.1','2014-07-24 17:46:51','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','最高管理员','0'),('10','admin2','c25a42047ed2efc58049a07c2e8a012e83864783ba69653a60d3664d','121212','运营2',NULL,'thinkgem@163.com','8675','8675',NULL,NULL,'127.0.0.1','2014-07-25 14:19:52','1','2013-05-27 08:00:00','10','2014-07-24 17:08:55','','0'),('13','jiazhang2','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0013','家长2',NULL,'dede@163.com','8675','8675',NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2014-07-23 17:28:56','','0'),('14','banzhuren2','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0014','班主任2',NULL,'','8675','8675',NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2014-07-23 17:30:42','','0'),('2','admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0002','管理员',NULL,'hhaha@163.com','8675','8675',NULL,NULL,'127.0.0.1','2014-07-24 16:48:27','1','2013-05-27 08:00:00','1','2014-07-23 17:22:13','','0'),('2025677ee9b847b893695fc1ab423622','jiazhang4','cffb31725e0c5c620053e67de2eb54cc0bfaacccd90566f0c2d5f484','438343','家长4',NULL,'','','245242',NULL,NULL,NULL,NULL,'10','2014-07-24 17:48:17','10','2014-07-24 17:48:33','','0'),('3','banzhuren5','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0003','班头',NULL,'','8675','8675',NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','10','2014-07-25 10:40:04','','0'),('4','banzhuren','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0004','班主任',NULL,'','8675','8675',NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2014-07-23 17:28:13','','0'),('5','laoshi','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0005','语文老师',NULL,'','8675','8675',NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2014-07-23 17:31:15','','0'),('6','jiazhang1','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0006','家长1',NULL,'thinkgem@163.com','8675','8675',NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2014-07-23 17:24:19','','0'),('636b4f66859c49118dc2b84e10af4023','admin3','482d529d4dec65799bdc94845472f9783e7eea3d4515d351fb41f244','52785287','admin3',NULL,'','57278572','',NULL,NULL,NULL,NULL,'10','2014-07-24 17:09:35','10','2014-07-24 17:26:48','','0'),('7','banzhuren7','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0007','banzhuren7',NULL,'thinkgem@163.com','8675','8675',NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','','0'),('8','banzhuren8','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0008','班主任8',NULL,'thinkgem@163.com','8675','8675',NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','','0'),('8ab3ced4f9034b79baa7cc959f51d364','jiazhang3','d97559e83c5365b376f6bdb28091a9768ef08510e5005fb74f85038b','2311231','家长3',NULL,'','','','2012114','小明','0:0:0:0:0:0:0:1','2014-06-05 16:24:07','0bff2462495042f79bbabeb109e20b28','2014-05-27 19:22:55','10','2014-07-25 11:27:01','','0'),('9','banzhuren9','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0009','班主任9',NULL,'thinkgem@163.com','8675','8675',NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','','0'),('cabc117c4e9f4f1cb7cb90d97043ad1a','banzhuren3','a0a6d5a5ea73daa5aecd9e0d60aad7191f8849df8dafc83fbb43acc7','615164','banzhuren3',NULL,'','','',NULL,NULL,NULL,NULL,'10','2014-07-24 17:37:30','10','2014-07-24 17:37:30','dad','0'),('d939fabeb9e042dbabcb34312ee958cd','adada','56510c2ecf3bcf649e01e984ae76b71bffc5fd3ecd013a181ca00043','dadada','adwd',NULL,'','','',NULL,NULL,NULL,NULL,'0bff2462495042f79bbabeb109e20b28','2014-07-22 11:24:19','0bff2462495042f79bbabeb109e20b28','2014-07-22 11:24:19','','0');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values ('0bff2462495042f79bbabeb109e20b28','1'),('1','1'),('10','2'),('11','3'),('12','4'),('13','5'),('14','3'),('2','2'),('2025677ee9b847b893695fc1ab423622','5'),('3','3'),('4','3'),('5','4'),('6','5'),('636b4f66859c49118dc2b84e10af4023','2'),('7','3'),('8','3'),('8ab3ced4f9034b79baa7cc959f51d364','5'),('9','3'),('cabc117c4e9f4f1cb7cb90d97043ad1a','3'),('d939fabeb9e042dbabcb34312ee958cd','6');

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `code` varchar(100) NOT NULL COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='test';

/*Data for the table `test` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
