/*
SQLyog Ultimate v8.32 
MySQL - 5.5.62 : Database - College-Achievement-Management-System
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`College-Achievement-Management-System` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `College-Achievement-Management-System`;

/*Table structure for table `candp` */

DROP TABLE IF EXISTS `candp`;

CREATE TABLE `candp` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `levelorprize` varchar(20) DEFAULT NULL,
  `is_leader` varchar(20) DEFAULT NULL,
  `stuid` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stuid` (`stuid`),
  CONSTRAINT `candp_ibfk_1` FOREIGN KEY (`stuid`) REFERENCES `studentinfos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `candp` */

/*Table structure for table `classadmins` */

DROP TABLE IF EXISTS `classadmins`;

CREATE TABLE `classadmins` (
  `id` varchar(20) NOT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `cclass` varchar(20) NOT NULL,
  `level` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cclass` (`cclass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `classadmins` */

insert  into `classadmins`(`id`,`pwd`,`cclass`,`level`) values ('cs140341A',NULL,'140341A','2'),('cs140341B','','140341B','2'),('cs140341C',NULL,'140341C','2'),('cs150341A',NULL,'150341A','2'),('cs150341B',NULL,'150341B','2'),('cs150341C',NULL,'150341C','2'),('cs160341A',NULL,'160341A','2'),('cs160341B','cs160341B','160341B','2'),('cs160341C','160341C','160341C','2'),('cs170341A',NULL,'170341A','2'),('cs170341B',NULL,'170341B','2'),('cs170341C',NULL,'170341C','2'),('is140342A',NULL,'140342A','2'),('is140342B',NULL,'140342B','2'),('is150342A','is150342A','150342A','2'),('is150342B',NULL,'150342B','2'),('is160342A',NULL,'160342A','2'),('is160342B',NULL,'160342B','2'),('is170342A',NULL,'170342A','2'),('is170342B',NULL,'170342B','2');

/*Table structure for table `courses` */

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `id` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `coefficient` float(20,1) DEFAULT NULL,
  `credit` float(20,1) DEFAULT NULL,
  `year` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `courses` */

insert  into `courses`(`id`,`name`,`type`,`coefficient`,`credit`,`year`) values ('2017001','物理上','1',1.2,1.0,2017),('2017002','高数下','2',1.2,2.0,2017),('2017003','思修','3',1.0,3.0,2016),('2017004','近代史','1',1.0,4.0,2016),('2017005','文化精品','2',1.0,5.0,2017),('2017006','法学导论','3',1.0,0.5,2017),('2017007','计算机图形学','1',1.0,1.5,2017),('2017008','汇编语言','2',1.2,2.5,2017),('2017009','数据库原理','3',1.2,3.5,2018),('2017010','程序设计实践','1',1.2,4.5,2018),('2017011','民航概论','2',1.0,0.5,2018),('2017012','英语4','3',1.0,1.5,2018),('2017013','电路分析基础','1',1.0,2.5,2018),('2017014','数字逻辑','2',1.0,3.5,2018);

/*Table structure for table `scores` */

DROP TABLE IF EXISTS `scores`;

CREATE TABLE `scores` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `stu_id` varchar(20) NOT NULL,
  `cou_id` varchar(20) NOT NULL,
  `score` int(20) DEFAULT NULL,
  `year` int(20) DEFAULT NULL,
  `term` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cou_id` (`cou_id`),
  KEY `stu_id` (`stu_id`),
  KEY `scoredesc` (`score`),
  CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`cou_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`stu_id`) REFERENCES `studentinfos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=498 DEFAULT CHARSET=utf8;

/*Data for the table `scores` */

insert  into `scores`(`id`,`stu_id`,`cou_id`,`score`,`year`,`term`) values (443,'160341237','2017001',80,2017,1),(444,'160341237','2017002',81,2017,1),(445,'160341237','2017003',82,2017,1),(446,'160341237','2017004',83,2017,1),(447,'160341237','2017005',84,2017,1),(448,'160341237','2017006',85,2017,2),(449,'160341237','2017007',86,2017,2),(450,'160341237','2017008',87,2017,2),(451,'160341237','2017009',82,2017,1),(452,'160341237','2017010',83,2017,1),(453,'160341237','2017011',84,2017,1),(454,'160341237','2017012',85,2017,3),(455,'160341237','2017013',55,2017,4),(456,'160341237','2017014',57,2017,2),(457,'160341238','2017001',70,2017,1),(458,'160341238','2017002',71,2017,1),(459,'160341238','2017003',72,2017,1),(460,'160341238','2017004',73,2017,1),(461,'160341238','2017005',74,2017,1),(462,'160341238','2017006',75,2017,2),(463,'160341238','2017007',76,2017,2),(464,'160341238','2017008',77,2017,2),(465,'160341239','2017001',90,2017,1),(466,'160341239','2017002',91,2017,1),(467,'160341239','2017003',92,2017,1),(468,'160341239','2017004',93,2017,1),(469,'160341239','2017005',94,2017,1),(470,'160341239','2017006',95,2017,2),(471,'160341239','2017007',96,2017,2),(472,'160341239','2017008',97,2017,2),(473,'160342237','2017001',80,2017,1),(474,'160342237','2017002',81,2017,1),(475,'160342237','2017003',82,2017,1),(476,'160342237','2017004',83,2017,1),(477,'160342237','2017005',84,2017,1),(478,'160342237','2017006',85,2017,2),(479,'160342237','2017007',86,2017,2),(480,'160342237','2017008',87,2017,2),(481,'160342238','2017001',70,2017,1),(482,'160342238','2017002',71,2017,1),(483,'160342238','2017003',72,2017,1),(484,'160342238','2017004',73,2017,1),(485,'160342238','2017005',74,2017,1),(486,'160342238','2017006',75,2017,2),(487,'160342238','2017007',76,2017,2),(488,'160342238','2017008',77,2017,2),(489,'160342239','2017001',90,2017,1),(490,'160342239','2017002',91,2017,1),(491,'160342239','2017003',92,2017,1),(492,'160342239','2017004',93,2017,1),(493,'160342239','2017005',94,2017,1),(494,'160342239','2017006',95,2017,2),(495,'160342239','2017007',96,2017,2),(496,'160342239','2017008',97,2017,2),(497,'170341237','2017001',100,2017,2);

/*Table structure for table `studentinfos` */

DROP TABLE IF EXISTS `studentinfos`;

CREATE TABLE `studentinfos` (
  `id` varchar(20) NOT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  `cclass` varchar(20) DEFAULT NULL,
  `gpa` double(6,2) DEFAULT '0.00',
  `level` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `studentinfos` */

insert  into `studentinfos`(`id`,`pwd`,`name`,`major`,`cclass`,`gpa`,`level`) values ('160341237',NULL,'詹金浩','cs','160341B',3.65,'1.00'),('160341238',NULL,'张家辉','cs','160341B',2.48,'1.00'),('160341239',NULL,'袁振宇','cs','160341B',4.23,'1.00'),('160341240',NULL,'熊宗铭','cs','160341B',3.60,'1.00'),('160341241',NULL,'赵立林','cs','160341B',3.70,'1.00'),('160341337',NULL,'李奕蓉','cs','160341C',3.20,'1.00'),('160341338',NULL,'陈聪瑞','cs','160341C',3.30,'1.00'),('160341339',NULL,'马迪雅','cs','160341C',3.40,'1.00'),('160341340',NULL,'罗静怡','cs','160341C',3.50,'1.00'),('160341341',NULL,'张嘉明','cs','160341C',3.60,'1.00'),('160342137',NULL,'喜羊羊','is','160342A',3.00,'1.00'),('160342138',NULL,'懒羊羊','is','160342A',3.10,'1.00'),('160342139',NULL,'美羊羊','is','160342A',3.20,'1.00'),('160342140',NULL,'慢羊羊','is','160342A',3.30,'1.00'),('160342141',NULL,'暖羊羊','is','160342A',3.40,'1.00'),('160342237',NULL,'熊大','is','160342B',3.53,'1.00'),('160342238',NULL,'熊二','is','160342B',2.48,'1.00'),('160342239',NULL,'熊三','is','160342B',4.23,'1.00'),('160342240',NULL,'熊四','is','160342B',3.40,'1.00'),('160342241',NULL,'熊五','is','160342B',3.50,'1.00'),('170341237',NULL,'飞鹰铠甲','cs','170341B',4.80,'1.00'),('170342237',NULL,'炎龙铠甲','is','170342B',3.80,'1.00');

/* Trigger structure for table `scores` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `changeGpa` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `changeGpa` AFTER INSERT ON `scores` FOR EACH ROW BEGIN
	DECLARE myavg DOUBLE;
	DECLARE allcre DOUBLE;
	DECLARE temp DOUBLE;
	DECLARE sum DOUBLE DEFAULT 0.0;
	DECLARE t INTEGER;
	DECLARE t1 DOUBLE;
	DECLARE t2 DOUBLE;
	DECLARE done INT DEFAULT FALSE;
	DECLARE cur cursor for SELECT scores.score, courses.coefficient, courses.credit from studentinfos, scores, courses 
       where studentinfos.id = scores.stu_id and scores.cou_id = courses.id and stu_id = new.stu_id;
	DECLARE CONTINUE HANDLER for not found set done = TRUE;
	SELECT SUM(courses.credit) into allcre from studentinfos, scores, courses 
       where studentinfos.id = scores.stu_id and scores.cou_id = courses.id and stu_id = new.stu_id and score>=60;
	open cur;	
	read_loop:loop
	FETCH cur into t, t1, t2;
		IF done THEN LEAVE read_loop; END IF;
		if(t < 60) THEN
			set temp = 0.0;
		end if;
		if(t >= 60) THEN
			set temp = 1.0;
		end if;
		if(t >= 64) THEN
			set temp = 1.6;
		end if;
		if(t >= 66) THEN
			set temp = 1.7;
		end if;
		if(t >= 68) THEN
			set temp = 2.0;
		end if;
		if(t >= 72) THEN
			set temp = 2.3;
		end if;
		if(t >= 75) THEN
			set temp = 2.7;
		end if;
		if(t >= 78) THEN
			set temp = 3.0;
		end if;
		if(t >= 82) THEN
			set temp = 3.3;
		end if;
		if(t >= 85) THEN
			set temp = 3.7;
		end if;
		if(t >= 90) THEN
			set temp = 4.0;
		end if;
		set sum=temp*t1*t2+sum;
	end loop;
	close cur;
	set myavg = sum/allcre;
	UPDATE studentinfos SET gpa = myavg where id = new.stu_id;
end */$$


DELIMITER ;

/* Function  structure for function  `getClassComTimes` */

/*!50003 DROP FUNCTION IF EXISTS `getClassComTimes` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `getClassComTimes`(`class` varchar(20)) RETURNS int(11)
BEGIN
	DECLARE num INT;
	select COUNT(*) into num from competitions
  where competitions.stuid in (select studentinfos.id from studentinfos where studentinfos.cclass = class);
  return num;
END */$$
DELIMITER ;

/* Function  structure for function  `getClassNotPassRate` */

/*!50003 DROP FUNCTION IF EXISTS `getClassNotPassRate` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `getClassNotPassRate`(`classID` varchar(20)) RETURNS double
BEGIN
	DECLARE sum DOUBLE;
	DECLARE notPassSum DOUBLE;
	select COUNT(*) into sum from scores,studentinfos where scores.stu_id = studentinfos.id and studentinfos.cclass = classID;
	select COUNT(*) into notPassSum from scores,studentinfos where scores.stu_id = studentinfos.id and studentinfos.cclass = classID and scores.score < 60;
	if(sum = 0) THEN
		return 0;
	end if;
	RETURN notPassSum/sum;
END */$$
DELIMITER ;

/* Function  structure for function  `getClassNotPassTimes` */

/*!50003 DROP FUNCTION IF EXISTS `getClassNotPassTimes` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `getClassNotPassTimes`(`class` varchar(20)) RETURNS int(11)
BEGIN
	DECLARE num INT;
	select COUNT(*) into num from scores
  where (scores.stu_id in (select studentinfos.id from studentinfos where studentinfos.cclass = class)) and score < 60;
  return num;
END */$$
DELIMITER ;

/* Function  structure for function  `getClassProTimes` */

/*!50003 DROP FUNCTION IF EXISTS `getClassProTimes` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `getClassProTimes`(`class` varchar(20)) RETURNS int(11)
BEGIN
	DECLARE num INT;
	select COUNT(*) into num from projects
  where projects.stuid in (select studentinfos.id from studentinfos where studentinfos.cclass = class);
  return num;
END */$$
DELIMITER ;

/* Function  structure for function  `getMajorNotPassRate` */

/*!50003 DROP FUNCTION IF EXISTS `getMajorNotPassRate` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `getMajorNotPassRate`(`major` varchar(20)) RETURNS double
BEGIN
	DECLARE sum DOUBLE;
	DECLARE notPassSum DOUBLE;
	select COUNT(*) into sum from scores,studentinfos where scores.stu_id = studentinfos.id and studentinfos.major = major;
	select COUNT(*) into notPassSum from scores,studentinfos where scores.stu_id = studentinfos.id and studentinfos.major = major and scores.score < 60;
	RETURN notPassSum/sum;
END */$$
DELIMITER ;

/* Function  structure for function  `getStudentPassRate` */

/*!50003 DROP FUNCTION IF EXISTS `getStudentPassRate` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `getStudentPassRate`(`id` varchar(20)) RETURNS double
BEGIN
	DECLARE sum DOUBLE;
	DECLARE notPassSum DOUBLE;
	select COUNT(*) into sum from scores where stu_id = id;
	select COUNT(*) into notPassSum from scores where stu_id = id and score > 59;
	RETURN notPassSum/sum;
END */$$
DELIMITER ;

/* Procedure structure for procedure `getClassGpa` */

/*!50003 DROP PROCEDURE IF EXISTS  `getClassGpa` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getClassGpa`(IN `classID` varchar(20),OUT `avgpa` double)
BEGIN
	DECLARE cgpa DOUBLE;
	DECLARE sum DOUBLE DEFAULT 0.0;
	DECLARE done int DEFAULT FALSE;
	DECLARE num int;
	DECLARE cur cursor for select gpa from studentinfos where cclass = classID;
	DECLARE CONTINUE HANDLER for not found set done = TRUE;
	set sum=0.0;
	set num=0;
	open cur;
	read_loop:LOOP
	FETCH CUR INTO cgpa;
	if done then
		leave read_loop;
	end if;
	set sum = sum + cgpa;
	set num = num+1;
	end loop;
	close cur;
	set avgpa = sum/num;
	SELECT sum,avgpa;
