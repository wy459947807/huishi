/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.17 : Database - huishi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`huishi` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `huishi`;

/*Table structure for table `hs_region_target` */

DROP TABLE IF EXISTS `hs_region_target`;

CREATE TABLE `hs_region_target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regionname` varchar(255) NOT NULL COMMENT '区域名称',
  `zonename` varchar(255) DEFAULT NULL COMMENT '大区名称',
  `target` int(11) DEFAULT NULL COMMENT 'MDT规定进度',
  `target_month` date DEFAULT NULL COMMENT '月份',
  `sign` varchar(255) DEFAULT NULL COMMENT '标识（防止重复插入）',
  PRIMARY KEY (`id`),
  KEY `REGIONNAME` (`regionname`) USING BTREE,
  KEY `ZONENAME` (`zonename`) USING BTREE,
  KEY `SIGN` (`sign`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `hs_region_target` */

insert  into `hs_region_target`(`id`,`regionname`,`zonename`,`target`,`target_month`,`sign`) values (1,'上海','东部',100,'2017-03-15',NULL),(2,'甘肃','西部',100,'2017-03-15',NULL),(3,'广东','南部',100,'2017-03-15',NULL),(4,'广西','南部',100,'2017-03-15',NULL),(5,'四川','中部',100,'2017-03-15',NULL),(6,'北京','北部',100,'2017-03-15',NULL);

/*Table structure for table `hs_ticket_custm` */

DROP TABLE IF EXISTS `hs_ticket_custm`;

CREATE TABLE `hs_ticket_custm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket` varchar(255) DEFAULT NULL COMMENT '唯一活动id',
  `brand` varchar(255) DEFAULT NULL COMMENT '品牌段数(启赋1，启赋2，金装经典版1，金装经典版2，金装旗舰版1，金装旗舰版2，铂臻1，铂臻2)',
  `buynum` int(11) DEFAULT NULL COMMENT '购买数量',
  `storecode` varchar(255) DEFAULT NULL COMMENT '店面ID',
  `storename` varchar(255) DEFAULT NULL COMMENT '店面名称',
  `zonename` varchar(255) DEFAULT NULL COMMENT '大区',
  `regionname` varchar(255) DEFAULT NULL COMMENT '区域',
  `physicalcity` varchar(255) DEFAULT NULL COMMENT '城市',
  `custmtype` varchar(255) DEFAULT NULL COMMENT '客户类型',
  `custmname` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `signdate` datetime DEFAULT NULL COMMENT '参与日期',
  `lng` varchar(255) DEFAULT NULL COMMENT '经度',
  `lat` varchar(255) DEFAULT NULL COMMENT '纬度',
  `sign` varchar(255) DEFAULT NULL COMMENT '标识（防止重复插入）',
  PRIMARY KEY (`id`),
  KEY `ZONENAME` (`zonename`) USING BTREE,
  KEY `REGIONNAME` (`regionname`) USING BTREE,
  KEY `SIGN` (`sign`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `hs_ticket_custm` */

insert  into `hs_ticket_custm`(`id`,`ticket`,`brand`,`buynum`,`storecode`,`storename`,`zonename`,`regionname`,`physicalcity`,`custmtype`,`custmname`,`signdate`,`lng`,`lat`,`sign`) values (1,'222','启赋1',22,'22','店面名称','东部','上海','上海市','客户类型','小王','2016-03-14 09:56:48','121.4648','31.2891',NULL),(2,'222','启赋1',22,'22','店面名称','南部','广东','东莞市','客户类型','小张','2017-03-14 09:56:48','113.8953','22.901',NULL),(4,'222','启赋1',22,'22','店面名称','南部','广西','北海市','客户类型','小花','2017-03-14 09:56:48','109.314','21.6211',NULL),(5,'222','启赋1',22,'22','店面名称','西部','甘肃','兰州市','客户类型','小明','2017-03-14 09:56:48','103.5901','36.3043',NULL),(6,'222','启赋1',22,'22','店面名称','南部','广东','佛山市','客户类型','小飞','2017-03-14 09:56:48','112.8955','23.1097',NULL),(7,'222','启赋1',22,'22','店面名称','中部','四川','成都市','客户类型','小李','2017-03-14 09:56:48','103.9526','30.7617',NULL),(8,'222','启赋1',22,'22','店面名称','东部','上海','上海市','客户类型','小华','2017-03-14 09:56:48','121.4648','31.2891',NULL),(9,'222','启赋1',22,'22','店面名称','北部','北京','北京市','客户类型','小丽','2017-03-14 09:56:48','116.4551','40.2539',NULL),(22,'11144','铂臻',12,'123','商铺名称','东部','甘肃','兰州市','客户1','客户1','2017-10-20 00:00:00','103.82330544073','36.064225525043',NULL),(26,'821549660237893052','启赋1',1,'test001','测试店面','华北区','北京','北京','MT NKA','沃尔玛','2017-03-20 13:53:00','116.39564503788','39.92998577808',NULL),(28,'203217059717448015','启赋1',1,'test001','测试店面','华北区','北京','北京','MT NKA','沃尔玛','2017-03-20 13:53:00','116.39564503788','39.92998577808',NULL),(33,'821549660237893052','启赋1',1,'test001','测试店面','华北区','北京','北京','MT NKA','沃尔玛','2017-03-20 13:53:00','116.39564503788','39.92998577808','ed238f2a44410af26e5fec52e7c381e595d18d2d');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
