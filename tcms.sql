/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : tcms

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2014-03-03 12:28:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for axle_record
-- ----------------------------
DROP TABLE IF EXISTS `axle_record`;
CREATE TABLE `axle_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `FHWA_class` int(11) DEFAULT NULL,
  `classification_record_id` int(11) DEFAULT NULL,
  `lane_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_axle_record_classification_record1` (`classification_record_id`),
  KEY `fk_axle_record_lane1` (`lane_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of axle_record
-- ----------------------------

-- ----------------------------
-- Table structure for binary_file
-- ----------------------------
DROP TABLE IF EXISTS `binary_file`;
CREATE TABLE `binary_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `upload_date` date NOT NULL,
  `upload_time` time DEFAULT NULL,
  `location` text,
  `counter_id` int(11) DEFAULT NULL,
  `case_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_binary_file_counter1` (`counter_id`),
  KEY `fk_binary_file_case1` (`case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of binary_file
-- ----------------------------
INSERT INTO `binary_file` VALUES ('48', 'Westfirstore_33.BIN', '0000-00-00', '00:00:00', 'files/binary_files/rejected_binary_files/', '0', '33');
INSERT INTO `binary_file` VALUES ('49', 'test_20_34.BIN', '0000-00-00', '00:00:00', 'files/binary_files/accepted_binary_files/', '0', '34');
INSERT INTO `binary_file` VALUES ('50', 'test_10_35.BIN', '0000-00-00', '00:00:00', 'files/binary_files/accepted_binary_files/', '0', '35');
INSERT INTO `binary_file` VALUES ('51', 'Westfirstore_38.BIN', '0000-00-00', '00:00:00', 'files/Binary_files/new_binary_files/', '0', '38');

-- ----------------------------
-- Table structure for case
-- ----------------------------
DROP TABLE IF EXISTS `case`;
CREATE TABLE `case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `open_date` date NOT NULL,
  `open_time` time DEFAULT NULL,
  `close_date` date NOT NULL,
  `close_time` time DEFAULT NULL,
  `accept_reject_date` date NOT NULL,
  `accept_reject_time` time DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `manual_closing_reason` text,
  `rejecting_reason` text,
  `collector_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_case_user1` (`collector_id`),
  KEY `fk_case_user2` (`admin_id`),
  KEY `fk_case_site1` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of case
-- ----------------------------
INSERT INTO `case` VALUES ('33', '2014-03-01', '16:22:48', '2014-03-01', '16:22:48', '2014-03-01', '16:23:06', '4', '', 'doesn%27t%20match%20our%20standards', '2', '0', '12');
INSERT INTO `case` VALUES ('34', '2014-03-01', '16:23:49', '2014-03-01', '16:23:57', '2014-03-01', '16:24:00', '3', '', '', '2', '2', '3');
INSERT INTO `case` VALUES ('35', '2014-03-02', '10:40:48', '2014-03-02', '10:43:05', '2014-03-02', '10:43:22', '3', '', '', '3', '3', '13');
INSERT INTO `case` VALUES ('36', '2014-03-02', '11:25:28', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '0', '', '', '0', '3', '2');
INSERT INTO `case` VALUES ('37', '2014-03-02', '13:01:08', '2014-03-02', '13:01:38', '0000-00-00', '00:00:00', '2', 'aaa', '', '2', '3', '12');
INSERT INTO `case` VALUES ('38', '2014-03-02', '13:01:27', '2014-03-02', '13:50:51', '0000-00-00', '00:00:00', '1', '', '', '2', '2', '3');
INSERT INTO `case` VALUES ('39', '2014-03-03', '12:20:12', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '0', '', '', '0', '2', '12');

-- ----------------------------
-- Table structure for classification_record
-- ----------------------------
DROP TABLE IF EXISTS `classification_record`;
CREATE TABLE `classification_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  `classification_step` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classification_record
-- ----------------------------

-- ----------------------------
-- Table structure for counter
-- ----------------------------
DROP TABLE IF EXISTS `counter`;
CREATE TABLE `counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(100) DEFAULT NULL,
  `unit_type` varchar(45) DEFAULT NULL,
  `unit_version` varchar(45) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_counter_site1` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of counter
-- ----------------------------

-- ----------------------------
-- Table structure for count_lane_record
-- ----------------------------
DROP TABLE IF EXISTS `count_lane_record`;
CREATE TABLE `count_lane_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `lane_id` int(11) DEFAULT NULL,
  `count_record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_count_lane_record_lane1` (`lane_id`),
  KEY `fk_count_lane_record_count_record1` (`count_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52928 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of count_lane_record