END */$$
DELIMITER ;

/*Table structure for table `classscore` */

DROP TABLE IF EXISTS `classscore`;

/*!50001 DROP VIEW IF EXISTS `classscore` */;
/*!50001 DROP TABLE IF EXISTS `classscore` */;

/*!50001 CREATE TABLE  `classscore`(
 `class` varchar(20) ,
 `gpa` double(10,6) ,
 `notpasstimes` int(11) ,
 `notpassrate` double ,
 `comtimes` int(11) ,
 `protimes` int(11) ,
 `major` varchar(20) 
)*/;

/*Table structure for table `classstudentscores` */

DROP TABLE IF EXISTS `classstudentscores`;

/*!50001 DROP VIEW IF EXISTS `classstudentscores` */;
/*!50001 DROP TABLE IF EXISTS `classstudentscores` */;

/*!50001 CREATE TABLE  `classstudentscores`(
 `id` varchar(20) ,
 `name` varchar(20) ,
 `pwd` varchar(20) ,
 `cclass` varchar(20) ,
 `gpa` double(6,2) ,
 `allcre` double(18,1) ,
 `passrate` double 
)*/;

/*Table structure for table `competitions` */

DROP TABLE IF EXISTS `competitions`;

/*!50001 DROP VIEW IF EXISTS `competitions` */;
/*!50001 DROP TABLE IF EXISTS `competitions` */;

