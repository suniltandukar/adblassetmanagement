-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2017 at 02:22 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `amctbl`
--

INSERT INTO `amctbl` (`amcid`, `amcstart`, `amcstarten`, `amcend`, `amcenden`, `amccost`, `amccompanyid`) VALUES
(6, 'das', '', '', '', 250, 3),
(7, '', '', '', '', 0, 3),
(8, '', '', '', '', 0, 3),
(9, '', '', '', '', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `billtbl`
--

CREATE TABLE IF NOT EXISTS `billtbl` (
  `billid` bigint(20) NOT NULL,
  `billno` varchar(20) DEFAULT NULL,
  `companyname` varchar(50) DEFAULT NULL,
  `billdate` varchar(10) DEFAULT NULL,
  `billdateen` varchar(10) DEFAULT NULL,
  `billimageoriginalname` varchar(80) DEFAULT NULL,
  `billimagegeneratedname` varchar(50) DEFAULT NULL,
  `billimagepath` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billtbl`
--

INSERT INTO `billtbl` (`billid`, `billno`, `companyname`, `billdate`, `billdateen`, `billimageoriginalname`, `billimagegeneratedname`, `billimagepath`) VALUES
(1, 'jlkjkl', 'jlkj', 'jlk', 'jlk', 'adbl-fb.jpg', NULL, NULL),
(2, '2017', '1022', '2017-11-11', '1961-02-22', 'IMG20171012151025.jpg', NULL, NULL),
(3, '', '', '', '', 'adbl-fb.jpg', NULL, NULL),
(4, '', '', '', '', NULL, NULL, NULL),
(5, '', '', '', '', NULL, NULL, NULL),
(6, 'ABC123', 'ABX', '2074-11-11', '2018-02-23', 'shishir.jpg', NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companytbl`
--

INSERT INTO `companytbl` (`companyid`, `vatpan`, `companyname`, `companyaddress`, `companycontactno`, `companyemail`, `companycontactperson`) VALUES
(3, '123456', 'Harish and Com.', 'Dillibazar, Kathmandu', '9848023564', 'harish@furniture.com', 'Harish Bikram Singh');

-- --------------------------------------------------------

--
-- Table structure for table `fundsourcetbl`
--

CREATE TABLE IF NOT EXISTS `fundsourcetbl` (
  `fundsourceid` bigint(20) NOT NULL,
  `sourcename` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fundsourcetbl`
--

INSERT INTO `fundsourcetbl` (`fundsourceid`, `sourcename`) VALUES
(3, 'Donation');

-- --------------------------------------------------------

--
-- Table structure for table `grouptbl`
--

CREATE TABLE IF NOT EXISTS `grouptbl` (
  `groupcode` varchar(10) NOT NULL,
  `groupname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grouptbl`
--

INSERT INTO `grouptbl` (`groupcode`, `groupname`) VALUES
('CHA', 'Chair'),
('TBL', 'Table');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `insurancetbl`
--

INSERT INTO `insurancetbl` (`insuranceid`, `insurancecompanyid`, `insurancestart`, `insurancestarten`, `insuranceend`, `insuranceenden`, `insurancepremiumamount`) VALUES
(6, 3, 'lathik cha', '', '', '', 250),
(7, 3, '', '', '', '', 0),
(8, 3, '', '', '', '', 0),
(9, 3, '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `inventoryitemdetail`
--
CREATE TABLE IF NOT EXISTS `inventoryitemdetail` (
`itemcode` varchar(20)
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventoryotherdetailtbl`
--

INSERT INTO `inventoryotherdetailtbl` (`inventoryotherdetailid`, `fundsourceid`, `unitname`, `rate`, `quantity`, `amount`, `warrantyid`, `amcid`, `insuranceid`, `supplierid`, `itemconditionid`, `itemsize`, `vehicleno`, `chesisno`, `engineno`, `macaddress`, `licenseno`) VALUES
(6, 3, 'done', 250, 1, 0, 183, 6, 6, 3, 2, '', '20', '20', '20', '105', '30'),
(8, 3, '', 20, 2, 0, 185, 8, 8, 3, 2, '', '', '', '', '', ''),
(9, 3, '', 0, 1, 0, 186, 9, 9, 3, 2, '', '', '', '', '', '');

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
  `depreciationrate` varchar(3) DEFAULT '0',
  `inventoryotherdetailid` bigint(20) DEFAULT NULL,
  `transactiondateen` varchar(10) DEFAULT NULL,
  `issueid` bigint(20) DEFAULT NULL,
  `transferid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventorytbl`
--

INSERT INTO `inventorytbl` (`itemcode`, `transactionid`, `legacyid`, `groupcode`, `itemname`, `model`, `decisiondate`, `decisiondateen`, `purchasedate`, `purchasedateen`, `depreciationrate`, `inventoryotherdetailid`, `transactiondateen`, `issueid`, `transferid`) VALUES
('2017CHA0002', '20170010002', 'Chari', 'CHA', 'Chair', 'ChairModel', '2074-01-01', '2017-04-14', '2074-02-01', '2017-05-15', '', 8, 'date', 24, NULL),
('2017TBL0001', '20170010004', '', 'TBL', 'shishir saman', '', '', '', '2074-07-25', '2017-11-11', '', 9, 'date', 26, NULL),
('2018TBL0001', '20170010001', 'Table01', 'TBL', 'Table', 'Table01', '2074-05-06', '2017-08-22', '2075-05-07', '2018-08-23', '0', 6, 'date', 17, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `issuetbl`
--

INSERT INTO `issuetbl` (`issueid`, `issuedby`, `issuedto`, `issueddate`, `issueddateen`, `statusid`, `issueitemcode`, `reserve2`, `reserve3`) VALUES
(7, 'admin', 'shishir', '2017-11-11', '1961-02-22', 2, NULL, NULL, NULL),
(8, 'shishir', 'shishir', '2017-11-11', '1961-02-22', 1, NULL, NULL, NULL),
(9, 'admin', 'shishir', '2017-11-11', '1961-02-22', 2, NULL, NULL, NULL),
(10, 'shishir', 'shishir', '2017-11-11', '1961-02-22', 2, NULL, NULL, NULL),
(11, 'admin', 'admin', '2017-11-11', '1961-02-22', 2, NULL, NULL, NULL),
(12, 'admin', 'admin', '2017-11-11', '1961-02-22', 2, NULL, NULL, NULL),
(13, 'admin', 'admin', '2017-11-11', '1961-02-22', 2, NULL, NULL, NULL),
(14, 'admin', 'admin', '2017-11-11', '1961-02-22', 2, NULL, NULL, NULL),
(15, 'shishir', 'admin', '2017-11-11', '1961-02-22', 2, NULL, NULL, NULL),
(16, 'admin', 'admin', '2017-11-11', '1961-02-22', 1, NULL, NULL, NULL),
(17, 'admin', 'admin', '2017-11-11', '1961-02-22', 1, NULL, NULL, NULL),
(18, 'admin', 'admin', '2017-11-11', '1961-02-22', 1, NULL, NULL, NULL),
(19, 'admin', 'admin', '2017-11-11', '1961-02-22', 1, NULL, NULL, NULL),
(20, 'admin', 'admin', '2017-11-11', '1961-02-22', 3, '2017CHA0002', NULL, NULL),
(21, 'admin', 'admin', '2017-11-11', '1961-02-22', 2, '2017CHA0002', NULL, NULL),
(22, 'admin', 'admin', '2017-11-11', '1961-02-22', 3, '	2017TBL0001', NULL, NULL),
(23, 'admin', 'admin', '2017-11-12', '1961-02-23', 2, '2017TBL0001', NULL, NULL),
(24, 'admin', 'shishir', '2017-11-12', '1961-02-23', 2, '2017CHA0002', NULL, NULL),
(25, 'admin', 'shishir', '2017-12-05', '1961-03-18', 1, '2017TBL0001', NULL, NULL),
(26, 'shishir', 'admin', '2015-05-06', '1958-08-22', 2, '2017TBL0001', NULL, NULL),
(27, 'admin', 'admin', '2017-11-11', '1961-02-22', 3, 'jfalkdjf', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `itemconditiontbl`
--

CREATE TABLE IF NOT EXISTS `itemconditiontbl` (
  `itemconditionid` bigint(20) NOT NULL,
  `itemconditionname` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `itemconditiontbl`
--

INSERT INTO `itemconditiontbl` (`itemconditionid`, `itemconditionname`) VALUES
(2, 'Good');

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
  `reserve3` varchar(50) DEFAULT NULL
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
  `userid` bigint(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `staffcode` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usertbl`
--

INSERT INTO `usertbl` (`userid`, `username`, `password`, `staffcode`) VALUES
(1, 'admin', 'admin', '1'),
(2, 'shishir', 'shishir', '10');

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
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `warrantytbl`
--

INSERT INTO `warrantytbl` (`warrantyid`, `warrantystart`, `warrantystarten`, `warrantyend`, `warrantyenden`) VALUES
(183, 'das', '', '', ''),
(185, '', '', '', ''),
(186, '', '', '', '');

-- --------------------------------------------------------

--
-- Structure for view `inventoryitemdetail`
--
DROP TABLE IF EXISTS `inventoryitemdetail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `inventoryitemdetail` AS select `inventorytbl`.`itemcode` AS `itemcode`,`inventorytbl`.`transactionid` AS `transactionid`,`inventorytbl`.`legacyid` AS `legacyid`,`inventorytbl`.`itemname` AS `itemname`,`inventorytbl`.`model` AS `model`,`inventorytbl`.`decisiondate` AS `decisiondate`,`inventorytbl`.`decisiondateen` AS `decisiondateen`,`inventorytbl`.`purchasedate` AS `purchasedate`,`inventorytbl`.`purchasedateen` AS `purchasedateen`,`inventorytbl`.`depreciationrate` AS `depreciationrate`,`inventorytbl`.`transactiondateen` AS `transactiondateen`,`grouptbl`.`groupcode` AS `groupcode`,`grouptbl`.`groupname` AS `groupname`,`inventoryotherdetailtbl`.`inventoryotherdetailid` AS `inventoryotherdetailid`,`inventoryotherdetailtbl`.`unitname` AS `unitname`,`inventoryotherdetailtbl`.`rate` AS `rate`,`inventoryotherdetailtbl`.`itemsize` AS `itemsize`,`inventoryotherdetailtbl`.`vehicleno` AS `vehicleno`,`inventoryotherdetailtbl`.`chesisno` AS `chesisno`,`inventoryotherdetailtbl`.`engineno` AS `engineno`,`inventoryotherdetailtbl`.`macaddress` AS `macaddress`,`inventoryotherdetailtbl`.`licenseno` AS `licenseno`,`inventoryotherdetailtbl`.`supplierid` AS `supplierid`,`companytbl`.`companyid` AS `companyid`,`companytbl`.`vatpan` AS `vatpan`,`companytbl`.`companyname` AS `companyname`,`companytbl`.`companyaddress` AS `companyaddress`,`companytbl`.`companycontactno` AS `companycontactno`,`companytbl`.`companyemail` AS `companyemail`,`companytbl`.`companycontactperson` AS `companycontactperson`,`amctbl`.`amcid` AS `amcid`,`amctbl`.`amcstart` AS `amcstart`,`amctbl`.`amcstarten` AS `amcstarten`,`amctbl`.`amcend` AS `amcend`,`amctbl`.`amcenden` AS `amcenden`,`amctbl`.`amccost` AS `amccost`,`amctbl`.`amccompanyid` AS `amccompanyid`,`insurancetbl`.`insuranceid` AS `insuranceid`,`insurancetbl`.`insurancecompanyid` AS `insurancecompanyid`,`insurancetbl`.`insurancestart` AS `insurancestart`,`insurancetbl`.`insurancestarten` AS `insurancestarten`,`insurancetbl`.`insuranceend` AS `insuranceend`,`insurancetbl`.`insuranceenden` AS `insuranceenden`,`insurancetbl`.`insurancepremiumamount` AS `insurancepremiumamount`,`warrantytbl`.`warrantyid` AS `warrantyid`,`warrantytbl`.`warrantystart` AS `warrantystart`,`warrantytbl`.`warrantystarten` AS `warrantystarten`,`warrantytbl`.`warrantyend` AS `warrantyend`,`warrantytbl`.`warrantyenden` AS `warrantyenden`,`fundsourcetbl`.`fundsourceid` AS `fundsourceid`,`fundsourcetbl`.`sourcename` AS `sourcename`,`itemconditiontbl`.`itemconditionid` AS `itemconditionid`,`itemconditiontbl`.`itemconditionname` AS `itemconditionname` from ((((((((`inventorytbl` join `grouptbl` on((`inventorytbl`.`groupcode` = `grouptbl`.`groupcode`))) join `inventoryotherdetailtbl` on((`inventorytbl`.`inventoryotherdetailid` = `inventoryotherdetailtbl`.`inventoryotherdetailid`))) join `companytbl` on((`inventoryotherdetailtbl`.`supplierid` = `companytbl`.`companyid`))) join `amctbl` on((`amctbl`.`amcid` = `inventoryotherdetailtbl`.`amcid`))) join `insurancetbl` on((`insurancetbl`.`insuranceid` = `inventoryotherdetailtbl`.`insuranceid`))) join `warrantytbl` on((`inventoryotherdetailtbl`.`warrantyid` = `warrantytbl`.`warrantyid`))) join `fundsourcetbl` on((`inventoryotherdetailtbl`.`fundsourceid` = `fundsourcetbl`.`fundsourceid`))) join `itemconditiontbl` on((`inventoryotherdetailtbl`.`itemconditionid` = `itemconditiontbl`.`itemconditionid`)));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amctbl`
--
ALTER TABLE `amctbl`
  ADD PRIMARY KEY (`amcid`), ADD KEY `fk_amctbl_companyid` (`amccompanyid`);

--
-- Indexes for table `billtbl`
--
ALTER TABLE `billtbl`
  ADD PRIMARY KEY (`billid`);

--
-- Indexes for table `companytbl`
--
ALTER TABLE `companytbl`
  ADD PRIMARY KEY (`companyid`);

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
  ADD PRIMARY KEY (`itemcode`), ADD KEY `fk_inventorytbl_inventoryotherdetailid` (`inventoryotherdetailid`), ADD KEY `fk_inventorytbl_issueid` (`issueid`), ADD KEY `fk_inventorytbl_transferid` (`transferid`);

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
  ADD PRIMARY KEY (`userid`);

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
  MODIFY `amcid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `billtbl`
--
ALTER TABLE `billtbl`
  MODIFY `billid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `companytbl`
--
ALTER TABLE `companytbl`
  MODIFY `companyid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `fundsourcetbl`
--
ALTER TABLE `fundsourcetbl`
  MODIFY `fundsourceid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `insurancetbl`
--
ALTER TABLE `insurancetbl`
  MODIFY `insuranceid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `inventoryotherdetailtbl`
--
ALTER TABLE `inventoryotherdetailtbl`
  MODIFY `inventoryotherdetailid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `issuetbl`
--
ALTER TABLE `issuetbl`
  MODIFY `issueid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `itemconditiontbl`
--
ALTER TABLE `itemconditiontbl`
  MODIFY `itemconditionid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `statustbl`
--
ALTER TABLE `statustbl`
  MODIFY `statusid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
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
  MODIFY `userid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `warrantytbl`
--
ALTER TABLE `warrantytbl`
  MODIFY `warrantyid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=187;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `amctbl`
--
ALTER TABLE `amctbl`
ADD CONSTRAINT `fk_amctbl_companyid` FOREIGN KEY (`amccompanyid`) REFERENCES `companytbl` (`companyid`) ON UPDATE CASCADE;

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
-- Constraints for table `transfertbl`
--
ALTER TABLE `transfertbl`
ADD CONSTRAINT `fk_transfertbl_statusid` FOREIGN KEY (`statusid`) REFERENCES `statustbl` (`statusid`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