-- ----------------------------

-- ----------------------------
-- Table structure for count_record
-- ----------------------------
DROP TABLE IF EXISTS `count_record`;
CREATE TABLE `count_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  `interval_length` int(11) DEFAULT NULL,
  `statistics_record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_count_record_statistics_record1` (`statistics_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of count_record
-- ----------------------------

-- ----------------------------
-- Table structure for lane
-- ----------------------------
DROP TABLE IF EXISTS `lane`;
CREATE TABLE `lane` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lane_number` int(11) DEFAULT NULL,
  `lane_direction` int(11) DEFAULT NULL,
  `lane_spacing` float DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `counter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lane_site` (`site_id`),
  KEY `fk_lane_counter1` (`counter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lane
-- ----------------------------
INSERT INTO `lane` VALUES ('1', '1', '0', '50', '2014-02-06', null, null, null);
INSERT INTO `lane` VALUES ('2', '1', '1', '121.92', '0000-00-00', '0000-00-00', '2', '16');
INSERT INTO `lane` VALUES ('3', '2', '5', '121.92', '0000-00-00', '0000-00-00', '2', '16');
INSERT INTO `lane` VALUES ('4', '0', '2', '0', '0000-00-00', '0000-00-00', '2', '0');
INSERT INTO `lane` VALUES ('5', '1', '1', '121.92', '0000-00-00', '0000-00-00', '3', '17');
INSERT INTO `lane` VALUES ('6', '2', '5', '121.92', '0000-00-00', '0000-00-00', '3', '17');
INSERT INTO `lane` VALUES ('7', '0', '0', '0', '0000-00-00', '0000-00-00', '4', '0');
INSERT INTO `lane` VALUES ('8', '0', '0', '0', '0000-00-00', '0000-00-00', '4', '0');
INSERT INTO `lane` VALUES ('9', '0', '0', '0', '0000-00-00', '0000-00-00', '5', '0');
INSERT INTO `lane` VALUES ('10', '0', '0', '0', '0000-00-00', '0000-00-00', '5', '0');
INSERT INTO `lane` VALUES ('11', '0', '0', '0', '0000-00-00', '0000-00-00', '6', '0');
INSERT INTO `lane` VALUES ('12', '0', '0', '0', '0000-00-00', '0000-00-00', '6', '0');
INSERT INTO `lane` VALUES ('13', '0', '0', '0', '0000-00-00', '0000-00-00', '7', '0');
INSERT INTO `lane` VALUES ('14', '0', '0', '0', '0000-00-00', '0000-00-00', '7', '0');
INSERT INTO `lane` VALUES ('15', '0', '0', '0', '0000-00-00', '0000-00-00', '8', '0');
INSERT INTO `lane` VALUES ('16', '0', '0', '0', '0000-00-00', '0000-00-00', '8', '0');
INSERT INTO `lane` VALUES ('17', '0', '1', '0', '0000-00-00', '0000-00-00', '9', '0');
INSERT INTO `lane` VALUES ('18', '0', '5', '0', '0000-00-00', '0000-00-00', '9', '0');
INSERT INTO `lane` VALUES ('19', '0', '0', '0', '0000-00-00', '0000-00-00', '10', '0');
INSERT INTO `lane` VALUES ('20', '0', '0', '0', '0000-00-00', '0000-00-00', '10', '0');
INSERT INTO `lane` VALUES ('21', '0', '0', '0', '0000-00-00', '0000-00-00', '11', '0');
INSERT INTO `lane` VALUES ('22', '0', '0', '0', '0000-00-00', '0000-00-00', '11', '0');
INSERT INTO `lane` VALUES ('23', '0', '8', '0', '0000-00-00', '0000-00-00', '12', '0');
INSERT INTO `lane` VALUES ('24', '0', '8', '0', '0000-00-00', '0000-00-00', '12', '0');
INSERT INTO `lane` VALUES ('25', '0', '2', '0', '0000-00-00', '0000-00-00', '13', '0');
INSERT INTO `lane` VALUES ('26', '0', '2', '0', '0000-00-00', '0000-00-00', '13', '0');

