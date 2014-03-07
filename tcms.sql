-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 07, 2014 at 09:26 AM
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
CREATE TABLE IF NOT EXISTS `accepted_case_counts` (
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

CREATE TABLE IF NOT EXISTS `axle_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `FHWA_class` int(11) DEFAULT NULL,
  `classification_record_id` int(11) DEFAULT NULL,
  `lane_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_axle_record_classification_record1` (`classification_record_id`),
  KEY `fk_axle_record_lane1` (`lane_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `binary_file`
--

CREATE TABLE IF NOT EXISTS `binary_file` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- Dumping data for table `binary_file`
--

INSERT INTO `binary_file` (`id`, `name`, `upload_date`, `upload_time`, `location`, `counter_id`, `case_id`) VALUES
(48, 'Westfirstore_33.BIN', '0000-00-00', '00:00:00', 'files/binary_files/rejected_binary_files/', 0, 33),
(49, 'test_20_34.BIN', '0000-00-00', '00:00:00', 'files/binary_files/accepted_binary_files/', 0, 34),
(50, 'test_10_35.BIN', '0000-00-00', '00:00:00', 'files/binary_files/accepted_binary_files/', 0, 35),
(51, 'Westfirstore_38.BIN', '0000-00-00', '00:00:00', 'files/binary_files/accepted_binary_files/', 0, 38),
(52, 'test_10_36.BIN', '0000-00-00', '00:00:00', 'files/binary_files/accepted_binary_files/', 0, 36),
(53, 'Westfirstore_41.BIN', '0000-00-00', '00:00:00', 'files/binary_files/rejected_binary_files/', 0, 41),
(54, 'test_10_361_40.BIN', '0000-00-00', '00:00:00', 'files/Binary_files/new_binary_files/', 0, 40);

-- --------------------------------------------------------

--
-- Table structure for table `case`
--

CREATE TABLE IF NOT EXISTS `case` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `case`
--

INSERT INTO `case` (`id`, `open_date`, `open_time`, `close_date`, `close_time`, `accept_reject_date`, `accept_reject_time`, `status`, `manual_closing_reason`, `rejecting_reason`, `collector_id`, `admin_id`, `site_id`) VALUES
(33, '2014-03-01', '16:22:48', '2014-03-01', '16:22:48', '2014-03-01', '16:23:06', 4, '', 'doesn%27t%20match%20our%20standards', 2, 0, 12),
(34, '2014-03-01', '16:23:49', '2014-03-01', '16:23:57', '2014-03-01', '16:24:00', 3, '', '', 2, 2, 3),
(35, '2014-03-02', '10:40:48', '2014-03-02', '10:43:05', '2014-03-02', '10:43:22', 3, '', '', 3, 3, 13),
(36, '2014-03-02', '11:25:28', '2014-03-05', '15:40:50', '2014-03-05', '16:13:37', 3, '', '', 2, 2, 2),
(37, '2014-03-02', '13:01:08', '2014-03-02', '13:01:38', '0000-00-00', '00:00:00', 2, 'aaa', '', 2, 3, 12),
(38, '2014-03-02', '13:01:27', '2014-03-02', '13:50:51', '2014-03-05', '16:02:21', 3, '', '', 2, 2, 3),
(39, '2014-03-03', '12:20:12', '2014-03-05', '15:40:58', '0000-00-00', '00:00:00', 2, 'heeeeeeek', '', 2, 2, 12),
(40, '2014-03-05', '15:49:10', '2014-03-05', '16:13:20', '0000-00-00', '00:00:00', 1, '', '', 2, 2, 3),
(41, '2014-03-05', '15:49:21', '2014-03-05', '15:49:21', '2014-03-05', '15:49:47', 4, '', 'heeeeeeeek', 2, 2, 12),
(42, '2014-03-05', '16:12:04', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 0, '', '', 0, 2, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `case_activities`
--
CREATE TABLE IF NOT EXISTS `case_activities` (
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
CREATE TABLE IF NOT EXISTS `case_count` (
`count` decimal(32,0)
,`case_id` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `case_site_counters`
--
CREATE TABLE IF NOT EXISTS `case_site_counters` (
`case_id` int(11)
,`serial` varchar(100)
,`counter_id` int(11)
,`site_id` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `classification_record`
--

CREATE TABLE IF NOT EXISTS `classification_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  `classification_step` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE IF NOT EXISTS `counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(100) DEFAULT NULL,
  `unit_type` varchar(45) DEFAULT NULL,
  `unit_version` varchar(45) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_counter_site1` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `count_lane_record`
--

CREATE TABLE IF NOT EXISTS `count_lane_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `lane_id` int(11) DEFAULT NULL,
  `count_record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_count_lane_record_lane1` (`lane_id`),
  KEY `fk_count_lane_record_count_record1` (`count_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `count_record`
--

CREATE TABLE IF NOT EXISTS `count_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  `interval_length` int(11) DEFAULT NULL,
  `statistics_record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_count_record_statistics_record1` (`statistics_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lane`
--

CREATE TABLE IF NOT EXISTS `lane` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `lane`
--

INSERT INTO `lane` (`id`, `lane_number`, `lane_direction`, `lane_spacing`, `start_date`, `end_date`, `site_id`, `counter_id`) VALUES
(1, 1, 0, 50, '2014-02-06', NULL, NULL, NULL),
(2, 1, 1, 121.92, '0000-00-00', '0000-00-00', 2, 16),
(3, 2, 5, 121.92, '0000-00-00', '0000-00-00', 2, 16),
(4, 0, 2, 0, '0000-00-00', '0000-00-00', 2, 0),
(5, 1, 1, 121.92, '0000-00-00', '0000-00-00', 3, 17),
(6, 2, 5, 121.92, '0000-00-00', '0000-00-00', 3, 17),
(7, 0, 0, 0, '0000-00-00', '0000-00-00', 4, 0),
(8, 0, 0, 0, '0000-00-00', '0000-00-00', 4, 0),
(9, 0, 0, 0, '0000-00-00', '0000-00-00', 5, 0),
(10, 0, 0, 0, '0000-00-00', '0000-00-00', 5, 0),
(11, 0, 0, 0, '0000-00-00', '0000-00-00', 6, 0),
(12, 0, 0, 0, '0000-00-00', '0000-00-00', 6, 0),
(13, 0, 0, 0, '0000-00-00', '0000-00-00', 7, 0),
(14, 0, 0, 0, '0000-00-00', '0000-00-00', 7, 0),
(15, 0, 0, 0, '0000-00-00', '0000-00-00', 8, 0),
(16, 0, 0, 0, '0000-00-00', '0000-00-00', 8, 0),
(17, 0, 1, 0, '0000-00-00', '0000-00-00', 9, 0),
(18, 0, 5, 0, '0000-00-00', '0000-00-00', 9, 0),
(19, 0, 0, 0, '0000-00-00', '0000-00-00', 10, 0),
(20, 0, 0, 0, '0000-00-00', '0000-00-00', 10, 0),
(21, 0, 0, 0, '0000-00-00', '0000-00-00', 11, 0),
(22, 0, 0, 0, '0000-00-00', '0000-00-00', 11, 0),
(23, 0, 8, 0, '0000-00-00', '0000-00-00', 12, 0),
(24, 0, 8, 0, '0000-00-00', '0000-00-00', 12, 0),
(25, 0, 2, 0, '0000-00-00', '0000-00-00', 13, 0),
(26, 0, 2, 0, '0000-00-00', '0000-00-00', 13, 0),
(27, 0, 0, 0, '0000-00-00', '0000-00-00', 14, 0),
(28, 0, 0, 0, '0000-00-00', '0000-00-00', 14, 0);

-- --------------------------------------------------------

--
-- Table structure for table `lane_record`
--

CREATE TABLE IF NOT EXISTS `lane_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '			',
  `lane_sensor` int(11) DEFAULT NULL,
  `count_method` int(11) DEFAULT NULL,
  `lane_mode` int(11) DEFAULT NULL,
  `statistics_record_id` int(11) DEFAULT NULL,
  `lane_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lane_record_statistics_record1` (`statistics_record_id`),
  KEY `fk_lane_record_lane1` (`lane_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `per_vehicle_record`
--

CREATE TABLE IF NOT EXISTS `per_vehicle_record` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE IF NOT EXISTS `site` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`id`, `name`, `FIPS`, `latitude`, `longitude`, `start_date`, `end_date`, `address`, `functional_class`, `lane_count`) VALUES
(2, 'Colin Desk', 5, '51.508742', '0.120850', '2014-02-19', '0000-00-00', 'sjdahjahdj ahsjd hajsdh', 4, 3),
(3, 'Main & First', 1, '35', '12', '2014-02-05', '0000-00-00', 'jskahdgaksjhdb akls KJQW H', 3, 2),
(4, 'Colin Desk', 1, '123123', '123123', '2014-01-28', '2014-02-28', '123123', 2, 2),
(5, 'Colin Desk', 1, '123123', '123123', '2014-02-04', '2014-02-28', '', 2, 2),
(6, 'Colin Desk', 1, '123123', '123123', '2014-02-04', '2014-02-28', '', 2, 2),
(7, 'Colin Desk', 1, '123123', '123123', '2014-02-04', '2014-02-28', '', 2, 2),
(8, 'Colin Desk', 1, '123123', '123123', '2014-02-04', '2014-02-28', '', 2, 2),
(9, 'Colin Desk', 1, '115', '123123', '2014-03-11', '2014-03-01', 'dssdfsf', 1, 2),
(10, 'Colin Desk', 1, '115', '123123', '2014-03-11', '2014-03-01', 'dssdfsf', 1, 2),
(11, 'Colin Desk', 1, '115', '123123', '2014-03-11', '2014-03-01', 'dssdfsf', 1, 2),
(12, 'aaa', 1, '36', '3', '2014-03-11', '0000-00-00', 'dssdfsf', 1, 2),
(13, 'daa', 1, '35.79999', '-97.51465', '2014-03-12', '0000-00-00', 'd erwerw', 3, 2),
(14, 'aa', 1, '11', '123123', '2014-02-24', '0000-00-00', '', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `speed_record`
--

CREATE TABLE IF NOT EXISTS `speed_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `count` int(11) DEFAULT NULL,
  `FHWA_speed` int(11) DEFAULT NULL,
  `classification_record_id` int(11) DEFAULT NULL,
  `lane_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_speed_record_classification_record1` (`classification_record_id`),
  KEY `fk_speed_record_lane1` (`lane_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `statistics_record`
--

CREATE TABLE IF NOT EXISTS `statistics_record` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `middle_name`, `last_name`, `username`, `password`, `address`, `phone_number`, `mobile_number`, `type`, `hire_date`, `end_date`) VALUES
(2, 'Ahmad', 'Molham', 'Barakat', 'molham', 'e10adc3949ba59abbe56e057f20f883e', 'HERE', '12345688', '12345677', 0, '2014-02-22', '0000-00-00'),
(3, 'mohanad', 'shab', 'kaleia', 'mohanad', 'e10adc3949ba59abbe56e057f20f883e', 'asdl dsmf ksdl jmslknjs sjfgnsjkfn gjsn jsfgn j', '1234564789', '123454987', 0, '2014-02-26', '0000-00-00'),
(11, 'Hazem', '', 'Refai', 'hazem', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', 0, '2014-03-03', '0000-00-00'),
(12, 'Asaad', '', 'Kaadan', 'asaad', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', 0, '2014-03-03', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_axle_spacing`
--

CREATE TABLE IF NOT EXISTS `vehicle_axle_spacing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spacing` float DEFAULT NULL,
  `per_vehicle_record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vehicle_axle_spacing_per_vehicle_record1` (`per_vehicle_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure for view `accepted_case_counts`
--
DROP TABLE IF EXISTS `accepted_case_counts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `accepted_case_counts` AS select `count_lane_record`.`count` AS `count`,`count_record`.`date` AS `date`,`count_record`.`time` AS `time`,`case`.`id` AS `case_id`,`site`.`id` AS `site_id` from ((((`count_lane_record` join `count_record`) join `statistics_record`) join `case`) join `site`) where ((`count_lane_record`.`count_record_id` = `count_record`.`id`) and (`count_record`.`statistics_record_id` = `statistics_record`.`id`) and (`statistics_record`.`case_id` = `case`.`id`) and (`case`.`status` = '3') and (`case`.`site_id` = `site`.`id`));

-- --------------------------------------------------------

--
-- Structure for view `case_activities`
--
DROP TABLE IF EXISTS `case_activities`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `case_activities` AS select `case`.`open_date` AS `open_date`,`case`.`close_date` AS `close_date`,`case`.`accept_reject_date` AS `acc_rej_date`,`case`.`status` AS `status`,`user`.`username` AS `user`,`site`.`name` AS `site` from ((`site` join `case`) join `user`) where (((`case`.`open_date` >= (curdate() + interval -(2) day)) or (`case`.`close_date` >= (curdate() + interval -(2) day)) or (`case`.`accept_reject_date` >= (curdate() + interval -(2) day))) and (`site`.`id` = `case`.`site_id`) and (((`case`.`admin_id` = `user`.`id`) and (`case`.`status` = 0)) or ((`user`.`id` = `case`.`collector_id`) and ((`case`.`status` = 1) or (`case`.`status` = 2))) or ((`user`.`id` = `case`.`admin_id`) and ((`case`.`status` = 3) or (`case`.`status` = 4))))) order by `case`.`accept_reject_date` desc,`case`.`accept_reject_time` desc,`case`.`close_date` desc,`case`.`close_time` desc,`case`.`open_date` desc,`case`.`open_time` desc;

-- --------------------------------------------------------

--
-- Structure for view `case_count`
--
DROP TABLE IF EXISTS `case_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `case_count` AS select sum(`count_lane_record`.`count`) AS `count`,`case`.`id` AS `case_id` from (((`count_lane_record` join `count_record`) join `statistics_record`) join `case`) where ((`count_lane_record`.`count_record_id` = `count_record`.`id`) and (`count_record`.`statistics_record_id` = `statistics_record`.`id`) and (`statistics_record`.`case_id` = `case`.`id`));

-- --------------------------------------------------------

--
-- Structure for view `case_site_counters`
--
DROP TABLE IF EXISTS `case_site_counters`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `case_site_counters` AS select `case`.`id` AS `case_id`,`counter`.`serial` AS `serial`,`counter`.`id` AS `counter_id`,`site`.`id` AS `site_id` from ((`case` join `site`) join `counter`) where ((`case`.`site_id` = `site`.`id`) and (`counter`.`site_id` = `site`.`id`));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
