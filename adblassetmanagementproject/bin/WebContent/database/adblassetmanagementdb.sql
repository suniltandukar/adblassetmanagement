-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2017 at 07:10 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `branchdetailtbl`
--

INSERT INTO `branchdetailtbl` (`branchid`, `branchname`, `branchaddress`, `branchdb`) VALUES
(1, 'Head Office', 'Singha Durbar, Kathmandu', 'adblheadofficedb'),
(2, 'Kirtipur', 'kirtipur', 'kirtipurbranch'),
(3, 'kalimati', 'kalimati', 'adblkalimatidb');

-- --------------------------------------------------------

--
-- Table structure for table `companycodetbl`
--

CREATE TABLE IF NOT EXISTS `companycodetbl` (
  `cid` int(10) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `branchcode` varchar(30) DEFAULT NULL,
  `reserved` varchar(30) DEFAULT NULL,
  `reserved1` varchar(30) DEFAULT NULL,
  `branchdbname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companycodetbl`
--

INSERT INTO `companycodetbl` (`cid`, `name`, `address`, `branchcode`, `reserved`, `reserved1`, `branchdbname`) VALUES
(1, 'Head Office', 'RamshahPath', 'HO', NULL, NULL, 'adblheadofficedb'),
(2, 'Kalimati', 'Kalimati', 'KA', NULL, NULL, 'adblkalimatidb'),
(3, 'Kalanki', 'Kalanki', 'KK', NULL, NULL, ''),
(4, 'Kuleshwor', 'Kuleshwor', 'KU', NULL, NULL, ''),
(5, 'Koteshwor', 'Koteshwor', 'KO', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loginhistorytbl`
--

CREATE TABLE IF NOT EXISTS `loginhistorytbl` (
  `loginhistoryid` bigint(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `ipaddress` varchar(50) NOT NULL,
  `macaddress` varchar(50) NOT NULL,
  `logindatetime` varchar(50) NOT NULL,
  `reserved1` varchar(50) DEFAULT NULL,
  `reserved2` varchar(50) DEFAULT NULL,
  `reserved3` varchar(50) DEFAULT NULL,
  `reserved4` varchar(50) DEFAULT NULL,
  `reserved5` varchar(50) DEFAULT NULL,
  `reserved6` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1280 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `loginhistorytbl`
--

INSERT INTO `loginhistorytbl` (`loginhistoryid`, `username`, `ipaddress`, `macaddress`, `logindatetime`, `reserved1`, `reserved2`, `reserved3`, `reserved4`, `reserved5`, `reserved6`) VALUES
(1271, 'admin', 'DESKTOP-BQ8PH7N/169.254.13.36', '00-FF-46-73-86-9B', '2017-12-29 11:23:19', NULL, NULL, NULL, NULL, NULL, NULL),
(1272, 'admin', 'DESKTOP-BQ8PH7N/169.254.13.36', '00-FF-46-73-86-9B', '2017-12-29 11:27:22', NULL, NULL, NULL, NULL, NULL, NULL),
(1273, 'admin', 'DESKTOP-BQ8PH7N/169.254.13.36', '00-FF-46-73-86-9B', '2017-12-29 11:29:19', NULL, NULL, NULL, NULL, NULL, NULL),
(1274, 'admin', 'DESKTOP-BQ8PH7N/169.254.13.36', '00-FF-46-73-86-9B', '2017-12-29 11:31:11', NULL, NULL, NULL, NULL, NULL, NULL),
(1275, 'admin', 'DESKTOP-BQ8PH7N/169.254.13.36', '00-FF-46-73-86-9B', '2017-12-29 11:37:09', NULL, NULL, NULL, NULL, NULL, NULL),
(1276, 'admin', 'DESKTOP-BQ8PH7N/169.254.13.36', '00-FF-46-73-86-9B', '2017-12-29 11:38:44', NULL, NULL, NULL, NULL, NULL, NULL),
(1277, 'admin', 'DESKTOP-BQ8PH7N/169.254.13.36', '00-FF-46-73-86-9B', '2017-12-29 11:49:00', NULL, NULL, NULL, NULL, NULL, NULL),
(1278, 'admin', 'DESKTOP-BQ8PH7N/169.254.13.36', '00-FF-46-73-86-9B', '2017-12-29 11:50:39', NULL, NULL, NULL, NULL, NULL, NULL),
(1279, 'admin', 'DESKTOP-BQ8PH7N/169.254.13.36', '00-FF-46-73-86-9B', '2017-12-29 11:53:25', NULL, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mainusertbl`
--

INSERT INTO `mainusertbl` (`mid`, `mainusername`, `mainpassword`, `staffcode`, `branchid`) VALUES
(1, 'admin', 'admin', 1, 1),
(2, 'kalimati', 'kalimati', 999, 3);

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
  `add` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rolemgmttbl`
--

INSERT INTO `rolemgmttbl` (`rolemgmtid`, `roleid`, `navigationid`, `reserve1`, `reserve2`, `reserve3`, `reserve4`, `reserve5`, `reserve6`, `reserve7`, `reserve8`, `reserve9`, `add`) VALUES
(1, 1, '#nav1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `roletbl`
--

CREATE TABLE IF NOT EXISTS `roletbl` (
  `roleid` bigint(20) NOT NULL,
  `rolename` varchar(10) DEFAULT NULL,
  `roledescription` varchar(30) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roletbl`
--

INSERT INTO `roletbl` (`roleid`, `rolename`, `roledescription`) VALUES
(1, 'role1', 'admin'),
(2, 'role2', 'staff');

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
  `mid` bigint(20) NOT NULL,
  `cid` int(10) DEFAULT NULL,
  `edate` varchar(10) NOT NULL,
  `enddate` varchar(10) NOT NULL,
  `givenrole` varchar(500) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usertbl`
--

INSERT INTO `usertbl` (`userid`, `username`, `password`, `staffcode`, `roleid`, `mid`, `cid`, `edate`, `enddate`, `givenrole`) VALUES
(1, 'admin', 'admin', 1, 1, 1, 1, '2012-02-02', '2018-02-02', '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove, #pendingtransfer, #transferhistory, #transfer\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branchdetailtbl`
--
ALTER TABLE `branchdetailtbl`
  ADD PRIMARY KEY (`branchid`);

--
-- Indexes for table `companycodetbl`
--
ALTER TABLE `companycodetbl`
  ADD PRIMARY KEY (`cid`), ADD UNIQUE KEY `branchcode` (`branchcode`);

--
-- Indexes for table `loginhistorytbl`
--
ALTER TABLE `loginhistorytbl`
  ADD PRIMARY KEY (`loginhistoryid`);

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
  ADD PRIMARY KEY (`userid`), ADD KEY `fk_usertbl_mid` (`mid`), ADD KEY `fk_usertbl_cid` (`cid`), ADD KEY `fk_usertbl_roleid` (`roleid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branchdetailtbl`
--
ALTER TABLE `branchdetailtbl`
  MODIFY `branchid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `companycodetbl`
--
ALTER TABLE `companycodetbl`
  MODIFY `cid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `loginhistorytbl`
--
ALTER TABLE `loginhistorytbl`
  MODIFY `loginhistoryid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1280;
--
-- AUTO_INCREMENT for table `mainusertbl`
--
ALTER TABLE `mainusertbl`
  MODIFY `mid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `rolemgmttbl`
--
ALTER TABLE `rolemgmttbl`
  MODIFY `rolemgmtid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `roletbl`
--
ALTER TABLE `roletbl`
  MODIFY `roleid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `usertbl`
--
ALTER TABLE `usertbl`
  MODIFY `userid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
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
ADD CONSTRAINT `fk_usertbl_cid` FOREIGN KEY (`cid`) REFERENCES `companycodetbl` (`cid`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_usertbl_mid` FOREIGN KEY (`mid`) REFERENCES `mainusertbl` (`mid`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_usertbl_roleid` FOREIGN KEY (`roleid`) REFERENCES `roletbl` (`roleid`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
