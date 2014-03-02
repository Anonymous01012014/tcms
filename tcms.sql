/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : tcms

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2014-03-02 13:46:47
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of binary_file
-- ----------------------------
INSERT INTO `binary_file` VALUES ('48', 'Westfirstore_33.BIN', '0000-00-00', '00:00:00', 'files/binary_files/rejected_binary_files/', '0', '33');
INSERT INTO `binary_file` VALUES ('49', 'test_20_34.BIN', '0000-00-00', '00:00:00', 'files/binary_files/accepted_binary_files/', '0', '34');
INSERT INTO `binary_file` VALUES ('50', 'test_10_35.BIN', '0000-00-00', '00:00:00', 'files/binary_files/accepted_binary_files/', '0', '35');

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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of case
-- ----------------------------
INSERT INTO `case` VALUES ('33', '2014-03-01', '16:22:48', '2014-03-01', '16:22:48', '2014-03-01', '16:23:06', '4', '', 'doesn%27t%20match%20our%20standards', '2', '0', '12');
INSERT INTO `case` VALUES ('34', '2014-03-01', '16:23:49', '2014-03-01', '16:23:57', '2014-03-01', '16:24:00', '3', '', '', '2', '2', '3');
INSERT INTO `case` VALUES ('35', '2014-03-02', '10:40:48', '2014-03-02', '10:43:05', '2014-03-02', '10:43:22', '3', '', '', '3', '3', '13');
INSERT INTO `case` VALUES ('36', '2014-03-02', '11:25:28', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '0', '', '', '0', '3', '2');
INSERT INTO `case` VALUES ('37', '2014-03-02', '13:01:08', '2014-03-02', '13:01:38', '0000-00-00', '00:00:00', '2', 'aaa', '', '2', '3', '12');
INSERT INTO `case` VALUES ('38', '2014-03-02', '13:01:27', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '0', '', '', '0', '2', '3');

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
INSERT INTO `counter` VALUES ('16', '010108-0000 OMG', 'Omega', '1.23', '2');
INSERT INTO `counter` VALUES ('17', '010108-0000 OMG', 'Omega', '1.18', '3');

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
INSERT INTO `count_lane_record` VALUES ('50846', '237', '2', '42081');
INSERT INTO `count_lane_record` VALUES ('50847', '237', '3', '42081');
INSERT INTO `count_lane_record` VALUES ('50848', '405', '2', '42082');
INSERT INTO `count_lane_record` VALUES ('50849', '405', '3', '42082');
INSERT INTO `count_lane_record` VALUES ('50850', '405', '2', '42083');
INSERT INTO `count_lane_record` VALUES ('50851', '405', '3', '42083');
INSERT INTO `count_lane_record` VALUES ('50852', '405', '2', '42084');
INSERT INTO `count_lane_record` VALUES ('50853', '405', '3', '42084');
INSERT INTO `count_lane_record` VALUES ('50854', '405', '2', '42085');
INSERT INTO `count_lane_record` VALUES ('50855', '405', '3', '42085');
INSERT INTO `count_lane_record` VALUES ('50856', '405', '2', '42086');
INSERT INTO `count_lane_record` VALUES ('50857', '405', '3', '42086');
INSERT INTO `count_lane_record` VALUES ('50858', '405', '2', '42087');
INSERT INTO `count_lane_record` VALUES ('50859', '405', '3', '42087');
INSERT INTO `count_lane_record` VALUES ('50860', '405', '2', '42088');
INSERT INTO `count_lane_record` VALUES ('50861', '405', '3', '42088');
INSERT INTO `count_lane_record` VALUES ('50862', '405', '2', '42089');
INSERT INTO `count_lane_record` VALUES ('50863', '405', '3', '42089');
INSERT INTO `count_lane_record` VALUES ('50864', '405', '2', '42090');
INSERT INTO `count_lane_record` VALUES ('50865', '405', '3', '42090');
INSERT INTO `count_lane_record` VALUES ('50866', '405', '2', '42091');
INSERT INTO `count_lane_record` VALUES ('50867', '405', '3', '42091');
INSERT INTO `count_lane_record` VALUES ('50868', '405', '2', '42092');
INSERT INTO `count_lane_record` VALUES ('50869', '405', '3', '42092');
INSERT INTO `count_lane_record` VALUES ('50870', '405', '2', '42093');
INSERT INTO `count_lane_record` VALUES ('50871', '405', '3', '42093');
INSERT INTO `count_lane_record` VALUES ('50872', '405', '2', '42094');
INSERT INTO `count_lane_record` VALUES ('50873', '405', '3', '42094');
INSERT INTO `count_lane_record` VALUES ('50874', '405', '2', '42095');
INSERT INTO `count_lane_record` VALUES ('50875', '405', '3', '42095');
INSERT INTO `count_lane_record` VALUES ('50876', '405', '2', '42096');
INSERT INTO `count_lane_record` VALUES ('50877', '405', '3', '42096');
INSERT INTO `count_lane_record` VALUES ('50878', '405', '2', '42097');
INSERT INTO `count_lane_record` VALUES ('50879', '405', '3', '42097');
INSERT INTO `count_lane_record` VALUES ('50880', '405', '2', '42098');
INSERT INTO `count_lane_record` VALUES ('50881', '405', '3', '42098');
INSERT INTO `count_lane_record` VALUES ('50882', '405', '2', '42099');
INSERT INTO `count_lane_record` VALUES ('50883', '405', '3', '42099');
INSERT INTO `count_lane_record` VALUES ('50884', '405', '2', '42100');
INSERT INTO `count_lane_record` VALUES ('50885', '405', '3', '42100');
INSERT INTO `count_lane_record` VALUES ('50886', '405', '2', '42101');
INSERT INTO `count_lane_record` VALUES ('50887', '405', '3', '42101');
INSERT INTO `count_lane_record` VALUES ('50888', '405', '2', '42102');
INSERT INTO `count_lane_record` VALUES ('50889', '405', '3', '42102');
INSERT INTO `count_lane_record` VALUES ('50890', '405', '2', '42103');
INSERT INTO `count_lane_record` VALUES ('50891', '405', '3', '42103');
INSERT INTO `count_lane_record` VALUES ('50892', '405', '2', '42104');
INSERT INTO `count_lane_record` VALUES ('50893', '405', '3', '42104');
INSERT INTO `count_lane_record` VALUES ('50894', '405', '2', '42105');
INSERT INTO `count_lane_record` VALUES ('50895', '405', '3', '42105');
INSERT INTO `count_lane_record` VALUES ('50896', '405', '2', '42106');
INSERT INTO `count_lane_record` VALUES ('50897', '405', '3', '42106');
INSERT INTO `count_lane_record` VALUES ('50898', '405', '2', '42107');
INSERT INTO `count_lane_record` VALUES ('50899', '405', '3', '42107');
INSERT INTO `count_lane_record` VALUES ('50900', '405', '2', '42108');
INSERT INTO `count_lane_record` VALUES ('50901', '405', '3', '42108');
INSERT INTO `count_lane_record` VALUES ('50902', '405', '2', '42109');
INSERT INTO `count_lane_record` VALUES ('50903', '405', '3', '42109');
INSERT INTO `count_lane_record` VALUES ('50904', '405', '2', '42110');
INSERT INTO `count_lane_record` VALUES ('50905', '405', '3', '42110');
INSERT INTO `count_lane_record` VALUES ('50906', '405', '2', '42111');
INSERT INTO `count_lane_record` VALUES ('50907', '405', '3', '42111');
INSERT INTO `count_lane_record` VALUES ('50908', '405', '2', '42112');
INSERT INTO `count_lane_record` VALUES ('50909', '405', '3', '42112');
INSERT INTO `count_lane_record` VALUES ('50910', '405', '2', '42113');
INSERT INTO `count_lane_record` VALUES ('50911', '405', '3', '42113');
INSERT INTO `count_lane_record` VALUES ('50912', '405', '2', '42114');
INSERT INTO `count_lane_record` VALUES ('50913', '405', '3', '42114');
INSERT INTO `count_lane_record` VALUES ('50914', '405', '2', '42115');
INSERT INTO `count_lane_record` VALUES ('50915', '405', '3', '42115');
INSERT INTO `count_lane_record` VALUES ('50916', '405', '2', '42116');
INSERT INTO `count_lane_record` VALUES ('50917', '405', '3', '42116');
INSERT INTO `count_lane_record` VALUES ('50918', '405', '2', '42117');
INSERT INTO `count_lane_record` VALUES ('50919', '405', '3', '42117');
INSERT INTO `count_lane_record` VALUES ('50920', '405', '2', '42118');
INSERT INTO `count_lane_record` VALUES ('50921', '405', '3', '42118');
INSERT INTO `count_lane_record` VALUES ('50922', '405', '2', '42119');
INSERT INTO `count_lane_record` VALUES ('50923', '405', '3', '42119');
INSERT INTO `count_lane_record` VALUES ('50924', '405', '2', '42120');
INSERT INTO `count_lane_record` VALUES ('50925', '405', '3', '42120');
INSERT INTO `count_lane_record` VALUES ('50926', '405', '2', '42121');
INSERT INTO `count_lane_record` VALUES ('50927', '405', '3', '42121');
INSERT INTO `count_lane_record` VALUES ('50928', '405', '2', '42122');
INSERT INTO `count_lane_record` VALUES ('50929', '405', '3', '42122');
INSERT INTO `count_lane_record` VALUES ('50930', '405', '2', '42123');
INSERT INTO `count_lane_record` VALUES ('50931', '405', '3', '42123');
INSERT INTO `count_lane_record` VALUES ('50932', '405', '2', '42124');
INSERT INTO `count_lane_record` VALUES ('50933', '405', '3', '42124');
INSERT INTO `count_lane_record` VALUES ('50934', '405', '2', '42125');
INSERT INTO `count_lane_record` VALUES ('50935', '405', '3', '42125');
INSERT INTO `count_lane_record` VALUES ('50936', '405', '2', '42126');
INSERT INTO `count_lane_record` VALUES ('50937', '405', '3', '42126');
INSERT INTO `count_lane_record` VALUES ('50938', '405', '2', '42127');
INSERT INTO `count_lane_record` VALUES ('50939', '405', '3', '42127');
INSERT INTO `count_lane_record` VALUES ('50940', '405', '2', '42128');
INSERT INTO `count_lane_record` VALUES ('50941', '405', '3', '42128');
INSERT INTO `count_lane_record` VALUES ('50942', '405', '2', '42129');
INSERT INTO `count_lane_record` VALUES ('50943', '405', '3', '42129');
INSERT INTO `count_lane_record` VALUES ('50944', '405', '2', '42130');
INSERT INTO `count_lane_record` VALUES ('50945', '405', '3', '42130');
INSERT INTO `count_lane_record` VALUES ('50946', '405', '2', '42131');
INSERT INTO `count_lane_record` VALUES ('50947', '405', '3', '42131');
INSERT INTO `count_lane_record` VALUES ('50948', '405', '2', '42132');
INSERT INTO `count_lane_record` VALUES ('50949', '405', '3', '42132');
INSERT INTO `count_lane_record` VALUES ('50950', '405', '2', '42133');
INSERT INTO `count_lane_record` VALUES ('50951', '405', '3', '42133');
INSERT INTO `count_lane_record` VALUES ('50952', '405', '2', '42134');
INSERT INTO `count_lane_record` VALUES ('50953', '405', '3', '42134');
INSERT INTO `count_lane_record` VALUES ('50954', '405', '2', '42135');
INSERT INTO `count_lane_record` VALUES ('50955', '405', '3', '42135');
INSERT INTO `count_lane_record` VALUES ('50956', '405', '2', '42136');
INSERT INTO `count_lane_record` VALUES ('50957', '405', '3', '42136');
INSERT INTO `count_lane_record` VALUES ('50958', '405', '2', '42137');
INSERT INTO `count_lane_record` VALUES ('50959', '405', '3', '42137');
INSERT INTO `count_lane_record` VALUES ('50960', '405', '2', '42138');
INSERT INTO `count_lane_record` VALUES ('50961', '405', '3', '42138');
INSERT INTO `count_lane_record` VALUES ('50962', '405', '2', '42139');
INSERT INTO `count_lane_record` VALUES ('50963', '405', '3', '42139');
INSERT INTO `count_lane_record` VALUES ('50964', '405', '2', '42140');
INSERT INTO `count_lane_record` VALUES ('50965', '405', '3', '42140');
INSERT INTO `count_lane_record` VALUES ('50966', '405', '2', '42141');
INSERT INTO `count_lane_record` VALUES ('50967', '405', '3', '42141');
INSERT INTO `count_lane_record` VALUES ('50968', '405', '2', '42142');
INSERT INTO `count_lane_record` VALUES ('50969', '405', '3', '42142');
INSERT INTO `count_lane_record` VALUES ('50970', '405', '2', '42143');
INSERT INTO `count_lane_record` VALUES ('50971', '405', '3', '42143');
INSERT INTO `count_lane_record` VALUES ('50972', '405', '2', '42144');
INSERT INTO `count_lane_record` VALUES ('50973', '405', '3', '42144');
INSERT INTO `count_lane_record` VALUES ('50974', '405', '2', '42145');
INSERT INTO `count_lane_record` VALUES ('50975', '405', '3', '42145');
INSERT INTO `count_lane_record` VALUES ('50976', '405', '2', '42146');
INSERT INTO `count_lane_record` VALUES ('50977', '405', '3', '42146');
INSERT INTO `count_lane_record` VALUES ('50978', '405', '2', '42147');
INSERT INTO `count_lane_record` VALUES ('50979', '405', '3', '42147');
INSERT INTO `count_lane_record` VALUES ('50980', '405', '2', '42148');
INSERT INTO `count_lane_record` VALUES ('50981', '405', '3', '42148');
INSERT INTO `count_lane_record` VALUES ('50982', '405', '2', '42149');
INSERT INTO `count_lane_record` VALUES ('50983', '405', '3', '42149');
INSERT INTO `count_lane_record` VALUES ('50984', '405', '2', '42150');
INSERT INTO `count_lane_record` VALUES ('50985', '405', '3', '42150');
INSERT INTO `count_lane_record` VALUES ('50986', '405', '2', '42151');
INSERT INTO `count_lane_record` VALUES ('50987', '405', '3', '42151');
INSERT INTO `count_lane_record` VALUES ('50988', '405', '2', '42152');
INSERT INTO `count_lane_record` VALUES ('50989', '405', '3', '42152');
INSERT INTO `count_lane_record` VALUES ('50990', '404', '2', '42153');
INSERT INTO `count_lane_record` VALUES ('50991', '405', '3', '42153');
INSERT INTO `count_lane_record` VALUES ('50992', '405', '2', '42154');
INSERT INTO `count_lane_record` VALUES ('50993', '405', '3', '42154');
INSERT INTO `count_lane_record` VALUES ('50994', '405', '2', '42155');
INSERT INTO `count_lane_record` VALUES ('50995', '405', '3', '42155');
INSERT INTO `count_lane_record` VALUES ('50996', '405', '2', '42156');
INSERT INTO `count_lane_record` VALUES ('50997', '404', '3', '42156');
INSERT INTO `count_lane_record` VALUES ('50998', '405', '2', '42157');
INSERT INTO `count_lane_record` VALUES ('50999', '405', '3', '42157');
INSERT INTO `count_lane_record` VALUES ('51000', '405', '2', '42158');
INSERT INTO `count_lane_record` VALUES ('51001', '405', '3', '42158');
INSERT INTO `count_lane_record` VALUES ('51002', '405', '2', '42159');
INSERT INTO `count_lane_record` VALUES ('51003', '405', '3', '42159');
INSERT INTO `count_lane_record` VALUES ('51004', '405', '2', '42160');
INSERT INTO `count_lane_record` VALUES ('51005', '405', '3', '42160');
INSERT INTO `count_lane_record` VALUES ('51006', '405', '2', '42161');
INSERT INTO `count_lane_record` VALUES ('51007', '405', '3', '42161');
INSERT INTO `count_lane_record` VALUES ('51008', '405', '2', '42162');
INSERT INTO `count_lane_record` VALUES ('51009', '405', '3', '42162');
INSERT INTO `count_lane_record` VALUES ('51010', '405', '2', '42163');
INSERT INTO `count_lane_record` VALUES ('51011', '405', '3', '42163');
INSERT INTO `count_lane_record` VALUES ('51012', '405', '2', '42164');
INSERT INTO `count_lane_record` VALUES ('51013', '405', '3', '42164');
INSERT INTO `count_lane_record` VALUES ('51014', '405', '2', '42165');
INSERT INTO `count_lane_record` VALUES ('51015', '405', '3', '42165');
INSERT INTO `count_lane_record` VALUES ('51016', '405', '2', '42166');
INSERT INTO `count_lane_record` VALUES ('51017', '405', '3', '42166');
INSERT INTO `count_lane_record` VALUES ('51018', '405', '2', '42167');
INSERT INTO `count_lane_record` VALUES ('51019', '405', '3', '42167');
INSERT INTO `count_lane_record` VALUES ('51020', '404', '2', '42168');
INSERT INTO `count_lane_record` VALUES ('51021', '405', '3', '42168');
INSERT INTO `count_lane_record` VALUES ('51022', '405', '2', '42169');
INSERT INTO `count_lane_record` VALUES ('51023', '405', '3', '42169');
INSERT INTO `count_lane_record` VALUES ('51024', '405', '2', '42170');
INSERT INTO `count_lane_record` VALUES ('51025', '405', '3', '42170');
INSERT INTO `count_lane_record` VALUES ('51026', '405', '2', '42171');
INSERT INTO `count_lane_record` VALUES ('51027', '404', '3', '42171');
INSERT INTO `count_lane_record` VALUES ('51028', '405', '2', '42172');
INSERT INTO `count_lane_record` VALUES ('51029', '405', '3', '42172');
INSERT INTO `count_lane_record` VALUES ('51030', '405', '2', '42173');
INSERT INTO `count_lane_record` VALUES ('51031', '405', '3', '42173');
INSERT INTO `count_lane_record` VALUES ('51032', '405', '2', '42174');
INSERT INTO `count_lane_record` VALUES ('51033', '405', '3', '42174');
INSERT INTO `count_lane_record` VALUES ('51034', '404', '2', '42175');
INSERT INTO `count_lane_record` VALUES ('51035', '405', '3', '42175');
INSERT INTO `count_lane_record` VALUES ('51036', '405', '2', '42176');
INSERT INTO `count_lane_record` VALUES ('51037', '405', '3', '42176');
INSERT INTO `count_lane_record` VALUES ('51038', '405', '2', '42177');
INSERT INTO `count_lane_record` VALUES ('51039', '405', '3', '42177');
INSERT INTO `count_lane_record` VALUES ('51040', '405', '2', '42178');
INSERT INTO `count_lane_record` VALUES ('51041', '404', '3', '42178');
INSERT INTO `count_lane_record` VALUES ('51042', '405', '2', '42179');
INSERT INTO `count_lane_record` VALUES ('51043', '405', '3', '42179');
INSERT INTO `count_lane_record` VALUES ('51044', '405', '2', '42180');
INSERT INTO `count_lane_record` VALUES ('51045', '405', '3', '42180');
INSERT INTO `count_lane_record` VALUES ('51046', '405', '2', '42181');
INSERT INTO `count_lane_record` VALUES ('51047', '405', '3', '42181');
INSERT INTO `count_lane_record` VALUES ('51048', '405', '2', '42182');
INSERT INTO `count_lane_record` VALUES ('51049', '405', '3', '42182');
INSERT INTO `count_lane_record` VALUES ('51050', '405', '2', '42183');
INSERT INTO `count_lane_record` VALUES ('51051', '405', '3', '42183');
INSERT INTO `count_lane_record` VALUES ('51052', '405', '2', '42184');
INSERT INTO `count_lane_record` VALUES ('51053', '405', '3', '42184');
INSERT INTO `count_lane_record` VALUES ('51054', '405', '2', '42185');
INSERT INTO `count_lane_record` VALUES ('51055', '405', '3', '42185');
INSERT INTO `count_lane_record` VALUES ('51056', '405', '2', '42186');
INSERT INTO `count_lane_record` VALUES ('51057', '405', '3', '42186');
INSERT INTO `count_lane_record` VALUES ('51058', '405', '2', '42187');
INSERT INTO `count_lane_record` VALUES ('51059', '405', '3', '42187');
INSERT INTO `count_lane_record` VALUES ('51060', '405', '2', '42188');
INSERT INTO `count_lane_record` VALUES ('51061', '405', '3', '42188');
INSERT INTO `count_lane_record` VALUES ('51062', '405', '2', '42189');
INSERT INTO `count_lane_record` VALUES ('51063', '405', '3', '42189');
INSERT INTO `count_lane_record` VALUES ('51064', '404', '2', '42190');
INSERT INTO `count_lane_record` VALUES ('51065', '405', '3', '42190');
INSERT INTO `count_lane_record` VALUES ('51066', '405', '2', '42191');
INSERT INTO `count_lane_record` VALUES ('51067', '405', '3', '42191');
INSERT INTO `count_lane_record` VALUES ('51068', '405', '2', '42192');
INSERT INTO `count_lane_record` VALUES ('51069', '405', '3', '42192');
INSERT INTO `count_lane_record` VALUES ('51070', '405', '2', '42193');
INSERT INTO `count_lane_record` VALUES ('51071', '404', '3', '42193');
INSERT INTO `count_lane_record` VALUES ('51072', '405', '2', '42194');
INSERT INTO `count_lane_record` VALUES ('51073', '405', '3', '42194');
INSERT INTO `count_lane_record` VALUES ('51074', '405', '2', '42195');
INSERT INTO `count_lane_record` VALUES ('51075', '405', '3', '42195');
INSERT INTO `count_lane_record` VALUES ('51076', '405', '2', '42196');
INSERT INTO `count_lane_record` VALUES ('51077', '405', '3', '42196');
INSERT INTO `count_lane_record` VALUES ('51078', '405', '2', '42197');
INSERT INTO `count_lane_record` VALUES ('51079', '405', '3', '42197');
INSERT INTO `count_lane_record` VALUES ('51080', '405', '2', '42198');
INSERT INTO `count_lane_record` VALUES ('51081', '405', '3', '42198');
INSERT INTO `count_lane_record` VALUES ('51082', '405', '2', '42199');
INSERT INTO `count_lane_record` VALUES ('51083', '405', '3', '42199');
INSERT INTO `count_lane_record` VALUES ('51084', '405', '2', '42200');
INSERT INTO `count_lane_record` VALUES ('51085', '405', '3', '42200');
INSERT INTO `count_lane_record` VALUES ('51086', '404', '2', '42201');
INSERT INTO `count_lane_record` VALUES ('51087', '405', '3', '42201');
INSERT INTO `count_lane_record` VALUES ('51088', '405', '2', '42202');
INSERT INTO `count_lane_record` VALUES ('51089', '405', '3', '42202');
INSERT INTO `count_lane_record` VALUES ('51090', '405', '2', '42203');
INSERT INTO `count_lane_record` VALUES ('51091', '405', '3', '42203');
INSERT INTO `count_lane_record` VALUES ('51092', '405', '2', '42204');
INSERT INTO `count_lane_record` VALUES ('51093', '404', '3', '42204');
INSERT INTO `count_lane_record` VALUES ('51094', '405', '2', '42205');
INSERT INTO `count_lane_record` VALUES ('51095', '405', '3', '42205');
INSERT INTO `count_lane_record` VALUES ('51096', '405', '2', '42206');
INSERT INTO `count_lane_record` VALUES ('51097', '405', '3', '42206');
INSERT INTO `count_lane_record` VALUES ('51098', '405', '2', '42207');
INSERT INTO `count_lane_record` VALUES ('51099', '405', '3', '42207');
INSERT INTO `count_lane_record` VALUES ('51100', '405', '2', '42208');
INSERT INTO `count_lane_record` VALUES ('51101', '405', '3', '42208');
INSERT INTO `count_lane_record` VALUES ('51102', '405', '2', '42209');
INSERT INTO `count_lane_record` VALUES ('51103', '405', '3', '42209');
INSERT INTO `count_lane_record` VALUES ('51104', '405', '2', '42210');
INSERT INTO `count_lane_record` VALUES ('51105', '405', '3', '42210');
INSERT INTO `count_lane_record` VALUES ('51106', '405', '2', '42211');
INSERT INTO `count_lane_record` VALUES ('51107', '405', '3', '42211');
INSERT INTO `count_lane_record` VALUES ('51108', '405', '2', '42212');
INSERT INTO `count_lane_record` VALUES ('51109', '405', '3', '42212');
INSERT INTO `count_lane_record` VALUES ('51110', '405', '2', '42213');
INSERT INTO `count_lane_record` VALUES ('51111', '405', '3', '42213');
INSERT INTO `count_lane_record` VALUES ('51112', '405', '2', '42214');
INSERT INTO `count_lane_record` VALUES ('51113', '405', '3', '42214');
INSERT INTO `count_lane_record` VALUES ('51114', '405', '2', '42215');
INSERT INTO `count_lane_record` VALUES ('51115', '405', '3', '42215');
INSERT INTO `count_lane_record` VALUES ('51116', '405', '2', '42216');
INSERT INTO `count_lane_record` VALUES ('51117', '405', '3', '42216');
INSERT INTO `count_lane_record` VALUES ('51118', '405', '2', '42217');
INSERT INTO `count_lane_record` VALUES ('51119', '405', '3', '42217');
INSERT INTO `count_lane_record` VALUES ('51120', '405', '2', '42218');
INSERT INTO `count_lane_record` VALUES ('51121', '405', '3', '42218');
INSERT INTO `count_lane_record` VALUES ('51122', '405', '2', '42219');
INSERT INTO `count_lane_record` VALUES ('51123', '405', '3', '42219');
INSERT INTO `count_lane_record` VALUES ('51124', '405', '2', '42220');
INSERT INTO `count_lane_record` VALUES ('51125', '405', '3', '42220');
INSERT INTO `count_lane_record` VALUES ('51126', '405', '2', '42221');
INSERT INTO `count_lane_record` VALUES ('51127', '405', '3', '42221');
INSERT INTO `count_lane_record` VALUES ('51128', '405', '2', '42222');
INSERT INTO `count_lane_record` VALUES ('51129', '405', '3', '42222');
INSERT INTO `count_lane_record` VALUES ('51130', '405', '2', '42223');
INSERT INTO `count_lane_record` VALUES ('51131', '405', '3', '42223');
INSERT INTO `count_lane_record` VALUES ('51132', '405', '2', '42224');
INSERT INTO `count_lane_record` VALUES ('51133', '405', '3', '42224');
INSERT INTO `count_lane_record` VALUES ('51134', '405', '2', '42225');
INSERT INTO `count_lane_record` VALUES ('51135', '405', '3', '42225');
INSERT INTO `count_lane_record` VALUES ('51136', '405', '2', '42226');
INSERT INTO `count_lane_record` VALUES ('51137', '405', '3', '42226');
INSERT INTO `count_lane_record` VALUES ('51138', '405', '2', '42227');
INSERT INTO `count_lane_record` VALUES ('51139', '405', '3', '42227');
INSERT INTO `count_lane_record` VALUES ('51140', '405', '2', '42228');
INSERT INTO `count_lane_record` VALUES ('51141', '405', '3', '42228');
INSERT INTO `count_lane_record` VALUES ('51142', '405', '2', '42229');
INSERT INTO `count_lane_record` VALUES ('51143', '405', '3', '42229');
INSERT INTO `count_lane_record` VALUES ('51144', '405', '2', '42230');
INSERT INTO `count_lane_record` VALUES ('51145', '405', '3', '42230');
INSERT INTO `count_lane_record` VALUES ('51146', '405', '2', '42231');
INSERT INTO `count_lane_record` VALUES ('51147', '405', '3', '42231');
INSERT INTO `count_lane_record` VALUES ('51148', '405', '2', '42232');
INSERT INTO `count_lane_record` VALUES ('51149', '405', '3', '42232');
INSERT INTO `count_lane_record` VALUES ('51150', '405', '2', '42233');
INSERT INTO `count_lane_record` VALUES ('51151', '405', '3', '42233');
INSERT INTO `count_lane_record` VALUES ('51152', '405', '2', '42234');
INSERT INTO `count_lane_record` VALUES ('51153', '405', '3', '42234');
INSERT INTO `count_lane_record` VALUES ('51154', '405', '2', '42235');
INSERT INTO `count_lane_record` VALUES ('51155', '405', '3', '42235');
INSERT INTO `count_lane_record` VALUES ('51156', '405', '2', '42236');
INSERT INTO `count_lane_record` VALUES ('51157', '405', '3', '42236');
INSERT INTO `count_lane_record` VALUES ('51158', '405', '2', '42237');
INSERT INTO `count_lane_record` VALUES ('51159', '405', '3', '42237');
INSERT INTO `count_lane_record` VALUES ('51160', '405', '2', '42238');
INSERT INTO `count_lane_record` VALUES ('51161', '405', '3', '42238');
INSERT INTO `count_lane_record` VALUES ('51162', '405', '2', '42239');
INSERT INTO `count_lane_record` VALUES ('51163', '405', '3', '42239');
INSERT INTO `count_lane_record` VALUES ('51164', '405', '2', '42240');
INSERT INTO `count_lane_record` VALUES ('51165', '405', '3', '42240');
INSERT INTO `count_lane_record` VALUES ('51166', '405', '2', '42241');
INSERT INTO `count_lane_record` VALUES ('51167', '405', '3', '42241');
INSERT INTO `count_lane_record` VALUES ('51168', '405', '2', '42242');
INSERT INTO `count_lane_record` VALUES ('51169', '405', '3', '42242');
INSERT INTO `count_lane_record` VALUES ('51170', '405', '2', '42243');
INSERT INTO `count_lane_record` VALUES ('51171', '405', '3', '42243');
INSERT INTO `count_lane_record` VALUES ('51172', '405', '2', '42244');
INSERT INTO `count_lane_record` VALUES ('51173', '405', '3', '42244');
INSERT INTO `count_lane_record` VALUES ('51174', '405', '2', '42245');
INSERT INTO `count_lane_record` VALUES ('51175', '405', '3', '42245');
INSERT INTO `count_lane_record` VALUES ('51176', '405', '2', '42246');
INSERT INTO `count_lane_record` VALUES ('51177', '405', '3', '42246');
INSERT INTO `count_lane_record` VALUES ('51178', '405', '2', '42247');
INSERT INTO `count_lane_record` VALUES ('51179', '405', '3', '42247');
INSERT INTO `count_lane_record` VALUES ('51180', '405', '2', '42248');
INSERT INTO `count_lane_record` VALUES ('51181', '405', '3', '42248');
INSERT INTO `count_lane_record` VALUES ('51182', '405', '2', '42249');
INSERT INTO `count_lane_record` VALUES ('51183', '405', '3', '42249');
INSERT INTO `count_lane_record` VALUES ('51184', '405', '2', '42250');
INSERT INTO `count_lane_record` VALUES ('51185', '405', '3', '42250');
INSERT INTO `count_lane_record` VALUES ('51186', '405', '2', '42251');
INSERT INTO `count_lane_record` VALUES ('51187', '405', '3', '42251');
INSERT INTO `count_lane_record` VALUES ('51188', '405', '2', '42252');
INSERT INTO `count_lane_record` VALUES ('51189', '405', '3', '42252');
INSERT INTO `count_lane_record` VALUES ('51190', '405', '2', '42253');
INSERT INTO `count_lane_record` VALUES ('51191', '405', '3', '42253');
INSERT INTO `count_lane_record` VALUES ('51192', '405', '2', '42254');
INSERT INTO `count_lane_record` VALUES ('51193', '405', '3', '42254');
INSERT INTO `count_lane_record` VALUES ('51194', '405', '2', '42255');
INSERT INTO `count_lane_record` VALUES ('51195', '405', '3', '42255');
INSERT INTO `count_lane_record` VALUES ('51196', '405', '2', '42256');
INSERT INTO `count_lane_record` VALUES ('51197', '405', '3', '42256');
INSERT INTO `count_lane_record` VALUES ('51198', '405', '2', '42257');
INSERT INTO `count_lane_record` VALUES ('51199', '405', '3', '42257');
INSERT INTO `count_lane_record` VALUES ('51200', '405', '2', '42258');
INSERT INTO `count_lane_record` VALUES ('51201', '405', '3', '42258');
INSERT INTO `count_lane_record` VALUES ('51202', '405', '2', '42259');
INSERT INTO `count_lane_record` VALUES ('51203', '405', '3', '42259');
INSERT INTO `count_lane_record` VALUES ('51204', '405', '2', '42260');
INSERT INTO `count_lane_record` VALUES ('51205', '405', '3', '42260');
INSERT INTO `count_lane_record` VALUES ('51206', '405', '2', '42261');
INSERT INTO `count_lane_record` VALUES ('51207', '405', '3', '42261');
INSERT INTO `count_lane_record` VALUES ('51208', '405', '2', '42262');
INSERT INTO `count_lane_record` VALUES ('51209', '405', '3', '42262');
INSERT INTO `count_lane_record` VALUES ('51210', '405', '2', '42263');
INSERT INTO `count_lane_record` VALUES ('51211', '405', '3', '42263');
INSERT INTO `count_lane_record` VALUES ('51212', '405', '2', '42264');
INSERT INTO `count_lane_record` VALUES ('51213', '405', '3', '42264');
INSERT INTO `count_lane_record` VALUES ('51214', '405', '2', '42265');
INSERT INTO `count_lane_record` VALUES ('51215', '405', '3', '42265');
INSERT INTO `count_lane_record` VALUES ('51216', '405', '2', '42266');
INSERT INTO `count_lane_record` VALUES ('51217', '405', '3', '42266');
INSERT INTO `count_lane_record` VALUES ('51218', '405', '2', '42267');
INSERT INTO `count_lane_record` VALUES ('51219', '405', '3', '42267');
INSERT INTO `count_lane_record` VALUES ('51220', '405', '2', '42268');
INSERT INTO `count_lane_record` VALUES ('51221', '405', '3', '42268');
INSERT INTO `count_lane_record` VALUES ('51222', '405', '2', '42269');
INSERT INTO `count_lane_record` VALUES ('51223', '405', '3', '42269');
INSERT INTO `count_lane_record` VALUES ('51224', '405', '2', '42270');
INSERT INTO `count_lane_record` VALUES ('51225', '405', '3', '42270');
INSERT INTO `count_lane_record` VALUES ('51226', '405', '2', '42271');
INSERT INTO `count_lane_record` VALUES ('51227', '405', '3', '42271');
INSERT INTO `count_lane_record` VALUES ('51228', '405', '2', '42272');
INSERT INTO `count_lane_record` VALUES ('51229', '405', '3', '42272');
INSERT INTO `count_lane_record` VALUES ('51230', '405', '2', '42273');
INSERT INTO `count_lane_record` VALUES ('51231', '405', '3', '42273');
INSERT INTO `count_lane_record` VALUES ('51232', '405', '2', '42274');
INSERT INTO `count_lane_record` VALUES ('51233', '405', '3', '42274');
INSERT INTO `count_lane_record` VALUES ('51234', '405', '2', '42275');
INSERT INTO `count_lane_record` VALUES ('51235', '405', '3', '42275');
INSERT INTO `count_lane_record` VALUES ('51236', '405', '2', '42276');
INSERT INTO `count_lane_record` VALUES ('51237', '405', '3', '42276');
INSERT INTO `count_lane_record` VALUES ('51238', '405', '2', '42277');
INSERT INTO `count_lane_record` VALUES ('51239', '405', '3', '42277');
INSERT INTO `count_lane_record` VALUES ('51240', '405', '2', '42278');
INSERT INTO `count_lane_record` VALUES ('51241', '405', '3', '42278');
INSERT INTO `count_lane_record` VALUES ('51242', '405', '2', '42279');
INSERT INTO `count_lane_record` VALUES ('51243', '405', '3', '42279');
INSERT INTO `count_lane_record` VALUES ('51244', '405', '2', '42280');
INSERT INTO `count_lane_record` VALUES ('51245', '405', '3', '42280');
INSERT INTO `count_lane_record` VALUES ('51246', '405', '2', '42281');
INSERT INTO `count_lane_record` VALUES ('51247', '405', '3', '42281');
INSERT INTO `count_lane_record` VALUES ('51248', '405', '2', '42282');
INSERT INTO `count_lane_record` VALUES ('51249', '405', '3', '42282');
INSERT INTO `count_lane_record` VALUES ('51250', '405', '2', '42283');
INSERT INTO `count_lane_record` VALUES ('51251', '405', '3', '42283');
INSERT INTO `count_lane_record` VALUES ('51252', '405', '2', '42284');
INSERT INTO `count_lane_record` VALUES ('51253', '405', '3', '42284');
INSERT INTO `count_lane_record` VALUES ('51254', '405', '2', '42285');
INSERT INTO `count_lane_record` VALUES ('51255', '405', '3', '42285');
INSERT INTO `count_lane_record` VALUES ('51256', '405', '2', '42286');
INSERT INTO `count_lane_record` VALUES ('51257', '405', '3', '42286');
INSERT INTO `count_lane_record` VALUES ('51258', '405', '2', '42287');
INSERT INTO `count_lane_record` VALUES ('51259', '405', '3', '42287');
INSERT INTO `count_lane_record` VALUES ('51260', '405', '2', '42288');
INSERT INTO `count_lane_record` VALUES ('51261', '405', '3', '42288');
INSERT INTO `count_lane_record` VALUES ('51262', '405', '2', '42289');
INSERT INTO `count_lane_record` VALUES ('51263', '405', '3', '42289');
INSERT INTO `count_lane_record` VALUES ('51264', '405', '2', '42290');
INSERT INTO `count_lane_record` VALUES ('51265', '405', '3', '42290');
INSERT INTO `count_lane_record` VALUES ('51266', '405', '2', '42291');
INSERT INTO `count_lane_record` VALUES ('51267', '405', '3', '42291');
INSERT INTO `count_lane_record` VALUES ('51268', '405', '2', '42292');
INSERT INTO `count_lane_record` VALUES ('51269', '405', '3', '42292');
INSERT INTO `count_lane_record` VALUES ('51270', '405', '2', '42293');
INSERT INTO `count_lane_record` VALUES ('51271', '405', '3', '42293');
INSERT INTO `count_lane_record` VALUES ('51272', '405', '2', '42294');
INSERT INTO `count_lane_record` VALUES ('51273', '405', '3', '42294');
INSERT INTO `count_lane_record` VALUES ('51274', '405', '2', '42295');
INSERT INTO `count_lane_record` VALUES ('51275', '405', '3', '42295');
INSERT INTO `count_lane_record` VALUES ('51276', '405', '2', '42296');
INSERT INTO `count_lane_record` VALUES ('51277', '405', '3', '42296');
INSERT INTO `count_lane_record` VALUES ('51278', '405', '2', '42297');
INSERT INTO `count_lane_record` VALUES ('51279', '405', '3', '42297');
INSERT INTO `count_lane_record` VALUES ('51280', '405', '2', '42298');
INSERT INTO `count_lane_record` VALUES ('51281', '405', '3', '42298');
INSERT INTO `count_lane_record` VALUES ('51282', '405', '2', '42299');
INSERT INTO `count_lane_record` VALUES ('51283', '405', '3', '42299');
INSERT INTO `count_lane_record` VALUES ('51284', '405', '2', '42300');
INSERT INTO `count_lane_record` VALUES ('51285', '405', '3', '42300');
INSERT INTO `count_lane_record` VALUES ('51286', '405', '2', '42301');
INSERT INTO `count_lane_record` VALUES ('51287', '405', '3', '42301');
INSERT INTO `count_lane_record` VALUES ('51288', '405', '2', '42302');
INSERT INTO `count_lane_record` VALUES ('51289', '405', '3', '42302');
INSERT INTO `count_lane_record` VALUES ('51290', '405', '2', '42303');
INSERT INTO `count_lane_record` VALUES ('51291', '405', '3', '42303');
INSERT INTO `count_lane_record` VALUES ('51292', '405', '2', '42304');
INSERT INTO `count_lane_record` VALUES ('51293', '405', '3', '42304');
INSERT INTO `count_lane_record` VALUES ('51294', '405', '2', '42305');
INSERT INTO `count_lane_record` VALUES ('51295', '405', '3', '42305');
INSERT INTO `count_lane_record` VALUES ('51296', '405', '2', '42306');
INSERT INTO `count_lane_record` VALUES ('51297', '405', '3', '42306');
INSERT INTO `count_lane_record` VALUES ('51298', '405', '2', '42307');
INSERT INTO `count_lane_record` VALUES ('51299', '405', '3', '42307');
INSERT INTO `count_lane_record` VALUES ('51300', '405', '2', '42308');
INSERT INTO `count_lane_record` VALUES ('51301', '405', '3', '42308');
INSERT INTO `count_lane_record` VALUES ('51302', '405', '2', '42309');
INSERT INTO `count_lane_record` VALUES ('51303', '405', '3', '42309');
INSERT INTO `count_lane_record` VALUES ('51304', '405', '2', '42310');
INSERT INTO `count_lane_record` VALUES ('51305', '405', '3', '42310');
INSERT INTO `count_lane_record` VALUES ('51306', '405', '2', '42311');
INSERT INTO `count_lane_record` VALUES ('51307', '405', '3', '42311');
INSERT INTO `count_lane_record` VALUES ('51308', '405', '2', '42312');
INSERT INTO `count_lane_record` VALUES ('51309', '405', '3', '42312');
INSERT INTO `count_lane_record` VALUES ('51310', '405', '2', '42313');
INSERT INTO `count_lane_record` VALUES ('51311', '405', '3', '42313');
INSERT INTO `count_lane_record` VALUES ('51312', '405', '2', '42314');
INSERT INTO `count_lane_record` VALUES ('51313', '405', '3', '42314');
INSERT INTO `count_lane_record` VALUES ('51314', '405', '2', '42315');
INSERT INTO `count_lane_record` VALUES ('51315', '405', '3', '42315');
INSERT INTO `count_lane_record` VALUES ('51316', '404', '2', '42316');
INSERT INTO `count_lane_record` VALUES ('51317', '405', '3', '42316');
INSERT INTO `count_lane_record` VALUES ('51318', '405', '2', '42317');
INSERT INTO `count_lane_record` VALUES ('51319', '405', '3', '42317');
INSERT INTO `count_lane_record` VALUES ('51320', '405', '2', '42318');
INSERT INTO `count_lane_record` VALUES ('51321', '405', '3', '42318');
INSERT INTO `count_lane_record` VALUES ('51322', '405', '2', '42319');
INSERT INTO `count_lane_record` VALUES ('51323', '404', '3', '42319');
INSERT INTO `count_lane_record` VALUES ('51324', '404', '2', '42320');
INSERT INTO `count_lane_record` VALUES ('51325', '405', '3', '42320');
INSERT INTO `count_lane_record` VALUES ('51326', '405', '2', '42321');
INSERT INTO `count_lane_record` VALUES ('51327', '405', '3', '42321');
INSERT INTO `count_lane_record` VALUES ('51328', '405', '2', '42322');
INSERT INTO `count_lane_record` VALUES ('51329', '405', '3', '42322');
INSERT INTO `count_lane_record` VALUES ('51330', '405', '2', '42323');
INSERT INTO `count_lane_record` VALUES ('51331', '404', '3', '42323');
INSERT INTO `count_lane_record` VALUES ('51332', '404', '2', '42324');
INSERT INTO `count_lane_record` VALUES ('51333', '405', '3', '42324');
INSERT INTO `count_lane_record` VALUES ('51334', '405', '2', '42325');
INSERT INTO `count_lane_record` VALUES ('51335', '405', '3', '42325');
INSERT INTO `count_lane_record` VALUES ('51336', '405', '2', '42326');
INSERT INTO `count_lane_record` VALUES ('51337', '405', '3', '42326');
INSERT INTO `count_lane_record` VALUES ('51338', '405', '2', '42327');
INSERT INTO `count_lane_record` VALUES ('51339', '404', '3', '42327');
INSERT INTO `count_lane_record` VALUES ('51340', '405', '2', '42328');
INSERT INTO `count_lane_record` VALUES ('51341', '405', '3', '42328');
INSERT INTO `count_lane_record` VALUES ('51342', '405', '2', '42329');
INSERT INTO `count_lane_record` VALUES ('51343', '405', '3', '42329');
INSERT INTO `count_lane_record` VALUES ('51344', '405', '2', '42330');
INSERT INTO `count_lane_record` VALUES ('51345', '405', '3', '42330');
INSERT INTO `count_lane_record` VALUES ('51346', '405', '2', '42331');
INSERT INTO `count_lane_record` VALUES ('51347', '405', '3', '42331');
INSERT INTO `count_lane_record` VALUES ('51348', '405', '2', '42332');
INSERT INTO `count_lane_record` VALUES ('51349', '405', '3', '42332');
INSERT INTO `count_lane_record` VALUES ('51350', '405', '2', '42333');
INSERT INTO `count_lane_record` VALUES ('51351', '405', '3', '42333');
INSERT INTO `count_lane_record` VALUES ('51352', '405', '2', '42334');
INSERT INTO `count_lane_record` VALUES ('51353', '405', '3', '42334');
INSERT INTO `count_lane_record` VALUES ('51354', '405', '2', '42335');
INSERT INTO `count_lane_record` VALUES ('51355', '405', '3', '42335');
INSERT INTO `count_lane_record` VALUES ('51356', '405', '2', '42336');
INSERT INTO `count_lane_record` VALUES ('51357', '405', '3', '42336');
INSERT INTO `count_lane_record` VALUES ('51358', '405', '2', '42337');
INSERT INTO `count_lane_record` VALUES ('51359', '405', '3', '42337');
INSERT INTO `count_lane_record` VALUES ('51360', '405', '2', '42338');
INSERT INTO `count_lane_record` VALUES ('51361', '405', '3', '42338');
INSERT INTO `count_lane_record` VALUES ('51362', '405', '2', '42339');
INSERT INTO `count_lane_record` VALUES ('51363', '405', '3', '42339');
INSERT INTO `count_lane_record` VALUES ('51364', '405', '2', '42340');
INSERT INTO `count_lane_record` VALUES ('51365', '405', '3', '42340');
INSERT INTO `count_lane_record` VALUES ('51366', '405', '2', '42341');
INSERT INTO `count_lane_record` VALUES ('51367', '405', '3', '42341');
INSERT INTO `count_lane_record` VALUES ('51368', '404', '2', '42342');
INSERT INTO `count_lane_record` VALUES ('51369', '405', '3', '42342');
INSERT INTO `count_lane_record` VALUES ('51370', '405', '2', '42343');
INSERT INTO `count_lane_record` VALUES ('51371', '405', '3', '42343');
INSERT INTO `count_lane_record` VALUES ('51372', '405', '2', '42344');
INSERT INTO `count_lane_record` VALUES ('51373', '405', '3', '42344');
INSERT INTO `count_lane_record` VALUES ('51374', '404', '2', '42345');
INSERT INTO `count_lane_record` VALUES ('51375', '404', '3', '42345');
INSERT INTO `count_lane_record` VALUES ('51376', '405', '2', '42346');
INSERT INTO `count_lane_record` VALUES ('51377', '405', '3', '42346');
INSERT INTO `count_lane_record` VALUES ('51378', '405', '2', '42347');
INSERT INTO `count_lane_record` VALUES ('51379', '405', '3', '42347');
INSERT INTO `count_lane_record` VALUES ('51380', '405', '2', '42348');
INSERT INTO `count_lane_record` VALUES ('51381', '404', '3', '42348');
INSERT INTO `count_lane_record` VALUES ('51382', '405', '2', '42349');
INSERT INTO `count_lane_record` VALUES ('51383', '405', '3', '42349');
INSERT INTO `count_lane_record` VALUES ('51384', '405', '2', '42350');
INSERT INTO `count_lane_record` VALUES ('51385', '405', '3', '42350');
INSERT INTO `count_lane_record` VALUES ('51386', '405', '2', '42351');
INSERT INTO `count_lane_record` VALUES ('51387', '405', '3', '42351');
INSERT INTO `count_lane_record` VALUES ('51388', '405', '2', '42352');
INSERT INTO `count_lane_record` VALUES ('51389', '405', '3', '42352');
INSERT INTO `count_lane_record` VALUES ('51390', '405', '2', '42353');
INSERT INTO `count_lane_record` VALUES ('51391', '405', '3', '42353');
INSERT INTO `count_lane_record` VALUES ('51392', '404', '2', '42354');
INSERT INTO `count_lane_record` VALUES ('51393', '405', '3', '42354');
INSERT INTO `count_lane_record` VALUES ('51394', '405', '2', '42355');
INSERT INTO `count_lane_record` VALUES ('51395', '405', '3', '42355');
INSERT INTO `count_lane_record` VALUES ('51396', '405', '2', '42356');
INSERT INTO `count_lane_record` VALUES ('51397', '405', '3', '42356');
INSERT INTO `count_lane_record` VALUES ('51398', '405', '2', '42357');
INSERT INTO `count_lane_record` VALUES ('51399', '404', '3', '42357');
INSERT INTO `count_lane_record` VALUES ('51400', '405', '2', '42358');
INSERT INTO `count_lane_record` VALUES ('51401', '405', '3', '42358');
INSERT INTO `count_lane_record` VALUES ('51402', '405', '2', '42359');
INSERT INTO `count_lane_record` VALUES ('51403', '405', '3', '42359');
INSERT INTO `count_lane_record` VALUES ('51404', '405', '2', '42360');
INSERT INTO `count_lane_record` VALUES ('51405', '405', '3', '42360');
INSERT INTO `count_lane_record` VALUES ('51406', '405', '2', '42361');
INSERT INTO `count_lane_record` VALUES ('51407', '405', '3', '42361');
INSERT INTO `count_lane_record` VALUES ('51408', '405', '2', '42362');
INSERT INTO `count_lane_record` VALUES ('51409', '405', '3', '42362');
INSERT INTO `count_lane_record` VALUES ('51410', '405', '2', '42363');
INSERT INTO `count_lane_record` VALUES ('51411', '405', '3', '42363');
INSERT INTO `count_lane_record` VALUES ('51412', '405', '2', '42364');
INSERT INTO `count_lane_record` VALUES ('51413', '405', '3', '42364');
INSERT INTO `count_lane_record` VALUES ('51414', '405', '2', '42365');
INSERT INTO `count_lane_record` VALUES ('51415', '405', '3', '42365');
INSERT INTO `count_lane_record` VALUES ('51416', '405', '2', '42366');
INSERT INTO `count_lane_record` VALUES ('51417', '405', '3', '42366');
INSERT INTO `count_lane_record` VALUES ('51418', '405', '2', '42367');
INSERT INTO `count_lane_record` VALUES ('51419', '405', '3', '42367');
INSERT INTO `count_lane_record` VALUES ('51420', '405', '2', '42368');
INSERT INTO `count_lane_record` VALUES ('51421', '405', '3', '42368');
INSERT INTO `count_lane_record` VALUES ('51422', '405', '2', '42369');
INSERT INTO `count_lane_record` VALUES ('51423', '405', '3', '42369');
INSERT INTO `count_lane_record` VALUES ('51424', '405', '2', '42370');
INSERT INTO `count_lane_record` VALUES ('51425', '405', '3', '42370');
INSERT INTO `count_lane_record` VALUES ('51426', '405', '2', '42371');
INSERT INTO `count_lane_record` VALUES ('51427', '405', '3', '42371');
INSERT INTO `count_lane_record` VALUES ('51428', '405', '2', '42372');
INSERT INTO `count_lane_record` VALUES ('51429', '405', '3', '42372');
INSERT INTO `count_lane_record` VALUES ('51430', '405', '2', '42373');
INSERT INTO `count_lane_record` VALUES ('51431', '405', '3', '42373');
INSERT INTO `count_lane_record` VALUES ('51432', '405', '2', '42374');
INSERT INTO `count_lane_record` VALUES ('51433', '405', '3', '42374');
INSERT INTO `count_lane_record` VALUES ('51434', '405', '2', '42375');
INSERT INTO `count_lane_record` VALUES ('51435', '405', '3', '42375');
INSERT INTO `count_lane_record` VALUES ('51436', '405', '2', '42376');
INSERT INTO `count_lane_record` VALUES ('51437', '405', '3', '42376');
INSERT INTO `count_lane_record` VALUES ('51438', '405', '2', '42377');
INSERT INTO `count_lane_record` VALUES ('51439', '405', '3', '42377');
INSERT INTO `count_lane_record` VALUES ('51440', '405', '2', '42378');
INSERT INTO `count_lane_record` VALUES ('51441', '405', '3', '42378');
INSERT INTO `count_lane_record` VALUES ('51442', '405', '2', '42379');
INSERT INTO `count_lane_record` VALUES ('51443', '405', '3', '42379');
INSERT INTO `count_lane_record` VALUES ('51444', '405', '2', '42380');
INSERT INTO `count_lane_record` VALUES ('51445', '405', '3', '42380');
INSERT INTO `count_lane_record` VALUES ('51446', '405', '2', '42381');
INSERT INTO `count_lane_record` VALUES ('51447', '405', '3', '42381');
INSERT INTO `count_lane_record` VALUES ('51448', '405', '2', '42382');
INSERT INTO `count_lane_record` VALUES ('51449', '405', '3', '42382');
INSERT INTO `count_lane_record` VALUES ('51450', '405', '2', '42383');
INSERT INTO `count_lane_record` VALUES ('51451', '405', '3', '42383');
INSERT INTO `count_lane_record` VALUES ('51452', '405', '2', '42384');
INSERT INTO `count_lane_record` VALUES ('51453', '405', '3', '42384');
INSERT INTO `count_lane_record` VALUES ('51454', '405', '2', '42385');
INSERT INTO `count_lane_record` VALUES ('51455', '405', '3', '42385');
INSERT INTO `count_lane_record` VALUES ('51456', '405', '2', '42386');
INSERT INTO `count_lane_record` VALUES ('51457', '405', '3', '42386');
INSERT INTO `count_lane_record` VALUES ('51458', '405', '2', '42387');
INSERT INTO `count_lane_record` VALUES ('51459', '405', '3', '42387');
INSERT INTO `count_lane_record` VALUES ('51460', '405', '2', '42388');
INSERT INTO `count_lane_record` VALUES ('51461', '405', '3', '42388');
INSERT INTO `count_lane_record` VALUES ('51462', '405', '2', '42389');
INSERT INTO `count_lane_record` VALUES ('51463', '405', '3', '42389');
INSERT INTO `count_lane_record` VALUES ('51464', '405', '2', '42390');
INSERT INTO `count_lane_record` VALUES ('51465', '405', '3', '42390');
INSERT INTO `count_lane_record` VALUES ('51466', '405', '2', '42391');
INSERT INTO `count_lane_record` VALUES ('51467', '405', '3', '42391');
INSERT INTO `count_lane_record` VALUES ('51468', '405', '2', '42392');
INSERT INTO `count_lane_record` VALUES ('51469', '405', '3', '42392');
INSERT INTO `count_lane_record` VALUES ('51470', '405', '2', '42393');
INSERT INTO `count_lane_record` VALUES ('51471', '405', '3', '42393');
INSERT INTO `count_lane_record` VALUES ('51472', '405', '2', '42394');
INSERT INTO `count_lane_record` VALUES ('51473', '405', '3', '42394');
INSERT INTO `count_lane_record` VALUES ('51474', '405', '2', '42395');
INSERT INTO `count_lane_record` VALUES ('51475', '405', '3', '42395');
INSERT INTO `count_lane_record` VALUES ('51476', '405', '2', '42396');
INSERT INTO `count_lane_record` VALUES ('51477', '405', '3', '42396');
INSERT INTO `count_lane_record` VALUES ('51478', '405', '2', '42397');
INSERT INTO `count_lane_record` VALUES ('51479', '405', '3', '42397');
INSERT INTO `count_lane_record` VALUES ('51480', '405', '2', '42398');
INSERT INTO `count_lane_record` VALUES ('51481', '405', '3', '42398');
INSERT INTO `count_lane_record` VALUES ('51482', '405', '2', '42399');
INSERT INTO `count_lane_record` VALUES ('51483', '405', '3', '42399');
INSERT INTO `count_lane_record` VALUES ('51484', '405', '2', '42400');
INSERT INTO `count_lane_record` VALUES ('51485', '405', '3', '42400');
INSERT INTO `count_lane_record` VALUES ('51486', '405', '2', '42401');
INSERT INTO `count_lane_record` VALUES ('51487', '405', '3', '42401');
INSERT INTO `count_lane_record` VALUES ('51488', '405', '2', '42402');
INSERT INTO `count_lane_record` VALUES ('51489', '405', '3', '42402');
INSERT INTO `count_lane_record` VALUES ('51490', '405', '2', '42403');
INSERT INTO `count_lane_record` VALUES ('51491', '405', '3', '42403');
INSERT INTO `count_lane_record` VALUES ('51492', '405', '2', '42404');
INSERT INTO `count_lane_record` VALUES ('51493', '405', '3', '42404');
INSERT INTO `count_lane_record` VALUES ('51494', '405', '2', '42405');
INSERT INTO `count_lane_record` VALUES ('51495', '405', '3', '42405');
INSERT INTO `count_lane_record` VALUES ('51496', '405', '2', '42406');
INSERT INTO `count_lane_record` VALUES ('51497', '405', '3', '42406');
INSERT INTO `count_lane_record` VALUES ('51498', '405', '2', '42407');
INSERT INTO `count_lane_record` VALUES ('51499', '405', '3', '42407');
INSERT INTO `count_lane_record` VALUES ('51500', '405', '2', '42408');
INSERT INTO `count_lane_record` VALUES ('51501', '405', '3', '42408');
INSERT INTO `count_lane_record` VALUES ('51502', '405', '2', '42409');
INSERT INTO `count_lane_record` VALUES ('51503', '405', '3', '42409');
INSERT INTO `count_lane_record` VALUES ('51504', '405', '2', '42410');
INSERT INTO `count_lane_record` VALUES ('51505', '405', '3', '42410');
INSERT INTO `count_lane_record` VALUES ('51506', '405', '2', '42411');
INSERT INTO `count_lane_record` VALUES ('51507', '405', '3', '42411');
INSERT INTO `count_lane_record` VALUES ('51508', '405', '2', '42412');
INSERT INTO `count_lane_record` VALUES ('51509', '405', '3', '42412');
INSERT INTO `count_lane_record` VALUES ('51510', '405', '2', '42413');
INSERT INTO `count_lane_record` VALUES ('51511', '405', '3', '42413');
INSERT INTO `count_lane_record` VALUES ('51512', '405', '2', '42414');
INSERT INTO `count_lane_record` VALUES ('51513', '405', '3', '42414');
INSERT INTO `count_lane_record` VALUES ('51514', '405', '2', '42415');
INSERT INTO `count_lane_record` VALUES ('51515', '405', '3', '42415');
INSERT INTO `count_lane_record` VALUES ('51516', '405', '2', '42416');
INSERT INTO `count_lane_record` VALUES ('51517', '405', '3', '42416');
INSERT INTO `count_lane_record` VALUES ('51518', '405', '2', '42417');
INSERT INTO `count_lane_record` VALUES ('51519', '405', '3', '42417');
INSERT INTO `count_lane_record` VALUES ('51520', '405', '2', '42418');
INSERT INTO `count_lane_record` VALUES ('51521', '405', '3', '42418');
INSERT INTO `count_lane_record` VALUES ('51522', '405', '2', '42419');
INSERT INTO `count_lane_record` VALUES ('51523', '405', '3', '42419');
INSERT INTO `count_lane_record` VALUES ('51524', '405', '2', '42420');
INSERT INTO `count_lane_record` VALUES ('51525', '405', '3', '42420');
INSERT INTO `count_lane_record` VALUES ('51526', '405', '2', '42421');
INSERT INTO `count_lane_record` VALUES ('51527', '405', '3', '42421');
INSERT INTO `count_lane_record` VALUES ('51528', '405', '2', '42422');
INSERT INTO `count_lane_record` VALUES ('51529', '405', '3', '42422');
INSERT INTO `count_lane_record` VALUES ('51530', '405', '2', '42423');
INSERT INTO `count_lane_record` VALUES ('51531', '405', '3', '42423');
INSERT INTO `count_lane_record` VALUES ('51532', '405', '2', '42424');
INSERT INTO `count_lane_record` VALUES ('51533', '405', '3', '42424');
INSERT INTO `count_lane_record` VALUES ('51534', '405', '2', '42425');
INSERT INTO `count_lane_record` VALUES ('51535', '405', '3', '42425');
INSERT INTO `count_lane_record` VALUES ('51536', '405', '2', '42426');
INSERT INTO `count_lane_record` VALUES ('51537', '405', '3', '42426');
INSERT INTO `count_lane_record` VALUES ('51538', '405', '2', '42427');
INSERT INTO `count_lane_record` VALUES ('51539', '405', '3', '42427');
INSERT INTO `count_lane_record` VALUES ('51540', '405', '2', '42428');
INSERT INTO `count_lane_record` VALUES ('51541', '405', '3', '42428');
INSERT INTO `count_lane_record` VALUES ('51542', '405', '2', '42429');
INSERT INTO `count_lane_record` VALUES ('51543', '405', '3', '42429');
INSERT INTO `count_lane_record` VALUES ('51544', '405', '2', '42430');
INSERT INTO `count_lane_record` VALUES ('51545', '405', '3', '42430');
INSERT INTO `count_lane_record` VALUES ('51546', '405', '2', '42431');
INSERT INTO `count_lane_record` VALUES ('51547', '405', '3', '42431');
INSERT INTO `count_lane_record` VALUES ('51548', '405', '2', '42432');
INSERT INTO `count_lane_record` VALUES ('51549', '405', '3', '42432');
INSERT INTO `count_lane_record` VALUES ('51550', '405', '2', '42433');
INSERT INTO `count_lane_record` VALUES ('51551', '405', '3', '42433');
INSERT INTO `count_lane_record` VALUES ('51552', '405', '2', '42434');
INSERT INTO `count_lane_record` VALUES ('51553', '405', '3', '42434');
INSERT INTO `count_lane_record` VALUES ('51554', '405', '2', '42435');
INSERT INTO `count_lane_record` VALUES ('51555', '405', '3', '42435');
INSERT INTO `count_lane_record` VALUES ('51556', '405', '2', '42436');
INSERT INTO `count_lane_record` VALUES ('51557', '405', '3', '42436');
INSERT INTO `count_lane_record` VALUES ('51558', '405', '2', '42437');
INSERT INTO `count_lane_record` VALUES ('51559', '405', '3', '42437');
INSERT INTO `count_lane_record` VALUES ('51560', '405', '2', '42438');
INSERT INTO `count_lane_record` VALUES ('51561', '405', '3', '42438');
INSERT INTO `count_lane_record` VALUES ('51562', '405', '2', '42439');
INSERT INTO `count_lane_record` VALUES ('51563', '405', '3', '42439');
INSERT INTO `count_lane_record` VALUES ('51564', '405', '2', '42440');
INSERT INTO `count_lane_record` VALUES ('51565', '405', '3', '42440');
INSERT INTO `count_lane_record` VALUES ('51566', '405', '2', '42441');
INSERT INTO `count_lane_record` VALUES ('51567', '405', '3', '42441');
INSERT INTO `count_lane_record` VALUES ('51568', '405', '2', '42442');
INSERT INTO `count_lane_record` VALUES ('51569', '405', '3', '42442');
INSERT INTO `count_lane_record` VALUES ('51570', '405', '2', '42443');
INSERT INTO `count_lane_record` VALUES ('51571', '405', '3', '42443');
INSERT INTO `count_lane_record` VALUES ('51572', '405', '2', '42444');
INSERT INTO `count_lane_record` VALUES ('51573', '405', '3', '42444');
INSERT INTO `count_lane_record` VALUES ('51574', '405', '2', '42445');
INSERT INTO `count_lane_record` VALUES ('51575', '405', '3', '42445');
INSERT INTO `count_lane_record` VALUES ('51576', '405', '2', '42446');
INSERT INTO `count_lane_record` VALUES ('51577', '405', '3', '42446');
INSERT INTO `count_lane_record` VALUES ('51578', '405', '2', '42447');
INSERT INTO `count_lane_record` VALUES ('51579', '405', '3', '42447');
INSERT INTO `count_lane_record` VALUES ('51580', '405', '2', '42448');
INSERT INTO `count_lane_record` VALUES ('51581', '405', '3', '42448');
INSERT INTO `count_lane_record` VALUES ('51582', '405', '2', '42449');
INSERT INTO `count_lane_record` VALUES ('51583', '405', '3', '42449');
INSERT INTO `count_lane_record` VALUES ('51584', '405', '2', '42450');
INSERT INTO `count_lane_record` VALUES ('51585', '405', '3', '42450');
INSERT INTO `count_lane_record` VALUES ('51586', '405', '2', '42451');
INSERT INTO `count_lane_record` VALUES ('51587', '405', '3', '42451');
INSERT INTO `count_lane_record` VALUES ('51588', '405', '2', '42452');
INSERT INTO `count_lane_record` VALUES ('51589', '405', '3', '42452');
INSERT INTO `count_lane_record` VALUES ('51590', '405', '2', '42453');
INSERT INTO `count_lane_record` VALUES ('51591', '405', '3', '42453');
INSERT INTO `count_lane_record` VALUES ('51592', '405', '2', '42454');
INSERT INTO `count_lane_record` VALUES ('51593', '405', '3', '42454');
INSERT INTO `count_lane_record` VALUES ('51594', '405', '2', '42455');
INSERT INTO `count_lane_record` VALUES ('51595', '405', '3', '42455');
INSERT INTO `count_lane_record` VALUES ('51596', '405', '2', '42456');
INSERT INTO `count_lane_record` VALUES ('51597', '405', '3', '42456');
INSERT INTO `count_lane_record` VALUES ('51598', '405', '2', '42457');
INSERT INTO `count_lane_record` VALUES ('51599', '405', '3', '42457');
INSERT INTO `count_lane_record` VALUES ('51600', '405', '2', '42458');
INSERT INTO `count_lane_record` VALUES ('51601', '405', '3', '42458');
INSERT INTO `count_lane_record` VALUES ('51602', '405', '2', '42459');
INSERT INTO `count_lane_record` VALUES ('51603', '405', '3', '42459');
INSERT INTO `count_lane_record` VALUES ('51604', '405', '2', '42460');
INSERT INTO `count_lane_record` VALUES ('51605', '405', '3', '42460');
INSERT INTO `count_lane_record` VALUES ('51606', '405', '2', '42461');
INSERT INTO `count_lane_record` VALUES ('51607', '405', '3', '42461');
INSERT INTO `count_lane_record` VALUES ('51608', '405', '2', '42462');
INSERT INTO `count_lane_record` VALUES ('51609', '405', '3', '42462');
INSERT INTO `count_lane_record` VALUES ('51610', '405', '2', '42463');
INSERT INTO `count_lane_record` VALUES ('51611', '405', '3', '42463');
INSERT INTO `count_lane_record` VALUES ('51612', '405', '2', '42464');
INSERT INTO `count_lane_record` VALUES ('51613', '405', '3', '42464');
INSERT INTO `count_lane_record` VALUES ('51614', '405', '2', '42465');
INSERT INTO `count_lane_record` VALUES ('51615', '405', '3', '42465');
INSERT INTO `count_lane_record` VALUES ('51616', '405', '2', '42466');
INSERT INTO `count_lane_record` VALUES ('51617', '405', '3', '42466');
INSERT INTO `count_lane_record` VALUES ('51618', '405', '2', '42467');
INSERT INTO `count_lane_record` VALUES ('51619', '405', '3', '42467');
INSERT INTO `count_lane_record` VALUES ('51620', '405', '2', '42468');
INSERT INTO `count_lane_record` VALUES ('51621', '405', '3', '42468');
INSERT INTO `count_lane_record` VALUES ('51622', '405', '2', '42469');
INSERT INTO `count_lane_record` VALUES ('51623', '405', '3', '42469');
INSERT INTO `count_lane_record` VALUES ('51624', '405', '2', '42470');
INSERT INTO `count_lane_record` VALUES ('51625', '405', '3', '42470');
INSERT INTO `count_lane_record` VALUES ('51626', '405', '2', '42471');
INSERT INTO `count_lane_record` VALUES ('51627', '405', '3', '42471');
INSERT INTO `count_lane_record` VALUES ('51628', '405', '2', '42472');
INSERT INTO `count_lane_record` VALUES ('51629', '405', '3', '42472');
INSERT INTO `count_lane_record` VALUES ('51630', '405', '2', '42473');
INSERT INTO `count_lane_record` VALUES ('51631', '405', '3', '42473');
INSERT INTO `count_lane_record` VALUES ('51632', '405', '2', '42474');
INSERT INTO `count_lane_record` VALUES ('51633', '405', '3', '42474');
INSERT INTO `count_lane_record` VALUES ('51634', '405', '2', '42475');
INSERT INTO `count_lane_record` VALUES ('51635', '405', '3', '42475');
INSERT INTO `count_lane_record` VALUES ('51636', '405', '2', '42476');
INSERT INTO `count_lane_record` VALUES ('51637', '405', '3', '42476');
INSERT INTO `count_lane_record` VALUES ('51638', '405', '2', '42477');
INSERT INTO `count_lane_record` VALUES ('51639', '405', '3', '42477');
INSERT INTO `count_lane_record` VALUES ('51640', '404', '2', '42478');
INSERT INTO `count_lane_record` VALUES ('51641', '405', '3', '42478');
INSERT INTO `count_lane_record` VALUES ('51642', '405', '2', '42479');
INSERT INTO `count_lane_record` VALUES ('51643', '405', '3', '42479');
INSERT INTO `count_lane_record` VALUES ('51644', '405', '2', '42480');
INSERT INTO `count_lane_record` VALUES ('51645', '405', '3', '42480');
INSERT INTO `count_lane_record` VALUES ('51646', '405', '2', '42481');
INSERT INTO `count_lane_record` VALUES ('51647', '404', '3', '42481');
INSERT INTO `count_lane_record` VALUES ('51648', '404', '2', '42482');
INSERT INTO `count_lane_record` VALUES ('51649', '405', '3', '42482');
INSERT INTO `count_lane_record` VALUES ('51650', '405', '2', '42483');
INSERT INTO `count_lane_record` VALUES ('51651', '405', '3', '42483');
INSERT INTO `count_lane_record` VALUES ('51652', '405', '2', '42484');
INSERT INTO `count_lane_record` VALUES ('51653', '405', '3', '42484');
INSERT INTO `count_lane_record` VALUES ('51654', '405', '2', '42485');
INSERT INTO `count_lane_record` VALUES ('51655', '404', '3', '42485');
INSERT INTO `count_lane_record` VALUES ('51656', '405', '2', '42486');
INSERT INTO `count_lane_record` VALUES ('51657', '405', '3', '42486');
INSERT INTO `count_lane_record` VALUES ('51658', '405', '2', '42487');
INSERT INTO `count_lane_record` VALUES ('51659', '405', '3', '42487');
INSERT INTO `count_lane_record` VALUES ('51660', '405', '2', '42488');
INSERT INTO `count_lane_record` VALUES ('51661', '405', '3', '42488');
INSERT INTO `count_lane_record` VALUES ('51662', '405', '2', '42489');
INSERT INTO `count_lane_record` VALUES ('51663', '405', '3', '42489');
INSERT INTO `count_lane_record` VALUES ('51664', '405', '2', '42490');
INSERT INTO `count_lane_record` VALUES ('51665', '405', '3', '42490');
INSERT INTO `count_lane_record` VALUES ('51666', '405', '2', '42491');
INSERT INTO `count_lane_record` VALUES ('51667', '405', '3', '42491');
INSERT INTO `count_lane_record` VALUES ('51668', '405', '2', '42492');
INSERT INTO `count_lane_record` VALUES ('51669', '405', '3', '42492');
INSERT INTO `count_lane_record` VALUES ('51670', '405', '2', '42493');
INSERT INTO `count_lane_record` VALUES ('51671', '405', '3', '42493');
INSERT INTO `count_lane_record` VALUES ('51672', '405', '2', '42494');
INSERT INTO `count_lane_record` VALUES ('51673', '405', '3', '42494');
INSERT INTO `count_lane_record` VALUES ('51674', '405', '2', '42495');
INSERT INTO `count_lane_record` VALUES ('51675', '405', '3', '42495');
INSERT INTO `count_lane_record` VALUES ('51676', '405', '2', '42496');
INSERT INTO `count_lane_record` VALUES ('51677', '405', '3', '42496');
INSERT INTO `count_lane_record` VALUES ('51678', '405', '2', '42497');
INSERT INTO `count_lane_record` VALUES ('51679', '405', '3', '42497');
INSERT INTO `count_lane_record` VALUES ('51680', '405', '2', '42498');
INSERT INTO `count_lane_record` VALUES ('51681', '405', '3', '42498');
INSERT INTO `count_lane_record` VALUES ('51682', '405', '2', '42499');
INSERT INTO `count_lane_record` VALUES ('51683', '405', '3', '42499');
INSERT INTO `count_lane_record` VALUES ('51684', '404', '2', '42500');
INSERT INTO `count_lane_record` VALUES ('51685', '405', '3', '42500');
INSERT INTO `count_lane_record` VALUES ('51686', '405', '2', '42501');
INSERT INTO `count_lane_record` VALUES ('51687', '405', '3', '42501');
INSERT INTO `count_lane_record` VALUES ('51688', '405', '2', '42502');
INSERT INTO `count_lane_record` VALUES ('51689', '405', '3', '42502');
INSERT INTO `count_lane_record` VALUES ('51690', '404', '2', '42503');
INSERT INTO `count_lane_record` VALUES ('51691', '404', '3', '42503');
INSERT INTO `count_lane_record` VALUES ('51692', '405', '2', '42504');
INSERT INTO `count_lane_record` VALUES ('51693', '405', '3', '42504');
INSERT INTO `count_lane_record` VALUES ('51694', '405', '2', '42505');
INSERT INTO `count_lane_record` VALUES ('51695', '405', '3', '42505');
INSERT INTO `count_lane_record` VALUES ('51696', '405', '2', '42506');
INSERT INTO `count_lane_record` VALUES ('51697', '404', '3', '42506');
INSERT INTO `count_lane_record` VALUES ('51698', '405', '2', '42507');
INSERT INTO `count_lane_record` VALUES ('51699', '405', '3', '42507');
INSERT INTO `count_lane_record` VALUES ('51700', '405', '2', '42508');
INSERT INTO `count_lane_record` VALUES ('51701', '405', '3', '42508');
INSERT INTO `count_lane_record` VALUES ('51702', '405', '2', '42509');
INSERT INTO `count_lane_record` VALUES ('51703', '405', '3', '42509');
INSERT INTO `count_lane_record` VALUES ('51704', '405', '2', '42510');
INSERT INTO `count_lane_record` VALUES ('51705', '405', '3', '42510');
INSERT INTO `count_lane_record` VALUES ('51706', '404', '2', '42511');
INSERT INTO `count_lane_record` VALUES ('51707', '405', '3', '42511');
INSERT INTO `count_lane_record` VALUES ('51708', '405', '2', '42512');
INSERT INTO `count_lane_record` VALUES ('51709', '405', '3', '42512');
INSERT INTO `count_lane_record` VALUES ('51710', '405', '2', '42513');
INSERT INTO `count_lane_record` VALUES ('51711', '404', '3', '42513');
INSERT INTO `count_lane_record` VALUES ('51712', '405', '2', '42514');
INSERT INTO `count_lane_record` VALUES ('51713', '405', '3', '42514');
INSERT INTO `count_lane_record` VALUES ('51714', '405', '2', '42515');
INSERT INTO `count_lane_record` VALUES ('51715', '405', '3', '42515');
INSERT INTO `count_lane_record` VALUES ('51716', '405', '2', '42516');
INSERT INTO `count_lane_record` VALUES ('51717', '405', '3', '42516');
INSERT INTO `count_lane_record` VALUES ('51718', '405', '2', '42517');
INSERT INTO `count_lane_record` VALUES ('51719', '405', '3', '42517');
INSERT INTO `count_lane_record` VALUES ('51720', '405', '2', '42518');
INSERT INTO `count_lane_record` VALUES ('51721', '405', '3', '42518');
INSERT INTO `count_lane_record` VALUES ('51722', '405', '2', '42519');
INSERT INTO `count_lane_record` VALUES ('51723', '405', '3', '42519');
INSERT INTO `count_lane_record` VALUES ('51724', '405', '2', '42520');
INSERT INTO `count_lane_record` VALUES ('51725', '405', '3', '42520');
INSERT INTO `count_lane_record` VALUES ('51726', '405', '2', '42521');
INSERT INTO `count_lane_record` VALUES ('51727', '405', '3', '42521');
INSERT INTO `count_lane_record` VALUES ('51728', '405', '2', '42522');
INSERT INTO `count_lane_record` VALUES ('51729', '405', '3', '42522');
INSERT INTO `count_lane_record` VALUES ('51730', '405', '2', '42523');
INSERT INTO `count_lane_record` VALUES ('51731', '405', '3', '42523');
INSERT INTO `count_lane_record` VALUES ('51732', '405', '2', '42524');
INSERT INTO `count_lane_record` VALUES ('51733', '405', '3', '42524');
INSERT INTO `count_lane_record` VALUES ('51734', '405', '2', '42525');
INSERT INTO `count_lane_record` VALUES ('51735', '405', '3', '42525');
INSERT INTO `count_lane_record` VALUES ('51736', '405', '2', '42526');
INSERT INTO `count_lane_record` VALUES ('51737', '405', '3', '42526');
INSERT INTO `count_lane_record` VALUES ('51738', '405', '2', '42527');
INSERT INTO `count_lane_record` VALUES ('51739', '405', '3', '42527');
INSERT INTO `count_lane_record` VALUES ('51740', '405', '2', '42528');
INSERT INTO `count_lane_record` VALUES ('51741', '405', '3', '42528');
INSERT INTO `count_lane_record` VALUES ('51742', '405', '2', '42529');
INSERT INTO `count_lane_record` VALUES ('51743', '405', '3', '42529');
INSERT INTO `count_lane_record` VALUES ('51744', '405', '2', '42530');
INSERT INTO `count_lane_record` VALUES ('51745', '405', '3', '42530');
INSERT INTO `count_lane_record` VALUES ('51746', '405', '2', '42531');
INSERT INTO `count_lane_record` VALUES ('51747', '405', '3', '42531');
INSERT INTO `count_lane_record` VALUES ('51748', '405', '2', '42532');
INSERT INTO `count_lane_record` VALUES ('51749', '405', '3', '42532');
INSERT INTO `count_lane_record` VALUES ('51750', '405', '2', '42533');
INSERT INTO `count_lane_record` VALUES ('51751', '405', '3', '42533');
INSERT INTO `count_lane_record` VALUES ('51752', '405', '2', '42534');
INSERT INTO `count_lane_record` VALUES ('51753', '405', '3', '42534');
INSERT INTO `count_lane_record` VALUES ('51754', '405', '2', '42535');
INSERT INTO `count_lane_record` VALUES ('51755', '405', '3', '42535');
INSERT INTO `count_lane_record` VALUES ('51756', '405', '2', '42536');
INSERT INTO `count_lane_record` VALUES ('51757', '405', '3', '42536');
INSERT INTO `count_lane_record` VALUES ('51758', '405', '2', '42537');
INSERT INTO `count_lane_record` VALUES ('51759', '405', '3', '42537');
INSERT INTO `count_lane_record` VALUES ('51760', '405', '2', '42538');
INSERT INTO `count_lane_record` VALUES ('51761', '405', '3', '42538');
INSERT INTO `count_lane_record` VALUES ('51762', '405', '2', '42539');
INSERT INTO `count_lane_record` VALUES ('51763', '405', '3', '42539');
INSERT INTO `count_lane_record` VALUES ('51764', '405', '2', '42540');
INSERT INTO `count_lane_record` VALUES ('51765', '405', '3', '42540');
INSERT INTO `count_lane_record` VALUES ('51766', '405', '2', '42541');
INSERT INTO `count_lane_record` VALUES ('51767', '405', '3', '42541');
INSERT INTO `count_lane_record` VALUES ('51768', '405', '2', '42542');
INSERT INTO `count_lane_record` VALUES ('51769', '405', '3', '42542');
INSERT INTO `count_lane_record` VALUES ('51770', '405', '2', '42543');
INSERT INTO `count_lane_record` VALUES ('51771', '405', '3', '42543');
INSERT INTO `count_lane_record` VALUES ('51772', '405', '2', '42544');
INSERT INTO `count_lane_record` VALUES ('51773', '405', '3', '42544');
INSERT INTO `count_lane_record` VALUES ('51774', '405', '2', '42545');
INSERT INTO `count_lane_record` VALUES ('51775', '405', '3', '42545');
INSERT INTO `count_lane_record` VALUES ('51776', '405', '2', '42546');
INSERT INTO `count_lane_record` VALUES ('51777', '405', '3', '42546');
INSERT INTO `count_lane_record` VALUES ('51778', '405', '2', '42547');
INSERT INTO `count_lane_record` VALUES ('51779', '405', '3', '42547');
INSERT INTO `count_lane_record` VALUES ('51780', '405', '2', '42548');
INSERT INTO `count_lane_record` VALUES ('51781', '405', '3', '42548');
INSERT INTO `count_lane_record` VALUES ('51782', '405', '2', '42549');
INSERT INTO `count_lane_record` VALUES ('51783', '405', '3', '42549');
INSERT INTO `count_lane_record` VALUES ('51784', '405', '2', '42550');
INSERT INTO `count_lane_record` VALUES ('51785', '405', '3', '42550');
INSERT INTO `count_lane_record` VALUES ('51786', '405', '2', '42551');
INSERT INTO `count_lane_record` VALUES ('51787', '405', '3', '42551');
INSERT INTO `count_lane_record` VALUES ('51788', '405', '2', '42552');
INSERT INTO `count_lane_record` VALUES ('51789', '405', '3', '42552');
INSERT INTO `count_lane_record` VALUES ('51790', '405', '2', '42553');
INSERT INTO `count_lane_record` VALUES ('51791', '405', '3', '42553');
INSERT INTO `count_lane_record` VALUES ('51792', '405', '2', '42554');
INSERT INTO `count_lane_record` VALUES ('51793', '405', '3', '42554');
INSERT INTO `count_lane_record` VALUES ('51794', '405', '2', '42555');
INSERT INTO `count_lane_record` VALUES ('51795', '405', '3', '42555');
INSERT INTO `count_lane_record` VALUES ('51796', '405', '2', '42556');
INSERT INTO `count_lane_record` VALUES ('51797', '405', '3', '42556');
INSERT INTO `count_lane_record` VALUES ('51798', '405', '2', '42557');
INSERT INTO `count_lane_record` VALUES ('51799', '405', '3', '42557');
INSERT INTO `count_lane_record` VALUES ('51800', '405', '2', '42558');
INSERT INTO `count_lane_record` VALUES ('51801', '405', '3', '42558');
INSERT INTO `count_lane_record` VALUES ('51802', '405', '2', '42559');
INSERT INTO `count_lane_record` VALUES ('51803', '405', '3', '42559');
INSERT INTO `count_lane_record` VALUES ('51804', '405', '2', '42560');
INSERT INTO `count_lane_record` VALUES ('51805', '405', '3', '42560');
INSERT INTO `count_lane_record` VALUES ('51806', '405', '2', '42561');
INSERT INTO `count_lane_record` VALUES ('51807', '405', '3', '42561');
INSERT INTO `count_lane_record` VALUES ('51808', '405', '2', '42562');
INSERT INTO `count_lane_record` VALUES ('51809', '405', '3', '42562');
INSERT INTO `count_lane_record` VALUES ('51810', '405', '2', '42563');
INSERT INTO `count_lane_record` VALUES ('51811', '405', '3', '42563');
INSERT INTO `count_lane_record` VALUES ('51812', '405', '2', '42564');
INSERT INTO `count_lane_record` VALUES ('51813', '405', '3', '42564');
INSERT INTO `count_lane_record` VALUES ('51814', '405', '2', '42565');
INSERT INTO `count_lane_record` VALUES ('51815', '405', '3', '42565');
INSERT INTO `count_lane_record` VALUES ('51816', '405', '2', '42566');
INSERT INTO `count_lane_record` VALUES ('51817', '405', '3', '42566');
INSERT INTO `count_lane_record` VALUES ('51818', '405', '2', '42567');
INSERT INTO `count_lane_record` VALUES ('51819', '405', '3', '42567');
INSERT INTO `count_lane_record` VALUES ('51820', '405', '2', '42568');
INSERT INTO `count_lane_record` VALUES ('51821', '405', '3', '42568');
INSERT INTO `count_lane_record` VALUES ('51822', '405', '2', '42569');
INSERT INTO `count_lane_record` VALUES ('51823', '405', '3', '42569');
INSERT INTO `count_lane_record` VALUES ('51824', '405', '2', '42570');
INSERT INTO `count_lane_record` VALUES ('51825', '405', '3', '42570');
INSERT INTO `count_lane_record` VALUES ('51826', '405', '2', '42571');
INSERT INTO `count_lane_record` VALUES ('51827', '405', '3', '42571');
INSERT INTO `count_lane_record` VALUES ('51828', '405', '2', '42572');
INSERT INTO `count_lane_record` VALUES ('51829', '405', '3', '42572');
INSERT INTO `count_lane_record` VALUES ('51830', '405', '2', '42573');
INSERT INTO `count_lane_record` VALUES ('51831', '405', '3', '42573');
INSERT INTO `count_lane_record` VALUES ('51832', '405', '2', '42574');
INSERT INTO `count_lane_record` VALUES ('51833', '405', '3', '42574');
INSERT INTO `count_lane_record` VALUES ('51834', '405', '2', '42575');
INSERT INTO `count_lane_record` VALUES ('51835', '405', '3', '42575');
INSERT INTO `count_lane_record` VALUES ('51836', '405', '2', '42576');
INSERT INTO `count_lane_record` VALUES ('51837', '405', '3', '42576');
INSERT INTO `count_lane_record` VALUES ('51838', '405', '2', '42577');
INSERT INTO `count_lane_record` VALUES ('51839', '405', '3', '42577');
INSERT INTO `count_lane_record` VALUES ('51840', '405', '2', '42578');
INSERT INTO `count_lane_record` VALUES ('51841', '405', '3', '42578');
INSERT INTO `count_lane_record` VALUES ('51842', '405', '2', '42579');
INSERT INTO `count_lane_record` VALUES ('51843', '405', '3', '42579');
INSERT INTO `count_lane_record` VALUES ('51844', '405', '2', '42580');
INSERT INTO `count_lane_record` VALUES ('51845', '405', '3', '42580');
INSERT INTO `count_lane_record` VALUES ('51846', '405', '2', '42581');
INSERT INTO `count_lane_record` VALUES ('51847', '405', '3', '42581');
INSERT INTO `count_lane_record` VALUES ('51848', '405', '2', '42582');
INSERT INTO `count_lane_record` VALUES ('51849', '405', '3', '42582');
INSERT INTO `count_lane_record` VALUES ('51850', '405', '2', '42583');
INSERT INTO `count_lane_record` VALUES ('51851', '405', '3', '42583');
INSERT INTO `count_lane_record` VALUES ('51852', '405', '2', '42584');
INSERT INTO `count_lane_record` VALUES ('51853', '405', '3', '42584');
INSERT INTO `count_lane_record` VALUES ('51854', '405', '2', '42585');
INSERT INTO `count_lane_record` VALUES ('51855', '405', '3', '42585');
INSERT INTO `count_lane_record` VALUES ('51856', '405', '2', '42586');
INSERT INTO `count_lane_record` VALUES ('51857', '405', '3', '42586');
INSERT INTO `count_lane_record` VALUES ('51858', '405', '2', '42587');
INSERT INTO `count_lane_record` VALUES ('51859', '405', '3', '42587');
INSERT INTO `count_lane_record` VALUES ('51860', '405', '2', '42588');
INSERT INTO `count_lane_record` VALUES ('51861', '405', '3', '42588');
INSERT INTO `count_lane_record` VALUES ('51862', '405', '2', '42589');
INSERT INTO `count_lane_record` VALUES ('51863', '405', '3', '42589');
INSERT INTO `count_lane_record` VALUES ('51864', '405', '2', '42590');
INSERT INTO `count_lane_record` VALUES ('51865', '405', '3', '42590');
INSERT INTO `count_lane_record` VALUES ('51866', '405', '2', '42591');
INSERT INTO `count_lane_record` VALUES ('51867', '405', '3', '42591');
INSERT INTO `count_lane_record` VALUES ('51868', '405', '2', '42592');
INSERT INTO `count_lane_record` VALUES ('51869', '405', '3', '42592');
INSERT INTO `count_lane_record` VALUES ('51870', '405', '2', '42593');
INSERT INTO `count_lane_record` VALUES ('51871', '405', '3', '42593');
INSERT INTO `count_lane_record` VALUES ('51872', '405', '2', '42594');
INSERT INTO `count_lane_record` VALUES ('51873', '405', '3', '42594');
INSERT INTO `count_lane_record` VALUES ('51874', '405', '2', '42595');
INSERT INTO `count_lane_record` VALUES ('51875', '405', '3', '42595');
INSERT INTO `count_lane_record` VALUES ('51876', '405', '2', '42596');
INSERT INTO `count_lane_record` VALUES ('51877', '405', '3', '42596');
INSERT INTO `count_lane_record` VALUES ('51878', '405', '2', '42597');
INSERT INTO `count_lane_record` VALUES ('51879', '405', '3', '42597');
INSERT INTO `count_lane_record` VALUES ('51880', '405', '2', '42598');
INSERT INTO `count_lane_record` VALUES ('51881', '405', '3', '42598');
INSERT INTO `count_lane_record` VALUES ('51882', '405', '2', '42599');
INSERT INTO `count_lane_record` VALUES ('51883', '405', '3', '42599');
INSERT INTO `count_lane_record` VALUES ('51884', '405', '2', '42600');
INSERT INTO `count_lane_record` VALUES ('51885', '405', '3', '42600');
INSERT INTO `count_lane_record` VALUES ('51886', '405', '2', '42601');
INSERT INTO `count_lane_record` VALUES ('51887', '405', '3', '42601');
INSERT INTO `count_lane_record` VALUES ('51888', '405', '2', '42602');
INSERT INTO `count_lane_record` VALUES ('51889', '405', '3', '42602');
INSERT INTO `count_lane_record` VALUES ('51890', '405', '2', '42603');
INSERT INTO `count_lane_record` VALUES ('51891', '405', '3', '42603');
INSERT INTO `count_lane_record` VALUES ('51892', '405', '2', '42604');
INSERT INTO `count_lane_record` VALUES ('51893', '405', '3', '42604');
INSERT INTO `count_lane_record` VALUES ('51894', '405', '2', '42605');
INSERT INTO `count_lane_record` VALUES ('51895', '405', '3', '42605');
INSERT INTO `count_lane_record` VALUES ('51896', '405', '2', '42606');
INSERT INTO `count_lane_record` VALUES ('51897', '405', '3', '42606');
INSERT INTO `count_lane_record` VALUES ('51898', '405', '2', '42607');
INSERT INTO `count_lane_record` VALUES ('51899', '405', '3', '42607');
INSERT INTO `count_lane_record` VALUES ('51900', '405', '2', '42608');
INSERT INTO `count_lane_record` VALUES ('51901', '405', '3', '42608');
INSERT INTO `count_lane_record` VALUES ('51902', '405', '2', '42609');
INSERT INTO `count_lane_record` VALUES ('51903', '405', '3', '42609');
INSERT INTO `count_lane_record` VALUES ('51904', '405', '2', '42610');
INSERT INTO `count_lane_record` VALUES ('51905', '405', '3', '42610');
INSERT INTO `count_lane_record` VALUES ('51906', '405', '2', '42611');
INSERT INTO `count_lane_record` VALUES ('51907', '405', '3', '42611');
INSERT INTO `count_lane_record` VALUES ('51908', '405', '2', '42612');
INSERT INTO `count_lane_record` VALUES ('51909', '405', '3', '42612');
INSERT INTO `count_lane_record` VALUES ('51910', '405', '2', '42613');
INSERT INTO `count_lane_record` VALUES ('51911', '405', '3', '42613');
INSERT INTO `count_lane_record` VALUES ('51912', '405', '2', '42614');
INSERT INTO `count_lane_record` VALUES ('51913', '405', '3', '42614');
INSERT INTO `count_lane_record` VALUES ('51914', '405', '2', '42615');
INSERT INTO `count_lane_record` VALUES ('51915', '405', '3', '42615');
INSERT INTO `count_lane_record` VALUES ('51916', '405', '2', '42616');
INSERT INTO `count_lane_record` VALUES ('51917', '405', '3', '42616');
INSERT INTO `count_lane_record` VALUES ('51918', '405', '2', '42617');
INSERT INTO `count_lane_record` VALUES ('51919', '405', '3', '42617');
INSERT INTO `count_lane_record` VALUES ('51920', '405', '2', '42618');
INSERT INTO `count_lane_record` VALUES ('51921', '405', '3', '42618');
INSERT INTO `count_lane_record` VALUES ('51922', '405', '2', '42619');
INSERT INTO `count_lane_record` VALUES ('51923', '405', '3', '42619');
INSERT INTO `count_lane_record` VALUES ('51924', '405', '2', '42620');
INSERT INTO `count_lane_record` VALUES ('51925', '405', '3', '42620');
INSERT INTO `count_lane_record` VALUES ('51926', '405', '2', '42621');
INSERT INTO `count_lane_record` VALUES ('51927', '405', '3', '42621');
INSERT INTO `count_lane_record` VALUES ('51928', '405', '2', '42622');
INSERT INTO `count_lane_record` VALUES ('51929', '405', '3', '42622');
INSERT INTO `count_lane_record` VALUES ('51930', '405', '2', '42623');
INSERT INTO `count_lane_record` VALUES ('51931', '405', '3', '42623');
INSERT INTO `count_lane_record` VALUES ('51932', '405', '2', '42624');
INSERT INTO `count_lane_record` VALUES ('51933', '405', '3', '42624');
INSERT INTO `count_lane_record` VALUES ('51934', '405', '2', '42625');
INSERT INTO `count_lane_record` VALUES ('51935', '405', '3', '42625');
INSERT INTO `count_lane_record` VALUES ('51936', '405', '2', '42626');
INSERT INTO `count_lane_record` VALUES ('51937', '405', '3', '42626');
INSERT INTO `count_lane_record` VALUES ('51938', '405', '2', '42627');
INSERT INTO `count_lane_record` VALUES ('51939', '405', '3', '42627');
INSERT INTO `count_lane_record` VALUES ('51940', '405', '2', '42628');
INSERT INTO `count_lane_record` VALUES ('51941', '405', '3', '42628');
INSERT INTO `count_lane_record` VALUES ('51942', '405', '2', '42629');
INSERT INTO `count_lane_record` VALUES ('51943', '405', '3', '42629');
INSERT INTO `count_lane_record` VALUES ('51944', '405', '2', '42630');
INSERT INTO `count_lane_record` VALUES ('51945', '405', '3', '42630');
INSERT INTO `count_lane_record` VALUES ('51946', '405', '2', '42631');
INSERT INTO `count_lane_record` VALUES ('51947', '405', '3', '42631');
INSERT INTO `count_lane_record` VALUES ('51948', '405', '2', '42632');
INSERT INTO `count_lane_record` VALUES ('51949', '405', '3', '42632');
INSERT INTO `count_lane_record` VALUES ('51950', '404', '2', '42633');
INSERT INTO `count_lane_record` VALUES ('51951', '405', '3', '42633');
INSERT INTO `count_lane_record` VALUES ('51952', '405', '2', '42634');
INSERT INTO `count_lane_record` VALUES ('51953', '405', '3', '42634');
INSERT INTO `count_lane_record` VALUES ('51954', '405', '2', '42635');
INSERT INTO `count_lane_record` VALUES ('51955', '405', '3', '42635');
INSERT INTO `count_lane_record` VALUES ('51956', '404', '2', '42636');
INSERT INTO `count_lane_record` VALUES ('51957', '404', '3', '42636');
INSERT INTO `count_lane_record` VALUES ('51958', '405', '2', '42637');
INSERT INTO `count_lane_record` VALUES ('51959', '405', '3', '42637');
INSERT INTO `count_lane_record` VALUES ('51960', '405', '2', '42638');
INSERT INTO `count_lane_record` VALUES ('51961', '404', '3', '42638');
INSERT INTO `count_lane_record` VALUES ('51962', '405', '2', '42639');
INSERT INTO `count_lane_record` VALUES ('51963', '405', '3', '42639');
INSERT INTO `count_lane_record` VALUES ('51964', '405', '2', '42640');
INSERT INTO `count_lane_record` VALUES ('51965', '405', '3', '42640');
INSERT INTO `count_lane_record` VALUES ('51966', '405', '2', '42641');
INSERT INTO `count_lane_record` VALUES ('51967', '405', '3', '42641');
INSERT INTO `count_lane_record` VALUES ('51968', '405', '2', '42642');
INSERT INTO `count_lane_record` VALUES ('51969', '405', '3', '42642');
INSERT INTO `count_lane_record` VALUES ('51970', '405', '2', '42643');
INSERT INTO `count_lane_record` VALUES ('51971', '405', '3', '42643');
INSERT INTO `count_lane_record` VALUES ('51972', '405', '2', '42644');
INSERT INTO `count_lane_record` VALUES ('51973', '405', '3', '42644');
INSERT INTO `count_lane_record` VALUES ('51974', '405', '2', '42645');
INSERT INTO `count_lane_record` VALUES ('51975', '405', '3', '42645');
INSERT INTO `count_lane_record` VALUES ('51976', '405', '2', '42646');
INSERT INTO `count_lane_record` VALUES ('51977', '405', '3', '42646');
INSERT INTO `count_lane_record` VALUES ('51978', '405', '2', '42647');
INSERT INTO `count_lane_record` VALUES ('51979', '405', '3', '42647');
INSERT INTO `count_lane_record` VALUES ('51980', '405', '2', '42648');
INSERT INTO `count_lane_record` VALUES ('51981', '405', '3', '42648');
INSERT INTO `count_lane_record` VALUES ('51982', '405', '2', '42649');
INSERT INTO `count_lane_record` VALUES ('51983', '405', '3', '42649');
INSERT INTO `count_lane_record` VALUES ('51984', '405', '2', '42650');
INSERT INTO `count_lane_record` VALUES ('51985', '405', '3', '42650');
INSERT INTO `count_lane_record` VALUES ('51986', '405', '2', '42651');
INSERT INTO `count_lane_record` VALUES ('51987', '405', '3', '42651');
INSERT INTO `count_lane_record` VALUES ('51988', '405', '2', '42652');
INSERT INTO `count_lane_record` VALUES ('51989', '405', '3', '42652');
INSERT INTO `count_lane_record` VALUES ('51990', '405', '2', '42653');
INSERT INTO `count_lane_record` VALUES ('51991', '405', '3', '42653');
INSERT INTO `count_lane_record` VALUES ('51992', '404', '2', '42654');
INSERT INTO `count_lane_record` VALUES ('51993', '405', '3', '42654');
INSERT INTO `count_lane_record` VALUES ('51994', '405', '2', '42655');
INSERT INTO `count_lane_record` VALUES ('51995', '405', '3', '42655');
INSERT INTO `count_lane_record` VALUES ('51996', '405', '2', '42656');
INSERT INTO `count_lane_record` VALUES ('51997', '405', '3', '42656');
INSERT INTO `count_lane_record` VALUES ('51998', '405', '2', '42657');
INSERT INTO `count_lane_record` VALUES ('51999', '404', '3', '42657');
INSERT INTO `count_lane_record` VALUES ('52000', '405', '2', '42658');
INSERT INTO `count_lane_record` VALUES ('52001', '405', '3', '42658');
INSERT INTO `count_lane_record` VALUES ('52002', '405', '2', '42659');
INSERT INTO `count_lane_record` VALUES ('52003', '405', '3', '42659');
INSERT INTO `count_lane_record` VALUES ('52004', '405', '2', '42660');
INSERT INTO `count_lane_record` VALUES ('52005', '405', '3', '42660');
INSERT INTO `count_lane_record` VALUES ('52006', '404', '2', '42661');
INSERT INTO `count_lane_record` VALUES ('52007', '405', '3', '42661');
INSERT INTO `count_lane_record` VALUES ('52008', '405', '2', '42662');
INSERT INTO `count_lane_record` VALUES ('52009', '405', '3', '42662');
INSERT INTO `count_lane_record` VALUES ('52010', '405', '2', '42663');
INSERT INTO `count_lane_record` VALUES ('52011', '405', '3', '42663');
INSERT INTO `count_lane_record` VALUES ('52012', '405', '2', '42664');
INSERT INTO `count_lane_record` VALUES ('52013', '404', '3', '42664');
INSERT INTO `count_lane_record` VALUES ('52014', '405', '2', '42665');
INSERT INTO `count_lane_record` VALUES ('52015', '405', '3', '42665');
INSERT INTO `count_lane_record` VALUES ('52016', '405', '2', '42666');
INSERT INTO `count_lane_record` VALUES ('52017', '405', '3', '42666');
INSERT INTO `count_lane_record` VALUES ('52018', '405', '2', '42667');
INSERT INTO `count_lane_record` VALUES ('52019', '405', '3', '42667');
INSERT INTO `count_lane_record` VALUES ('52020', '405', '2', '42668');
INSERT INTO `count_lane_record` VALUES ('52021', '405', '3', '42668');
INSERT INTO `count_lane_record` VALUES ('52022', '405', '2', '42669');
INSERT INTO `count_lane_record` VALUES ('52023', '405', '3', '42669');
INSERT INTO `count_lane_record` VALUES ('52024', '405', '2', '42670');
INSERT INTO `count_lane_record` VALUES ('52025', '405', '3', '42670');
INSERT INTO `count_lane_record` VALUES ('52026', '405', '2', '42671');
INSERT INTO `count_lane_record` VALUES ('52027', '405', '3', '42671');
INSERT INTO `count_lane_record` VALUES ('52028', '405', '2', '42672');
INSERT INTO `count_lane_record` VALUES ('52029', '405', '3', '42672');
INSERT INTO `count_lane_record` VALUES ('52030', '405', '2', '42673');
INSERT INTO `count_lane_record` VALUES ('52031', '405', '3', '42673');
INSERT INTO `count_lane_record` VALUES ('52032', '405', '2', '42674');
INSERT INTO `count_lane_record` VALUES ('52033', '405', '3', '42674');
INSERT INTO `count_lane_record` VALUES ('52034', '405', '2', '42675');
INSERT INTO `count_lane_record` VALUES ('52035', '405', '3', '42675');
INSERT INTO `count_lane_record` VALUES ('52036', '405', '2', '42676');
INSERT INTO `count_lane_record` VALUES ('52037', '405', '3', '42676');
INSERT INTO `count_lane_record` VALUES ('52038', '405', '2', '42677');
INSERT INTO `count_lane_record` VALUES ('52039', '405', '3', '42677');
INSERT INTO `count_lane_record` VALUES ('52040', '405', '2', '42678');
INSERT INTO `count_lane_record` VALUES ('52041', '405', '3', '42678');
INSERT INTO `count_lane_record` VALUES ('52042', '405', '2', '42679');
INSERT INTO `count_lane_record` VALUES ('52043', '405', '3', '42679');
INSERT INTO `count_lane_record` VALUES ('52044', '405', '2', '42680');
INSERT INTO `count_lane_record` VALUES ('52045', '405', '3', '42680');
INSERT INTO `count_lane_record` VALUES ('52046', '405', '2', '42681');
INSERT INTO `count_lane_record` VALUES ('52047', '405', '3', '42681');
INSERT INTO `count_lane_record` VALUES ('52048', '405', '2', '42682');
INSERT INTO `count_lane_record` VALUES ('52049', '405', '3', '42682');
INSERT INTO `count_lane_record` VALUES ('52050', '405', '2', '42683');
INSERT INTO `count_lane_record` VALUES ('52051', '405', '3', '42683');
INSERT INTO `count_lane_record` VALUES ('52052', '405', '2', '42684');
INSERT INTO `count_lane_record` VALUES ('52053', '405', '3', '42684');
INSERT INTO `count_lane_record` VALUES ('52054', '405', '2', '42685');
INSERT INTO `count_lane_record` VALUES ('52055', '405', '3', '42685');
INSERT INTO `count_lane_record` VALUES ('52056', '405', '2', '42686');
INSERT INTO `count_lane_record` VALUES ('52057', '405', '3', '42686');
INSERT INTO `count_lane_record` VALUES ('52058', '405', '2', '42687');
INSERT INTO `count_lane_record` VALUES ('52059', '405', '3', '42687');
INSERT INTO `count_lane_record` VALUES ('52060', '405', '2', '42688');
INSERT INTO `count_lane_record` VALUES ('52061', '405', '3', '42688');
INSERT INTO `count_lane_record` VALUES ('52062', '405', '2', '42689');
INSERT INTO `count_lane_record` VALUES ('52063', '405', '3', '42689');
INSERT INTO `count_lane_record` VALUES ('52064', '405', '2', '42690');
INSERT INTO `count_lane_record` VALUES ('52065', '405', '3', '42690');
INSERT INTO `count_lane_record` VALUES ('52066', '405', '2', '42691');
INSERT INTO `count_lane_record` VALUES ('52067', '405', '3', '42691');
INSERT INTO `count_lane_record` VALUES ('52068', '405', '2', '42692');
INSERT INTO `count_lane_record` VALUES ('52069', '405', '3', '42692');
INSERT INTO `count_lane_record` VALUES ('52070', '405', '2', '42693');
INSERT INTO `count_lane_record` VALUES ('52071', '405', '3', '42693');
INSERT INTO `count_lane_record` VALUES ('52072', '405', '2', '42694');
INSERT INTO `count_lane_record` VALUES ('52073', '405', '3', '42694');
INSERT INTO `count_lane_record` VALUES ('52074', '405', '2', '42695');
INSERT INTO `count_lane_record` VALUES ('52075', '405', '3', '42695');
INSERT INTO `count_lane_record` VALUES ('52076', '405', '2', '42696');
INSERT INTO `count_lane_record` VALUES ('52077', '405', '3', '42696');
INSERT INTO `count_lane_record` VALUES ('52078', '405', '2', '42697');
INSERT INTO `count_lane_record` VALUES ('52079', '405', '3', '42697');
INSERT INTO `count_lane_record` VALUES ('52080', '405', '2', '42698');
INSERT INTO `count_lane_record` VALUES ('52081', '405', '3', '42698');
INSERT INTO `count_lane_record` VALUES ('52082', '405', '2', '42699');
INSERT INTO `count_lane_record` VALUES ('52083', '405', '3', '42699');
INSERT INTO `count_lane_record` VALUES ('52084', '405', '2', '42700');
INSERT INTO `count_lane_record` VALUES ('52085', '405', '3', '42700');
INSERT INTO `count_lane_record` VALUES ('52086', '405', '2', '42701');
INSERT INTO `count_lane_record` VALUES ('52087', '405', '3', '42701');
INSERT INTO `count_lane_record` VALUES ('52088', '405', '2', '42702');
INSERT INTO `count_lane_record` VALUES ('52089', '405', '3', '42702');
INSERT INTO `count_lane_record` VALUES ('52090', '405', '2', '42703');
INSERT INTO `count_lane_record` VALUES ('52091', '405', '3', '42703');
INSERT INTO `count_lane_record` VALUES ('52092', '405', '2', '42704');
INSERT INTO `count_lane_record` VALUES ('52093', '405', '3', '42704');
INSERT INTO `count_lane_record` VALUES ('52094', '405', '2', '42705');
INSERT INTO `count_lane_record` VALUES ('52095', '405', '3', '42705');
INSERT INTO `count_lane_record` VALUES ('52096', '405', '2', '42706');
INSERT INTO `count_lane_record` VALUES ('52097', '405', '3', '42706');
INSERT INTO `count_lane_record` VALUES ('52098', '405', '2', '42707');
INSERT INTO `count_lane_record` VALUES ('52099', '405', '3', '42707');
INSERT INTO `count_lane_record` VALUES ('52100', '405', '2', '42708');
INSERT INTO `count_lane_record` VALUES ('52101', '405', '3', '42708');
INSERT INTO `count_lane_record` VALUES ('52102', '405', '2', '42709');
INSERT INTO `count_lane_record` VALUES ('52103', '405', '3', '42709');
INSERT INTO `count_lane_record` VALUES ('52104', '405', '2', '42710');
INSERT INTO `count_lane_record` VALUES ('52105', '405', '3', '42710');
INSERT INTO `count_lane_record` VALUES ('52106', '405', '2', '42711');
INSERT INTO `count_lane_record` VALUES ('52107', '405', '3', '42711');
INSERT INTO `count_lane_record` VALUES ('52108', '405', '2', '42712');
INSERT INTO `count_lane_record` VALUES ('52109', '405', '3', '42712');
INSERT INTO `count_lane_record` VALUES ('52110', '405', '2', '42713');
INSERT INTO `count_lane_record` VALUES ('52111', '405', '3', '42713');
INSERT INTO `count_lane_record` VALUES ('52112', '405', '2', '42714');
INSERT INTO `count_lane_record` VALUES ('52113', '405', '3', '42714');
INSERT INTO `count_lane_record` VALUES ('52114', '405', '2', '42715');
INSERT INTO `count_lane_record` VALUES ('52115', '405', '3', '42715');
INSERT INTO `count_lane_record` VALUES ('52116', '405', '2', '42716');
INSERT INTO `count_lane_record` VALUES ('52117', '405', '3', '42716');
INSERT INTO `count_lane_record` VALUES ('52118', '405', '2', '42717');
INSERT INTO `count_lane_record` VALUES ('52119', '405', '3', '42717');
INSERT INTO `count_lane_record` VALUES ('52120', '405', '2', '42718');
INSERT INTO `count_lane_record` VALUES ('52121', '405', '3', '42718');
INSERT INTO `count_lane_record` VALUES ('52122', '405', '2', '42719');
INSERT INTO `count_lane_record` VALUES ('52123', '405', '3', '42719');
INSERT INTO `count_lane_record` VALUES ('52124', '405', '2', '42720');
INSERT INTO `count_lane_record` VALUES ('52125', '405', '3', '42720');
INSERT INTO `count_lane_record` VALUES ('52126', '405', '2', '42721');
INSERT INTO `count_lane_record` VALUES ('52127', '405', '3', '42721');
INSERT INTO `count_lane_record` VALUES ('52128', '405', '2', '42722');
INSERT INTO `count_lane_record` VALUES ('52129', '405', '3', '42722');
INSERT INTO `count_lane_record` VALUES ('52130', '405', '2', '42723');
INSERT INTO `count_lane_record` VALUES ('52131', '405', '3', '42723');
INSERT INTO `count_lane_record` VALUES ('52132', '405', '2', '42724');
INSERT INTO `count_lane_record` VALUES ('52133', '405', '3', '42724');
INSERT INTO `count_lane_record` VALUES ('52134', '405', '2', '42725');
INSERT INTO `count_lane_record` VALUES ('52135', '405', '3', '42725');
INSERT INTO `count_lane_record` VALUES ('52136', '405', '2', '42726');
INSERT INTO `count_lane_record` VALUES ('52137', '405', '3', '42726');
INSERT INTO `count_lane_record` VALUES ('52138', '405', '2', '42727');
INSERT INTO `count_lane_record` VALUES ('52139', '405', '3', '42727');
INSERT INTO `count_lane_record` VALUES ('52140', '405', '2', '42728');
INSERT INTO `count_lane_record` VALUES ('52141', '405', '3', '42728');
INSERT INTO `count_lane_record` VALUES ('52142', '405', '2', '42729');
INSERT INTO `count_lane_record` VALUES ('52143', '405', '3', '42729');
INSERT INTO `count_lane_record` VALUES ('52144', '405', '2', '42730');
INSERT INTO `count_lane_record` VALUES ('52145', '405', '3', '42730');
INSERT INTO `count_lane_record` VALUES ('52146', '405', '2', '42731');
INSERT INTO `count_lane_record` VALUES ('52147', '405', '3', '42731');
INSERT INTO `count_lane_record` VALUES ('52148', '405', '2', '42732');
INSERT INTO `count_lane_record` VALUES ('52149', '405', '3', '42732');
INSERT INTO `count_lane_record` VALUES ('52150', '405', '2', '42733');
INSERT INTO `count_lane_record` VALUES ('52151', '405', '3', '42733');
INSERT INTO `count_lane_record` VALUES ('52152', '405', '2', '42734');
INSERT INTO `count_lane_record` VALUES ('52153', '405', '3', '42734');
INSERT INTO `count_lane_record` VALUES ('52154', '405', '2', '42735');
INSERT INTO `count_lane_record` VALUES ('52155', '405', '3', '42735');
INSERT INTO `count_lane_record` VALUES ('52156', '405', '2', '42736');
INSERT INTO `count_lane_record` VALUES ('52157', '405', '3', '42736');
INSERT INTO `count_lane_record` VALUES ('52158', '405', '2', '42737');
INSERT INTO `count_lane_record` VALUES ('52159', '405', '3', '42737');
INSERT INTO `count_lane_record` VALUES ('52160', '405', '2', '42738');
INSERT INTO `count_lane_record` VALUES ('52161', '405', '3', '42738');
INSERT INTO `count_lane_record` VALUES ('52162', '405', '2', '42739');
INSERT INTO `count_lane_record` VALUES ('52163', '405', '3', '42739');
INSERT INTO `count_lane_record` VALUES ('52164', '405', '2', '42740');
INSERT INTO `count_lane_record` VALUES ('52165', '405', '3', '42740');
INSERT INTO `count_lane_record` VALUES ('52166', '405', '2', '42741');
INSERT INTO `count_lane_record` VALUES ('52167', '405', '3', '42741');
INSERT INTO `count_lane_record` VALUES ('52168', '405', '2', '42742');
INSERT INTO `count_lane_record` VALUES ('52169', '405', '3', '42742');
INSERT INTO `count_lane_record` VALUES ('52170', '405', '2', '42743');
INSERT INTO `count_lane_record` VALUES ('52171', '405', '3', '42743');
INSERT INTO `count_lane_record` VALUES ('52172', '405', '2', '42744');
INSERT INTO `count_lane_record` VALUES ('52173', '405', '3', '42744');
INSERT INTO `count_lane_record` VALUES ('52174', '405', '2', '42745');
INSERT INTO `count_lane_record` VALUES ('52175', '405', '3', '42745');
INSERT INTO `count_lane_record` VALUES ('52176', '405', '2', '42746');
INSERT INTO `count_lane_record` VALUES ('52177', '405', '3', '42746');
INSERT INTO `count_lane_record` VALUES ('52178', '405', '2', '42747');
INSERT INTO `count_lane_record` VALUES ('52179', '405', '3', '42747');
INSERT INTO `count_lane_record` VALUES ('52180', '405', '2', '42748');
INSERT INTO `count_lane_record` VALUES ('52181', '405', '3', '42748');
INSERT INTO `count_lane_record` VALUES ('52182', '405', '2', '42749');
INSERT INTO `count_lane_record` VALUES ('52183', '405', '3', '42749');
INSERT INTO `count_lane_record` VALUES ('52184', '405', '2', '42750');
INSERT INTO `count_lane_record` VALUES ('52185', '405', '3', '42750');
INSERT INTO `count_lane_record` VALUES ('52186', '405', '2', '42751');
INSERT INTO `count_lane_record` VALUES ('52187', '405', '3', '42751');
INSERT INTO `count_lane_record` VALUES ('52188', '405', '2', '42752');
INSERT INTO `count_lane_record` VALUES ('52189', '405', '3', '42752');
INSERT INTO `count_lane_record` VALUES ('52190', '405', '2', '42753');
INSERT INTO `count_lane_record` VALUES ('52191', '405', '3', '42753');
INSERT INTO `count_lane_record` VALUES ('52192', '405', '2', '42754');
INSERT INTO `count_lane_record` VALUES ('52193', '405', '3', '42754');
INSERT INTO `count_lane_record` VALUES ('52194', '405', '2', '42755');
INSERT INTO `count_lane_record` VALUES ('52195', '405', '3', '42755');
INSERT INTO `count_lane_record` VALUES ('52196', '405', '2', '42756');
INSERT INTO `count_lane_record` VALUES ('52197', '405', '3', '42756');
INSERT INTO `count_lane_record` VALUES ('52198', '405', '2', '42757');
INSERT INTO `count_lane_record` VALUES ('52199', '405', '3', '42757');
INSERT INTO `count_lane_record` VALUES ('52200', '405', '2', '42758');
INSERT INTO `count_lane_record` VALUES ('52201', '405', '3', '42758');
INSERT INTO `count_lane_record` VALUES ('52202', '405', '2', '42759');
INSERT INTO `count_lane_record` VALUES ('52203', '405', '3', '42759');
INSERT INTO `count_lane_record` VALUES ('52204', '405', '2', '42760');
INSERT INTO `count_lane_record` VALUES ('52205', '405', '3', '42760');
INSERT INTO `count_lane_record` VALUES ('52206', '405', '2', '42761');
INSERT INTO `count_lane_record` VALUES ('52207', '405', '3', '42761');
INSERT INTO `count_lane_record` VALUES ('52208', '405', '2', '42762');
INSERT INTO `count_lane_record` VALUES ('52209', '405', '3', '42762');
INSERT INTO `count_lane_record` VALUES ('52210', '405', '2', '42763');
INSERT INTO `count_lane_record` VALUES ('52211', '405', '3', '42763');
INSERT INTO `count_lane_record` VALUES ('52212', '405', '2', '42764');
INSERT INTO `count_lane_record` VALUES ('52213', '405', '3', '42764');
INSERT INTO `count_lane_record` VALUES ('52214', '405', '2', '42765');
INSERT INTO `count_lane_record` VALUES ('52215', '405', '3', '42765');
INSERT INTO `count_lane_record` VALUES ('52216', '405', '2', '42766');
INSERT INTO `count_lane_record` VALUES ('52217', '405', '3', '42766');
INSERT INTO `count_lane_record` VALUES ('52218', '405', '2', '42767');
INSERT INTO `count_lane_record` VALUES ('52219', '405', '3', '42767');
INSERT INTO `count_lane_record` VALUES ('52220', '405', '2', '42768');
INSERT INTO `count_lane_record` VALUES ('52221', '405', '3', '42768');
INSERT INTO `count_lane_record` VALUES ('52222', '405', '2', '42769');
INSERT INTO `count_lane_record` VALUES ('52223', '405', '3', '42769');
INSERT INTO `count_lane_record` VALUES ('52224', '405', '2', '42770');
INSERT INTO `count_lane_record` VALUES ('52225', '405', '3', '42770');
INSERT INTO `count_lane_record` VALUES ('52226', '405', '2', '42771');
INSERT INTO `count_lane_record` VALUES ('52227', '405', '3', '42771');
INSERT INTO `count_lane_record` VALUES ('52228', '405', '2', '42772');
INSERT INTO `count_lane_record` VALUES ('52229', '405', '3', '42772');
INSERT INTO `count_lane_record` VALUES ('52230', '405', '2', '42773');
INSERT INTO `count_lane_record` VALUES ('52231', '405', '3', '42773');
INSERT INTO `count_lane_record` VALUES ('52232', '405', '2', '42774');
INSERT INTO `count_lane_record` VALUES ('52233', '405', '3', '42774');
INSERT INTO `count_lane_record` VALUES ('52234', '405', '2', '42775');
INSERT INTO `count_lane_record` VALUES ('52235', '405', '3', '42775');
INSERT INTO `count_lane_record` VALUES ('52236', '405', '2', '42776');
INSERT INTO `count_lane_record` VALUES ('52237', '405', '3', '42776');
INSERT INTO `count_lane_record` VALUES ('52238', '405', '2', '42777');
INSERT INTO `count_lane_record` VALUES ('52239', '405', '3', '42777');
INSERT INTO `count_lane_record` VALUES ('52240', '405', '2', '42778');
INSERT INTO `count_lane_record` VALUES ('52241', '405', '3', '42778');
INSERT INTO `count_lane_record` VALUES ('52242', '405', '2', '42779');
INSERT INTO `count_lane_record` VALUES ('52243', '405', '3', '42779');
INSERT INTO `count_lane_record` VALUES ('52244', '405', '2', '42780');
INSERT INTO `count_lane_record` VALUES ('52245', '405', '3', '42780');
INSERT INTO `count_lane_record` VALUES ('52246', '405', '2', '42781');
INSERT INTO `count_lane_record` VALUES ('52247', '405', '3', '42781');
INSERT INTO `count_lane_record` VALUES ('52248', '405', '2', '42782');
INSERT INTO `count_lane_record` VALUES ('52249', '405', '3', '42782');
INSERT INTO `count_lane_record` VALUES ('52250', '405', '2', '42783');
INSERT INTO `count_lane_record` VALUES ('52251', '405', '3', '42783');
INSERT INTO `count_lane_record` VALUES ('52252', '405', '2', '42784');
INSERT INTO `count_lane_record` VALUES ('52253', '405', '3', '42784');
INSERT INTO `count_lane_record` VALUES ('52254', '405', '2', '42785');
INSERT INTO `count_lane_record` VALUES ('52255', '405', '3', '42785');
INSERT INTO `count_lane_record` VALUES ('52256', '405', '2', '42786');
INSERT INTO `count_lane_record` VALUES ('52257', '405', '3', '42786');
INSERT INTO `count_lane_record` VALUES ('52258', '405', '2', '42787');
INSERT INTO `count_lane_record` VALUES ('52259', '405', '3', '42787');
INSERT INTO `count_lane_record` VALUES ('52260', '405', '2', '42788');
INSERT INTO `count_lane_record` VALUES ('52261', '405', '3', '42788');
INSERT INTO `count_lane_record` VALUES ('52262', '405', '2', '42789');
INSERT INTO `count_lane_record` VALUES ('52263', '405', '3', '42789');
INSERT INTO `count_lane_record` VALUES ('52264', '405', '2', '42790');
INSERT INTO `count_lane_record` VALUES ('52265', '405', '3', '42790');
INSERT INTO `count_lane_record` VALUES ('52266', '405', '2', '42791');
INSERT INTO `count_lane_record` VALUES ('52267', '405', '3', '42791');
INSERT INTO `count_lane_record` VALUES ('52268', '405', '2', '42792');
INSERT INTO `count_lane_record` VALUES ('52269', '405', '3', '42792');
INSERT INTO `count_lane_record` VALUES ('52270', '404', '2', '42793');
INSERT INTO `count_lane_record` VALUES ('52271', '405', '3', '42793');
INSERT INTO `count_lane_record` VALUES ('52272', '405', '2', '42794');
INSERT INTO `count_lane_record` VALUES ('52273', '405', '3', '42794');
INSERT INTO `count_lane_record` VALUES ('52274', '404', '2', '42795');
INSERT INTO `count_lane_record` VALUES ('52275', '404', '3', '42795');
INSERT INTO `count_lane_record` VALUES ('52276', '405', '2', '42796');
INSERT INTO `count_lane_record` VALUES ('52277', '405', '3', '42796');
INSERT INTO `count_lane_record` VALUES ('52278', '405', '2', '42797');
INSERT INTO `count_lane_record` VALUES ('52279', '405', '3', '42797');
INSERT INTO `count_lane_record` VALUES ('52280', '404', '2', '42798');
INSERT INTO `count_lane_record` VALUES ('52281', '404', '3', '42798');
INSERT INTO `count_lane_record` VALUES ('52282', '405', '2', '42799');
INSERT INTO `count_lane_record` VALUES ('52283', '405', '3', '42799');
INSERT INTO `count_lane_record` VALUES ('52284', '405', '2', '42800');
INSERT INTO `count_lane_record` VALUES ('52285', '405', '3', '42800');
INSERT INTO `count_lane_record` VALUES ('52286', '405', '2', '42801');
INSERT INTO `count_lane_record` VALUES ('52287', '404', '3', '42801');
INSERT INTO `count_lane_record` VALUES ('52288', '405', '2', '42802');
INSERT INTO `count_lane_record` VALUES ('52289', '405', '3', '42802');
INSERT INTO `count_lane_record` VALUES ('52290', '405', '2', '42803');
INSERT INTO `count_lane_record` VALUES ('52291', '405', '3', '42803');
INSERT INTO `count_lane_record` VALUES ('52292', '405', '2', '42804');
INSERT INTO `count_lane_record` VALUES ('52293', '405', '3', '42804');
INSERT INTO `count_lane_record` VALUES ('52294', '405', '2', '42805');
INSERT INTO `count_lane_record` VALUES ('52295', '405', '3', '42805');
INSERT INTO `count_lane_record` VALUES ('52296', '405', '2', '42806');
INSERT INTO `count_lane_record` VALUES ('52297', '405', '3', '42806');
INSERT INTO `count_lane_record` VALUES ('52298', '405', '2', '42807');
INSERT INTO `count_lane_record` VALUES ('52299', '405', '3', '42807');
INSERT INTO `count_lane_record` VALUES ('52300', '405', '2', '42808');
INSERT INTO `count_lane_record` VALUES ('52301', '405', '3', '42808');
INSERT INTO `count_lane_record` VALUES ('52302', '405', '2', '42809');
INSERT INTO `count_lane_record` VALUES ('52303', '405', '3', '42809');
INSERT INTO `count_lane_record` VALUES ('52304', '405', '2', '42810');
INSERT INTO `count_lane_record` VALUES ('52305', '405', '3', '42810');
INSERT INTO `count_lane_record` VALUES ('52306', '404', '2', '42811');
INSERT INTO `count_lane_record` VALUES ('52307', '405', '3', '42811');
INSERT INTO `count_lane_record` VALUES ('52308', '405', '2', '42812');
INSERT INTO `count_lane_record` VALUES ('52309', '405', '3', '42812');
INSERT INTO `count_lane_record` VALUES ('52310', '405', '2', '42813');
INSERT INTO `count_lane_record` VALUES ('52311', '405', '3', '42813');
INSERT INTO `count_lane_record` VALUES ('52312', '405', '2', '42814');
INSERT INTO `count_lane_record` VALUES ('52313', '404', '3', '42814');
INSERT INTO `count_lane_record` VALUES ('52314', '405', '2', '42815');
INSERT INTO `count_lane_record` VALUES ('52315', '405', '3', '42815');
INSERT INTO `count_lane_record` VALUES ('52316', '405', '2', '42816');
INSERT INTO `count_lane_record` VALUES ('52317', '405', '3', '42816');
INSERT INTO `count_lane_record` VALUES ('52318', '405', '2', '42817');
INSERT INTO `count_lane_record` VALUES ('52319', '405', '3', '42817');
INSERT INTO `count_lane_record` VALUES ('52320', '405', '2', '42818');
INSERT INTO `count_lane_record` VALUES ('52321', '405', '3', '42818');
INSERT INTO `count_lane_record` VALUES ('52322', '405', '2', '42819');
INSERT INTO `count_lane_record` VALUES ('52323', '405', '3', '42819');
INSERT INTO `count_lane_record` VALUES ('52324', '405', '2', '42820');
INSERT INTO `count_lane_record` VALUES ('52325', '405', '3', '42820');
INSERT INTO `count_lane_record` VALUES ('52326', '405', '2', '42821');
INSERT INTO `count_lane_record` VALUES ('52327', '405', '3', '42821');
INSERT INTO `count_lane_record` VALUES ('52328', '405', '2', '42822');
INSERT INTO `count_lane_record` VALUES ('52329', '405', '3', '42822');
INSERT INTO `count_lane_record` VALUES ('52330', '405', '2', '42823');
INSERT INTO `count_lane_record` VALUES ('52331', '405', '3', '42823');
INSERT INTO `count_lane_record` VALUES ('52332', '405', '2', '42824');
INSERT INTO `count_lane_record` VALUES ('52333', '405', '3', '42824');
INSERT INTO `count_lane_record` VALUES ('52334', '405', '2', '42825');
INSERT INTO `count_lane_record` VALUES ('52335', '405', '3', '42825');
INSERT INTO `count_lane_record` VALUES ('52336', '405', '2', '42826');
INSERT INTO `count_lane_record` VALUES ('52337', '405', '3', '42826');
INSERT INTO `count_lane_record` VALUES ('52338', '405', '2', '42827');
INSERT INTO `count_lane_record` VALUES ('52339', '405', '3', '42827');
INSERT INTO `count_lane_record` VALUES ('52340', '405', '2', '42828');
INSERT INTO `count_lane_record` VALUES ('52341', '405', '3', '42828');
INSERT INTO `count_lane_record` VALUES ('52342', '405', '2', '42829');
INSERT INTO `count_lane_record` VALUES ('52343', '405', '3', '42829');
INSERT INTO `count_lane_record` VALUES ('52344', '405', '2', '42830');
INSERT INTO `count_lane_record` VALUES ('52345', '405', '3', '42830');
INSERT INTO `count_lane_record` VALUES ('52346', '405', '2', '42831');
INSERT INTO `count_lane_record` VALUES ('52347', '405', '3', '42831');
INSERT INTO `count_lane_record` VALUES ('52348', '405', '2', '42832');
INSERT INTO `count_lane_record` VALUES ('52349', '405', '3', '42832');
INSERT INTO `count_lane_record` VALUES ('52350', '405', '2', '42833');
INSERT INTO `count_lane_record` VALUES ('52351', '405', '3', '42833');
INSERT INTO `count_lane_record` VALUES ('52352', '405', '2', '42834');
INSERT INTO `count_lane_record` VALUES ('52353', '405', '3', '42834');
INSERT INTO `count_lane_record` VALUES ('52354', '405', '2', '42835');
INSERT INTO `count_lane_record` VALUES ('52355', '405', '3', '42835');
INSERT INTO `count_lane_record` VALUES ('52356', '405', '2', '42836');
INSERT INTO `count_lane_record` VALUES ('52357', '405', '3', '42836');
INSERT INTO `count_lane_record` VALUES ('52358', '405', '2', '42837');
INSERT INTO `count_lane_record` VALUES ('52359', '405', '3', '42837');
INSERT INTO `count_lane_record` VALUES ('52360', '405', '2', '42838');
INSERT INTO `count_lane_record` VALUES ('52361', '405', '3', '42838');
INSERT INTO `count_lane_record` VALUES ('52362', '405', '2', '42839');
INSERT INTO `count_lane_record` VALUES ('52363', '405', '3', '42839');
INSERT INTO `count_lane_record` VALUES ('52364', '405', '2', '42840');
INSERT INTO `count_lane_record` VALUES ('52365', '405', '3', '42840');
INSERT INTO `count_lane_record` VALUES ('52366', '405', '2', '42841');
INSERT INTO `count_lane_record` VALUES ('52367', '405', '3', '42841');
INSERT INTO `count_lane_record` VALUES ('52368', '405', '2', '42842');
INSERT INTO `count_lane_record` VALUES ('52369', '405', '3', '42842');
INSERT INTO `count_lane_record` VALUES ('52370', '405', '2', '42843');
INSERT INTO `count_lane_record` VALUES ('52371', '405', '3', '42843');
INSERT INTO `count_lane_record` VALUES ('52372', '405', '2', '42844');
INSERT INTO `count_lane_record` VALUES ('52373', '405', '3', '42844');
INSERT INTO `count_lane_record` VALUES ('52374', '405', '2', '42845');
INSERT INTO `count_lane_record` VALUES ('52375', '405', '3', '42845');
INSERT INTO `count_lane_record` VALUES ('52376', '405', '2', '42846');
INSERT INTO `count_lane_record` VALUES ('52377', '405', '3', '42846');
INSERT INTO `count_lane_record` VALUES ('52378', '405', '2', '42847');
INSERT INTO `count_lane_record` VALUES ('52379', '405', '3', '42847');
INSERT INTO `count_lane_record` VALUES ('52380', '405', '2', '42848');
INSERT INTO `count_lane_record` VALUES ('52381', '405', '3', '42848');
INSERT INTO `count_lane_record` VALUES ('52382', '405', '2', '42849');
INSERT INTO `count_lane_record` VALUES ('52383', '405', '3', '42849');
INSERT INTO `count_lane_record` VALUES ('52384', '405', '2', '42850');
INSERT INTO `count_lane_record` VALUES ('52385', '405', '3', '42850');
INSERT INTO `count_lane_record` VALUES ('52386', '405', '2', '42851');
INSERT INTO `count_lane_record` VALUES ('52387', '405', '3', '42851');
INSERT INTO `count_lane_record` VALUES ('52388', '405', '2', '42852');
INSERT INTO `count_lane_record` VALUES ('52389', '405', '3', '42852');
INSERT INTO `count_lane_record` VALUES ('52390', '405', '2', '42853');
INSERT INTO `count_lane_record` VALUES ('52391', '405', '3', '42853');
INSERT INTO `count_lane_record` VALUES ('52392', '405', '2', '42854');
INSERT INTO `count_lane_record` VALUES ('52393', '405', '3', '42854');
INSERT INTO `count_lane_record` VALUES ('52394', '405', '2', '42855');
INSERT INTO `count_lane_record` VALUES ('52395', '405', '3', '42855');
INSERT INTO `count_lane_record` VALUES ('52396', '405', '2', '42856');
INSERT INTO `count_lane_record` VALUES ('52397', '405', '3', '42856');
INSERT INTO `count_lane_record` VALUES ('52398', '405', '2', '42857');
INSERT INTO `count_lane_record` VALUES ('52399', '405', '3', '42857');
INSERT INTO `count_lane_record` VALUES ('52400', '405', '2', '42858');
INSERT INTO `count_lane_record` VALUES ('52401', '405', '3', '42858');
INSERT INTO `count_lane_record` VALUES ('52402', '405', '2', '42859');
INSERT INTO `count_lane_record` VALUES ('52403', '405', '3', '42859');
INSERT INTO `count_lane_record` VALUES ('52404', '405', '2', '42860');
INSERT INTO `count_lane_record` VALUES ('52405', '405', '3', '42860');
INSERT INTO `count_lane_record` VALUES ('52406', '405', '2', '42861');
INSERT INTO `count_lane_record` VALUES ('52407', '405', '3', '42861');
INSERT INTO `count_lane_record` VALUES ('52408', '405', '2', '42862');
INSERT INTO `count_lane_record` VALUES ('52409', '405', '3', '42862');
INSERT INTO `count_lane_record` VALUES ('52410', '405', '2', '42863');
INSERT INTO `count_lane_record` VALUES ('52411', '405', '3', '42863');
INSERT INTO `count_lane_record` VALUES ('52412', '405', '2', '42864');
INSERT INTO `count_lane_record` VALUES ('52413', '405', '3', '42864');
INSERT INTO `count_lane_record` VALUES ('52414', '405', '2', '42865');
INSERT INTO `count_lane_record` VALUES ('52415', '405', '3', '42865');
INSERT INTO `count_lane_record` VALUES ('52416', '405', '2', '42866');
INSERT INTO `count_lane_record` VALUES ('52417', '405', '3', '42866');
INSERT INTO `count_lane_record` VALUES ('52418', '405', '2', '42867');
INSERT INTO `count_lane_record` VALUES ('52419', '405', '3', '42867');
INSERT INTO `count_lane_record` VALUES ('52420', '405', '2', '42868');
INSERT INTO `count_lane_record` VALUES ('52421', '405', '3', '42868');
INSERT INTO `count_lane_record` VALUES ('52422', '405', '2', '42869');
INSERT INTO `count_lane_record` VALUES ('52423', '405', '3', '42869');
INSERT INTO `count_lane_record` VALUES ('52424', '405', '2', '42870');
INSERT INTO `count_lane_record` VALUES ('52425', '405', '3', '42870');
INSERT INTO `count_lane_record` VALUES ('52426', '405', '2', '42871');
INSERT INTO `count_lane_record` VALUES ('52427', '405', '3', '42871');
INSERT INTO `count_lane_record` VALUES ('52428', '405', '2', '42872');
INSERT INTO `count_lane_record` VALUES ('52429', '405', '3', '42872');
INSERT INTO `count_lane_record` VALUES ('52430', '405', '2', '42873');
INSERT INTO `count_lane_record` VALUES ('52431', '405', '3', '42873');
INSERT INTO `count_lane_record` VALUES ('52432', '405', '2', '42874');
INSERT INTO `count_lane_record` VALUES ('52433', '405', '3', '42874');
INSERT INTO `count_lane_record` VALUES ('52434', '405', '2', '42875');
INSERT INTO `count_lane_record` VALUES ('52435', '405', '3', '42875');
INSERT INTO `count_lane_record` VALUES ('52436', '405', '2', '42876');
INSERT INTO `count_lane_record` VALUES ('52437', '405', '3', '42876');
INSERT INTO `count_lane_record` VALUES ('52438', '405', '2', '42877');
INSERT INTO `count_lane_record` VALUES ('52439', '405', '3', '42877');
INSERT INTO `count_lane_record` VALUES ('52440', '405', '2', '42878');
INSERT INTO `count_lane_record` VALUES ('52441', '405', '3', '42878');
INSERT INTO `count_lane_record` VALUES ('52442', '405', '2', '42879');
INSERT INTO `count_lane_record` VALUES ('52443', '405', '3', '42879');
INSERT INTO `count_lane_record` VALUES ('52444', '405', '2', '42880');
INSERT INTO `count_lane_record` VALUES ('52445', '405', '3', '42880');
INSERT INTO `count_lane_record` VALUES ('52446', '405', '2', '42881');
INSERT INTO `count_lane_record` VALUES ('52447', '405', '3', '42881');
INSERT INTO `count_lane_record` VALUES ('52448', '405', '2', '42882');
INSERT INTO `count_lane_record` VALUES ('52449', '405', '3', '42882');
INSERT INTO `count_lane_record` VALUES ('52450', '405', '2', '42883');
INSERT INTO `count_lane_record` VALUES ('52451', '405', '3', '42883');
INSERT INTO `count_lane_record` VALUES ('52452', '405', '2', '42884');
INSERT INTO `count_lane_record` VALUES ('52453', '405', '3', '42884');
INSERT INTO `count_lane_record` VALUES ('52454', '405', '2', '42885');
INSERT INTO `count_lane_record` VALUES ('52455', '405', '3', '42885');
INSERT INTO `count_lane_record` VALUES ('52456', '405', '2', '42886');
INSERT INTO `count_lane_record` VALUES ('52457', '405', '3', '42886');
INSERT INTO `count_lane_record` VALUES ('52458', '405', '2', '42887');
INSERT INTO `count_lane_record` VALUES ('52459', '405', '3', '42887');
INSERT INTO `count_lane_record` VALUES ('52460', '405', '2', '42888');
INSERT INTO `count_lane_record` VALUES ('52461', '405', '3', '42888');
INSERT INTO `count_lane_record` VALUES ('52462', '405', '2', '42889');
INSERT INTO `count_lane_record` VALUES ('52463', '405', '3', '42889');
INSERT INTO `count_lane_record` VALUES ('52464', '405', '2', '42890');
INSERT INTO `count_lane_record` VALUES ('52465', '405', '3', '42890');
INSERT INTO `count_lane_record` VALUES ('52466', '405', '2', '42891');
INSERT INTO `count_lane_record` VALUES ('52467', '405', '3', '42891');
INSERT INTO `count_lane_record` VALUES ('52468', '405', '2', '42892');
INSERT INTO `count_lane_record` VALUES ('52469', '405', '3', '42892');
INSERT INTO `count_lane_record` VALUES ('52470', '405', '2', '42893');
INSERT INTO `count_lane_record` VALUES ('52471', '405', '3', '42893');
INSERT INTO `count_lane_record` VALUES ('52472', '405', '2', '42894');
INSERT INTO `count_lane_record` VALUES ('52473', '405', '3', '42894');
INSERT INTO `count_lane_record` VALUES ('52474', '405', '2', '42895');
INSERT INTO `count_lane_record` VALUES ('52475', '405', '3', '42895');
INSERT INTO `count_lane_record` VALUES ('52476', '405', '2', '42896');
INSERT INTO `count_lane_record` VALUES ('52477', '405', '3', '42896');
INSERT INTO `count_lane_record` VALUES ('52478', '405', '2', '42897');
INSERT INTO `count_lane_record` VALUES ('52479', '405', '3', '42897');
INSERT INTO `count_lane_record` VALUES ('52480', '405', '2', '42898');
INSERT INTO `count_lane_record` VALUES ('52481', '405', '3', '42898');
INSERT INTO `count_lane_record` VALUES ('52482', '405', '2', '42899');
INSERT INTO `count_lane_record` VALUES ('52483', '405', '3', '42899');
INSERT INTO `count_lane_record` VALUES ('52484', '405', '2', '42900');
INSERT INTO `count_lane_record` VALUES ('52485', '405', '3', '42900');
INSERT INTO `count_lane_record` VALUES ('52486', '405', '2', '42901');
INSERT INTO `count_lane_record` VALUES ('52487', '405', '3', '42901');
INSERT INTO `count_lane_record` VALUES ('52488', '405', '2', '42902');
INSERT INTO `count_lane_record` VALUES ('52489', '405', '3', '42902');
INSERT INTO `count_lane_record` VALUES ('52490', '405', '2', '42903');
INSERT INTO `count_lane_record` VALUES ('52491', '405', '3', '42903');
INSERT INTO `count_lane_record` VALUES ('52492', '405', '2', '42904');
INSERT INTO `count_lane_record` VALUES ('52493', '405', '3', '42904');
INSERT INTO `count_lane_record` VALUES ('52494', '405', '2', '42905');
INSERT INTO `count_lane_record` VALUES ('52495', '405', '3', '42905');
INSERT INTO `count_lane_record` VALUES ('52496', '405', '2', '42906');
INSERT INTO `count_lane_record` VALUES ('52497', '405', '3', '42906');
INSERT INTO `count_lane_record` VALUES ('52498', '405', '2', '42907');
INSERT INTO `count_lane_record` VALUES ('52499', '405', '3', '42907');
INSERT INTO `count_lane_record` VALUES ('52500', '405', '2', '42908');
INSERT INTO `count_lane_record` VALUES ('52501', '405', '3', '42908');
INSERT INTO `count_lane_record` VALUES ('52502', '405', '2', '42909');
INSERT INTO `count_lane_record` VALUES ('52503', '405', '3', '42909');
INSERT INTO `count_lane_record` VALUES ('52504', '405', '2', '42910');
INSERT INTO `count_lane_record` VALUES ('52505', '405', '3', '42910');
INSERT INTO `count_lane_record` VALUES ('52506', '405', '2', '42911');
INSERT INTO `count_lane_record` VALUES ('52507', '405', '3', '42911');
INSERT INTO `count_lane_record` VALUES ('52508', '405', '2', '42912');
INSERT INTO `count_lane_record` VALUES ('52509', '405', '3', '42912');
INSERT INTO `count_lane_record` VALUES ('52510', '405', '2', '42913');
INSERT INTO `count_lane_record` VALUES ('52511', '405', '3', '42913');
INSERT INTO `count_lane_record` VALUES ('52512', '405', '2', '42914');
INSERT INTO `count_lane_record` VALUES ('52513', '405', '3', '42914');
INSERT INTO `count_lane_record` VALUES ('52514', '405', '2', '42915');
INSERT INTO `count_lane_record` VALUES ('52515', '405', '3', '42915');
INSERT INTO `count_lane_record` VALUES ('52516', '405', '2', '42916');
INSERT INTO `count_lane_record` VALUES ('52517', '405', '3', '42916');
INSERT INTO `count_lane_record` VALUES ('52518', '405', '2', '42917');
INSERT INTO `count_lane_record` VALUES ('52519', '405', '3', '42917');
INSERT INTO `count_lane_record` VALUES ('52520', '405', '2', '42918');
INSERT INTO `count_lane_record` VALUES ('52521', '405', '3', '42918');
INSERT INTO `count_lane_record` VALUES ('52522', '405', '2', '42919');
INSERT INTO `count_lane_record` VALUES ('52523', '405', '3', '42919');
INSERT INTO `count_lane_record` VALUES ('52524', '405', '2', '42920');
INSERT INTO `count_lane_record` VALUES ('52525', '405', '3', '42920');
INSERT INTO `count_lane_record` VALUES ('52526', '405', '2', '42921');
INSERT INTO `count_lane_record` VALUES ('52527', '405', '3', '42921');
INSERT INTO `count_lane_record` VALUES ('52528', '405', '2', '42922');
INSERT INTO `count_lane_record` VALUES ('52529', '405', '3', '42922');
INSERT INTO `count_lane_record` VALUES ('52530', '405', '2', '42923');
INSERT INTO `count_lane_record` VALUES ('52531', '405', '3', '42923');
INSERT INTO `count_lane_record` VALUES ('52532', '405', '2', '42924');
INSERT INTO `count_lane_record` VALUES ('52533', '405', '3', '42924');
INSERT INTO `count_lane_record` VALUES ('52534', '405', '2', '42925');
INSERT INTO `count_lane_record` VALUES ('52535', '405', '3', '42925');
INSERT INTO `count_lane_record` VALUES ('52536', '405', '2', '42926');
INSERT INTO `count_lane_record` VALUES ('52537', '405', '3', '42926');
INSERT INTO `count_lane_record` VALUES ('52538', '405', '2', '42927');
INSERT INTO `count_lane_record` VALUES ('52539', '405', '3', '42927');
INSERT INTO `count_lane_record` VALUES ('52540', '405', '2', '42928');
INSERT INTO `count_lane_record` VALUES ('52541', '405', '3', '42928');
INSERT INTO `count_lane_record` VALUES ('52542', '405', '2', '42929');
INSERT INTO `count_lane_record` VALUES ('52543', '405', '3', '42929');
INSERT INTO `count_lane_record` VALUES ('52544', '405', '2', '42930');
INSERT INTO `count_lane_record` VALUES ('52545', '405', '3', '42930');
INSERT INTO `count_lane_record` VALUES ('52546', '405', '2', '42931');
INSERT INTO `count_lane_record` VALUES ('52547', '405', '3', '42931');
INSERT INTO `count_lane_record` VALUES ('52548', '405', '2', '42932');
INSERT INTO `count_lane_record` VALUES ('52549', '405', '3', '42932');
INSERT INTO `count_lane_record` VALUES ('52550', '405', '2', '42933');
INSERT INTO `count_lane_record` VALUES ('52551', '405', '3', '42933');
INSERT INTO `count_lane_record` VALUES ('52552', '405', '2', '42934');
INSERT INTO `count_lane_record` VALUES ('52553', '405', '3', '42934');
INSERT INTO `count_lane_record` VALUES ('52554', '405', '2', '42935');
INSERT INTO `count_lane_record` VALUES ('52555', '405', '3', '42935');
INSERT INTO `count_lane_record` VALUES ('52556', '405', '2', '42936');
INSERT INTO `count_lane_record` VALUES ('52557', '405', '3', '42936');
INSERT INTO `count_lane_record` VALUES ('52558', '405', '2', '42937');
INSERT INTO `count_lane_record` VALUES ('52559', '405', '3', '42937');
INSERT INTO `count_lane_record` VALUES ('52560', '405', '2', '42938');
INSERT INTO `count_lane_record` VALUES ('52561', '405', '3', '42938');
INSERT INTO `count_lane_record` VALUES ('52562', '405', '2', '42939');
INSERT INTO `count_lane_record` VALUES ('52563', '405', '3', '42939');
INSERT INTO `count_lane_record` VALUES ('52564', '405', '2', '42940');
INSERT INTO `count_lane_record` VALUES ('52565', '405', '3', '42940');
INSERT INTO `count_lane_record` VALUES ('52566', '405', '2', '42941');
INSERT INTO `count_lane_record` VALUES ('52567', '405', '3', '42941');
INSERT INTO `count_lane_record` VALUES ('52568', '405', '2', '42942');
INSERT INTO `count_lane_record` VALUES ('52569', '405', '3', '42942');
INSERT INTO `count_lane_record` VALUES ('52570', '405', '2', '42943');
INSERT INTO `count_lane_record` VALUES ('52571', '405', '3', '42943');
INSERT INTO `count_lane_record` VALUES ('52572', '405', '2', '42944');
INSERT INTO `count_lane_record` VALUES ('52573', '405', '3', '42944');
INSERT INTO `count_lane_record` VALUES ('52574', '405', '2', '42945');
INSERT INTO `count_lane_record` VALUES ('52575', '405', '3', '42945');
INSERT INTO `count_lane_record` VALUES ('52576', '405', '2', '42946');
INSERT INTO `count_lane_record` VALUES ('52577', '405', '3', '42946');
INSERT INTO `count_lane_record` VALUES ('52578', '404', '2', '42947');
INSERT INTO `count_lane_record` VALUES ('52579', '405', '3', '42947');
INSERT INTO `count_lane_record` VALUES ('52580', '405', '2', '42948');
INSERT INTO `count_lane_record` VALUES ('52581', '405', '3', '42948');
INSERT INTO `count_lane_record` VALUES ('52582', '405', '2', '42949');
INSERT INTO `count_lane_record` VALUES ('52583', '405', '3', '42949');
INSERT INTO `count_lane_record` VALUES ('52584', '404', '2', '42950');
INSERT INTO `count_lane_record` VALUES ('52585', '404', '3', '42950');
INSERT INTO `count_lane_record` VALUES ('52586', '405', '2', '42951');
INSERT INTO `count_lane_record` VALUES ('52587', '405', '3', '42951');
INSERT INTO `count_lane_record` VALUES ('52588', '405', '2', '42952');
INSERT INTO `count_lane_record` VALUES ('52589', '405', '3', '42952');
INSERT INTO `count_lane_record` VALUES ('52590', '405', '2', '42953');
INSERT INTO `count_lane_record` VALUES ('52591', '404', '3', '42953');
INSERT INTO `count_lane_record` VALUES ('52592', '405', '2', '42954');
INSERT INTO `count_lane_record` VALUES ('52593', '405', '3', '42954');
INSERT INTO `count_lane_record` VALUES ('52594', '405', '2', '42955');
INSERT INTO `count_lane_record` VALUES ('52595', '405', '3', '42955');
INSERT INTO `count_lane_record` VALUES ('52596', '405', '2', '42956');
INSERT INTO `count_lane_record` VALUES ('52597', '405', '3', '42956');
INSERT INTO `count_lane_record` VALUES ('52598', '405', '2', '42957');
INSERT INTO `count_lane_record` VALUES ('52599', '405', '3', '42957');
INSERT INTO `count_lane_record` VALUES ('52600', '405', '2', '42958');
INSERT INTO `count_lane_record` VALUES ('52601', '405', '3', '42958');
INSERT INTO `count_lane_record` VALUES ('52602', '405', '2', '42959');
INSERT INTO `count_lane_record` VALUES ('52603', '405', '3', '42959');
INSERT INTO `count_lane_record` VALUES ('52604', '405', '2', '42960');
INSERT INTO `count_lane_record` VALUES ('52605', '405', '3', '42960');
INSERT INTO `count_lane_record` VALUES ('52606', '404', '2', '42961');
INSERT INTO `count_lane_record` VALUES ('52607', '405', '3', '42961');
INSERT INTO `count_lane_record` VALUES ('52608', '405', '2', '42962');
INSERT INTO `count_lane_record` VALUES ('52609', '405', '3', '42962');
INSERT INTO `count_lane_record` VALUES ('52610', '405', '2', '42963');
INSERT INTO `count_lane_record` VALUES ('52611', '405', '3', '42963');
INSERT INTO `count_lane_record` VALUES ('52612', '405', '2', '42964');
INSERT INTO `count_lane_record` VALUES ('52613', '404', '3', '42964');
INSERT INTO `count_lane_record` VALUES ('52614', '405', '2', '42965');
INSERT INTO `count_lane_record` VALUES ('52615', '405', '3', '42965');
INSERT INTO `count_lane_record` VALUES ('52616', '405', '2', '42966');
INSERT INTO `count_lane_record` VALUES ('52617', '405', '3', '42966');
INSERT INTO `count_lane_record` VALUES ('52618', '405', '2', '42967');
INSERT INTO `count_lane_record` VALUES ('52619', '405', '3', '42967');
INSERT INTO `count_lane_record` VALUES ('52620', '405', '2', '42968');
INSERT INTO `count_lane_record` VALUES ('52621', '405', '3', '42968');
INSERT INTO `count_lane_record` VALUES ('52622', '405', '2', '42969');
INSERT INTO `count_lane_record` VALUES ('52623', '405', '3', '42969');
INSERT INTO `count_lane_record` VALUES ('52624', '405', '2', '42970');
INSERT INTO `count_lane_record` VALUES ('52625', '405', '3', '42970');
INSERT INTO `count_lane_record` VALUES ('52626', '405', '2', '42971');
INSERT INTO `count_lane_record` VALUES ('52627', '405', '3', '42971');
INSERT INTO `count_lane_record` VALUES ('52628', '405', '2', '42972');
INSERT INTO `count_lane_record` VALUES ('52629', '405', '3', '42972');
INSERT INTO `count_lane_record` VALUES ('52630', '405', '2', '42973');
INSERT INTO `count_lane_record` VALUES ('52631', '405', '3', '42973');
INSERT INTO `count_lane_record` VALUES ('52632', '405', '2', '42974');
INSERT INTO `count_lane_record` VALUES ('52633', '405', '3', '42974');
INSERT INTO `count_lane_record` VALUES ('52634', '405', '2', '42975');
INSERT INTO `count_lane_record` VALUES ('52635', '405', '3', '42975');
INSERT INTO `count_lane_record` VALUES ('52636', '405', '2', '42976');
INSERT INTO `count_lane_record` VALUES ('52637', '405', '3', '42976');
INSERT INTO `count_lane_record` VALUES ('52638', '405', '2', '42977');
INSERT INTO `count_lane_record` VALUES ('52639', '405', '3', '42977');
INSERT INTO `count_lane_record` VALUES ('52640', '405', '2', '42978');
INSERT INTO `count_lane_record` VALUES ('52641', '405', '3', '42978');
INSERT INTO `count_lane_record` VALUES ('52642', '405', '2', '42979');
INSERT INTO `count_lane_record` VALUES ('52643', '405', '3', '42979');
INSERT INTO `count_lane_record` VALUES ('52644', '405', '2', '42980');
INSERT INTO `count_lane_record` VALUES ('52645', '405', '3', '42980');
INSERT INTO `count_lane_record` VALUES ('52646', '405', '2', '42981');
INSERT INTO `count_lane_record` VALUES ('52647', '405', '3', '42981');
INSERT INTO `count_lane_record` VALUES ('52648', '405', '2', '42982');
INSERT INTO `count_lane_record` VALUES ('52649', '405', '3', '42982');
INSERT INTO `count_lane_record` VALUES ('52650', '405', '2', '42983');
INSERT INTO `count_lane_record` VALUES ('52651', '405', '3', '42983');
INSERT INTO `count_lane_record` VALUES ('52652', '405', '2', '42984');
INSERT INTO `count_lane_record` VALUES ('52653', '405', '3', '42984');
INSERT INTO `count_lane_record` VALUES ('52654', '405', '2', '42985');
INSERT INTO `count_lane_record` VALUES ('52655', '405', '3', '42985');
INSERT INTO `count_lane_record` VALUES ('52656', '405', '2', '42986');
INSERT INTO `count_lane_record` VALUES ('52657', '405', '3', '42986');
INSERT INTO `count_lane_record` VALUES ('52658', '405', '2', '42987');
INSERT INTO `count_lane_record` VALUES ('52659', '405', '3', '42987');
INSERT INTO `count_lane_record` VALUES ('52660', '405', '2', '42988');
INSERT INTO `count_lane_record` VALUES ('52661', '405', '3', '42988');
INSERT INTO `count_lane_record` VALUES ('52662', '405', '2', '42989');
INSERT INTO `count_lane_record` VALUES ('52663', '405', '3', '42989');
INSERT INTO `count_lane_record` VALUES ('52664', '405', '2', '42990');
INSERT INTO `count_lane_record` VALUES ('52665', '405', '3', '42990');
INSERT INTO `count_lane_record` VALUES ('52666', '405', '2', '42991');
INSERT INTO `count_lane_record` VALUES ('52667', '405', '3', '42991');
INSERT INTO `count_lane_record` VALUES ('52668', '405', '2', '42992');
INSERT INTO `count_lane_record` VALUES ('52669', '405', '3', '42992');
INSERT INTO `count_lane_record` VALUES ('52670', '405', '2', '42993');
INSERT INTO `count_lane_record` VALUES ('52671', '405', '3', '42993');
INSERT INTO `count_lane_record` VALUES ('52672', '405', '2', '42994');
INSERT INTO `count_lane_record` VALUES ('52673', '405', '3', '42994');
INSERT INTO `count_lane_record` VALUES ('52674', '405', '2', '42995');
INSERT INTO `count_lane_record` VALUES ('52675', '405', '3', '42995');
INSERT INTO `count_lane_record` VALUES ('52676', '405', '2', '42996');
INSERT INTO `count_lane_record` VALUES ('52677', '405', '3', '42996');
INSERT INTO `count_lane_record` VALUES ('52678', '405', '2', '42997');
INSERT INTO `count_lane_record` VALUES ('52679', '405', '3', '42997');
INSERT INTO `count_lane_record` VALUES ('52680', '405', '2', '42998');
INSERT INTO `count_lane_record` VALUES ('52681', '405', '3', '42998');
INSERT INTO `count_lane_record` VALUES ('52682', '405', '2', '42999');
INSERT INTO `count_lane_record` VALUES ('52683', '405', '3', '42999');
INSERT INTO `count_lane_record` VALUES ('52684', '405', '2', '43000');
INSERT INTO `count_lane_record` VALUES ('52685', '405', '3', '43000');
INSERT INTO `count_lane_record` VALUES ('52686', '405', '2', '43001');
INSERT INTO `count_lane_record` VALUES ('52687', '405', '3', '43001');
INSERT INTO `count_lane_record` VALUES ('52688', '405', '2', '43002');
INSERT INTO `count_lane_record` VALUES ('52689', '405', '3', '43002');
INSERT INTO `count_lane_record` VALUES ('52690', '405', '2', '43003');
INSERT INTO `count_lane_record` VALUES ('52691', '405', '3', '43003');
INSERT INTO `count_lane_record` VALUES ('52692', '405', '2', '43004');
INSERT INTO `count_lane_record` VALUES ('52693', '405', '3', '43004');
INSERT INTO `count_lane_record` VALUES ('52694', '405', '2', '43005');
INSERT INTO `count_lane_record` VALUES ('52695', '405', '3', '43005');
INSERT INTO `count_lane_record` VALUES ('52696', '405', '2', '43006');
INSERT INTO `count_lane_record` VALUES ('52697', '405', '3', '43006');
INSERT INTO `count_lane_record` VALUES ('52698', '405', '2', '43007');
INSERT INTO `count_lane_record` VALUES ('52699', '405', '3', '43007');
INSERT INTO `count_lane_record` VALUES ('52700', '405', '2', '43008');
INSERT INTO `count_lane_record` VALUES ('52701', '405', '3', '43008');
INSERT INTO `count_lane_record` VALUES ('52702', '405', '2', '43009');
INSERT INTO `count_lane_record` VALUES ('52703', '405', '3', '43009');
INSERT INTO `count_lane_record` VALUES ('52704', '405', '2', '43010');
INSERT INTO `count_lane_record` VALUES ('52705', '405', '3', '43010');
INSERT INTO `count_lane_record` VALUES ('52706', '405', '2', '43011');
INSERT INTO `count_lane_record` VALUES ('52707', '405', '3', '43011');
INSERT INTO `count_lane_record` VALUES ('52708', '405', '2', '43012');
INSERT INTO `count_lane_record` VALUES ('52709', '405', '3', '43012');
INSERT INTO `count_lane_record` VALUES ('52710', '405', '2', '43013');
INSERT INTO `count_lane_record` VALUES ('52711', '405', '3', '43013');
INSERT INTO `count_lane_record` VALUES ('52712', '405', '2', '43014');
INSERT INTO `count_lane_record` VALUES ('52713', '405', '3', '43014');
INSERT INTO `count_lane_record` VALUES ('52714', '405', '2', '43015');
INSERT INTO `count_lane_record` VALUES ('52715', '405', '3', '43015');
INSERT INTO `count_lane_record` VALUES ('52716', '405', '2', '43016');
INSERT INTO `count_lane_record` VALUES ('52717', '405', '3', '43016');
INSERT INTO `count_lane_record` VALUES ('52718', '405', '2', '43017');
INSERT INTO `count_lane_record` VALUES ('52719', '405', '3', '43017');
INSERT INTO `count_lane_record` VALUES ('52720', '405', '2', '43018');
INSERT INTO `count_lane_record` VALUES ('52721', '405', '3', '43018');
INSERT INTO `count_lane_record` VALUES ('52722', '405', '2', '43019');
INSERT INTO `count_lane_record` VALUES ('52723', '405', '3', '43019');
INSERT INTO `count_lane_record` VALUES ('52724', '405', '2', '43020');
INSERT INTO `count_lane_record` VALUES ('52725', '405', '3', '43020');
INSERT INTO `count_lane_record` VALUES ('52726', '405', '2', '43021');
INSERT INTO `count_lane_record` VALUES ('52727', '405', '3', '43021');
INSERT INTO `count_lane_record` VALUES ('52728', '405', '2', '43022');
INSERT INTO `count_lane_record` VALUES ('52729', '405', '3', '43022');
INSERT INTO `count_lane_record` VALUES ('52730', '405', '2', '43023');
INSERT INTO `count_lane_record` VALUES ('52731', '405', '3', '43023');
INSERT INTO `count_lane_record` VALUES ('52732', '405', '2', '43024');
INSERT INTO `count_lane_record` VALUES ('52733', '405', '3', '43024');
INSERT INTO `count_lane_record` VALUES ('52734', '405', '2', '43025');
INSERT INTO `count_lane_record` VALUES ('52735', '405', '3', '43025');
INSERT INTO `count_lane_record` VALUES ('52736', '405', '2', '43026');
INSERT INTO `count_lane_record` VALUES ('52737', '405', '3', '43026');
INSERT INTO `count_lane_record` VALUES ('52738', '405', '2', '43027');
INSERT INTO `count_lane_record` VALUES ('52739', '405', '3', '43027');
INSERT INTO `count_lane_record` VALUES ('52740', '405', '2', '43028');
INSERT INTO `count_lane_record` VALUES ('52741', '405', '3', '43028');
INSERT INTO `count_lane_record` VALUES ('52742', '405', '2', '43029');
INSERT INTO `count_lane_record` VALUES ('52743', '405', '3', '43029');
INSERT INTO `count_lane_record` VALUES ('52744', '405', '2', '43030');
INSERT INTO `count_lane_record` VALUES ('52745', '405', '3', '43030');
INSERT INTO `count_lane_record` VALUES ('52746', '405', '2', '43031');
INSERT INTO `count_lane_record` VALUES ('52747', '405', '3', '43031');
INSERT INTO `count_lane_record` VALUES ('52748', '405', '2', '43032');
INSERT INTO `count_lane_record` VALUES ('52749', '405', '3', '43032');
INSERT INTO `count_lane_record` VALUES ('52750', '405', '2', '43033');
INSERT INTO `count_lane_record` VALUES ('52751', '405', '3', '43033');
INSERT INTO `count_lane_record` VALUES ('52752', '405', '2', '43034');
INSERT INTO `count_lane_record` VALUES ('52753', '405', '3', '43034');
INSERT INTO `count_lane_record` VALUES ('52754', '405', '2', '43035');
INSERT INTO `count_lane_record` VALUES ('52755', '405', '3', '43035');
INSERT INTO `count_lane_record` VALUES ('52756', '405', '2', '43036');
INSERT INTO `count_lane_record` VALUES ('52757', '405', '3', '43036');
INSERT INTO `count_lane_record` VALUES ('52758', '405', '2', '43037');
INSERT INTO `count_lane_record` VALUES ('52759', '405', '3', '43037');
INSERT INTO `count_lane_record` VALUES ('52760', '405', '2', '43038');
INSERT INTO `count_lane_record` VALUES ('52761', '405', '3', '43038');
INSERT INTO `count_lane_record` VALUES ('52762', '405', '2', '43039');
INSERT INTO `count_lane_record` VALUES ('52763', '405', '3', '43039');
INSERT INTO `count_lane_record` VALUES ('52764', '405', '2', '43040');
INSERT INTO `count_lane_record` VALUES ('52765', '405', '3', '43040');
INSERT INTO `count_lane_record` VALUES ('52766', '405', '2', '43041');
INSERT INTO `count_lane_record` VALUES ('52767', '405', '3', '43041');
INSERT INTO `count_lane_record` VALUES ('52768', '405', '2', '43042');
INSERT INTO `count_lane_record` VALUES ('52769', '405', '3', '43042');
INSERT INTO `count_lane_record` VALUES ('52770', '405', '2', '43043');
INSERT INTO `count_lane_record` VALUES ('52771', '405', '3', '43043');
INSERT INTO `count_lane_record` VALUES ('52772', '405', '2', '43044');
INSERT INTO `count_lane_record` VALUES ('52773', '405', '3', '43044');
INSERT INTO `count_lane_record` VALUES ('52774', '405', '2', '43045');
INSERT INTO `count_lane_record` VALUES ('52775', '405', '3', '43045');
INSERT INTO `count_lane_record` VALUES ('52776', '405', '2', '43046');
INSERT INTO `count_lane_record` VALUES ('52777', '405', '3', '43046');
INSERT INTO `count_lane_record` VALUES ('52778', '405', '2', '43047');
INSERT INTO `count_lane_record` VALUES ('52779', '405', '3', '43047');
INSERT INTO `count_lane_record` VALUES ('52780', '405', '2', '43048');
INSERT INTO `count_lane_record` VALUES ('52781', '405', '3', '43048');
INSERT INTO `count_lane_record` VALUES ('52782', '405', '2', '43049');
INSERT INTO `count_lane_record` VALUES ('52783', '405', '3', '43049');
INSERT INTO `count_lane_record` VALUES ('52784', '405', '2', '43050');
INSERT INTO `count_lane_record` VALUES ('52785', '405', '3', '43050');
INSERT INTO `count_lane_record` VALUES ('52786', '405', '2', '43051');
INSERT INTO `count_lane_record` VALUES ('52787', '405', '3', '43051');
INSERT INTO `count_lane_record` VALUES ('52788', '405', '2', '43052');
INSERT INTO `count_lane_record` VALUES ('52789', '405', '3', '43052');
INSERT INTO `count_lane_record` VALUES ('52790', '405', '2', '43053');
INSERT INTO `count_lane_record` VALUES ('52791', '405', '3', '43053');
INSERT INTO `count_lane_record` VALUES ('52792', '405', '2', '43054');
INSERT INTO `count_lane_record` VALUES ('52793', '405', '3', '43054');
INSERT INTO `count_lane_record` VALUES ('52794', '405', '2', '43055');
INSERT INTO `count_lane_record` VALUES ('52795', '405', '3', '43055');
INSERT INTO `count_lane_record` VALUES ('52796', '405', '2', '43056');
INSERT INTO `count_lane_record` VALUES ('52797', '405', '3', '43056');
INSERT INTO `count_lane_record` VALUES ('52798', '405', '2', '43057');
INSERT INTO `count_lane_record` VALUES ('52799', '405', '3', '43057');
INSERT INTO `count_lane_record` VALUES ('52800', '405', '2', '43058');
INSERT INTO `count_lane_record` VALUES ('52801', '405', '3', '43058');
INSERT INTO `count_lane_record` VALUES ('52802', '405', '2', '43059');
INSERT INTO `count_lane_record` VALUES ('52803', '405', '3', '43059');
INSERT INTO `count_lane_record` VALUES ('52804', '405', '2', '43060');
INSERT INTO `count_lane_record` VALUES ('52805', '405', '3', '43060');
INSERT INTO `count_lane_record` VALUES ('52806', '405', '2', '43061');
INSERT INTO `count_lane_record` VALUES ('52807', '405', '3', '43061');
INSERT INTO `count_lane_record` VALUES ('52808', '405', '2', '43062');
INSERT INTO `count_lane_record` VALUES ('52809', '405', '3', '43062');
INSERT INTO `count_lane_record` VALUES ('52810', '405', '2', '43063');
INSERT INTO `count_lane_record` VALUES ('52811', '405', '3', '43063');
INSERT INTO `count_lane_record` VALUES ('52812', '405', '2', '43064');
INSERT INTO `count_lane_record` VALUES ('52813', '405', '3', '43064');
INSERT INTO `count_lane_record` VALUES ('52814', '405', '2', '43065');
INSERT INTO `count_lane_record` VALUES ('52815', '405', '3', '43065');
INSERT INTO `count_lane_record` VALUES ('52816', '405', '2', '43066');
INSERT INTO `count_lane_record` VALUES ('52817', '405', '3', '43066');
INSERT INTO `count_lane_record` VALUES ('52818', '405', '2', '43067');
INSERT INTO `count_lane_record` VALUES ('52819', '405', '3', '43067');
INSERT INTO `count_lane_record` VALUES ('52820', '405', '2', '43068');
INSERT INTO `count_lane_record` VALUES ('52821', '405', '3', '43068');
INSERT INTO `count_lane_record` VALUES ('52822', '405', '2', '43069');
INSERT INTO `count_lane_record` VALUES ('52823', '405', '3', '43069');
INSERT INTO `count_lane_record` VALUES ('52824', '405', '2', '43070');
INSERT INTO `count_lane_record` VALUES ('52825', '405', '3', '43070');
INSERT INTO `count_lane_record` VALUES ('52826', '405', '2', '43071');
INSERT INTO `count_lane_record` VALUES ('52827', '405', '3', '43071');
INSERT INTO `count_lane_record` VALUES ('52828', '405', '2', '43072');
INSERT INTO `count_lane_record` VALUES ('52829', '405', '3', '43072');
INSERT INTO `count_lane_record` VALUES ('52830', '405', '2', '43073');
INSERT INTO `count_lane_record` VALUES ('52831', '405', '3', '43073');
INSERT INTO `count_lane_record` VALUES ('52832', '405', '2', '43074');
INSERT INTO `count_lane_record` VALUES ('52833', '405', '3', '43074');
INSERT INTO `count_lane_record` VALUES ('52834', '405', '2', '43075');
INSERT INTO `count_lane_record` VALUES ('52835', '405', '3', '43075');
INSERT INTO `count_lane_record` VALUES ('52836', '405', '2', '43076');
INSERT INTO `count_lane_record` VALUES ('52837', '405', '3', '43076');
INSERT INTO `count_lane_record` VALUES ('52838', '405', '2', '43077');
INSERT INTO `count_lane_record` VALUES ('52839', '405', '3', '43077');
INSERT INTO `count_lane_record` VALUES ('52840', '405', '2', '43078');
INSERT INTO `count_lane_record` VALUES ('52841', '405', '3', '43078');
INSERT INTO `count_lane_record` VALUES ('52842', '405', '2', '43079');
INSERT INTO `count_lane_record` VALUES ('52843', '405', '3', '43079');
INSERT INTO `count_lane_record` VALUES ('52844', '405', '2', '43080');
INSERT INTO `count_lane_record` VALUES ('52845', '405', '3', '43080');
INSERT INTO `count_lane_record` VALUES ('52846', '405', '2', '43081');
INSERT INTO `count_lane_record` VALUES ('52847', '405', '3', '43081');
INSERT INTO `count_lane_record` VALUES ('52848', '405', '2', '43082');
INSERT INTO `count_lane_record` VALUES ('52849', '405', '3', '43082');
INSERT INTO `count_lane_record` VALUES ('52850', '405', '2', '43083');
INSERT INTO `count_lane_record` VALUES ('52851', '405', '3', '43083');
INSERT INTO `count_lane_record` VALUES ('52852', '405', '2', '43084');
INSERT INTO `count_lane_record` VALUES ('52853', '405', '3', '43084');
INSERT INTO `count_lane_record` VALUES ('52854', '405', '2', '43085');
INSERT INTO `count_lane_record` VALUES ('52855', '405', '3', '43085');
INSERT INTO `count_lane_record` VALUES ('52856', '405', '2', '43086');
INSERT INTO `count_lane_record` VALUES ('52857', '405', '3', '43086');
INSERT INTO `count_lane_record` VALUES ('52858', '405', '2', '43087');
INSERT INTO `count_lane_record` VALUES ('52859', '405', '3', '43087');
INSERT INTO `count_lane_record` VALUES ('52860', '405', '2', '43088');
INSERT INTO `count_lane_record` VALUES ('52861', '405', '3', '43088');
INSERT INTO `count_lane_record` VALUES ('52862', '405', '2', '43089');
INSERT INTO `count_lane_record` VALUES ('52863', '405', '3', '43089');
INSERT INTO `count_lane_record` VALUES ('52864', '405', '2', '43090');
INSERT INTO `count_lane_record` VALUES ('52865', '405', '3', '43090');
INSERT INTO `count_lane_record` VALUES ('52866', '405', '2', '43091');
INSERT INTO `count_lane_record` VALUES ('52867', '405', '3', '43091');
INSERT INTO `count_lane_record` VALUES ('52868', '405', '2', '43092');
INSERT INTO `count_lane_record` VALUES ('52869', '405', '3', '43092');
INSERT INTO `count_lane_record` VALUES ('52870', '405', '2', '43093');
INSERT INTO `count_lane_record` VALUES ('52871', '405', '3', '43093');
INSERT INTO `count_lane_record` VALUES ('52872', '202', '2', '43094');
INSERT INTO `count_lane_record` VALUES ('52873', '202', '3', '43094');
INSERT INTO `count_lane_record` VALUES ('52874', '0', '2', '43095');
INSERT INTO `count_lane_record` VALUES ('52875', '0', '3', '43095');
INSERT INTO `count_lane_record` VALUES ('52876', '0', '2', '43096');
INSERT INTO `count_lane_record` VALUES ('52877', '0', '3', '43096');
INSERT INTO `count_lane_record` VALUES ('52878', '0', '2', '43097');
INSERT INTO `count_lane_record` VALUES ('52879', '0', '3', '43097');
INSERT INTO `count_lane_record` VALUES ('52880', '0', '2', '43098');
INSERT INTO `count_lane_record` VALUES ('52881', '0', '3', '43098');
INSERT INTO `count_lane_record` VALUES ('52882', '0', '2', '43099');
INSERT INTO `count_lane_record` VALUES ('52883', '0', '3', '43099');
INSERT INTO `count_lane_record` VALUES ('52884', '0', '2', '43100');
INSERT INTO `count_lane_record` VALUES ('52885', '0', '3', '43100');
INSERT INTO `count_lane_record` VALUES ('52886', '0', '2', '43101');
INSERT INTO `count_lane_record` VALUES ('52887', '0', '3', '43101');
INSERT INTO `count_lane_record` VALUES ('52888', '0', '2', '43102');
INSERT INTO `count_lane_record` VALUES ('52889', '0', '3', '43102');
INSERT INTO `count_lane_record` VALUES ('52890', '0', '2', '43103');
INSERT INTO `count_lane_record` VALUES ('52891', '0', '3', '43103');
INSERT INTO `count_lane_record` VALUES ('52892', '0', '2', '43104');
INSERT INTO `count_lane_record` VALUES ('52893', '0', '3', '43104');
INSERT INTO `count_lane_record` VALUES ('52894', '0', '2', '43105');
INSERT INTO `count_lane_record` VALUES ('52895', '0', '3', '43105');
INSERT INTO `count_lane_record` VALUES ('52896', '0', '2', '43106');
INSERT INTO `count_lane_record` VALUES ('52897', '0', '3', '43106');
INSERT INTO `count_lane_record` VALUES ('52898', '0', '2', '43107');
INSERT INTO `count_lane_record` VALUES ('52899', '0', '3', '43107');
INSERT INTO `count_lane_record` VALUES ('52900', '0', '2', '43108');
INSERT INTO `count_lane_record` VALUES ('52901', '0', '3', '43108');
INSERT INTO `count_lane_record` VALUES ('52902', '0', '2', '43109');
INSERT INTO `count_lane_record` VALUES ('52903', '0', '3', '43109');
INSERT INTO `count_lane_record` VALUES ('52904', '0', '2', '43110');
INSERT INTO `count_lane_record` VALUES ('52905', '0', '3', '43110');
INSERT INTO `count_lane_record` VALUES ('52906', '0', '2', '43111');
INSERT INTO `count_lane_record` VALUES ('52907', '0', '3', '43111');
INSERT INTO `count_lane_record` VALUES ('52908', '0', '2', '43112');
INSERT INTO `count_lane_record` VALUES ('52909', '0', '3', '43112');
INSERT INTO `count_lane_record` VALUES ('52910', '0', '2', '43113');
INSERT INTO `count_lane_record` VALUES ('52911', '0', '3', '43113');
INSERT INTO `count_lane_record` VALUES ('52912', '0', '2', '43114');
INSERT INTO `count_lane_record` VALUES ('52913', '0', '3', '43114');
INSERT INTO `count_lane_record` VALUES ('52914', '0', '2', '43115');
INSERT INTO `count_lane_record` VALUES ('52915', '0', '3', '43115');
INSERT INTO `count_lane_record` VALUES ('52916', '0', '2', '43116');
INSERT INTO `count_lane_record` VALUES ('52917', '0', '3', '43116');
INSERT INTO `count_lane_record` VALUES ('52918', '0', '2', '43117');
INSERT INTO `count_lane_record` VALUES ('52919', '0', '3', '43117');
INSERT INTO `count_lane_record` VALUES ('52920', '0', '2', '43118');
INSERT INTO `count_lane_record` VALUES ('52921', '0', '3', '43118');
INSERT INTO `count_lane_record` VALUES ('52922', '0', '2', '43119');
INSERT INTO `count_lane_record` VALUES ('52923', '0', '3', '43119');
INSERT INTO `count_lane_record` VALUES ('52924', '0', '2', '43120');
INSERT INTO `count_lane_record` VALUES ('52925', '0', '3', '43120');
INSERT INTO `count_lane_record` VALUES ('52926', '0', '2', '43121');
INSERT INTO `count_lane_record` VALUES ('52927', '0', '3', '43121');

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
INSERT INTO `count_record` VALUES ('42081', '2011-01-13', '15:34:00', '15', '66');
INSERT INTO `count_record` VALUES ('42082', '2011-01-13', '15:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42083', '2011-01-13', '16:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42084', '2011-01-13', '16:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42085', '2011-01-13', '16:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42086', '2011-01-13', '16:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42087', '2011-01-13', '17:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42088', '2011-01-13', '17:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42089', '2011-01-13', '17:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42090', '2011-01-13', '17:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42091', '2011-01-13', '18:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42092', '2011-01-13', '18:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42093', '2011-01-13', '18:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42094', '2011-01-13', '18:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42095', '2011-01-13', '19:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42096', '2011-01-13', '19:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42097', '2011-01-13', '19:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42098', '2011-01-13', '19:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42099', '2011-01-13', '20:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42100', '2011-01-13', '20:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42101', '2011-01-13', '20:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42102', '2011-01-13', '20:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42103', '2011-01-13', '21:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42104', '2011-01-13', '21:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42105', '2011-01-13', '21:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42106', '2011-01-13', '21:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42107', '2011-01-13', '22:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42108', '2011-01-13', '22:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42109', '2011-01-13', '22:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42110', '2011-01-13', '22:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42111', '2011-01-13', '23:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42112', '2011-01-13', '23:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42113', '2011-01-13', '23:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42114', '2011-01-13', '23:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42115', '2011-01-14', '00:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42116', '2011-01-14', '00:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42117', '2011-01-14', '00:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42118', '2011-01-14', '00:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42119', '2011-01-14', '01:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42120', '2011-01-14', '01:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42121', '2011-01-14', '01:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42122', '2011-01-14', '01:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42123', '2011-01-14', '02:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42124', '2011-01-14', '02:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42125', '2011-01-14', '02:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42126', '2011-01-14', '02:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42127', '2011-01-14', '03:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42128', '2011-01-14', '03:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42129', '2011-01-14', '03:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42130', '2011-01-14', '03:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42131', '2011-01-14', '04:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42132', '2011-01-14', '04:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42133', '2011-01-14', '04:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42134', '2011-01-14', '04:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42135', '2011-01-14', '05:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42136', '2011-01-14', '05:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42137', '2011-01-14', '05:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42138', '2011-01-14', '05:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42139', '2011-01-14', '06:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42140', '2011-01-14', '06:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42141', '2011-01-14', '06:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42142', '2011-01-14', '06:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42143', '2011-01-14', '07:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42144', '2011-01-14', '07:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42145', '2011-01-14', '07:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42146', '2011-01-14', '07:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42147', '2011-01-14', '08:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42148', '2011-01-14', '08:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42149', '2011-01-14', '08:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42150', '2011-01-14', '08:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42151', '2011-01-14', '09:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42152', '2011-01-14', '09:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42153', '2011-01-14', '09:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42154', '2011-01-14', '09:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42155', '2011-01-14', '10:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42156', '2011-01-14', '10:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42157', '2011-01-14', '10:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42158', '2011-01-14', '10:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42159', '2011-01-14', '11:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42160', '2011-01-14', '11:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42161', '2011-01-14', '11:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42162', '2011-01-14', '11:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42163', '2011-01-14', '12:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42164', '2011-01-14', '12:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42165', '2011-01-14', '12:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42166', '2011-01-14', '12:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42167', '2011-01-14', '13:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42168', '2011-01-14', '13:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42169', '2011-01-14', '13:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42170', '2011-01-14', '13:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42171', '2011-01-14', '14:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42172', '2011-01-14', '14:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42173', '2011-01-14', '14:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42174', '2011-01-14', '14:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42175', '2011-01-14', '15:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42176', '2011-01-14', '15:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42177', '2011-01-14', '15:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42178', '2011-01-14', '15:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42179', '2011-01-14', '16:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42180', '2011-01-14', '16:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42181', '2011-01-14', '16:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42182', '2011-01-14', '16:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42183', '2011-01-14', '17:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42184', '2011-01-14', '17:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42185', '2011-01-14', '17:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42186', '2011-01-14', '17:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42187', '2011-01-14', '18:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42188', '2011-01-14', '18:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42189', '2011-01-14', '18:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42190', '2011-01-14', '18:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42191', '2011-01-14', '19:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42192', '2011-01-14', '19:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42193', '2011-01-14', '19:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42194', '2011-01-14', '19:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42195', '2011-01-14', '20:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42196', '2011-01-14', '20:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42197', '2011-01-14', '20:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42198', '2011-01-14', '20:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42199', '2011-01-14', '21:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42200', '2011-01-14', '21:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42201', '2011-01-14', '21:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42202', '2011-01-14', '21:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42203', '2011-01-14', '22:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42204', '2011-01-14', '22:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42205', '2011-01-14', '22:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42206', '2011-01-14', '22:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42207', '2011-01-14', '23:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42208', '2011-01-14', '23:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42209', '2011-01-14', '23:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42210', '2011-01-14', '23:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42211', '2011-01-15', '00:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42212', '2011-01-15', '00:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42213', '2011-01-15', '00:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42214', '2011-01-15', '00:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42215', '2011-01-15', '01:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42216', '2011-01-15', '01:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42217', '2011-01-15', '01:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42218', '2011-01-15', '01:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42219', '2011-01-15', '02:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42220', '2011-01-15', '02:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42221', '2011-01-15', '02:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42222', '2011-01-15', '02:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42223', '2011-01-15', '03:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42224', '2011-01-15', '03:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42225', '2011-01-15', '03:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42226', '2011-01-15', '03:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42227', '2011-01-15', '04:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42228', '2011-01-15', '04:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42229', '2011-01-15', '04:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42230', '2011-01-15', '04:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42231', '2011-01-15', '05:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42232', '2011-01-15', '05:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42233', '2011-01-15', '05:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42234', '2011-01-15', '05:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42235', '2011-01-15', '06:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42236', '2011-01-15', '06:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42237', '2011-01-15', '06:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42238', '2011-01-15', '06:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42239', '2011-01-15', '07:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42240', '2011-01-15', '07:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42241', '2011-01-15', '07:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42242', '2011-01-15', '07:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42243', '2011-01-15', '08:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42244', '2011-01-15', '08:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42245', '2011-01-15', '08:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42246', '2011-01-15', '08:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42247', '2011-01-15', '09:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42248', '2011-01-15', '09:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42249', '2011-01-15', '09:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42250', '2011-01-15', '09:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42251', '2011-01-15', '10:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42252', '2011-01-15', '10:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42253', '2011-01-15', '10:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42254', '2011-01-15', '10:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42255', '2011-01-15', '11:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42256', '2011-01-15', '11:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42257', '2011-01-15', '11:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42258', '2011-01-15', '11:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42259', '2011-01-15', '12:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42260', '2011-01-15', '12:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42261', '2011-01-15', '12:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42262', '2011-01-15', '12:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42263', '2011-01-15', '13:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42264', '2011-01-15', '13:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42265', '2011-01-15', '13:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42266', '2011-01-15', '13:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42267', '2011-01-15', '14:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42268', '2011-01-15', '14:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42269', '2011-01-15', '14:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42270', '2011-01-15', '14:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42271', '2011-01-15', '15:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42272', '2011-01-15', '15:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42273', '2011-01-15', '15:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42274', '2011-01-15', '15:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42275', '2011-01-15', '16:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42276', '2011-01-15', '16:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42277', '2011-01-15', '16:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42278', '2011-01-15', '16:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42279', '2011-01-15', '17:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42280', '2011-01-15', '17:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42281', '2011-01-15', '17:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42282', '2011-01-15', '17:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42283', '2011-01-15', '18:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42284', '2011-01-15', '18:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42285', '2011-01-15', '18:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42286', '2011-01-15', '18:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42287', '2011-01-15', '19:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42288', '2011-01-15', '19:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42289', '2011-01-15', '19:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42290', '2011-01-15', '19:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42291', '2011-01-15', '20:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42292', '2011-01-15', '20:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42293', '2011-01-15', '20:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42294', '2011-01-15', '20:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42295', '2011-01-15', '21:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42296', '2011-01-15', '21:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42297', '2011-01-15', '21:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42298', '2011-01-15', '21:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42299', '2011-01-15', '22:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42300', '2011-01-15', '22:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42301', '2011-01-15', '22:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42302', '2011-01-15', '22:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42303', '2011-01-15', '23:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42304', '2011-01-15', '23:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42305', '2011-01-15', '23:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42306', '2011-01-15', '23:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42307', '2011-01-16', '00:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42308', '2011-01-16', '00:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42309', '2011-01-16', '00:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42310', '2011-01-16', '00:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42311', '2011-01-16', '01:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42312', '2011-01-16', '01:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42313', '2011-01-16', '01:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42314', '2011-01-16', '01:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42315', '2011-01-16', '02:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42316', '2011-01-16', '02:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42317', '2011-01-16', '02:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42318', '2011-01-16', '02:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42319', '2011-01-16', '03:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42320', '2011-01-16', '03:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42321', '2011-01-16', '03:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42322', '2011-01-16', '03:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42323', '2011-01-16', '04:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42324', '2011-01-16', '04:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42325', '2011-01-16', '04:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42326', '2011-01-16', '04:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42327', '2011-01-16', '05:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42328', '2011-01-16', '05:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42329', '2011-01-16', '05:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42330', '2011-01-16', '05:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42331', '2011-01-16', '06:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42332', '2011-01-16', '06:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42333', '2011-01-16', '06:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42334', '2011-01-16', '06:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42335', '2011-01-16', '07:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42336', '2011-01-16', '07:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42337', '2011-01-16', '07:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42338', '2011-01-16', '07:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42339', '2011-01-16', '08:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42340', '2011-01-16', '08:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42341', '2011-01-16', '08:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42342', '2011-01-16', '08:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42343', '2011-01-16', '09:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42344', '2011-01-16', '09:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42345', '2011-01-16', '09:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42346', '2011-01-16', '09:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42347', '2011-01-16', '10:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42348', '2011-01-16', '10:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42349', '2011-01-16', '10:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42350', '2011-01-16', '10:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42351', '2011-01-16', '11:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42352', '2011-01-16', '11:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42353', '2011-01-16', '11:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42354', '2011-01-16', '11:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42355', '2011-01-16', '12:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42356', '2011-01-16', '12:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42357', '2011-01-16', '12:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42358', '2011-01-16', '12:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42359', '2011-01-16', '13:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42360', '2011-01-16', '13:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42361', '2011-01-16', '13:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42362', '2011-01-16', '13:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42363', '2011-01-16', '14:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42364', '2011-01-16', '14:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42365', '2011-01-16', '14:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42366', '2011-01-16', '14:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42367', '2011-01-16', '15:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42368', '2011-01-16', '15:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42369', '2011-01-16', '15:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42370', '2011-01-16', '15:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42371', '2011-01-16', '16:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42372', '2011-01-16', '16:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42373', '2011-01-16', '16:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42374', '2011-01-16', '16:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42375', '2011-01-16', '17:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42376', '2011-01-16', '17:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42377', '2011-01-16', '17:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42378', '2011-01-16', '17:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42379', '2011-01-16', '18:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42380', '2011-01-16', '18:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42381', '2011-01-16', '18:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42382', '2011-01-16', '18:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42383', '2011-01-16', '19:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42384', '2011-01-16', '19:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42385', '2011-01-16', '19:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42386', '2011-01-16', '19:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42387', '2011-01-16', '20:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42388', '2011-01-16', '20:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42389', '2011-01-16', '20:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42390', '2011-01-16', '20:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42391', '2011-01-16', '21:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42392', '2011-01-16', '21:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42393', '2011-01-16', '21:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42394', '2011-01-16', '21:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42395', '2011-01-16', '22:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42396', '2011-01-16', '22:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42397', '2011-01-16', '22:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42398', '2011-01-16', '22:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42399', '2011-01-16', '23:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42400', '2011-01-16', '23:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42401', '2011-01-16', '23:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42402', '2011-01-16', '23:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42403', '2011-01-17', '00:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42404', '2011-01-17', '00:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42405', '2011-01-17', '00:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42406', '2011-01-17', '00:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42407', '2011-01-17', '01:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42408', '2011-01-17', '01:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42409', '2011-01-17', '01:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42410', '2011-01-17', '01:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42411', '2011-01-17', '02:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42412', '2011-01-17', '02:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42413', '2011-01-17', '02:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42414', '2011-01-17', '02:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42415', '2011-01-17', '03:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42416', '2011-01-17', '03:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42417', '2011-01-17', '03:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42418', '2011-01-17', '03:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42419', '2011-01-17', '04:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42420', '2011-01-17', '04:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42421', '2011-01-17', '04:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42422', '2011-01-17', '04:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42423', '2011-01-17', '05:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42424', '2011-01-17', '05:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42425', '2011-01-17', '05:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42426', '2011-01-17', '05:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42427', '2011-01-17', '06:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42428', '2011-01-17', '06:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42429', '2011-01-17', '06:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42430', '2011-01-17', '06:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42431', '2011-01-17', '07:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42432', '2011-01-17', '07:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42433', '2011-01-17', '07:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42434', '2011-01-17', '07:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42435', '2011-01-17', '08:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42436', '2011-01-17', '08:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42437', '2011-01-17', '08:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42438', '2011-01-17', '08:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42439', '2011-01-17', '09:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42440', '2011-01-17', '09:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42441', '2011-01-17', '09:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42442', '2011-01-17', '09:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42443', '2011-01-17', '10:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42444', '2011-01-17', '10:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42445', '2011-01-17', '10:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42446', '2011-01-17', '10:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42447', '2011-01-17', '11:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42448', '2011-01-17', '11:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42449', '2011-01-17', '11:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42450', '2011-01-17', '11:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42451', '2011-01-17', '12:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42452', '2011-01-17', '12:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42453', '2011-01-17', '12:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42454', '2011-01-17', '12:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42455', '2011-01-17', '13:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42456', '2011-01-17', '13:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42457', '2011-01-17', '13:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42458', '2011-01-17', '13:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42459', '2011-01-17', '14:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42460', '2011-01-17', '14:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42461', '2011-01-17', '14:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42462', '2011-01-17', '14:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42463', '2011-01-17', '15:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42464', '2011-01-17', '15:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42465', '2011-01-17', '15:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42466', '2011-01-17', '15:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42467', '2011-01-17', '16:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42468', '2011-01-17', '16:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42469', '2011-01-17', '16:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42470', '2011-01-17', '16:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42471', '2011-01-17', '17:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42472', '2011-01-17', '17:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42473', '2011-01-17', '17:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42474', '2011-01-17', '17:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42475', '2011-01-17', '18:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42476', '2011-01-17', '18:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42477', '2011-01-17', '18:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42478', '2011-01-17', '18:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42479', '2011-01-17', '19:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42480', '2011-01-17', '19:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42481', '2011-01-17', '19:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42482', '2011-01-17', '19:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42483', '2011-01-17', '20:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42484', '2011-01-17', '20:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42485', '2011-01-17', '20:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42486', '2011-01-17', '20:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42487', '2011-01-17', '21:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42488', '2011-01-17', '21:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42489', '2011-01-17', '21:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42490', '2011-01-17', '21:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42491', '2011-01-17', '22:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42492', '2011-01-17', '22:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42493', '2011-01-17', '22:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42494', '2011-01-17', '22:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42495', '2011-01-17', '23:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42496', '2011-01-17', '23:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42497', '2011-01-17', '23:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42498', '2011-01-17', '23:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42499', '2011-01-18', '00:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42500', '2011-01-18', '00:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42501', '2011-01-18', '00:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42502', '2011-01-18', '00:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42503', '2011-01-18', '01:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42504', '2011-01-18', '01:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42505', '2011-01-18', '01:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42506', '2011-01-18', '01:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42507', '2011-01-18', '02:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42508', '2011-01-18', '02:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42509', '2011-01-18', '02:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42510', '2011-01-18', '02:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42511', '2011-01-18', '03:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42512', '2011-01-18', '03:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42513', '2011-01-18', '03:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42514', '2011-01-18', '03:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42515', '2011-01-18', '04:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42516', '2011-01-18', '04:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42517', '2011-01-18', '04:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42518', '2011-01-18', '04:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42519', '2011-01-18', '05:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42520', '2011-01-18', '05:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42521', '2011-01-18', '05:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42522', '2011-01-18', '05:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42523', '2011-01-18', '06:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42524', '2011-01-18', '06:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42525', '2011-01-18', '06:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42526', '2011-01-18', '06:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42527', '2011-01-18', '07:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42528', '2011-01-18', '07:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42529', '2011-01-18', '07:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42530', '2011-01-18', '07:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42531', '2011-01-18', '08:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42532', '2011-01-18', '08:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42533', '2011-01-18', '08:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42534', '2011-01-18', '08:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42535', '2011-01-18', '09:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42536', '2011-01-18', '09:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42537', '2011-01-18', '09:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42538', '2011-01-18', '09:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42539', '2011-01-18', '10:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42540', '2011-01-18', '10:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42541', '2011-01-18', '10:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42542', '2011-01-18', '10:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42543', '2011-01-18', '11:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42544', '2011-01-18', '11:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42545', '2011-01-18', '11:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42546', '2011-01-18', '11:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42547', '2011-01-18', '12:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42548', '2011-01-18', '12:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42549', '2011-01-18', '12:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42550', '2011-01-18', '12:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42551', '2011-01-18', '13:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42552', '2011-01-18', '13:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42553', '2011-01-18', '13:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42554', '2011-01-18', '13:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42555', '2011-01-18', '14:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42556', '2011-01-18', '14:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42557', '2011-01-18', '14:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42558', '2011-01-18', '14:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42559', '2011-01-18', '15:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42560', '2011-01-18', '15:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42561', '2011-01-18', '15:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42562', '2011-01-18', '15:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42563', '2011-01-18', '16:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42564', '2011-01-18', '16:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42565', '2011-01-18', '16:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42566', '2011-01-18', '16:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42567', '2011-01-18', '17:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42568', '2011-01-18', '17:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42569', '2011-01-18', '17:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42570', '2011-01-18', '17:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42571', '2011-01-18', '18:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42572', '2011-01-18', '18:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42573', '2011-01-18', '18:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42574', '2011-01-18', '18:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42575', '2011-01-18', '19:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42576', '2011-01-18', '19:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42577', '2011-01-18', '19:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42578', '2011-01-18', '19:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42579', '2011-01-18', '20:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42580', '2011-01-18', '20:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42581', '2011-01-18', '20:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42582', '2011-01-18', '20:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42583', '2011-01-18', '21:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42584', '2011-01-18', '21:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42585', '2011-01-18', '21:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42586', '2011-01-18', '21:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42587', '2011-01-18', '22:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42588', '2011-01-18', '22:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42589', '2011-01-18', '22:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42590', '2011-01-18', '22:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42591', '2011-01-18', '23:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42592', '2011-01-18', '23:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42593', '2011-01-18', '23:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42594', '2011-01-18', '23:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42595', '2011-01-19', '00:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42596', '2011-01-19', '00:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42597', '2011-01-19', '00:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42598', '2011-01-19', '00:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42599', '2011-01-19', '01:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42600', '2011-01-19', '01:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42601', '2011-01-19', '01:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42602', '2011-01-19', '01:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42603', '2011-01-19', '02:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42604', '2011-01-19', '02:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42605', '2011-01-19', '02:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42606', '2011-01-19', '02:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42607', '2011-01-19', '03:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42608', '2011-01-19', '03:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42609', '2011-01-19', '03:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42610', '2011-01-19', '03:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42611', '2011-01-19', '04:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42612', '2011-01-19', '04:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42613', '2011-01-19', '04:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42614', '2011-01-19', '04:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42615', '2011-01-19', '05:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42616', '2011-01-19', '05:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42617', '2011-01-19', '05:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42618', '2011-01-19', '05:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42619', '2011-01-19', '06:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42620', '2011-01-19', '06:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42621', '2011-01-19', '06:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42622', '2011-01-19', '06:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42623', '2011-01-19', '07:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42624', '2011-01-19', '07:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42625', '2011-01-19', '07:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42626', '2011-01-19', '07:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42627', '2011-01-19', '08:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42628', '2011-01-19', '08:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42629', '2011-01-19', '08:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42630', '2011-01-19', '08:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42631', '2011-01-19', '09:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42632', '2011-01-19', '09:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42633', '2011-01-19', '09:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42634', '2011-01-19', '09:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42635', '2011-01-19', '10:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42636', '2011-01-19', '10:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42637', '2011-01-19', '10:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42638', '2011-01-19', '10:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42639', '2011-01-19', '11:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42640', '2011-01-19', '11:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42641', '2011-01-19', '11:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42642', '2011-01-19', '11:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42643', '2011-01-19', '12:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42644', '2011-01-19', '12:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42645', '2011-01-19', '12:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42646', '2011-01-19', '12:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42647', '2011-01-19', '13:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42648', '2011-01-19', '13:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42649', '2011-01-19', '13:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42650', '2011-01-19', '13:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42651', '2011-01-19', '14:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42652', '2011-01-19', '14:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42653', '2011-01-19', '14:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42654', '2011-01-19', '14:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42655', '2011-01-19', '15:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42656', '2011-01-19', '15:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42657', '2011-01-19', '15:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42658', '2011-01-19', '15:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42659', '2011-01-19', '16:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42660', '2011-01-19', '16:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42661', '2011-01-19', '16:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42662', '2011-01-19', '16:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42663', '2011-01-19', '17:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42664', '2011-01-19', '17:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42665', '2011-01-19', '17:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42666', '2011-01-19', '17:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42667', '2011-01-19', '18:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42668', '2011-01-19', '18:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42669', '2011-01-19', '18:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42670', '2011-01-19', '18:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42671', '2011-01-19', '19:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42672', '2011-01-19', '19:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42673', '2011-01-19', '19:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42674', '2011-01-19', '19:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42675', '2011-01-19', '20:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42676', '2011-01-19', '20:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42677', '2011-01-19', '20:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42678', '2011-01-19', '20:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42679', '2011-01-19', '21:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42680', '2011-01-19', '21:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42681', '2011-01-19', '21:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42682', '2011-01-19', '21:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42683', '2011-01-19', '22:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42684', '2011-01-19', '22:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42685', '2011-01-19', '22:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42686', '2011-01-19', '22:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42687', '2011-01-19', '23:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42688', '2011-01-19', '23:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42689', '2011-01-19', '23:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42690', '2011-01-19', '23:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42691', '2011-01-20', '00:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42692', '2011-01-20', '00:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42693', '2011-01-20', '00:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42694', '2011-01-20', '00:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42695', '2011-01-20', '01:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42696', '2011-01-20', '01:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42697', '2011-01-20', '01:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42698', '2011-01-20', '01:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42699', '2011-01-20', '02:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42700', '2011-01-20', '02:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42701', '2011-01-20', '02:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42702', '2011-01-20', '02:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42703', '2011-01-20', '03:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42704', '2011-01-20', '03:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42705', '2011-01-20', '03:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42706', '2011-01-20', '03:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42707', '2011-01-20', '04:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42708', '2011-01-20', '04:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42709', '2011-01-20', '04:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42710', '2011-01-20', '04:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42711', '2011-01-20', '05:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42712', '2011-01-20', '05:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42713', '2011-01-20', '05:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42714', '2011-01-20', '05:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42715', '2011-01-20', '06:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42716', '2011-01-20', '06:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42717', '2011-01-20', '06:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42718', '2011-01-20', '06:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42719', '2011-01-20', '07:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42720', '2011-01-20', '07:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42721', '2011-01-20', '07:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42722', '2011-01-20', '07:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42723', '2011-01-20', '08:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42724', '2011-01-20', '08:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42725', '2011-01-20', '08:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42726', '2011-01-20', '08:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42727', '2011-01-20', '09:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42728', '2011-01-20', '09:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42729', '2011-01-20', '09:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42730', '2011-01-20', '09:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42731', '2011-01-20', '10:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42732', '2011-01-20', '10:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42733', '2011-01-20', '10:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42734', '2011-01-20', '10:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42735', '2011-01-20', '11:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42736', '2011-01-20', '11:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42737', '2011-01-20', '11:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42738', '2011-01-20', '11:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42739', '2011-01-20', '12:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42740', '2011-01-20', '12:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42741', '2011-01-20', '12:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42742', '2011-01-20', '12:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42743', '2011-01-20', '13:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42744', '2011-01-20', '13:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42745', '2011-01-20', '13:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42746', '2011-01-20', '13:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42747', '2011-01-20', '14:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42748', '2011-01-20', '14:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42749', '2011-01-20', '14:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42750', '2011-01-20', '14:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42751', '2011-01-20', '15:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42752', '2011-01-20', '15:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42753', '2011-01-20', '15:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42754', '2011-01-20', '15:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42755', '2011-01-20', '16:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42756', '2011-01-20', '16:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42757', '2011-01-20', '16:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42758', '2011-01-20', '16:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42759', '2011-01-20', '17:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42760', '2011-01-20', '17:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42761', '2011-01-20', '17:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42762', '2011-01-20', '17:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42763', '2011-01-20', '18:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42764', '2011-01-20', '18:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42765', '2011-01-20', '18:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42766', '2011-01-20', '18:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42767', '2011-01-20', '19:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42768', '2011-01-20', '19:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42769', '2011-01-20', '19:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42770', '2011-01-20', '19:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42771', '2011-01-20', '20:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42772', '2011-01-20', '20:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42773', '2011-01-20', '20:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42774', '2011-01-20', '20:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42775', '2011-01-20', '21:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42776', '2011-01-20', '21:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42777', '2011-01-20', '21:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42778', '2011-01-20', '21:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42779', '2011-01-20', '22:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42780', '2011-01-20', '22:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42781', '2011-01-20', '22:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42782', '2011-01-20', '22:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42783', '2011-01-20', '23:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42784', '2011-01-20', '23:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42785', '2011-01-20', '23:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42786', '2011-01-20', '23:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42787', '2011-01-21', '00:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42788', '2011-01-21', '00:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42789', '2011-01-21', '00:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42790', '2011-01-21', '00:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42791', '2011-01-21', '01:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42792', '2011-01-21', '01:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42793', '2011-01-21', '01:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42794', '2011-01-21', '01:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42795', '2011-01-21', '02:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42796', '2011-01-21', '02:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42797', '2011-01-21', '02:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42798', '2011-01-21', '02:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42799', '2011-01-21', '03:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42800', '2011-01-21', '03:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42801', '2011-01-21', '03:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42802', '2011-01-21', '03:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42803', '2011-01-21', '04:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42804', '2011-01-21', '04:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42805', '2011-01-21', '04:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42806', '2011-01-21', '04:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42807', '2011-01-21', '05:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42808', '2011-01-21', '05:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42809', '2011-01-21', '05:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42810', '2011-01-21', '05:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42811', '2011-01-21', '06:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42812', '2011-01-21', '06:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42813', '2011-01-21', '06:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42814', '2011-01-21', '06:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42815', '2011-01-21', '07:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42816', '2011-01-21', '07:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42817', '2011-01-21', '07:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42818', '2011-01-21', '07:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42819', '2011-01-21', '08:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42820', '2011-01-21', '08:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42821', '2011-01-21', '08:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42822', '2011-01-21', '08:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42823', '2011-01-21', '09:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42824', '2011-01-21', '09:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42825', '2011-01-21', '09:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42826', '2011-01-21', '09:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42827', '2011-01-21', '10:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42828', '2011-01-21', '10:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42829', '2011-01-21', '10:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42830', '2011-01-21', '10:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42831', '2011-01-21', '11:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42832', '2011-01-21', '11:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42833', '2011-01-21', '11:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42834', '2011-01-21', '11:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42835', '2011-01-21', '12:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42836', '2011-01-21', '12:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42837', '2011-01-21', '12:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42838', '2011-01-21', '12:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42839', '2011-01-21', '13:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42840', '2011-01-21', '13:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42841', '2011-01-21', '13:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42842', '2011-01-21', '13:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42843', '2011-01-21', '14:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42844', '2011-01-21', '14:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42845', '2011-01-21', '14:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42846', '2011-01-21', '14:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42847', '2011-01-21', '15:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42848', '2011-01-21', '15:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42849', '2011-01-21', '15:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42850', '2011-01-21', '15:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42851', '2011-01-21', '16:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42852', '2011-01-21', '16:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42853', '2011-01-21', '16:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42854', '2011-01-21', '16:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42855', '2011-01-21', '17:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42856', '2011-01-21', '17:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42857', '2011-01-21', '17:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42858', '2011-01-21', '17:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42859', '2011-01-21', '18:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42860', '2011-01-21', '18:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42861', '2011-01-21', '18:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42862', '2011-01-21', '18:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42863', '2011-01-21', '19:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42864', '2011-01-21', '19:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42865', '2011-01-21', '19:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42866', '2011-01-21', '19:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42867', '2011-01-21', '20:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42868', '2011-01-21', '20:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42869', '2011-01-21', '20:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42870', '2011-01-21', '20:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42871', '2011-01-21', '21:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42872', '2011-01-21', '21:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42873', '2011-01-21', '21:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42874', '2011-01-21', '21:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42875', '2011-01-21', '22:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42876', '2011-01-21', '22:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42877', '2011-01-21', '22:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42878', '2011-01-21', '22:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42879', '2011-01-21', '23:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42880', '2011-01-21', '23:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42881', '2011-01-21', '23:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42882', '2011-01-21', '23:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42883', '2011-01-22', '00:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42884', '2011-01-22', '00:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42885', '2011-01-22', '00:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42886', '2011-01-22', '00:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42887', '2011-01-22', '01:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42888', '2011-01-22', '01:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42889', '2011-01-22', '01:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42890', '2011-01-22', '01:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42891', '2011-01-22', '02:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42892', '2011-01-22', '02:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42893', '2011-01-22', '02:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42894', '2011-01-22', '02:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42895', '2011-01-22', '03:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42896', '2011-01-22', '03:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42897', '2011-01-22', '03:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42898', '2011-01-22', '03:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42899', '2011-01-22', '04:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42900', '2011-01-22', '04:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42901', '2011-01-22', '04:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42902', '2011-01-22', '04:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42903', '2011-01-22', '05:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42904', '2011-01-22', '05:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42905', '2011-01-22', '05:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42906', '2011-01-22', '05:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42907', '2011-01-22', '06:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42908', '2011-01-22', '06:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42909', '2011-01-22', '06:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42910', '2011-01-22', '06:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42911', '2011-01-22', '07:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42912', '2011-01-22', '07:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42913', '2011-01-22', '07:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42914', '2011-01-22', '07:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42915', '2011-01-22', '08:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42916', '2011-01-22', '08:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42917', '2011-01-22', '08:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42918', '2011-01-22', '08:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42919', '2011-01-22', '09:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42920', '2011-01-22', '09:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42921', '2011-01-22', '09:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42922', '2011-01-22', '09:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42923', '2011-01-22', '10:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42924', '2011-01-22', '10:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42925', '2011-01-22', '10:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42926', '2011-01-22', '10:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42927', '2011-01-22', '11:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42928', '2011-01-22', '11:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42929', '2011-01-22', '11:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42930', '2011-01-22', '11:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42931', '2011-01-22', '12:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42932', '2011-01-22', '12:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42933', '2011-01-22', '12:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42934', '2011-01-22', '12:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42935', '2011-01-22', '13:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42936', '2011-01-22', '13:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42937', '2011-01-22', '13:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42938', '2011-01-22', '13:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42939', '2011-01-22', '14:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42940', '2011-01-22', '14:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42941', '2011-01-22', '14:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42942', '2011-01-22', '14:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42943', '2011-01-22', '15:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42944', '2011-01-22', '15:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42945', '2011-01-22', '15:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42946', '2011-01-22', '15:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42947', '2011-01-22', '16:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42948', '2011-01-22', '16:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42949', '2011-01-22', '16:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42950', '2011-01-22', '16:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42951', '2011-01-22', '17:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42952', '2011-01-22', '17:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42953', '2011-01-22', '17:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42954', '2011-01-22', '17:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42955', '2011-01-22', '18:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42956', '2011-01-22', '18:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42957', '2011-01-22', '18:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42958', '2011-01-22', '18:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42959', '2011-01-22', '19:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42960', '2011-01-22', '19:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42961', '2011-01-22', '19:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42962', '2011-01-22', '19:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42963', '2011-01-22', '20:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42964', '2011-01-22', '20:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42965', '2011-01-22', '20:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42966', '2011-01-22', '20:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42967', '2011-01-22', '21:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42968', '2011-01-22', '21:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42969', '2011-01-22', '21:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42970', '2011-01-22', '21:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42971', '2011-01-22', '22:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42972', '2011-01-22', '22:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42973', '2011-01-22', '22:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42974', '2011-01-22', '22:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42975', '2011-01-22', '23:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42976', '2011-01-22', '23:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42977', '2011-01-22', '23:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42978', '2011-01-22', '23:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42979', '2011-01-23', '00:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42980', '2011-01-23', '00:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42981', '2011-01-23', '00:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42982', '2011-01-23', '00:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42983', '2011-01-23', '01:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42984', '2011-01-23', '01:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42985', '2011-01-23', '01:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42986', '2011-01-23', '01:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42987', '2011-01-23', '02:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42988', '2011-01-23', '02:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42989', '2011-01-23', '02:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42990', '2011-01-23', '02:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42991', '2011-01-23', '03:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42992', '2011-01-23', '03:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42993', '2011-01-23', '03:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42994', '2011-01-23', '03:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42995', '2011-01-23', '04:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('42996', '2011-01-23', '04:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('42997', '2011-01-23', '04:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('42998', '2011-01-23', '04:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('42999', '2011-01-23', '05:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43000', '2011-01-23', '05:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43001', '2011-01-23', '05:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43002', '2011-01-23', '05:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43003', '2011-01-23', '06:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43004', '2011-01-23', '06:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43005', '2011-01-23', '06:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43006', '2011-01-23', '06:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43007', '2011-01-23', '07:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43008', '2011-01-23', '07:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43009', '2011-01-23', '07:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43010', '2011-01-23', '07:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43011', '2011-01-23', '08:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43012', '2011-01-23', '08:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43013', '2011-01-23', '08:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43014', '2011-01-23', '08:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43015', '2011-01-23', '09:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43016', '2011-01-23', '09:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43017', '2011-01-23', '09:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43018', '2011-01-23', '09:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43019', '2011-01-23', '10:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43020', '2011-01-23', '10:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43021', '2011-01-23', '10:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43022', '2011-01-23', '10:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43023', '2011-01-23', '11:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43024', '2011-01-23', '11:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43025', '2011-01-23', '11:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43026', '2011-01-23', '11:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43027', '2011-01-23', '12:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43028', '2011-01-23', '12:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43029', '2011-01-23', '12:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43030', '2011-01-23', '12:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43031', '2011-01-23', '13:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43032', '2011-01-23', '13:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43033', '2011-01-23', '13:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43034', '2011-01-23', '13:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43035', '2011-01-23', '14:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43036', '2011-01-23', '14:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43037', '2011-01-23', '14:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43038', '2011-01-23', '14:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43039', '2011-01-23', '15:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43040', '2011-01-23', '15:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43041', '2011-01-23', '15:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43042', '2011-01-23', '15:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43043', '2011-01-23', '16:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43044', '2011-01-23', '16:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43045', '2011-01-23', '16:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43046', '2011-01-23', '16:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43047', '2011-01-23', '17:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43048', '2011-01-23', '17:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43049', '2011-01-23', '17:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43050', '2011-01-23', '17:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43051', '2011-01-23', '18:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43052', '2011-01-23', '18:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43053', '2011-01-23', '18:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43054', '2011-01-23', '18:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43055', '2011-01-23', '19:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43056', '2011-01-23', '19:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43057', '2011-01-23', '19:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43058', '2011-01-23', '19:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43059', '2011-01-23', '20:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43060', '2011-01-23', '20:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43061', '2011-01-23', '20:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43062', '2011-01-23', '20:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43063', '2011-01-23', '21:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43064', '2011-01-23', '21:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43065', '2011-01-23', '21:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43066', '2011-01-23', '21:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43067', '2011-01-23', '22:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43068', '2011-01-23', '22:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43069', '2011-01-23', '22:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43070', '2011-01-23', '22:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43071', '2011-01-23', '23:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43072', '2011-01-23', '23:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43073', '2011-01-23', '23:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43074', '2011-01-23', '23:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43075', '2011-01-24', '00:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43076', '2011-01-24', '00:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43077', '2011-01-24', '00:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43078', '2011-01-24', '00:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43079', '2011-01-24', '01:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43080', '2011-01-24', '01:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43081', '2011-01-24', '01:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43082', '2011-01-24', '01:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43083', '2011-01-24', '02:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43084', '2011-01-24', '02:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43085', '2011-01-24', '02:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43086', '2011-01-24', '02:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43087', '2011-01-24', '03:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43088', '2011-01-24', '03:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43089', '2011-01-24', '03:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43090', '2011-01-24', '03:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43091', '2011-01-24', '04:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43092', '2011-01-24', '04:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43093', '2011-01-24', '04:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43094', '2011-01-24', '04:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43095', '2011-01-24', '05:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43096', '2011-01-24', '05:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43097', '2011-01-24', '05:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43098', '2011-01-24', '05:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43099', '2011-01-24', '06:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43100', '2011-01-24', '06:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43101', '2011-01-24', '06:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43102', '2011-01-24', '06:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43103', '2011-01-24', '07:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43104', '2011-01-24', '07:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43105', '2011-01-24', '07:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43106', '2011-01-24', '07:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43107', '2011-01-24', '08:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43108', '2011-01-24', '08:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43109', '2011-01-24', '08:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43110', '2011-01-24', '08:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43111', '2011-01-24', '09:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43112', '2011-01-24', '09:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43113', '2011-01-24', '09:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43114', '2011-01-24', '09:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43115', '2011-01-24', '10:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43116', '2011-01-24', '10:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43117', '2011-01-24', '10:30:00', '15', '66');
INSERT INTO `count_record` VALUES ('43118', '2011-01-24', '10:45:00', '15', '66');
INSERT INTO `count_record` VALUES ('43119', '2011-01-24', '11:00:00', '15', '66');
INSERT INTO `count_record` VALUES ('43120', '2011-01-24', '11:15:00', '15', '66');
INSERT INTO `count_record` VALUES ('43121', '2011-01-24', '11:30:00', '15', '66');

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
INSERT INTO `lane` VALUES ('25', '0', '1', '0', '0000-00-00', '0000-00-00', '13', '0');
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
INSERT INTO `lane_record` VALUES ('1', '2', '2', '0', '3', '0');
INSERT INTO `lane_record` VALUES ('2', '2', '2', '0', '3', '0');
INSERT INTO `lane_record` VALUES ('3', '2', '2', '0', '22', '2');
INSERT INTO `lane_record` VALUES ('4', '2', '2', '0', '22', '3');
INSERT INTO `lane_record` VALUES ('5', '2', '2', '0', '23', '2');
INSERT INTO `lane_record` VALUES ('6', '2', '2', '0', '23', '3');
INSERT INTO `lane_record` VALUES ('7', '2', '2', '0', '24', '5');
INSERT INTO `lane_record` VALUES ('8', '2', '2', '0', '24', '6');
INSERT INTO `lane_record` VALUES ('9', '2', '2', '0', '25', '5');
INSERT INTO `lane_record` VALUES ('10', '2', '2', '0', '25', '6');
INSERT INTO `lane_record` VALUES ('11', '1', '2', '2', '26', '2');
INSERT INTO `lane_record` VALUES ('12', '1', '2', '2', '26', '3');
INSERT INTO `lane_record` VALUES ('13', '1', '2', '2', '27', '2');
INSERT INTO `lane_record` VALUES ('14', '1', '2', '2', '27', '3');
INSERT INTO `lane_record` VALUES ('15', '1', '2', '2', '28', '2');
INSERT INTO `lane_record` VALUES ('16', '1', '2', '2', '28', '3');
INSERT INTO `lane_record` VALUES ('17', '1', '2', '2', '29', '2');
INSERT INTO `lane_record` VALUES ('18', '1', '2', '2', '29', '3');
INSERT INTO `lane_record` VALUES ('19', '1', '2', '2', '30', '2');
INSERT INTO `lane_record` VALUES ('20', '1', '2', '2', '30', '3');
INSERT INTO `lane_record` VALUES ('21', '1', '2', '2', '31', '2');
INSERT INTO `lane_record` VALUES ('22', '1', '2', '2', '31', '3');
INSERT INTO `lane_record` VALUES ('23', '2', '2', '0', '32', '2');
INSERT INTO `lane_record` VALUES ('24', '2', '2', '0', '32', '3');
INSERT INTO `lane_record` VALUES ('25', '2', '2', '0', '33', '2');
INSERT INTO `lane_record` VALUES ('26', '2', '2', '0', '33', '3');
INSERT INTO `lane_record` VALUES ('27', '2', '2', '0', '34', '2');
INSERT INTO `lane_record` VALUES ('28', '2', '2', '0', '34', '3');
INSERT INTO `lane_record` VALUES ('29', '2', '2', '0', '35', '2');
INSERT INTO `lane_record` VALUES ('30', '2', '2', '0', '35', '3');
INSERT INTO `lane_record` VALUES ('31', '2', '2', '0', '36', '2');
INSERT INTO `lane_record` VALUES ('32', '2', '2', '0', '36', '3');
INSERT INTO `lane_record` VALUES ('33', '2', '2', '0', '37', '2');
INSERT INTO `lane_record` VALUES ('34', '2', '2', '0', '37', '3');
INSERT INTO `lane_record` VALUES ('35', '2', '2', '0', '38', '2');
INSERT INTO `lane_record` VALUES ('36', '2', '2', '0', '38', '3');
INSERT INTO `lane_record` VALUES ('37', '2', '2', '0', '39', '2');
INSERT INTO `lane_record` VALUES ('38', '2', '2', '0', '39', '3');
INSERT INTO `lane_record` VALUES ('39', '2', '2', '0', '40', '2');
INSERT INTO `lane_record` VALUES ('40', '2', '2', '0', '40', '3');
INSERT INTO `lane_record` VALUES ('41', '2', '2', '0', '41', '2');
INSERT INTO `lane_record` VALUES ('42', '2', '2', '0', '41', '3');
INSERT INTO `lane_record` VALUES ('43', '2', '2', '0', '42', '2');
INSERT INTO `lane_record` VALUES ('44', '2', '2', '0', '42', '3');
INSERT INTO `lane_record` VALUES ('45', '2', '2', '0', '43', '2');
INSERT INTO `lane_record` VALUES ('46', '2', '2', '0', '43', '3');
INSERT INTO `lane_record` VALUES ('47', '2', '2', '0', '44', '2');
INSERT INTO `lane_record` VALUES ('48', '2', '2', '0', '44', '3');
INSERT INTO `lane_record` VALUES ('49', '2', '2', '0', '45', '2');
INSERT INTO `lane_record` VALUES ('50', '2', '2', '0', '45', '3');
INSERT INTO `lane_record` VALUES ('51', '2', '2', '0', '46', '2');
INSERT INTO `lane_record` VALUES ('52', '2', '2', '0', '46', '3');
INSERT INTO `lane_record` VALUES ('53', '2', '2', '0', '47', '2');
INSERT INTO `lane_record` VALUES ('54', '2', '2', '0', '47', '3');
INSERT INTO `lane_record` VALUES ('55', '2', '2', '0', '48', '2');
INSERT INTO `lane_record` VALUES ('56', '2', '2', '0', '48', '3');
INSERT INTO `lane_record` VALUES ('57', '2', '2', '0', '49', '2');
INSERT INTO `lane_record` VALUES ('58', '2', '2', '0', '49', '3');
INSERT INTO `lane_record` VALUES ('59', '2', '2', '0', '50', '2');
INSERT INTO `lane_record` VALUES ('60', '2', '2', '0', '50', '3');
INSERT INTO `lane_record` VALUES ('61', '2', '2', '0', '51', '2');
INSERT INTO `lane_record` VALUES ('62', '2', '2', '0', '51', '3');
INSERT INTO `lane_record` VALUES ('63', '2', '2', '0', '52', '2');
INSERT INTO `lane_record` VALUES ('64', '2', '2', '0', '52', '3');
INSERT INTO `lane_record` VALUES ('65', '2', '2', '0', '53', '2');
INSERT INTO `lane_record` VALUES ('66', '2', '2', '0', '53', '3');
INSERT INTO `lane_record` VALUES ('67', '2', '2', '0', '54', '2');
INSERT INTO `lane_record` VALUES ('68', '2', '2', '0', '54', '3');
INSERT INTO `lane_record` VALUES ('69', '2', '2', '0', '55', '5');
INSERT INTO `lane_record` VALUES ('70', '2', '2', '0', '55', '6');
INSERT INTO `lane_record` VALUES ('71', '2', '2', '0', '56', '2');
INSERT INTO `lane_record` VALUES ('72', '2', '2', '0', '56', '3');
INSERT INTO `lane_record` VALUES ('73', '2', '2', '0', '57', '5');
INSERT INTO `lane_record` VALUES ('74', '2', '2', '0', '57', '6');
INSERT INTO `lane_record` VALUES ('75', '2', '2', '0', '58', '5');
INSERT INTO `lane_record` VALUES ('76', '2', '2', '0', '58', '6');
INSERT INTO `lane_record` VALUES ('77', '1', '2', '2', '59', '5');
INSERT INTO `lane_record` VALUES ('78', '1', '2', '2', '59', '6');
INSERT INTO `lane_record` VALUES ('79', '1', '2', '2', '60', '2');
INSERT INTO `lane_record` VALUES ('80', '1', '2', '2', '60', '3');
INSERT INTO `lane_record` VALUES ('81', '1', '2', '2', '61', '2');
INSERT INTO `lane_record` VALUES ('82', '1', '2', '2', '61', '3');
INSERT INTO `lane_record` VALUES ('83', '1', '2', '2', '62', '2');
INSERT INTO `lane_record` VALUES ('84', '1', '2', '2', '62', '3');
INSERT INTO `lane_record` VALUES ('85', '1', '2', '2', '63', '5');
INSERT INTO `lane_record` VALUES ('86', '1', '2', '2', '63', '6');
INSERT INTO `lane_record` VALUES ('87', '2', '2', '0', '64', '5');
INSERT INTO `lane_record` VALUES ('88', '2', '2', '0', '64', '6');
INSERT INTO `lane_record` VALUES ('89', '2', '2', '0', '65', '2');
INSERT INTO `lane_record` VALUES ('90', '2', '2', '0', '65', '3');
INSERT INTO `lane_record` VALUES ('91', '2', '2', '0', '66', '2');
INSERT INTO `lane_record` VALUES ('92', '2', '2', '0', '66', '3');

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
INSERT INTO `site` VALUES ('13', 'daa', '1', '13', '12', '2014-03-12', '0000-00-00', 'd erwerw', '3', '2');

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
INSERT INTO `statistics_record` VALUES ('66', 'Colin Gibson', '', '0', '563', '2011-01-13', '15:34:00', '2011-01-24', '11:41:00', '0', '20');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Ahmad', 'Molham', 'Barakat', 'molham', 'd41d8cd98f00b204e9800998ecf8427e', 'HERE', '12345688', '12345677', '0', '2014-02-22', '0000-00-00');
INSERT INTO `user` VALUES ('2', 'Ahmad', 'Molham', 'Barakat', 'molham', 'e10adc3949ba59abbe56e057f20f883e', 'HERE', '12345688', '12345677', '0', '2014-02-22', '0000-00-00');
INSERT INTO `user` VALUES ('3', 'mohanad', 'shab', 'kaleia', 'mohanad', 'e10adc3949ba59abbe56e057f20f883e', 'asdl dsmf ksdl jmslknjs sjfgnsjkfn gjsn jsfgn j', '1234564789', '123454987', '1', '2014-02-26', '0000-00-00');
INSERT INTO `user` VALUES ('8', 'Ahmad', '', 'aaa', 'aaa', '47bce5c74f589f4867dbd57e9ca9f808', '', '', '', '0', '2014-03-01', '2014-03-01');
INSERT INTO `user` VALUES ('9', 'aaa', 'mmm', 'bbb', 'bbb', '47bce5c74f589f4867dbd57e9ca9f808', 'dlkufio ', '123456', '123156', '0', '0000-00-00', '2014-03-01');
INSERT INTO `user` VALUES ('10', 'aaa', 'sss', 'ddd', 'aaaa', '9f6e6800cfae7749eb6c486619254b9c', 'aklsdj klasjd', '123', '345', '0', '2014-03-01', '0000-00-00');

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
