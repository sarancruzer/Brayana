-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 11, 2018 at 04:52 PM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `brayana`
--

-- --------------------------------------------------------

--
-- Table structure for table `agar_booking`
--

DROP TABLE IF EXISTS `agar_booking`;
CREATE TABLE IF NOT EXISTS `agar_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agar_id` int(11) NOT NULL,
  `booking_no` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `login_id` int(11) NOT NULL,
  `no_tree` int(11) NOT NULL,
  `inst_month` int(11) NOT NULL,
  `inst_amount` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `tot_amount` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `paid_months` int(11) NOT NULL DEFAULT '0',
  `paid_amount` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance_months` int(11) NOT NULL DEFAULT '0',
  `balance_amount` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `agar_booking`
--

INSERT INTO `agar_booking` (`id`, `agar_id`, `booking_no`, `login_id`, `no_tree`, `inst_month`, `inst_amount`, `tot_amount`, `paid_months`, `paid_amount`, `balance_months`, `balance_amount`, `status`, `added_by`, `updated_date`) VALUES
(1, 1, 'Book123', 5, 3, 10, '12', '120', 0, '0', 10, '120', 0, 1, '2018-06-11 16:16:11'),
(2, 1, 'Book123', 5, 3, 10, '12', '120', 0, '0', 10, '120', 0, 1, '2018-06-11 16:17:18');

-- --------------------------------------------------------

--
-- Table structure for table `agar_installments`
--

DROP TABLE IF EXISTS `agar_installments`;
CREATE TABLE IF NOT EXISTS `agar_installments` (
  `inst_id` int(11) NOT NULL AUTO_INCREMENT,
  `agar_id` int(11) NOT NULL COMMENT 'agar_booking_id',
  `login_id` int(11) NOT NULL,
  `inst_month` varchar(64) NOT NULL,
  `inst_amount` varchar(64) NOT NULL,
  `added_by` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`inst_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agar_installments`
--

INSERT INTO `agar_installments` (`inst_id`, `agar_id`, `login_id`, `inst_month`, `inst_amount`, `added_by`, `datetime`, `is_delete`, `deleted_by`) VALUES
(1, 1, 5, '1', '12', 1, '2018-06-11 14:48:34', 1, 1),
(2, 1, 5, '2', '12', 1, '2018-06-11 14:48:43', 1, 1),
(3, 2, 5, '1', '12', 1, '2018-06-11 14:48:50', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `chit_booking`
--

DROP TABLE IF EXISTS `chit_booking`;
CREATE TABLE IF NOT EXISTS `chit_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chit_id` int(11) NOT NULL,
  `booking_no` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `login_id` int(11) NOT NULL,
  `inst_month` int(11) NOT NULL,
  `inst_amount` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `tot_amount` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `paid_months` int(11) NOT NULL DEFAULT '0',
  `paid_amount` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance_months` int(11) NOT NULL DEFAULT '0',
  `balance_amount` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chit_booking`
--

INSERT INTO `chit_booking` (`id`, `chit_id`, `booking_no`, `login_id`, `inst_month`, `inst_amount`, `tot_amount`, `paid_months`, `paid_amount`, `balance_months`, `balance_amount`, `status`, `added_by`, `updated_date`) VALUES
(1, 1, 'Book123', 5, 10, '12', '120', 1, '12', 9, '108', 0, 1, '2018-06-11 16:10:01');

-- --------------------------------------------------------

--
-- Table structure for table `chit_installments`
--

DROP TABLE IF EXISTS `chit_installments`;
CREATE TABLE IF NOT EXISTS `chit_installments` (
  `inst_id` int(11) NOT NULL AUTO_INCREMENT,
  `chit_id` int(11) NOT NULL COMMENT 'chit_booking_id',
  `login_id` int(11) NOT NULL,
  `inst_month` varchar(64) NOT NULL,
  `inst_amount` varchar(64) NOT NULL,
  `added_by` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`inst_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chit_installments`
--

INSERT INTO `chit_installments` (`inst_id`, `chit_id`, `login_id`, `inst_month`, `inst_amount`, `added_by`, `datetime`, `is_delete`, `deleted_by`) VALUES
(1, 1, 5, '1', '12', 1, '2018-06-11 14:35:29', 0, NULL),
(2, 1, 5, '2', '12', 1, '2018-06-11 16:07:02', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `chit_master`
--

DROP TABLE IF EXISTS `chit_master`;
CREATE TABLE IF NOT EXISTS `chit_master` (
  `chit_id` int(11) NOT NULL AUTO_INCREMENT,
  `fund_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `inst_month` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `inst_amount` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `total_amount` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`chit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chit_master`
--