/*!50001 CREATE TABLE  `competitions`(
 `id` int(20) ,
 `name` varchar(20) ,
 `year` varchar(20) ,
 `prize` varchar(20) ,
 `is_leader` varchar(20) ,
 `stuid` varchar(20) 
)*/;

/*Table structure for table `projects` */

DROP TABLE IF EXISTS `projects`;

/*!50001 DROP VIEW IF EXISTS `projects` */;
/*!50001 DROP TABLE IF EXISTS `projects` */;

/*!50001 CREATE TABLE  `projects`(
 `id` int(20) ,
 `name` varchar(20) ,
 `year` varchar(20) ,
 `level` varchar(20) ,
 `is_leader` varchar(20) ,
 `stuid` varchar(20) 
)*/;

/*View structure for view classscore */

/*!50001 DROP TABLE IF EXISTS `classscore` */;
/*!50001 DROP VIEW IF EXISTS `classscore` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `classscore` AS select `studentinfos`.`cclass` AS `class`,avg(`studentinfos`.`gpa`) AS `gpa`,`getClassNotPassTimes`(`studentinfos`.`cclass`) AS `notpasstimes`,`getClassNotPassRate`(`studentinfos`.`cclass`) AS `notpassrate`,`getClassComTimes`(`studentinfos`.`cclass`) AS `comtimes`,`getClassProTimes`(`studentinfos`.`cclass`) AS `protimes`,`studentinfos`.`major` AS `major` from `studentinfos` group by `studentinfos`.`cclass` having (count(0) > 0) */;

