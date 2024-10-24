/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.24-log : Database - permissionssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`permissionssm` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `permissionssm`;

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '无意义、主键uuid',
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `nickName` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '昵称',
  `phoneNum` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `email` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `member` */

insert  into `member`(`id`,`name`,`nickName`,`phoneNum`,`email`) values ('E61D65F673D54F68B0861025C69773DB','张三','小三','18888888888','zs@163.com');

/*Table structure for table `order_traveller` */

DROP TABLE IF EXISTS `order_traveller`;

CREATE TABLE `order_traveller` (
  `orderId` varchar(32) COLLATE utf8_bin NOT NULL,
  `travellerId` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`orderId`,`travellerId`),
  KEY `travellerId` (`travellerId`),
  CONSTRAINT `order_traveller_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_traveller_ibfk_2` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `order_traveller` */

insert  into `order_traveller`(`orderId`,`travellerId`) values ('0E7231DC797C486290E8713CA3C6ECCC','3FE27DF2A4E44A6DBC5D0FE4651D3D3E'),('2FF351C4AC744E2092DCF08CFD314420','3FE27DF2A4E44A6DBC5D0FE4651D3D3E'),('5DC6A48DD4E94592AE904930EA866AFA','3FE27DF2A4E44A6DBC5D0FE4651D3D3E'),('A0657832D93E4B10AE88A2D4B70B1A28','3FE27DF2A4E44A6DBC5D0FE4651D3D3E'),('3081770BC3984EF092D9E99760FDABDE','EE7A71FB6945483FBF91543DBE851960'),('55F9AF582D5A4DB28FB4EC3199385762','EE7A71FB6945483FBF91543DBE851960'),('96CC8BD43C734CC2ACBFF09501B4DD5D','EE7A71FB6945483FBF91543DBE851960'),('CA005CF1BE3C4EF68F88ABC7DF30E976','EE7A71FB6945483FBF91543DBE851960'),('E4DD4C45EED84870ABA83574A801083E','EE7A71FB6945483FBF91543DBE851960');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '无意义、主键uuid',
  `orderNum` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '订单编号 不为空 唯一',
  `orderTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '下单时间',
  `peopleCount` int(11) DEFAULT NULL COMMENT '出行人数',
  `orderDesc` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '订单描述(其它信息)',
  `payType` int(11) DEFAULT NULL COMMENT '付方式(0 支付宝 1 微信 2其它)',
  `orderStatus` int(11) DEFAULT NULL COMMENT '订单状态(0 未支付 1 已支付)',
  `productId` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '产品id',
  `memberId` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '会员id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderNum` (`orderNum`),
  KEY `productId` (`productId`),
  KEY `memberId` (`memberId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `orders` */

insert  into `orders`(`id`,`orderNum`,`orderTime`,`peopleCount`,`orderDesc`,`payType`,`orderStatus`,`productId`,`memberId`) values ('0E7231DC797C486290E8713CA3C6ECCC','12345','2018-02-03 12:00:00',2,'没什么',0,1,'676C5BD1D35E429A8C2E114939C5685A','E61D65F673D54F68B0861025C69773DB'),('2FF351C4AC744E2092DCF08CFD314420','67890','2018-02-03 12:00:00',2,'没什么',0,1,'12B7ABF2A4C544568B0A7C69F36BF8B7','E61D65F673D54F68B0861025C69773DB'),('3081770BC3984EF092D9E99760FDABDE','55555','2018-02-03 12:00:00',2,'没什么',0,1,'9F71F01CB448476DAFB309AA6DF9497F','E61D65F673D54F68B0861025C69773DB'),('3B9A2F04BB01427D8745F39586C92D90','34567','2020-06-03 22:43:00',11,'',0,0,'35DBF13FEA6B4624B390E3CB578A62D9','E61D65F673D54F68B0861025C69773DB'),('55F9AF582D5A4DB28FB4EC3199385762','33333','2018-02-03 12:00:00',2,'没什么',0,1,'9F71F01CB448476DAFB309AA6DF9497F','E61D65F673D54F68B0861025C69773DB'),('5DC6A48DD4E94592AE904930EA866AFA','54321','2018-02-03 12:00:00',2,'没什么',0,1,'676C5BD1D35E429A8C2E114939C5685A','E61D65F673D54F68B0861025C69773DB'),('96CC8BD43C734CC2ACBFF09501B4DD5D','22222','2018-02-03 12:00:00',2,'没什么',0,1,'12B7ABF2A4C544568B0A7C69F36BF8B7','E61D65F673D54F68B0861025C69773DB'),('A0657832D93E4B10AE88A2D4B70B1A28','98765','2018-02-03 12:00:00',2,'没什么',0,1,'12B7ABF2A4C544568B0A7C69F36BF8B7','E61D65F673D54F68B0861025C69773DB'),('CA005CF1BE3C4EF68F88ABC7DF30E976','44444','2018-02-03 12:00:00',2,'没什么',0,1,'9F71F01CB448476DAFB309AA6DF9497F','E61D65F673D54F68B0861025C69773DB'),('E4DD4C45EED84870ABA83574A801083E','11111','2018-02-03 12:00:00',2,'没什么',0,1,'12B7ABF2A4C544568B0A7C69F36BF8B7','E61D65F673D54F68B0861025C69773DB');

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `pid` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '无意义，主键uuid',
  `permissionName` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '权限名',
  `url` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '资源路径',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `permission` */

insert  into `permission`(`pid`,`permissionName`,`url`) values ('123','user findAll','/user/findAll.do'),('234','user findById','/user/findById.do');

/*Table structure for table `persistent_logins` */

DROP TABLE IF EXISTS `persistent_logins`;

CREATE TABLE `persistent_logins` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `series` varchar(64) COLLATE utf8_bin NOT NULL,
  `token` varchar(64) COLLATE utf8_bin NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `persistent_logins` */

insert  into `persistent_logins`(`username`,`series`,`token`,`last_used`) values ('lzx','j/jMul2wGppPsB7Qj5nxtw==','WPB2hileMx1+wB/PdYSnsQ==','2020-06-28 13:53:56'),('lzx','ke2hRhNm2ITFU8KbyVFhvQ==','iyfZ9UySna8Xs1wFEUCCcA==','2020-06-28 23:59:42'),('lzx','pLW4aLSfUTmcafSHCE1Q9g==','1roq//w0eUOU4ERjnM4mpg==','2020-06-28 15:15:51'),('lzx','z1OnfnCQgm8aawZSdVmHfQ==','PtMzEfUkZRASchbY3097LQ==','2020-07-18 10:21:53');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `productNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品编号',
  `productName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品名',
  `cityName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '出发城市名',
  `departureTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '出发时间',
  `productPrice` double DEFAULT NULL COMMENT '产品价格',
  `productDesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品描述',
  `productStatus` int(11) DEFAULT NULL COMMENT '产品状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`,`productNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `product` */

insert  into `product`(`id`,`productNum`,`productName`,`cityName`,`departureTime`,`productPrice`,`productDesc`,`productStatus`) values ('0E64A795156F45DEAC07FB0A72A92B27','itcast-004','北京4日游','北京','2020-05-25 16:13:48',10000,'',1),('12B7ABF2A4C544568B0A7C69F36BF8B7','xpt-003','上海五日游','上海','2018-04-25 14:30:00',1800,'魔都我来了',0),('35DBF13FEA6B4624B390E3CB578A62D9','itcast-002','北京2日游','北京','2020-05-25 16:13:24',100,'',0),('4E50876AFC96414D98711A387A9ED927','itcast-003','北京3日游','北京',NULL,100,'',0),('676C5BD1D35E429A8C2E114939C5685A','xpt-002','北京二日游','北京',NULL,1200,'不错的旅行',1),('9F71F01CB448476DAFB309AA6DF9497F','xpt-001','北京一日游','北京',NULL,1200,'不错的旅行',1),('CEC75B42A32D43F485C8000104B996D1','itcast-006','北京6日游','北京',NULL,100,'',1),('f55a998e8d764f669f7583cb1bd93193','itcast-001','北京1日游','北京','2020-05-18 22:10:51',100,'哈哈哈哈',1);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `rid` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '无意义，主键uuid',
  `roleName` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '角色名',
  `roleDesc` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `role` */

insert  into `role`(`rid`,`roleName`,`roleDesc`) values ('1111','ADMIN','vip'),('2222','USER','vip'),('3333','EMP','ordinary'),('4444','GUEST','ordinary');

/*Table structure for table `role_permission` */

DROP TABLE IF EXISTS `role_permission`;

CREATE TABLE `role_permission` (
  `permissionId` varchar(32) COLLATE utf8_bin NOT NULL,
  `roleId` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`permissionId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`pid`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `role_permission` */

insert  into `role_permission`(`permissionId`,`roleId`) values ('123','1111'),('234','1111'),('123','2222');

/*Table structure for table `syslog` */

DROP TABLE IF EXISTS `syslog`;

CREATE TABLE `syslog` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '主键 无意义uuid',
  `visitTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '访问时间',
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '操作者用户名',
  `ip` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '访问ip',
  `url` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '访问资源url',
  `executionTime` int(11) DEFAULT NULL COMMENT '执行时长',
  `method` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '访问方法',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `syslog` */

insert  into `syslog`(`id`,`visitTime`,`username`,`ip`,`url`,`executionTime`,`method`) values ('0351541CC1F3473BA05D822CAFE639F1','2020-09-30 20:14:25','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',8,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('03F3852B2717472C854D728A990E1A44','2020-09-30 20:14:04','lzx','0:0:0:0:0:0:0:1','/product/findAll.do',263,'[类名] com.itheima.web.ProductController[方法名] findAll'),('042FFF5FD89D4D6EAB9F0BC6D160988F','2020-09-30 20:14:37','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('05B960AD2DA34391AA896318D3132284','2020-09-30 20:14:00','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('05E23F755DB9432D9DF1169D55F970CD','2020-09-30 20:15:14','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',4,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('0CAC36469BE047A6934401D75BA07858','2020-09-30 20:15:23','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',8,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('0EC856B70EBA4C6BB778A65A802816F5','2020-09-30 20:14:36','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('100386A1503F40B3B7A1B54923A1F850','2020-09-30 20:16:39','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('10ABD071B0154E2F8D3747883876388F','2020-09-30 20:14:47','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('1194EA2F81FA446BB2789E804B50F081','2020-09-30 20:15:08','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('16AD42281172495AA482B490DAF1D098','2020-09-30 20:16:42','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',8,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('199A2EE52985451F8AC4F06DEA9E4E8C','2020-09-30 20:14:36','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('19F16DC4BC994B13A1D6D4871DB321DC','2020-09-30 20:15:15','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',5,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('1ABBC100558E44709DAA7FF10B5562BE','2020-09-30 20:17:09','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',5,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('1C81D80BBC4D4C978A3E0D5D4561C217','2020-09-30 20:13:55','lzx','0:0:0:0:0:0:0:1','/user/findAll.do',10,'[类名] com.itheima.web.UserController[方法名] findAll'),('1D0D7962383A44F2BFC690E2D3F06C57','2020-09-30 20:14:40','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('208A9817432B4607A2660CFA3560630F','2020-09-30 20:15:19','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',5,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('25CD65F7505F4A80A5048AE6D19704C1','2020-09-30 20:15:07','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',9,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('26B30430243E4351B73D0E84A0559531','2020-09-30 20:14:52','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',9,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('2712BC1843A24DACA6C635E2A52B4F36','2020-09-30 20:13:45','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',8,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('2972992BA70E413AABBD0A5C042576CE','2020-09-30 20:14:11','lzx','0:0:0:0:0:0:0:1','/orders/findById.do',73,'[类名] com.itheima.web.OrdersController[方法名] findById'),('2B457F45A25F46548006E3CE86B53AE9','2020-09-30 20:13:38','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('2C59BA3CA8DB4F90B2B04DB9F2495CFB','2020-09-30 20:15:39','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',9,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('2F00AF8FB57A4D90AD88D5C04DFBB87D','2020-09-30 20:15:08','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',5,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('302A9C9A49DD4E759A726D9C0695F301','2020-09-30 20:15:15','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('31CAE260660C4949A774B9E96AB10CC9','2020-09-30 20:15:18','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('381ED09B59FB4806905B2EE5D0212088','2020-09-30 20:14:36','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('397226ED1AA2438A85CB659CD707BEB0','2020-09-30 20:14:18','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('3CC27B9FD9204287BDAE476CBB37FDEB','2020-09-30 20:15:03','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('3DA2BA56FD12422F88BCED4C416FCA3D','2020-09-30 20:16:34','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('40620F8B56B04E7B8E03A02FDFA58654','2020-09-30 20:15:19','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('40BEBB7281D640A0835898429BB04509','2020-09-30 20:14:28','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('42A8D4AE5D4547EC9489D5181C174E27','2020-09-30 20:16:50','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',8,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('4309166D7D924E6B8EAA55CE9BF5CC07','2020-09-30 20:14:38','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',9,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('43D3550581D74BF79B6567E4129CDF9D','2020-09-30 20:14:41','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('4B41459BCD364178AE3B30525D5FDEAF','2020-09-30 20:14:40','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('4B8E2D45BA9D44198DB8DD948F6507A1','2020-09-30 20:15:35','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',5,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('4CC5A148EEA34E39ABD56CD6169ABE0A','2020-09-30 20:17:00','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',8,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('4D5E88365DFB4283BAE37FBF79DF83AF','2020-09-30 20:14:55','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',8,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('51C57B1A6FD8434BA7D34856A0974C02','2020-09-30 20:16:52','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('558D76803FF24CE1A67E2BCFFC4B5CB4','2020-09-30 20:15:07','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',4,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('5AC05D48A90045278E8716A3D95B27FC','2020-09-30 20:16:47','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('5BEA307C2ADB4A5EACF30FC17842F89B','2020-09-30 20:15:16','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('61685AD003E14444BEFC6470D02592F9','2020-09-30 20:14:07','lzx','0:0:0:0:0:0:0:1','/orders/findAll.do',62,'[类名] com.itheima.web.OrdersController[方法名] findAll'),('6982336B413345769ED7E68EC505A33B','2020-09-30 20:15:17','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',5,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('6BB9A28424A7460BB2694190F5019979','2020-09-30 20:14:39','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',8,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('6BD33AE3B7A54A42A31655EFCDF01C58','2020-09-30 20:14:16','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('6F875DE1E31442BBA32DABF109ABB962','2020-09-30 20:16:30','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('73C47E53B02A4D1C9429B7C780ED504B','2020-09-30 20:14:39','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',8,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('758A390330B64BD48EDA78D079CFF3B6','2020-09-30 20:14:42','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',10,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('7CC4D92AAEE547ECB3BE46F5E5216C70','2020-09-30 20:14:22','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',8,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('7F26530B51F44D7DB8D8880B1F219709','2020-09-30 20:15:29','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('82E1F7B9667D460587CDC302840D2EFC','2020-09-30 20:13:57','lzx','0:0:0:0:0:0:0:1','/rolefindAll.do',20,'[类名] com.itheima.web.RoleController[方法名] findAll'),('8A48150890F14AD9833C1CAEA76BF50D','2020-09-30 20:14:28','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('8C5C5CE98595464DA10CC235986E3557','2020-09-30 20:15:06','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',5,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('8ECBDC95CDB34BA68229DA42C37CC5E2','2020-09-30 20:14:29','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',5,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('908B5BFA76404338B8A19C9A4344C96D','2020-09-30 20:14:41','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('91103E82FDCB499CA55F7ED24B86D134','2020-09-30 20:15:11','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('99791BC67E214758827E2C0F724FF6B2','2020-09-30 20:16:48','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',5,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('9D8ECC230A004959B1C0E834ABAE8025','2020-09-30 20:14:14','lzx','0:0:0:0:0:0:0:1','/orders/findAll.do',9,'[类名] com.itheima.web.OrdersController[方法名] findAll'),('9EBC42346AE247AF91846D590DF8EA9C','2020-09-30 20:15:20','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',10,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('A39F92FEFEF642EAB408D5E1AC760663','2020-09-30 20:16:46','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',8,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('A442091590444A2FA5E52147B259ED5C','2020-09-30 20:15:31','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('A7993D60878E4B069E75014912D5E77A','2020-09-30 20:14:29','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',5,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('A7A34B2F0CDE4161A49B1FBCE2E0F355','2020-09-30 20:17:11','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('A94BFBAB6D3D4AA5A26CC04CEC4B1F47','2020-09-30 20:15:12','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('AAA21271E0DC4FD29EC6AE1D85D4BA10','2020-09-30 20:15:16','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('AD93D184ECD5494DA49AF0EA82C1479E','2020-09-30 20:17:02','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',9,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('B0F713EE2CC141FB8C49ADEC4B112893','2020-09-30 20:15:21','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('B74CEDAABBD643DA94BE74CE0A2054BD','2020-09-30 20:14:23','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',5,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('BA1D6256FB754AD7B0381AED83D7F4AB','2020-09-30 20:14:33','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('BC7535979A324379884FE202E6E68B2A','2020-09-30 20:15:20','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',5,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('BFB5F9117A364C2185482C227B7610B6','2020-09-30 20:14:39','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',8,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('C2F3E67B11244B108E6002023F8DDA89','2020-09-30 20:16:35','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('C49B40EE40374E1E9F50B4C03C5F3F6D','2020-09-30 20:15:18','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('C508182775994AB6A9E9E7C2D0E6C6BE','2020-09-30 20:14:37','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',4,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('C5A3C19091A1471E8692933131087E30','2020-09-30 20:15:33','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('C7AB3E2D72814B6C9EA83C0401072578','2020-09-30 20:14:51','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',4,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('C935010A7EF44EF689806AF44770DD10','2020-09-30 20:16:32','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',4,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('C97F7D4D4F884DECAB43765CF77D726E','2020-09-30 20:14:44','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('C9A5E4F10ECE48FD8CB75AA3F07BAAD3','2020-09-30 20:14:38','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('CBD7D6AB95E44996862FA483722CCF8F','2020-09-30 20:15:16','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',8,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('CD69A1573A9D4094B005C7D1EC30E124','2020-09-30 20:16:44','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('D1AD3305D8834D46AE3B5119575F3B8E','2020-09-30 20:15:04','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('D3279D08DB9845E2875AFB4C2021C288','2020-09-30 20:14:27','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',14,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('D3B60781D8974ABBAF2329E062E82DA7','2020-09-30 20:15:17','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('D62AAD5B148C4C54A9EEB0B815DABD4D','2020-09-30 20:14:21','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('D8ADD47007444410BCA1E7AC86874E13','2020-09-30 20:13:50','lzx','0:0:0:0:0:0:0:1','/user/findAll.do',53,'[类名] com.itheima.web.UserController[方法名] findAll'),('D90D9E655F7C4B8B8986A32B10048C59','2020-09-30 20:15:27','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('D9F95184E5784978A377B2EA4FC14C3F','2020-09-30 20:15:09','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',5,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('DC4B852B482D4C128FFDF3790BDA20AC','2020-09-30 20:14:31','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',8,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('DF1BD527B4CB47E3801B25CD59B3AB42','2020-09-30 20:14:50','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('DF8917FA3E2A465FBB84F205E1588507','2020-09-30 20:13:53','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',149,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('DF9916832A534630B8E1BD5E3D25D2E1','2020-09-30 20:14:51','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('E177F4CC15A74DFB99E713369767DB62','2020-09-30 20:15:15','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('E3CDFACA6D1E48DD85BA39B5585200C9','2020-09-30 20:14:57','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',5,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('E40F3ECAD96840749CC703849D0FE1DF','2020-09-30 20:14:41','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',6,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('E7D784F1EE7F4A70BF6CF65BF42B8603','2020-09-30 20:15:19','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',5,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('E81D632B162F4AB19BE3AEA3F9669204','2020-09-30 20:14:27','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',9,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('EC0C224066BE4E50AABA839A5A1B3357','2020-09-30 20:14:49','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',9,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('EF635AEA7E134369A4963C6C0EF485D2','2020-09-30 20:17:07','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',8,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('F1DA35A02ACA4AE89A06DD539891E4C6','2020-09-30 20:14:54','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',8,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('F97ADBB1369A4C338F56C8F0E302A1E5','2020-09-30 20:15:08','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',4,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('FC03B13566D643C88FAE532ABF2A1D38','2020-09-30 20:15:43','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll'),('FFC8199198F94F959A4DB07287032944','2020-09-30 20:14:58','lzx','0:0:0:0:0:0:0:1','/syslog/findAll.do',7,'[类名] com.itheima.web.SysLogController[方法名] findAll');

/*Table structure for table `traveller` */

DROP TABLE IF EXISTS `traveller`;

CREATE TABLE `traveller` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '无意义、主键uuid',
  `NAME` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `sex` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `phoneNum` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `credentialsType` int(11) DEFAULT NULL COMMENT '证件类型 0身份证 1护照 2军官证',
  `credentialsNum` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `travellerType` int(11) DEFAULT NULL COMMENT '旅客类型(人群) 0 成人 1 儿童',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `traveller` */

insert  into `traveller`(`id`,`NAME`,`sex`,`phoneNum`,`credentialsType`,`credentialsNum`,`travellerType`) values ('3FE27DF2A4E44A6DBC5D0FE4651D3D3E','张龙','男','13333333333',0,'123456789009876543',0),('EE7A71FB6945483FBF91543DBE851960','张小龙','男','15555555555',0,'987654321123456789',1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '无意义，主键uuid',
  `email` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '非空，唯一',
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `PASSWORD` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '密码（加密）',
  `phoneNum` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态0 未开启 1 开启',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `users` */

insert  into `users`(`id`,`email`,`username`,`PASSWORD`,`phoneNum`,`STATUS`) values ('111-111','lzx@qq.com','lzx','$2a$10$UiPMyA4fZ0GukBgN8nyULenqHPhBgtHSCjj3Zob34CZBWHvZcTMRG','123456',1),('1B7CC006FD1D4AC6A05A914982943DED','lisi@qq.com','lisi','$2a$10$iBIwQvuN4v9XVP3N9975ZecGdvHK/iWguKB5qBIfYogi5djNBJgUK','123456',1),('57D8BB13AEBF445D81EE1CB72E7B1826','wangwu@qq.com','wangwu','$2a$10$y3ubKJS0WQhGuxiRTwkE1.3MwgHpkimpiTq8ofKxS/tRxDr6/Uu8G','123456',1);

/*Table structure for table `users_role` */

DROP TABLE IF EXISTS `users_role`;

CREATE TABLE `users_role` (
  `userId` varchar(32) COLLATE utf8_bin NOT NULL,
  `roleId` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `users_role` */

insert  into `users_role`(`userId`,`roleId`) values ('111-111','1111'),('1B7CC006FD1D4AC6A05A914982943DED','1111'),('111-111','2222'),('57D8BB13AEBF445D81EE1CB72E7B1826','2222'),('111-111','3333');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
