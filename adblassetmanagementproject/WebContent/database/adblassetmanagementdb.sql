-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2017 at 02:24 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `adblassetmanagementdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `branchdetailtbl`
--

CREATE TABLE IF NOT EXISTS `branchdetailtbl` (
  `branchid` bigint(20) NOT NULL,
  `branchname` varchar(100) DEFAULT NULL,
  `branchaddress` varchar(100) DEFAULT NULL,
  `branchdb` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `branchdetailtbl`
--

INSERT INTO `branchdetailtbl` (`branchid`, `branchname`, `branchaddress`, `branchdb`) VALUES
(1, 'Head Office', 'Singha Durbar, Kathmandu', 'adblheadofficedb');

-- --------------------------------------------------------

--
-- Table structure for table `mainusertbl`
--

CREATE TABLE IF NOT EXISTS `mainusertbl` (
  `mid` bigint(20) NOT NULL,
  `mainusername` varchar(20) DEFAULT NULL,
  `mainpassword` varchar(20) DEFAULT NULL,
  `staffcode` int(11) DEFAULT NULL,
  `branchid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mainusertbl`
--

INSERT INTO `mainusertbl` (`mid`, `mainusername`, `mainpassword`, `staffcode`, `branchid`) VALUES
(1, 'admin', 'admin', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rolemgmttbl`
--

CREATE TABLE IF NOT EXISTS `rolemgmttbl` (
  `rolemgmtid` bigint(20) NOT NULL,
  `roleid` bigint(20) DEFAULT NULL,
  `navigationid` varchar(20) DEFAULT NULL,
  `reserve1` varchar(20) DEFAULT NULL,
  `reserve2` varchar(20) DEFAULT NULL,
  `reserve3` varchar(20) DEFAULT NULL,
  `reserve4` varchar(20) DEFAULT NULL,
  `reserve5` varchar(20) DEFAULT NULL,
  `reserve6` varchar(20) DEFAULT NULL,
  `reserve7` varchar(20) DEFAULT NULL,
  `reserve8` varchar(20) DEFAULT NULL,
  `reserve9` varchar(20) DEFAULT NULL,
  `reserve10` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rolemgmttbl`
--

INSERT INTO `rolemgmttbl` (`rolemgmtid`, `roleid`, `navigationid`, `reserve1`, `reserve2`, `reserve3`, `reserve4`, `reserve5`, `reserve6`, `reserve7`, `reserve8`, `reserve9`, `reserve10`) VALUES
(1, 1, '#nav1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, '#nav2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, '#nav3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, '#nav4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 1, '#nav5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 1, '#nav6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 1, '#nav7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roletbl`
--

CREATE TABLE IF NOT EXISTS `roletbl` (
  `roleid` bigint(20) NOT NULL,
  `rolename` varchar(10) DEFAULT NULL,
  `roledescription` varchar(30) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roletbl`
--

INSERT INTO `roletbl` (`roleid`, `rolename`, `roledescription`) VALUES
(1, 'role1', 'Administrator'),
(2, 'role2', 'Staff'),
(3, 'role3', '');

-- --------------------------------------------------------

--
-- Table structure for table `usertbl`
--

CREATE TABLE IF NOT EXISTS `usertbl` (
  `userid` bigint(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `staffcode` int(11) DEFAULT NULL,
  `roleid` bigint(20) NOT NULL,
  `mid` bigint(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usertbl`
--

INSERT INTO `usertbl` (`userid`, `username`, `password`, `staffcode`, `roleid`, `mid`) VALUES
(1, 'admin', 'admin', 1, 2, 1),
(2, 'shishir', 'shishir', 10, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branchdetailtbl`
--
ALTER TABLE `branchdetailtbl`
  ADD PRIMARY KEY (`branchid`);

--
-- Indexes for table `mainusertbl`
--
ALTER TABLE `mainusertbl`
  ADD PRIMARY KEY (`mid`), ADD KEY `fk_mainusertbl_branchid` (`branchid`);

--
-- Indexes for table `rolemgmttbl`
--
ALTER TABLE `rolemgmttbl`
  ADD PRIMARY KEY (`rolemgmtid`), ADD KEY `fk_rolemgmttbl_roleid` (`roleid`);

--
-- Indexes for table `roletbl`
--
ALTER TABLE `roletbl`
  ADD PRIMARY KEY (`roleid`);

--
-- Indexes for table `usertbl`
--
ALTER TABLE `usertbl`
  ADD PRIMARY KEY (`userid`), ADD KEY `fk_usertbl_mid` (`mid`), ADD KEY `fk_usertbl_roleid` (`roleid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branchdetailtbl`
--
ALTER TABLE `branchdetailtbl`
  MODIFY `branchid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mainusertbl`
--
ALTER TABLE `mainusertbl`
  MODIFY `mid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `rolemgmttbl`
--
ALTER TABLE `rolemgmttbl`
  MODIFY `rolemgmtid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `roletbl`
--
ALTER TABLE `roletbl`
  MODIFY `roleid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `usertbl`
--
ALTER TABLE `usertbl`
  MODIFY `userid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `mainusertbl`
--
ALTER TABLE `mainusertbl`
ADD CONSTRAINT `fk_mainusertbl_branchid` FOREIGN KEY (`branchid`) REFERENCES `branchdetailtbl` (`branchid`) ON UPDATE CASCADE;

--
-- Constraints for table `rolemgmttbl`
--
ALTER TABLE `rolemgmttbl`
ADD CONSTRAINT `fk_rolemgmttbl_roleid` FOREIGN KEY (`roleid`) REFERENCES `roletbl` (`roleid`) ON UPDATE CASCADE;

--
-- Constraints for table `usertbl`
--
ALTER TABLE `usertbl`
ADD CONSTRAINT `fk_usertbl_mid` FOREIGN KEY (`mid`) REFERENCES `mainusertbl` (`mid`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_usertbl_roleid` FOREIGN KEY (`roleid`) REFERENCES `roletbl` (`roleid`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