INSERT INTO `chit_master` (`chit_id`, `fund_type`, `inst_month`, `inst_amount`, `total_amount`, `updated_date`) VALUES
(1, 'tst1', '12', '1000', '12000', '2018-05-12 15:26:40'),
(2, 'tst1212', '121', '1000', '121000', '2018-05-30 17:07:26'),
(4, 'tes1', '11', '21', '231', '2018-05-30 17:07:38'),
(5, 'testjay', '12', '323', '3876', '2018-05-21 16:32:22');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `date_of_joining` date DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '1=Land,2=Chit,Agar',
  `active` int(2) NOT NULL DEFAULT '1',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `added_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `login_id`, `name`, `mobile`, `email_id`, `address`, `date_of_joining`, `description`, `type`, `active`, `updated_date`, `added_by`) VALUES
(1, 3, '90035027191', '90035027191', 'jayanthan.ece@gmail.com', NULL, NULL, NULL, '2', 1, '2018-06-03 10:17:06', 1),
(2, 4, '9003502719', '9003502719', 'jayanthan.ece@gmail.com', NULL, NULL, NULL, '1', 1, '2018-06-03 11:32:29', 1),
(3, 5, 'Jayanthan', '1234567890', 'jayanthan.ece@gmail.com', 'test address', NULL, NULL, '1', 1, '2018-06-11 08:43:36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) NOT NULL,
  `emp_pin` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `mobile` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `education` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `maritial_status` int(11) NOT NULL,
  `id_proof` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `land_booking`
--

DROP TABLE IF EXISTS `land_booking`;
CREATE TABLE IF NOT EXISTS `land_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `booking_no` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `login_id` int(11) NOT NULL,
  `inst_month` int(11) NOT NULL,
  `inst_amount` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `paid_months` int(11) DEFAULT NULL,
  `paid_amount` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance_months` int(11) DEFAULT NULL,
  `balance_amount` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `added_by` int(11) NOT NULL,
  `tot_amount` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `land_booking`
--

INSERT INTO `land_booking` (`id`, `site_id`, `booking_no`, `login_id`, `inst_month`, `inst_amount`, `paid_months`, `paid_amount`, `balance_months`, `balance_amount`, `status`, `added_by`, `tot_amount`, `updated_date`) VALUES
(1, 1, 'LAND-123', 5, 12, '1000', 0, '0', 12, '12000', 0, 1, '12000', '2018-06-11 16:00:54');

-- --------------------------------------------------------

--
-- Table structure for table `land_installments`
--

DROP TABLE IF EXISTS `land_installments`;
CREATE TABLE IF NOT EXISTS `land_installments` (
  `inst_id` int(11) NOT NULL AUTO_INCREMENT,
  `land_id` int(11) NOT NULL COMMENT 'land_booking_id',
  `login_id` int(11) NOT NULL,
  `inst_month` varchar(64) NOT NULL,
  `inst_amount` varchar(64) NOT NULL,
  `added_by` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`inst_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `land_installments`
--

INSERT INTO `land_installments` (`inst_id`, `land_id`, `login_id`, `inst_month`, `inst_amount`, `added_by`, `datetime`, `is_delete`, `deleted_by`) VALUES
(1, 1, 5, '01', '1000', 1, '2018-06-11 13:30:40', 0, 1),
(2, 1, 5, '02', '1000', 1, '2018-06-11 13:31:55', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `land_master`
--

DROP TABLE IF EXISTS `land_master`;
CREATE TABLE IF NOT EXISTS `land_master` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `survey_no` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `area` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `inst_month` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `inst_amount` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `total_amount` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `land_master`
--

INSERT INTO `land_master` (`site_id`, `site_name`, `desc`, `survey_no`, `area`, `city`, `inst_month`, `inst_amount`, `total_amount`, `updated_date`) VALUES
(1, 'test', NULL, 'test', 'test', 'test1', '12', '121', '1452', '2018-06-03 11:19:09');

-- --------------------------------------------------------

--
-- Table structure for table `tree_master`
--

DROP TABLE IF EXISTS `tree_master`;
CREATE TABLE IF NOT EXISTS `tree_master` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `no_tree` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `tree_amount` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tree_master`
--

INSERT INTO `tree_master` (`site_id`, `site_name`, `no_tree`, `tree_amount`, `updated_date`) VALUES
(1, 'sample1', '121', '1231', '2018-05-30 17:19:47');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
CREATE TABLE IF NOT EXISTS `user_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_mobile` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL COMMENT '1=admin,2=employee,3=Customer',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`id`, `user_name`, `user_email`, `user_password`, `user_mobile`, `user_type`) VALUES
(1, 'admin', NULL, '21232f297a57a5a743894a0e4a801fc3', '9003502719', '1'),
(2, 'admin2', 'admin2@gmail.com', 'c84258e9c39059a89ab77d846ddab909', '', '1'),
(3, '90035027191', 'jayanthan.ece@gmail.com', '6b1f18d5f7f496506d327b80875488f0', '90035027191', '3'),
(4, '9003502719', 'jayanthan.ece@gmail.com', 'd1a7eedb6e79edbab46679eff4bfe6bf', '9003502719', '3'),
(5, '1234567890', 'jayanthan.ece@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', '1234567890', '3');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