-- ----------------------------
-- Table structure for lane_record
-- ----------------------------
DROP TABLE IF EXISTS `lane_record`;
CREATE TABLE `lane_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '			',
  `lane_sensor` int(11) DEFAULT NULL,
  `count_method` int(11) DEFAULT NULL,
  `lane_mode` int(11) DEFAULT NULL,
  `statistics_record_id` int(11) DEFAULT NULL,
  `lane_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lane_record_statistics_record1` (`statistics_record_id`),
  KEY `fk_lane_record_lane1` (`lane_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lane_record
-- ----------------------------

-- ----------------------------
-- Table structure for per_vehicle_record
-- ----------------------------
DROP TABLE IF EXISTS `per_vehicle_record`;
CREATE TABLE `per_vehicle_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `axles` int(11) DEFAULT NULL COMMENT 'axles count',
  `total_number` float DEFAULT NULL,
  `statistics_record_id` int(11) DEFAULT NULL,
  `axle_record_id` int(11) DEFAULT NULL,
  `speed_record_id` int(11) DEFAULT NULL,
  `classification_record_id` int(11) DEFAULT NULL,
  `lane_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_per_vehicle_record_statistics_record1` (`statistics_record_id`),
  KEY `fk_per_vehicle_record_axle_record1` (`axle_record_id`),
  KEY `fk_per_vehicle_record_speed_record1` (`speed_record_id`),
  KEY `fk_per_vehicle_record_classification_record1` (`classification_record_id`),
  KEY `fk_per_vehicle_record_lane1` (`lane_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of per_vehicle_record
-- ----------------------------

-- ----------------------------
-- Table structure for site
-- ----------------------------
DROP TABLE IF EXISTS `site`;
CREATE TABLE `site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `FIPS` int(11) DEFAULT NULL,
  `latitude` mediumtext,
  `longitude` mediumtext,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `address` text,
  `functional_class` int(11) DEFAULT NULL,
  `lane_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of site
-- ----------------------------
INSERT INTO `site` VALUES ('2', 'Colin Desk', '5', '15.15205', '122.00', '2014-02-19', '0000-00-00', 'sjdahjahdj ahsjd hajsdh', '4', '3');
INSERT INTO `site` VALUES ('3', 'Main & First', '1', '35', '12', '2014-02-05', '0000-00-00', 'jskahdgaksjhdb akls KJQW H', '3', '2');
INSERT INTO `site` VALUES ('4', 'Colin Desk', '1', '123123', '123123', '2014-01-28', '2014-02-28', '123123', '2', '2');
INSERT INTO `site` VALUES ('5', 'Colin Desk', '1', '123123', '123123', '2014-02-04', '2014-02-28', '', '2', '2');
INSERT INTO `site` VALUES ('6', 'Colin Desk', '1', '123123', '123123', '2014-02-04', '2014-02-28', '', '2', '2');
INSERT INTO `site` VALUES ('7', 'Colin Desk', '1', '123123', '123123', '2014-02-04', '2014-02-28', '', '2', '2');
INSERT INTO `site` VALUES ('8', 'Colin Desk', '1', '123123', '123123', '2014-02-04', '2014-02-28', '', '2', '2');
INSERT INTO `site` VALUES ('9', 'Colin Desk', '1', '115', '123123', '2014-03-11', '2014-03-01', 'dssdfsf', '1', '2');
INSERT INTO `site` VALUES ('10', 'Colin Desk', '1', '115', '123123', '2014-03-11', '2014-03-01', 'dssdfsf', '1', '2');
INSERT INTO `site` VALUES ('11', 'Colin Desk', '1', '115', '123123', '2014-03-11', '2014-03-01', 'dssdfsf', '1', '2');
INSERT INTO `site` VALUES ('12', 'aaa', '1', '36', '3', '2014-03-11', '0000-00-00', 'dssdfsf', '1', '2');
INSERT INTO `site` VALUES ('13', 'daa', '1', '35.79999', '-97.51465', '2014-03-12', '0000-00-00', 'd erwerw', '3', '2');

-- ----------------------------
-- Table structure for speed_record
-- ----------------------------
DROP TABLE IF EXISTS `speed_record`;
CREATE TABLE `speed_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `count` int(11) DEFAULT NULL,
  `FHWA_speed` int(11) DEFAULT NULL,
  `classification_record_id` int(11) DEFAULT NULL,
  `lane_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_speed_record_classification_record1` (`classification_record_id`),
  KEY `fk_speed_record_lane1` (`lane_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of speed_record
-- ----------------------------