/*View structure for view classstudentscores */

/*!50001 DROP TABLE IF EXISTS `classstudentscores` */;
/*!50001 DROP VIEW IF EXISTS `classstudentscores` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `classstudentscores` AS select `scores`.`stu_id` AS `id`,`studentinfos`.`name` AS `name`,`studentinfos`.`pwd` AS `pwd`,`studentinfos`.`cclass` AS `cclass`,`studentinfos`.`gpa` AS `gpa`,sum(`courses`.`credit`) AS `allcre`,`getStudentPassRate`(`scores`.`stu_id`) AS `passrate` from ((`studentinfos` join `scores`) join `courses`) where ((`studentinfos`.`id` = `scores`.`stu_id`) and (`scores`.`cou_id` = `courses`.`id`) and (`scores`.`score` > 59)) group by `scores`.`stu_id` */;

/*View structure for view competitions */

/*!50001 DROP TABLE IF EXISTS `competitions` */;
/*!50001 DROP VIEW IF EXISTS `competitions` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `competitions` AS select `candp`.`id` AS `id`,`candp`.`name` AS `name`,`candp`.`year` AS `year`,`candp`.`levelorprize` AS `prize`,`candp`.`is_leader` AS `is_leader`,`candp`.`stuid` AS `stuid` from `candp` where (`candp`.`status` = '1') */;

/*View structure for view projects */

/*!50001 DROP TABLE IF EXISTS `projects` */;
/*!50001 DROP VIEW IF EXISTS `projects` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `projects` AS select `candp`.`id` AS `id`,`candp`.`name` AS `name`,`candp`.`year` AS `year`,`candp`.`levelorprize` AS `level`,`candp`.`is_leader` AS `is_leader`,`candp`.`stuid` AS `stuid` from `candp` where (`candp`.`status` = '0') */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
