-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2018 at 06:26 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `adblheadofficedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `amctbl`
--

CREATE TABLE IF NOT EXISTS `amctbl` (
  `amcid` bigint(20) NOT NULL,
  `amcstart` varchar(10) DEFAULT NULL,
  `amcstarten` varchar(10) DEFAULT NULL,
  `amcend` varchar(10) DEFAULT NULL,
  `amcenden` varchar(10) DEFAULT NULL,
  `amccost` double DEFAULT NULL,
  `amccompanyid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `billportpathtbl`
--

CREATE TABLE IF NOT EXISTS `billportpathtbl` (
  `billportpathid` bigint(20) NOT NULL,
  `ipport` varchar(20) NOT NULL,
  `filepath` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `billportpathtbl`
--

INSERT INTO `billportpathtbl` (`billportpathid`, `ipport`, `filepath`) VALUES
(1, 'localhost:8080', 'adblassetmanagementproject/view/uploadedbills');

-- --------------------------------------------------------

--
-- Table structure for table `billtbl`
--

CREATE TABLE IF NOT EXISTS `billtbl` (
  `billid` bigint(20) NOT NULL,
  `billno` varchar(20) DEFAULT NULL,
  `companyid` bigint(20) DEFAULT NULL,
  `billdate` varchar(10) DEFAULT NULL,
  `billdateen` varchar(10) DEFAULT NULL,
  `billimageoriginalname` varchar(80) DEFAULT NULL,
  `billimagegeneratedname` varchar(50) DEFAULT NULL,
  `billimagepath` varchar(500) DEFAULT NULL,
  `billportpathid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `billtbl`
--

INSERT INTO `billtbl` (`billid`, `billno`, `companyid`, `billdate`, `billdateen`, `billimageoriginalname`, `billimagegeneratedname`, `billimagepath`, `billportpathid`) VALUES
(7, '121212', NULL, '2050-11-11', '1994-02-23', 'icon.png', '20501212121994', 'D:/xampp/tomcat/webapps/image', 1),
(8, '111', 4, '2012-02-02', '1955-05-16', '1100.jpg', '20121111955', 'C:/Users/sunil/git/adblassetmanagementproject/adblassetmanagementproject/WebContent/view/uploadedbills', 1);

-- --------------------------------------------------------

--
-- Table structure for table `branchtbl`
--

CREATE TABLE IF NOT EXISTS `branchtbl` (
  `companyId` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `branchId` varchar(4) CHARACTER SET utf8 NOT NULL,
  `branchName` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `branchAddress` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `branchPhone` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `branchFax` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `branchemail` varchar(70) CHARACTER SET utf8 DEFAULT NULL,
  `reserve1` varchar(70) CHARACTER SET utf8 DEFAULT NULL,
  `reserve2` varchar(70) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branchtbl`
--

INSERT INTO `branchtbl` (`companyId`, `branchId`, `branchName`, `branchAddress`, `branchPhone`, `branchFax`, `branchemail`, `reserve1`, `reserve2`) VALUES
('1231', '001', 'Kalimati', '12', '12', '12', NULL, NULL, NULL),
('123', '123', 'Kirtipur', NULL, '12', '12', NULL, NULL, NULL);

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
  `reserved1` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `companytbl`
--

CREATE TABLE IF NOT EXISTS `companytbl` (
  `companyid` bigint(20) NOT NULL,
  `vatpan` varchar(30) NOT NULL,
  `companyname` varchar(50) DEFAULT NULL,
  `companyaddress` varchar(100) DEFAULT NULL,
  `companycontactno` varchar(10) DEFAULT NULL,
  `companyemail` varchar(30) DEFAULT NULL,
  `companycontactperson` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companytbl`
--

INSERT INTO `companytbl` (`companyid`, `vatpan`, `companyname`, `companyaddress`, `companycontactno`, `companyemail`, `companycontactperson`) VALUES
(4, 'none', 'none', 'none', 'none', 'none', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `depreciationtbl`
--

CREATE TABLE IF NOT EXISTS `depreciationtbl` (
  `did` bigint(20) NOT NULL,
  `lastyearDepreciation` varchar(100) DEFAULT NULL,
  `thisyearDepreciation` varchar(100) DEFAULT NULL,
  `totalDepreciation` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fundsourcetbl`
--

CREATE TABLE IF NOT EXISTS `fundsourcetbl` (
  `fundsourceid` bigint(20) NOT NULL,
  `sourcename` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fundsourcetbl`
--

INSERT INTO `fundsourcetbl` (`fundsourceid`, `sourcename`) VALUES
(4, 'none');

-- --------------------------------------------------------

--
-- Table structure for table `grouptbl`
--

CREATE TABLE IF NOT EXISTS `grouptbl` (
  `groupcode` varchar(10) NOT NULL,
  `groupname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `insurancetbl`
--

CREATE TABLE IF NOT EXISTS `insurancetbl` (
  `insuranceid` bigint(20) NOT NULL,
  `insurancecompanyid` bigint(20) DEFAULT NULL,
  `insurancestart` varchar(10) DEFAULT NULL,
  `insurancestarten` varchar(10) DEFAULT NULL,
  `insuranceend` varchar(10) DEFAULT NULL,
  `insuranceenden` varchar(10) DEFAULT NULL,
  `insurancepremiumamount` double DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `inventoryitemdetail`
--
CREATE TABLE IF NOT EXISTS `inventoryitemdetail` (
`itemcode` varchar(20)
,`branchCode` varchar(10)
,`donationpercentage` varchar(5)
,`transactionid` varchar(20)
,`legacyid` varchar(30)
,`itemname` varchar(30)
,`model` varchar(30)
,`decisiondate` varchar(10)
,`decisiondateen` varchar(10)
,`purchasedate` varchar(10)
,`purchasedateen` varchar(10)
,`depreciationrate` varchar(3)
,`transactiondateen` varchar(10)
,`groupcode` varchar(10)
,`groupname` varchar(20)
,`inventoryotherdetailid` bigint(20)
,`unitname` varchar(20)
,`rate` double
,`itemsize` varchar(20)
,`vehicleno` varchar(20)
,`chesisno` varchar(30)
,`engineno` varchar(30)
,`macaddress` varchar(30)
,`licenseno` varchar(30)
,`supplierid` bigint(20)
,`companyid` bigint(20)
,`vatpan` varchar(30)
,`companyname` varchar(50)
,`companyaddress` varchar(100)
,`companycontactno` varchar(10)
,`companyemail` varchar(30)
,`companycontactperson` varchar(50)
,`amcid` bigint(20)
,`amcstart` varchar(10)
,`amcstarten` varchar(10)
,`amcend` varchar(10)
,`amcenden` varchar(10)
,`amccost` double
,`amccompanyid` bigint(20)
,`insuranceid` bigint(20)
,`insurancecompanyid` bigint(20)
,`insurancestart` varchar(10)
,`insurancestarten` varchar(10)
,`insuranceend` varchar(10)
,`insuranceenden` varchar(10)
,`insurancepremiumamount` double
,`warrantyid` bigint(20)
,`warrantystart` varchar(10)
,`warrantystarten` varchar(20)
,`warrantyend` varchar(10)
,`warrantyenden` varchar(20)
,`fundsourceid` bigint(20)
,`sourcename` varchar(30)
,`itemconditionid` bigint(20)
,`itemconditionname` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `inventoryotherdetailtbl`
--

CREATE TABLE IF NOT EXISTS `inventoryotherdetailtbl` (
  `inventoryotherdetailid` bigint(20) NOT NULL,
  `fundsourceid` bigint(20) DEFAULT NULL,
  `unitname` varchar(20) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `warrantyid` bigint(20) DEFAULT NULL,
  `amcid` bigint(20) DEFAULT NULL,
  `insuranceid` bigint(20) DEFAULT NULL,
  `supplierid` bigint(20) DEFAULT NULL,
  `itemconditionid` bigint(20) DEFAULT NULL,
  `itemsize` varchar(20) DEFAULT NULL,
  `vehicleno` varchar(20) DEFAULT NULL,
  `chesisno` varchar(30) DEFAULT NULL,
  `engineno` varchar(30) DEFAULT NULL,
  `macaddress` varchar(30) DEFAULT NULL,
  `licenseno` varchar(30) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inventorytbl`
--

CREATE TABLE IF NOT EXISTS `inventorytbl` (
  `itemcode` varchar(20) NOT NULL,
  `transactionid` varchar(20) DEFAULT NULL,
  `legacyid` varchar(30) DEFAULT NULL,
  `groupcode` varchar(10) DEFAULT NULL,
  `itemname` varchar(30) DEFAULT NULL,
  `model` varchar(30) DEFAULT NULL,
  `decisiondate` varchar(10) DEFAULT NULL,
  `decisiondateen` varchar(10) DEFAULT NULL,
  `purchasedate` varchar(10) DEFAULT NULL,
  `purchasedateen` varchar(10) DEFAULT NULL,
  `depreciationrate` varchar(3) DEFAULT NULL,
  `inventoryotherdetailid` bigint(20) DEFAULT NULL,
  `transactiondateen` varchar(10) DEFAULT NULL,
  `issueid` bigint(20) DEFAULT NULL,
  `transferid` bigint(20) DEFAULT NULL,
  `cid` int(10) DEFAULT NULL,
  `branchCode` varchar(10) NOT NULL,
  `custno` int(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `donationpercentage` varchar(5) DEFAULT '0.00',
  `inputter` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `issuetbl`
--

CREATE TABLE IF NOT EXISTS `issuetbl` (
  `issueid` bigint(20) NOT NULL,
  `issuedby` varchar(30) DEFAULT NULL,
  `issuedto` varchar(30) DEFAULT NULL,
  `issueddate` varchar(10) DEFAULT NULL,
  `issueddateen` varchar(10) DEFAULT NULL,
  `statusid` bigint(20) DEFAULT NULL,
  `issueitemcode` varchar(50) DEFAULT NULL,
  `reserve2` varchar(50) DEFAULT NULL,
  `reserve3` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `itemconditiontbl`
--

CREATE TABLE IF NOT EXISTS `itemconditiontbl` (
  `itemconditionid` bigint(20) NOT NULL,
  `itemconditionname` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `itemconditiontbl`
--

INSERT INTO `itemconditiontbl` (`itemconditionid`, `itemconditionname`) VALUES
(3, 'none');

-- --------------------------------------------------------

--
-- Table structure for table `roleindex`
--

CREATE TABLE IF NOT EXISTS `roleindex` (
  `roles` varchar(500) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roleindex`
--

INSERT INTO `roleindex` (`roles`, `name`) VALUES
('#dashboard,#items,#transferissue,#bill,#settings,#usersettings', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `statustbl`
--

CREATE TABLE IF NOT EXISTS `statustbl` (
  `statusid` bigint(20) NOT NULL,
  `statusname` varchar(20) NOT NULL,
  `statusdescription` varchar(30) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statustbl`
--

INSERT INTO `statustbl` (`statusid`, `statusname`, `statusdescription`) VALUES
(1, '0', 'rejected'),
(2, '1', 'accepted'),
(3, 'p', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `transferhistorytbl`
--

CREATE TABLE IF NOT EXISTS `transferhistorytbl` (
  `thid` bigint(20) NOT NULL,
  `transferid` bigint(20) DEFAULT NULL,
  `itemcode` varchar(20) DEFAULT NULL,
  `cid` int(10) DEFAULT NULL,
  `reserve1` varchar(50) DEFAULT NULL,
  `reserve2` varchar(50) DEFAULT NULL,
  `reserve3` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transfertbl`
--

CREATE TABLE IF NOT EXISTS `transfertbl` (
  `transferid` bigint(20) NOT NULL,
  `transferedby` varchar(30) DEFAULT NULL,
  `branchby` varchar(30) DEFAULT NULL,
  `transferedto` varchar(30) DEFAULT NULL,
  `branchto` varchar(30) DEFAULT NULL,
  `transfereddate` varchar(10) DEFAULT NULL,
  `transfereddateen` varchar(10) DEFAULT NULL,
  `statusid` bigint(20) DEFAULT NULL,
  `reserve1` varchar(50) DEFAULT NULL,
  `reserve2` varchar(50) DEFAULT NULL,
  `reserve3` varchar(50) DEFAULT NULL,
  `branchname` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `unittbl`
--

CREATE TABLE IF NOT EXISTS `unittbl` (
  `unitid` bigint(20) NOT NULL,
  `unitname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usertbl`
--

CREATE TABLE IF NOT EXISTS `usertbl` (
  `userid` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 NOT NULL,
  `status` varchar(1) CHARACTER SET utf8 NOT NULL DEFAULT '1',
  `givenrole` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `fullName` varchar(30) DEFAULT NULL,
  `post` varchar(30) DEFAULT NULL,
  `staffCode` varchar(10) DEFAULT NULL,
  `startDate` varchar(10) DEFAULT NULL,
  `endDate` varchar(10) DEFAULT NULL,
  `branchCode` varchar(10) DEFAULT NULL,
  `roleName` varchar(30) DEFAULT NULL,
  `functionAllowed` varchar(500) DEFAULT NULL,
  `functionRestriction` varchar(500) DEFAULT NULL,
  `branchAllowed` varchar(500) DEFAULT NULL,
  `additionalFunctions` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `branchAllowedFunctions` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `reserved4` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `reserved5` varchar(50) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertbl`
--

INSERT INTO `usertbl` (`userid`, `username`, `password`, `status`, `givenrole`, `fullName`, `post`, `staffCode`, `startDate`, `endDate`, `branchCode`, `roleName`, `functionAllowed`, `functionRestriction`, `branchAllowed`, `additionalFunctions`, `branchAllowedFunctions`, `reserved4`, `reserved5`) VALUES
(48, 'admin', 'admin', '1', 'admin', 'admin', 'admin', '1', '2015-02-02', '2018-12-01', '001', NULL, '#a,#e,#v,#i', NULL, 'null', 'null', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warrantytbl`
--

CREATE TABLE IF NOT EXISTS `warrantytbl` (
  `warrantyid` bigint(20) NOT NULL,
  `warrantystart` varchar(10) DEFAULT NULL,
  `warrantystarten` varchar(20) NOT NULL,
  `warrantyend` varchar(10) DEFAULT NULL,
  `warrantyenden` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure for view `inventoryitemdetail`
--
DROP TABLE IF EXISTS `inventoryitemdetail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `inventoryitemdetail` AS select `inventorytbl`.`itemcode` AS `itemcode`,`inventorytbl`.`branchCode` AS `branchCode`,`inventorytbl`.`donationpercentage` AS `donationpercentage`,`inventorytbl`.`transactionid` AS `transactionid`,`inventorytbl`.`legacyid` AS `legacyid`,`inventorytbl`.`itemname` AS `itemname`,`inventorytbl`.`model` AS `model`,`inventorytbl`.`decisiondate` AS `decisiondate`,`inventorytbl`.`decisiondateen` AS `decisiondateen`,`inventorytbl`.`purchasedate` AS `purchasedate`,`inventorytbl`.`purchasedateen` AS `purchasedateen`,`inventorytbl`.`depreciationrate` AS `depreciationrate`,`inventorytbl`.`transactiondateen` AS `transactiondateen`,`grouptbl`.`groupcode` AS `groupcode`,`grouptbl`.`groupname` AS `groupname`,`inventoryotherdetailtbl`.`inventoryotherdetailid` AS `inventoryotherdetailid`,`inventoryotherdetailtbl`.`unitname` AS `unitname`,`inventoryotherdetailtbl`.`rate` AS `rate`,`inventoryotherdetailtbl`.`itemsize` AS `itemsize`,`inventoryotherdetailtbl`.`vehicleno` AS `vehicleno`,`inventoryotherdetailtbl`.`chesisno` AS `chesisno`,`inventoryotherdetailtbl`.`engineno` AS `engineno`,`inventoryotherdetailtbl`.`macaddress` AS `macaddress`,`inventoryotherdetailtbl`.`licenseno` AS `licenseno`,`inventoryotherdetailtbl`.`supplierid` AS `supplierid`,`companytbl`.`companyid` AS `companyid`,`companytbl`.`vatpan` AS `vatpan`,`companytbl`.`companyname` AS `companyname`,`companytbl`.`companyaddress` AS `companyaddress`,`companytbl`.`companycontactno` AS `companycontactno`,`companytbl`.`companyemail` AS `companyemail`,`companytbl`.`companycontactperson` AS `companycontactperson`,`amctbl`.`amcid` AS `amcid`,`amctbl`.`amcstart` AS `amcstart`,`amctbl`.`amcstarten` AS `amcstarten`,`amctbl`.`amcend` AS `amcend`,`amctbl`.`amcenden` AS `amcenden`,`amctbl`.`amccost` AS `amccost`,`amctbl`.`amccompanyid` AS `amccompanyid`,`insurancetbl`.`insuranceid` AS `insuranceid`,`insurancetbl`.`insurancecompanyid` AS `insurancecompanyid`,`insurancetbl`.`insurancestart` AS `insurancestart`,`insurancetbl`.`insurancestarten` AS `insurancestarten`,`insurancetbl`.`insuranceend` AS `insuranceend`,`insurancetbl`.`insuranceenden` AS `insuranceenden`,`insurancetbl`.`insurancepremiumamount` AS `insurancepremiumamount`,`warrantytbl`.`warrantyid` AS `warrantyid`,`warrantytbl`.`warrantystart` AS `warrantystart`,`warrantytbl`.`warrantystarten` AS `warrantystarten`,`warrantytbl`.`warrantyend` AS `warrantyend`,`warrantytbl`.`warrantyenden` AS `warrantyenden`,`fundsourcetbl`.`fundsourceid` AS `fundsourceid`,`fundsourcetbl`.`sourcename` AS `sourcename`,`itemconditiontbl`.`itemconditionid` AS `itemconditionid`,`itemconditiontbl`.`itemconditionname` AS `itemconditionname` from ((((((((`inventorytbl` join `grouptbl` on((`inventorytbl`.`groupcode` = `grouptbl`.`groupcode`))) join `inventoryotherdetailtbl` on((`inventorytbl`.`inventoryotherdetailid` = `inventoryotherdetailtbl`.`inventoryotherdetailid`))) join `companytbl` on((`inventoryotherdetailtbl`.`supplierid` = `companytbl`.`companyid`))) join `amctbl` on((`amctbl`.`amcid` = `inventoryotherdetailtbl`.`amcid`))) join `insurancetbl` on((`insurancetbl`.`insuranceid` = `inventoryotherdetailtbl`.`insuranceid`))) join `warrantytbl` on((`inventoryotherdetailtbl`.`warrantyid` = `warrantytbl`.`warrantyid`))) join `fundsourcetbl` on((`inventoryotherdetailtbl`.`fundsourceid` = `fundsourcetbl`.`fundsourceid`))) join `itemconditiontbl` on((`inventoryotherdetailtbl`.`itemconditionid` = `itemconditiontbl`.`itemconditionid`)));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amctbl`
--
ALTER TABLE `amctbl`
  ADD PRIMARY KEY (`amcid`), ADD KEY `fk_amctbl_companyid` (`amccompanyid`);

--
-- Indexes for table `billportpathtbl`
--
ALTER TABLE `billportpathtbl`
  ADD PRIMARY KEY (`billportpathid`);

--
-- Indexes for table `billtbl`
--
ALTER TABLE `billtbl`
  ADD PRIMARY KEY (`billid`), ADD KEY `fk_billtbl_billportpathid` (`billportpathid`), ADD KEY `fk_billtbl_companyid` (`companyid`);

--
-- Indexes for table `companycodetbl`
--
ALTER TABLE `companycodetbl`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `companytbl`
--
ALTER TABLE `companytbl`
  ADD PRIMARY KEY (`companyid`);

--
-- Indexes for table `depreciationtbl`
--
ALTER TABLE `depreciationtbl`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `fundsourcetbl`
--
ALTER TABLE `fundsourcetbl`
  ADD PRIMARY KEY (`fundsourceid`);

--
-- Indexes for table `grouptbl`
--
ALTER TABLE `grouptbl`
  ADD PRIMARY KEY (`groupcode`);

--
-- Indexes for table `insurancetbl`
--
ALTER TABLE `insurancetbl`
  ADD PRIMARY KEY (`insuranceid`), ADD KEY `fk_insurancetbl_companyid` (`insurancecompanyid`);

--
-- Indexes for table `inventoryotherdetailtbl`
--
ALTER TABLE `inventoryotherdetailtbl`
  ADD PRIMARY KEY (`inventoryotherdetailid`), ADD KEY `fk_inventoryotherdetailtbl_fundsourceid` (`fundsourceid`), ADD KEY `fk_inventoryotherdetailtbl_warrantyid` (`warrantyid`), ADD KEY `fk_inventoryotherdetailtbl_amcid` (`amcid`), ADD KEY `fk_inventoryotherdetailtbl_supplierid` (`supplierid`), ADD KEY `fk_inventoryotherdetailtbl_itemconditionid` (`itemconditionid`);

--
-- Indexes for table `inventorytbl`
--
ALTER TABLE `inventorytbl`
  ADD PRIMARY KEY (`itemcode`), ADD KEY `fk_inventorytbl_cid` (`cid`), ADD KEY `fk_inventorytbl_inventoryotherdetailid` (`inventoryotherdetailid`), ADD KEY `fk_inventorytbl_issueid` (`issueid`), ADD KEY `fk_inventorytbl_transferid` (`transferid`);

--
-- Indexes for table `issuetbl`
--
ALTER TABLE `issuetbl`
  ADD PRIMARY KEY (`issueid`), ADD KEY `fk_issuetbl_statusid` (`statusid`);

--
-- Indexes for table `itemconditiontbl`
--
ALTER TABLE `itemconditiontbl`
  ADD PRIMARY KEY (`itemconditionid`);

--
-- Indexes for table `statustbl`
--
ALTER TABLE `statustbl`
  ADD PRIMARY KEY (`statusid`);

--
-- Indexes for table `transferhistorytbl`
--
ALTER TABLE `transferhistorytbl`
  ADD PRIMARY KEY (`thid`), ADD KEY `fk_transferhistorytbl_cid` (`cid`), ADD KEY `fk_transferhistorytbl_transferid` (`transferid`), ADD KEY `fk_transferhistorytbl_itemcode` (`itemcode`);

--
-- Indexes for table `transfertbl`
--
ALTER TABLE `transfertbl`
  ADD PRIMARY KEY (`transferid`), ADD KEY `fk_transfertbl_statusid` (`statusid`);

--
-- Indexes for table `unittbl`
--
ALTER TABLE `unittbl`
  ADD PRIMARY KEY (`unitid`);

--
-- Indexes for table `usertbl`
--
ALTER TABLE `usertbl`
  ADD PRIMARY KEY (`userid`), ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `warrantytbl`
--
ALTER TABLE `warrantytbl`
  ADD PRIMARY KEY (`warrantyid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amctbl`
--
ALTER TABLE `amctbl`
  MODIFY `amcid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `billtbl`
--
ALTER TABLE `billtbl`
  MODIFY `billid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `companycodetbl`
--
ALTER TABLE `companycodetbl`
  MODIFY `cid` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `companytbl`
--
ALTER TABLE `companytbl`
  MODIFY `companyid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `depreciationtbl`
--
ALTER TABLE `depreciationtbl`
  MODIFY `did` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fundsourcetbl`
--
ALTER TABLE `fundsourcetbl`
  MODIFY `fundsourceid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `insurancetbl`
--
ALTER TABLE `insurancetbl`
  MODIFY `insuranceid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `inventoryotherdetailtbl`
--
ALTER TABLE `inventoryotherdetailtbl`
  MODIFY `inventoryotherdetailid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `issuetbl`
--
ALTER TABLE `issuetbl`
  MODIFY `issueid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `itemconditiontbl`
--
ALTER TABLE `itemconditiontbl`
  MODIFY `itemconditionid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `statustbl`
--
ALTER TABLE `statustbl`
  MODIFY `statusid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `transferhistorytbl`
--
ALTER TABLE `transferhistorytbl`
  MODIFY `thid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transfertbl`
--
ALTER TABLE `transfertbl`
  MODIFY `transferid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unittbl`
--
ALTER TABLE `unittbl`
  MODIFY `unitid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usertbl`
--
ALTER TABLE `usertbl`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `warrantytbl`
--
ALTER TABLE `warrantytbl`
  MODIFY `warrantyid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `amctbl`
--
ALTER TABLE `amctbl`
ADD CONSTRAINT `fk_amctbl_companyid` FOREIGN KEY (`amccompanyid`) REFERENCES `companytbl` (`companyid`) ON UPDATE CASCADE;

--
-- Constraints for table `billtbl`
--
ALTER TABLE `billtbl`
ADD CONSTRAINT `fk_billtbl_billportpathid` FOREIGN KEY (`billportpathid`) REFERENCES `billportpathtbl` (`billportpathid`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_billtbl_companyid` FOREIGN KEY (`companyid`) REFERENCES `companytbl` (`companyid`) ON UPDATE CASCADE;

--
-- Constraints for table `insurancetbl`
--
ALTER TABLE `insurancetbl`
ADD CONSTRAINT `fk_insurancetbl_companyid` FOREIGN KEY (`insurancecompanyid`) REFERENCES `companytbl` (`companyid`) ON UPDATE CASCADE;

--
-- Constraints for table `inventoryotherdetailtbl`
--
ALTER TABLE `inventoryotherdetailtbl`
ADD CONSTRAINT `fk_inventoryotherdetailtbl_amcid` FOREIGN KEY (`amcid`) REFERENCES `amctbl` (`amcid`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_inventoryotherdetailtbl_fundsourceid` FOREIGN KEY (`fundsourceid`) REFERENCES `fundsourcetbl` (`fundsourceid`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_inventoryotherdetailtbl_itemconditionid` FOREIGN KEY (`itemconditionid`) REFERENCES `itemconditiontbl` (`itemconditionid`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_inventoryotherdetailtbl_supplierid` FOREIGN KEY (`supplierid`) REFERENCES `companytbl` (`companyid`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_inventoryotherdetailtbl_warrantyid` FOREIGN KEY (`warrantyid`) REFERENCES `warrantytbl` (`warrantyid`) ON UPDATE CASCADE;

--
-- Constraints for table `inventorytbl`
--
ALTER TABLE `inventorytbl`
ADD CONSTRAINT `fk_inventorytbl_inventoryotherdetailid` FOREIGN KEY (`inventoryotherdetailid`) REFERENCES `inventoryotherdetailtbl` (`inventoryotherdetailid`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_inventorytbl_issueid` FOREIGN KEY (`issueid`) REFERENCES `issuetbl` (`issueid`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_inventorytbl_transferid` FOREIGN KEY (`transferid`) REFERENCES `transfertbl` (`transferid`) ON UPDATE CASCADE;

--
-- Constraints for table `issuetbl`
--
ALTER TABLE `issuetbl`
ADD CONSTRAINT `fk_issuetbl_statusid` FOREIGN KEY (`statusid`) REFERENCES `statustbl` (`statusid`) ON UPDATE CASCADE;

--
-- Constraints for table `transferhistorytbl`
--
ALTER TABLE `transferhistorytbl`
ADD CONSTRAINT `fk_transferhistorytbl_cid` FOREIGN KEY (`cid`) REFERENCES `companycodetbl` (`cid`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_transferhistorytbl_itemcode` FOREIGN KEY (`itemcode`) REFERENCES `inventorytbl` (`itemcode`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_transferhistorytbl_transferid` FOREIGN KEY (`transferid`) REFERENCES `transfertbl` (`transferid`) ON UPDATE CASCADE;

--
-- Constraints for table `transfertbl`
--
ALTER TABLE `transfertbl`
ADD CONSTRAINT `fk_transfertbl_statusid` FOREIGN KEY (`statusid`) REFERENCES `statustbl` (`statusid`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