-- ----------------------------
-- Table structure for statistics_record
-- ----------------------------
DROP TABLE IF EXISTS `statistics_record`;
CREATE TABLE `statistics_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_name` varchar(100) DEFAULT NULL,
  `weather` varchar(45) DEFAULT NULL,
  `storage_mode` int(11) DEFAULT NULL,
  `posted_speed_limit` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `stop_date` date NOT NULL,
  `stop_time` time DEFAULT NULL,
  `interval_length` int(11) DEFAULT '0',
  `case_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of statistics_record
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `address` text,
  `phone_number` varchar(45) DEFAULT NULL,
  `mobile_number` varchar(45) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `hire_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', 'Ahmad', 'Molham', 'Barakat', 'molham', 'e10adc3949ba59abbe56e057f20f883e', 'HERE', '12345688', '12345677', '0', '2014-02-22', '0000-00-00');
INSERT INTO `user` VALUES ('3', 'mohanad', 'shab', 'kaleia', 'mohanad', 'e10adc3949ba59abbe56e057f20f883e', 'asdl dsmf ksdl jmslknjs sjfgnsjkfn gjsn jsfgn j', '1234564789', '123454987', '0', '2014-02-26', '0000-00-00');
INSERT INTO `user` VALUES ('11', 'Hazem', '', 'Refai', 'hazem', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '0', '2014-03-03', '0000-00-00');
INSERT INTO `user` VALUES ('12', 'Asaad', '', 'Kaadan', 'asaad', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '0', '2014-03-03', '0000-00-00');

-- ----------------------------
-- Table structure for vehicle_axle_spacing
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_axle_spacing`;
CREATE TABLE `vehicle_axle_spacing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spacing` float DEFAULT NULL,
  `per_vehicle_record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vehicle_axle_spacing_per_vehicle_record1` (`per_vehicle_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vehicle_axle_spacing
-- ----------------------------

-- ----------------------------
-- View structure for accepted_case_counts
-- ----------------------------
DROP VIEW IF EXISTS `accepted_case_counts`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `accepted_case_counts` AS SELECT
count_lane_record.count AS count,
count_record.date AS date,
count_record.time AS time,
`case`.id AS case_id,
site.id AS site_id
FROM
count_lane_record ,
count_record ,
statistics_record ,
`case` ,
site
WHERE
count_lane_record.count_record_id = count_record.id AND
count_record.statistics_record_id = statistics_record.id AND
statistics_record.case_id = `case`.id AND
`case`.`status` = '3' AND
`case`.site_id = site.id ;

-- ----------------------------
-- View structure for case_activities
-- ----------------------------
DROP VIEW IF EXISTS `case_activities`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `case_activities` AS SELECT
`case`.open_date AS open_date,
`case`.close_date AS close_date,
`case`.accept_reject_date AS acc_rej_date,
`case`.`status` AS `status`,
`user`.username AS `user`,
site.`name` AS site
FROM
site ,
`case` ,
`user`
WHERE
(`case`.open_date >= DATE_ADD(CURDATE(), INTERVAL -2 DAY) OR
`case`.close_date >= DATE_ADD(CURDATE(), INTERVAL -2 DAY) OR
`case`.accept_reject_date >= DATE_ADD(CURDATE(), INTERVAL -2 DAY)) AND
site.id = `case`.site_id AND
((`case`.admin_id = `user`.id AND
`case`.`status` = 0) OR
(`user`.id = `case`.collector_id) AND
((`case`.`status` = 1 OR
`case`.`status` = 2)) OR
(`user`.id = `case`.admin_id AND
(`case`.`status` = 3 OR
`case`.`status` = 4)))
ORDER BY
acc_rej_date DESC,
close_date DESC,
open_date DESC,
`case`.accept_reject_time DESC,
`case`.close_time DESC,
`case`.open_time DESC ;

-- ----------------------------
-- View structure for case_count
-- ----------------------------
DROP VIEW IF EXISTS `case_count`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `case_count` AS SELECT
Sum(count_lane_record.count) AS count,
`case`.id AS case_id
FROM
count_lane_record ,
count_record ,
statistics_record ,
`case`
WHERE
count_lane_record.count_record_id = count_record.id AND
count_record.statistics_record_id = statistics_record.id AND
statistics_record.case_id = `case`.id ;

-- ----------------------------
-- View structure for case_site_counters
-- ----------------------------
DROP VIEW IF EXISTS `case_site_counters`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `case_site_counters` AS SELECT
`case`.id AS case_id,
counter.serial AS serial,
counter.id AS counter_id,
site.id AS site_id
FROM
`case` ,
site ,
counter
WHERE
`case`.site_id = site.id AND
counter.site_id = site.id ;
