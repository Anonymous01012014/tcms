-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 26, 2014 at 01:48 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tcms`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `accepted_case_counts`
--
CREATE TABLE `accepted_case_counts` (
`count` int(11)
,`date` date
,`time` time
,`case_id` int(11)
,`site_id` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `axle_record`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `binary_file`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `case`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `case_activities`
--
CREATE TABLE `case_activities` (
`open_date` date
,`close_date` date
,`acc_rej_date` date
,`status` int(11)
,`user` varchar(100)
,`site` varchar(100)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `case_count`
--
CREATE TABLE `case_count` (
`count` decimal(32,0)
,`case_id` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `case_site_counters`
--
CREATE TABLE `case_site_counters` (
`case_id` int(11)
,`serial` varchar(100)
,`counter_id` int(11)
,`site_id` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `classification_record`
--

CREATE TABLE `classification_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  `classification_step` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE `counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(100) DEFAULT NULL,
  `unit_type` varchar(45) DEFAULT NULL,
  `unit_version` varchar(45) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_counter_site1` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `count_lane_record`
--

CREATE TABLE `count_lane_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `lane_id` int(11) DEFAULT NULL,
  `count_record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_count_lane_record_lane1` (`lane_id`),
  KEY `fk_count_lane_record_count_record1` (`count_record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `count_record`
--

CREATE TABLE `count_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `interval_length` int(11) DEFAULT NULL,
  `statistics_record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_count_record_statistics_record1` (`statistics_record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lane`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lane_record`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `per_vehicle_record`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `FIPS` int(11) DEFAULT NULL,
  `county` varchar(100) DEFAULT NULL,
  `latitude` mediumtext,
  `longitude` mediumtext,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `address` text,
  `functional_class` int(11) DEFAULT NULL,
  `lane_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `speed_record`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `statistics_record`
--

CREATE TABLE `statistics_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_name` varchar(100) DEFAULT NULL,
  `weather` varchar(45) DEFAULT NULL,
  `storage_mode` int(11) DEFAULT NULL,
  `posted_speed_limit` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `stop_date` date DEFAULT NULL,
  `stop_time` time DEFAULT NULL,
  `interval_length` int(11) DEFAULT '0',
  `case_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_axle_spacing`
--

CREATE TABLE `vehicle_axle_spacing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spacing` float DEFAULT NULL,
  `per_vehicle_record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vehicle_axle_spacing_per_vehicle_record1` (`per_vehicle_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure for view `accepted_case_counts`
--
DROP TABLE IF EXISTS `accepted_case_counts`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `accepted_case_counts` AS select `count_lane_record`.`count` AS `count`,`count_record`.`date` AS `date`,`count_record`.`time` AS `time`,`case`.`id` AS `case_id`,`site`.`id` AS `site_id` from ((((`count_lane_record` join `count_record`) join `statistics_record`) join `case`) join `site`) where ((`count_lane_record`.`count_record_id` = `count_record`.`id`) and (`count_record`.`statistics_record_id` = `statistics_record`.`id`) and (`statistics_record`.`case_id` = `case`.`id`) and (`case`.`status` = '3') and (`case`.`site_id` = `site`.`id`));

-- --------------------------------------------------------

--
-- Structure for view `case_activities`
--
DROP TABLE IF EXISTS `case_activities`;

CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `case_activities` AS select `case`.`open_date` AS `open_date`,`case`.`close_date` AS `close_date`,`case`.`accept_reject_date` AS `acc_rej_date`,`case`.`status` AS `status`,`user`.`username` AS `user`,`site`.`name` AS `site` from ((`site` join `case`) join `user`) where (((`case`.`open_date` >= (curdate() + interval -(2) day)) or (`case`.`close_date` >= (curdate() + interval -(2) day)) or (`case`.`accept_reject_date` >= (curdate() + interval -(2) day))) and (`site`.`id` = `case`.`site_id`) and (((`case`.`admin_id` = `user`.`id`) and (`case`.`status` = 0)) or ((`user`.`id` = `case`.`collector_id`) and ((`case`.`status` = 1) or (`case`.`status` = 2))) or ((`user`.`id` = `case`.`admin_id`) and ((`case`.`status` = 3) or (`case`.`status` = 4))))) order by `case`.`accept_reject_date` desc,`case`.`accept_reject_time` desc,`case`.`close_date` desc,`case`.`close_time` desc,`case`.`open_date` desc,`case`.`open_time` desc;

-- --------------------------------------------------------

--
-- Structure for view `case_count`
--
DROP TABLE IF EXISTS `case_count`;

CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `case_count` AS select sum(`count_lane_record`.`count`) AS `count`,`case`.`id` AS `case_id` from (((`count_lane_record` join `count_record`) join `statistics_record`) join `case`) where ((`count_lane_record`.`count_record_id` = `count_record`.`id`) and (`count_record`.`statistics_record_id` = `statistics_record`.`id`) and (`statistics_record`.`case_id` = `case`.`id`)) group by `case`.`id`;

-- --------------------------------------------------------

--
-- Structure for view `case_site_counters`
--
DROP TABLE IF EXISTS `case_site_counters`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `case_site_counters` AS select `case`.`id` AS `case_id`,`counter`.`serial` AS `serial`,`counter`.`id` AS `counter_id`,`site`.`id` AS `site_id` from ((`case` join `site`) join `counter`) where ((`case`.`site_id` = `site`.`id`) and (`counter`.`site_id` = `site`.`id`));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
