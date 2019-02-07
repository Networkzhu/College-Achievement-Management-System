/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : college-achievement-management-system

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-06-25 20:59:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for candp
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of candp
-- ----------------------------

-- ----------------------------
-- Table structure for classadmins
-- ----------------------------
DROP TABLE IF EXISTS `classadmins`;
CREATE TABLE `classadmins` (
  `id` varchar(20) NOT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `cclass` varchar(20) NOT NULL,
  `level` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cclass` (`cclass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classadmins
-- ----------------------------
INSERT INTO `classadmins` VALUES ('cs140341A', null, '140341A', '2');
INSERT INTO `classadmins` VALUES ('cs140341B', '', '140341B', '2');
INSERT INTO `classadmins` VALUES ('cs140341C', null, '140341C', '2');
INSERT INTO `classadmins` VALUES ('cs150341A', null, '150341A', '2');
INSERT INTO `classadmins` VALUES ('cs150341B', null, '150341B', '2');
INSERT INTO `classadmins` VALUES ('cs150341C', null, '150341C', '2');
INSERT INTO `classadmins` VALUES ('cs160341A', null, '160341A', '2');
INSERT INTO `classadmins` VALUES ('cs160341B', 'cs160341B', '160341B', '2');
INSERT INTO `classadmins` VALUES ('cs160341C', '160341C', '160341C', '2');
INSERT INTO `classadmins` VALUES ('cs170341A', null, '170341A', '2');
INSERT INTO `classadmins` VALUES ('cs170341B', null, '170341B', '2');
INSERT INTO `classadmins` VALUES ('cs170341C', null, '170341C', '2');
INSERT INTO `classadmins` VALUES ('is140342A', null, '140342A', '2');
INSERT INTO `classadmins` VALUES ('is140342B', null, '140342B', '2');
INSERT INTO `classadmins` VALUES ('is150342A', 'is150342A', '150342A', '2');
INSERT INTO `classadmins` VALUES ('is150342B', null, '150342B', '2');
INSERT INTO `classadmins` VALUES ('is160342A', null, '160342A', '2');
INSERT INTO `classadmins` VALUES ('is160342B', null, '160342B', '2');
INSERT INTO `classadmins` VALUES ('is170342A', null, '170342A', '2');
INSERT INTO `classadmins` VALUES ('is170342B', null, '170342B', '2');

-- ----------------------------
-- Table structure for courses
-- ----------------------------
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

-- ----------------------------
-- Records of courses
-- ----------------------------
INSERT INTO `courses` VALUES ('2017001', '物理上', '1', '1.2', '1.0', '2017');
INSERT INTO `courses` VALUES ('2017002', '高数下', '2', '1.2', '2.0', '2017');
INSERT INTO `courses` VALUES ('2017003', '思修', '3', '1.0', '3.0', '2016');
INSERT INTO `courses` VALUES ('2017004', '近代史', '1', '1.0', '4.0', '2016');
INSERT INTO `courses` VALUES ('2017005', '文化精品', '2', '1.0', '5.0', '2017');
INSERT INTO `courses` VALUES ('2017006', '法学导论', '3', '1.0', '0.5', '2017');
INSERT INTO `courses` VALUES ('2017007', '计算机图形学', '1', '1.0', '1.5', '2017');
INSERT INTO `courses` VALUES ('2017008', '汇编语言', '2', '1.2', '2.5', '2017');
INSERT INTO `courses` VALUES ('2017009', '数据库原理', '3', '1.2', '3.5', '2018');
INSERT INTO `courses` VALUES ('2017010', '程序设计实践', '1', '1.2', '4.5', '2018');
INSERT INTO `courses` VALUES ('2017011', '民航概论', '2', '1.0', '0.5', '2018');
INSERT INTO `courses` VALUES ('2017012', '英语4', '3', '1.0', '1.5', '2018');
INSERT INTO `courses` VALUES ('2017013', '电路分析基础', '1', '1.0', '2.5', '2018');
INSERT INTO `courses` VALUES ('2017014', '数字逻辑', '2', '1.0', '3.5', '2018');

-- ----------------------------
-- Table structure for scores
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=443 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scores
-- ----------------------------
INSERT INTO `scores` VALUES ('388', '160341237', '2017001', '80', '2017', '1');
INSERT INTO `scores` VALUES ('389', '160341237', '2017002', '81', '2017', '1');
INSERT INTO `scores` VALUES ('390', '160341237', '2017003', '82', '2017', '1');
INSERT INTO `scores` VALUES ('391', '160341237', '2017004', '83', '2017', '1');
INSERT INTO `scores` VALUES ('392', '160341237', '2017005', '84', '2017', '1');
INSERT INTO `scores` VALUES ('393', '160341237', '2017006', '85', '2017', '2');
INSERT INTO `scores` VALUES ('394', '160341237', '2017007', '86', '2017', '2');
INSERT INTO `scores` VALUES ('395', '160341237', '2017008', '87', '2017', '2');
INSERT INTO `scores` VALUES ('396', '160341237', '2017009', '82', '2017', '1');
INSERT INTO `scores` VALUES ('397', '160341237', '2017010', '83', '2017', '1');
INSERT INTO `scores` VALUES ('398', '160341237', '2017011', '84', '2017', '1');
INSERT INTO `scores` VALUES ('399', '160341237', '2017012', '85', '2017', '3');
INSERT INTO `scores` VALUES ('400', '160341237', '2017013', '55', '2017', '4');
INSERT INTO `scores` VALUES ('401', '160341237', '2017014', '57', '2017', '2');
INSERT INTO `scores` VALUES ('402', '160341238', '2017001', '70', '2017', '1');
INSERT INTO `scores` VALUES ('403', '160341238', '2017002', '71', '2017', '1');
INSERT INTO `scores` VALUES ('404', '160341238', '2017003', '72', '2017', '1');
INSERT INTO `scores` VALUES ('405', '160341238', '2017004', '73', '2017', '1');
INSERT INTO `scores` VALUES ('406', '160341238', '2017005', '74', '2017', '1');
INSERT INTO `scores` VALUES ('407', '160341238', '2017006', '75', '2017', '2');
INSERT INTO `scores` VALUES ('408', '160341238', '2017007', '76', '2017', '2');
INSERT INTO `scores` VALUES ('409', '160341238', '2017008', '77', '2017', '2');
INSERT INTO `scores` VALUES ('410', '160341239', '2017001', '90', '2017', '1');
INSERT INTO `scores` VALUES ('411', '160341239', '2017002', '91', '2017', '1');
INSERT INTO `scores` VALUES ('412', '160341239', '2017003', '92', '2017', '1');
INSERT INTO `scores` VALUES ('413', '160341239', '2017004', '93', '2017', '1');
INSERT INTO `scores` VALUES ('414', '160341239', '2017005', '94', '2017', '1');
INSERT INTO `scores` VALUES ('415', '160341239', '2017006', '95', '2017', '2');
INSERT INTO `scores` VALUES ('416', '160341239', '2017007', '96', '2017', '2');
INSERT INTO `scores` VALUES ('417', '160341239', '2017008', '97', '2017', '2');
INSERT INTO `scores` VALUES ('418', '160342237', '2017001', '80', '2017', '1');
INSERT INTO `scores` VALUES ('419', '160342237', '2017002', '81', '2017', '1');
INSERT INTO `scores` VALUES ('420', '160342237', '2017003', '82', '2017', '1');
INSERT INTO `scores` VALUES ('421', '160342237', '2017004', '83', '2017', '1');
INSERT INTO `scores` VALUES ('422', '160342237', '2017005', '84', '2017', '1');
INSERT INTO `scores` VALUES ('423', '160342237', '2017006', '85', '2017', '2');
INSERT INTO `scores` VALUES ('424', '160342237', '2017007', '86', '2017', '2');
INSERT INTO `scores` VALUES ('425', '160342237', '2017008', '87', '2017', '2');
INSERT INTO `scores` VALUES ('426', '160342238', '2017001', '70', '2017', '1');
INSERT INTO `scores` VALUES ('427', '160342238', '2017002', '71', '2017', '1');
INSERT INTO `scores` VALUES ('428', '160342238', '2017003', '72', '2017', '1');
INSERT INTO `scores` VALUES ('429', '160342238', '2017004', '73', '2017', '1');
INSERT INTO `scores` VALUES ('430', '160342238', '2017005', '74', '2017', '1');
INSERT INTO `scores` VALUES ('431', '160342238', '2017006', '75', '2017', '2');
INSERT INTO `scores` VALUES ('432', '160342238', '2017007', '76', '2017', '2');
INSERT INTO `scores` VALUES ('433', '160342238', '2017008', '77', '2017', '2');
INSERT INTO `scores` VALUES ('434', '160342239', '2017001', '90', '2017', '1');
INSERT INTO `scores` VALUES ('435', '160342239', '2017002', '91', '2017', '1');
INSERT INTO `scores` VALUES ('436', '160342239', '2017003', '92', '2017', '1');
INSERT INTO `scores` VALUES ('437', '160342239', '2017004', '93', '2017', '1');
INSERT INTO `scores` VALUES ('438', '160342239', '2017005', '94', '2017', '1');
INSERT INTO `scores` VALUES ('439', '160342239', '2017006', '95', '2017', '2');
INSERT INTO `scores` VALUES ('440', '160342239', '2017007', '96', '2017', '2');
INSERT INTO `scores` VALUES ('441', '160342239', '2017008', '97', '2017', '2');
INSERT INTO `scores` VALUES ('442', '170341237', '2017001', '100', '2017', '2');

-- ----------------------------
-- Table structure for studentinfos
-- ----------------------------
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

-- ----------------------------
-- Records of studentinfos
-- ----------------------------
INSERT INTO `studentinfos` VALUES ('160341237', null, '詹金浩', 'cs', '160341B', '3.65', '1.00');
INSERT INTO `studentinfos` VALUES ('160341238', null, '张家辉', 'cs', '160341B', '2.48', '1.00');
INSERT INTO `studentinfos` VALUES ('160341239', null, '袁振宇', 'cs', '160341B', '4.23', '1.00');
INSERT INTO `studentinfos` VALUES ('160341240', null, '熊宗铭', 'cs', '160341B', '3.60', '1.00');
INSERT INTO `studentinfos` VALUES ('160341241', null, '赵立林', 'cs', '160341B', '3.70', '1.00');
INSERT INTO `studentinfos` VALUES ('160341337', null, '李奕蓉', 'cs', '160341C', '3.20', '1.00');
INSERT INTO `studentinfos` VALUES ('160341338', null, '陈聪瑞', 'cs', '160341C', '3.30', '1.00');
INSERT INTO `studentinfos` VALUES ('160341339', null, '马迪雅', 'cs', '160341C', '3.40', '1.00');
INSERT INTO `studentinfos` VALUES ('160341340', null, '罗静怡', 'cs', '160341C', '3.50', '1.00');
INSERT INTO `studentinfos` VALUES ('160341341', null, '张嘉明', 'cs', '160341C', '3.60', '1.00');
INSERT INTO `studentinfos` VALUES ('160342137', null, '喜羊羊', 'is', '160342A', '3.00', '1.00');
INSERT INTO `studentinfos` VALUES ('160342138', null, '懒羊羊', 'is', '160342A', '3.10', '1.00');
INSERT INTO `studentinfos` VALUES ('160342139', null, '美羊羊', 'is', '160342A', '3.20', '1.00');
INSERT INTO `studentinfos` VALUES ('160342140', null, '慢羊羊', 'is', '160342A', '3.30', '1.00');
INSERT INTO `studentinfos` VALUES ('160342141', null, '暖羊羊', 'is', '160342A', '3.40', '1.00');
INSERT INTO `studentinfos` VALUES ('160342237', null, '熊大', 'is', '160342B', '3.53', '1.00');
INSERT INTO `studentinfos` VALUES ('160342238', null, '熊二', 'is', '160342B', '2.48', '1.00');
INSERT INTO `studentinfos` VALUES ('160342239', null, '熊三', 'is', '160342B', '4.23', '1.00');
INSERT INTO `studentinfos` VALUES ('160342240', null, '熊四', 'is', '160342B', '3.40', '1.00');
INSERT INTO `studentinfos` VALUES ('160342241', null, '熊五', 'is', '160342B', '3.50', '1.00');
INSERT INTO `studentinfos` VALUES ('170341237', null, '飞鹰铠甲', 'cs', '170341B', '4.80', '1.00');
INSERT INTO `studentinfos` VALUES ('170342237', null, '炎龙铠甲', 'is', '170342B', '3.80', '1.00');

-- ----------------------------
-- View structure for classscore
-- ----------------------------
DROP VIEW IF EXISTS `classscore`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `classscore` AS select `studentinfos`.`cclass` AS `class`,avg(`studentinfos`.`gpa`) AS `gpa`,`getClassNotPassTimes`(`studentinfos`.`cclass`) AS `notpasstimes`,`getClassNotPassRate`(`studentinfos`.`cclass`) AS `notpassrate`,`getClassComTimes`(`studentinfos`.`cclass`) AS `comtimes`,`getClassProTimes`(`studentinfos`.`cclass`) AS `protimes`,`studentinfos`.`major` AS `major` from `studentinfos` group by `studentinfos`.`cclass` having (count(0) > 0) ;

-- ----------------------------
-- View structure for classstudentscores
-- ----------------------------
DROP VIEW IF EXISTS `classstudentscores`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `classstudentscores` AS select `scores`.`stu_id` AS `id`,`studentinfos`.`name` AS `name`,`studentinfos`.`pwd` AS `pwd`,`studentinfos`.`cclass` AS `cclass`,`studentinfos`.`gpa` AS `gpa`,sum(`courses`.`credit`) AS `allcre`,`getStudentPassRate`(`scores`.`stu_id`) AS `passrate` from ((`studentinfos` join `scores`) join `courses`) where ((`studentinfos`.`id` = `scores`.`stu_id`) and (`scores`.`cou_id` = `courses`.`id`) and (`scores`.`score` > 59)) group by `scores`.`stu_id` ;

-- ----------------------------
-- View structure for competitions
-- ----------------------------
DROP VIEW IF EXISTS `competitions`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `competitions` AS select `candp`.`id` AS `id`,`candp`.`name` AS `name`,`candp`.`year` AS `year`,`candp`.`levelorprize` AS `prize`,`candp`.`is_leader` AS `is_leader`,`candp`.`stuid` AS `stuid` from `candp` where (`candp`.`status` = '1') ;

-- ----------------------------
-- View structure for projects
-- ----------------------------
DROP VIEW IF EXISTS `projects`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `projects` AS select `candp`.`id` AS `id`,`candp`.`name` AS `name`,`candp`.`year` AS `year`,`candp`.`levelorprize` AS `level`,`candp`.`is_leader` AS `is_leader`,`candp`.`stuid` AS `stuid` from `candp` where (`candp`.`status` = '0') ;

-- ----------------------------
-- Procedure structure for getClassGpa
-- ----------------------------
DROP PROCEDURE IF EXISTS `getClassGpa`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClassGpa`(IN `classID` varchar(20),OUT `avgpa` double)
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
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getClassComTimes
-- ----------------------------
DROP FUNCTION IF EXISTS `getClassComTimes`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getClassComTimes`(`class` varchar(20)) RETURNS int(11)
BEGIN
	DECLARE num INT;
	select COUNT(*) into num from competitions
  where competitions.stuid in (select studentinfos.id from studentinfos where studentinfos.cclass = class);
  return num;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getClassNotPassRate
-- ----------------------------
DROP FUNCTION IF EXISTS `getClassNotPassRate`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getClassNotPassRate`(`classID` varchar(20)) RETURNS double
BEGIN
	DECLARE sum DOUBLE;
	DECLARE notPassSum DOUBLE;
	select COUNT(*) into sum from scores,studentinfos where scores.stu_id = studentinfos.id and studentinfos.cclass = classID;
	select COUNT(*) into notPassSum from scores,studentinfos where scores.stu_id = studentinfos.id and studentinfos.cclass = classID and scores.score < 60;
	if(sum = 0) THEN
		return 0;
	end if;
	RETURN notPassSum/sum;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getClassNotPassTimes
-- ----------------------------
DROP FUNCTION IF EXISTS `getClassNotPassTimes`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getClassNotPassTimes`(`class` varchar(20)) RETURNS int(11)
BEGIN
	DECLARE num INT;
	select COUNT(*) into num from scores
  where (scores.stu_id in (select studentinfos.id from studentinfos where studentinfos.cclass = class)) and score < 60;
  return num;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getClassProTimes
-- ----------------------------
DROP FUNCTION IF EXISTS `getClassProTimes`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getClassProTimes`(`class` varchar(20)) RETURNS int(11)
BEGIN
	DECLARE num INT;
	select COUNT(*) into num from projects
  where projects.stuid in (select studentinfos.id from studentinfos where studentinfos.cclass = class);
  return num;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getMajorNotPassRate
-- ----------------------------
DROP FUNCTION IF EXISTS `getMajorNotPassRate`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getMajorNotPassRate`(`major` varchar(20)) RETURNS double
BEGIN
	DECLARE sum DOUBLE;
	DECLARE notPassSum DOUBLE;
	select COUNT(*) into sum from scores,studentinfos where scores.stu_id = studentinfos.id and studentinfos.major = major;
	select COUNT(*) into notPassSum from scores,studentinfos where scores.stu_id = studentinfos.id and studentinfos.major = major and scores.score < 60;
	RETURN notPassSum/sum;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getStudentPassRate
-- ----------------------------
DROP FUNCTION IF EXISTS `getStudentPassRate`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getStudentPassRate`(`id` varchar(20)) RETURNS double
BEGIN
	DECLARE sum DOUBLE;
	DECLARE notPassSum DOUBLE;
	select COUNT(*) into sum from scores where stu_id = id;
	select COUNT(*) into notPassSum from scores where stu_id = id and score > 59;
	RETURN notPassSum/sum;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `changeGpa`;
DELIMITER ;;
CREATE TRIGGER `changeGpa` AFTER INSERT ON `scores` FOR EACH ROW BEGIN
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
end
;;
DELIMITER ;
