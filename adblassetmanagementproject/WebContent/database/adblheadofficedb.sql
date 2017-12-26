-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2017 at 05:30 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `amctbl`
--

INSERT INTO `amctbl` (`amcid`, `amcstart`, `amcstarten`, `amcend`, `amcenden`, `amccost`, `amccompanyid`) VALUES
(10, '', '', '', '', 0, 4),
(11, '', '', '', '', 0, 4),
(12, '', '', '', '', 0, 4),
(13, '', '', '', '', 0, 4),
(14, '', '', '', '', 0, 4),
(15, '', '', '', '', 0, 4),
(16, '', '', '', '', 0, 4),
(17, '', '', '', '', 0, 4),
(18, '', '', '', '', 0, 4);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `billtbl`
--

INSERT INTO `billtbl` (`billid`, `billno`, `companyid`, `billdate`, `billdateen`, `billimageoriginalname`, `billimagegeneratedname`, `billimagepath`, `billportpathid`) VALUES
(7, '121212', NULL, '2050-11-11', '1994-02-23', 'icon.png', '20501212121994', 'D:/xampp/tomcat/webapps/image', 1),
(10, 'dfas', 4, '2015-11-11', '1959-02-22', 'bg2.jpg', '2015dfas1959', 'C:/Users/sunil/git/adblassetmanagementproject/adblassetmanagementproject/WebContent/view/uploadedbills', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companycodetbl`
--

INSERT INTO `companycodetbl` (`cid`, `name`, `address`, `branchcode`, `reserved`, `reserved1`) VALUES
(1, 'Head Office', 'RamshahPath', 'HO', NULL, NULL),
(2, 'Kalimati', 'Kalimati', 'KA', NULL, NULL);

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

--
-- Dumping data for table `grouptbl`
--

INSERT INTO `grouptbl` (`groupcode`, `groupname`) VALUES
('CHA', 'chair'),
('TBL', 'table');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `insurancetbl`
--

INSERT INTO `insurancetbl` (`insuranceid`, `insurancecompanyid`, `insurancestart`, `insurancestarten`, `insuranceend`, `insuranceenden`, `insurancepremiumamount`) VALUES
(11, 4, '', '', '', '', 0),
(12, 4, '', '', '', '', 0),
(13, 4, '', '', '', '', 0),
(14, 4, '', '', '', '', 0),
(15, 4, '', '', '', '', 0),
(16, 4, '', '', '', '', 0),
(17, 4, '', '', '', '', 0),
(18, 4, '', '', '', '', 0);

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
,`cid` int(10)
,`name` varchar(30)
,`address` varchar(30)
,`branchcode` varchar(30)
,`reserved` varchar(30)
,`reserved1` varchar(30)
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventoryotherdetailtbl`
--

INSERT INTO `inventoryotherdetailtbl` (`inventoryotherdetailid`, `fundsourceid`, `unitname`, `rate`, `quantity`, `amount`, `warrantyid`, `amcid`, `insuranceid`, `supplierid`, `itemconditionid`, `itemsize`, `vehicleno`, `chesisno`, `engineno`, `macaddress`, `licenseno`) VALUES
(11, 4, '', 0, 1, 0, 188, 11, 11, 4, 3, '', '', '', '', '', ''),
(12, 4, '', 0, 1, 0, 189, 12, 12, 4, 3, '', '', '', '', '', ''),
(13, 4, '', 0, 1, 0, 190, 13, 13, 4, 3, '', '', '', '', '', ''),
(14, 4, '', 0, 1, 0, 191, 14, 14, 4, 3, '', '', '', '', '', ''),
(15, 4, '', 0, 1, 0, 192, 15, 15, 4, 3, '', '', '', '', '', ''),
(16, 4, '', 0, 1, 0, 193, 16, 16, 4, 3, '', '', '', '', '', ''),
(17, 4, '', 0, 1, 0, 194, 17, 17, 4, 3, '', '', '', '', '', ''),
(18, 4, '', 0, 1, 0, 195, 18, 18, 4, 3, '', '', '', '', '', '');

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
  `cid` int(10) DEFAULT '1',
  `custno` int(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventorytbl`
--

INSERT INTO `inventorytbl` (`itemcode`, `transactionid`, `legacyid`, `groupcode`, `itemname`, `model`, `decisiondate`, `decisiondateen`, `purchasedate`, `purchasedateen`, `depreciationrate`, `inventoryotherdetailid`, `transactiondateen`, `issueid`, `transferid`, `cid`, `custno`, `status`) VALUES
('1956CHA0001', '20170010001', '123', 'CHA', 'chair', 'new', '2012-02-02', '1955-05-16', '2013-03-03', '1956-06-16', '5', 17, 'date', NULL, NULL, 2, NULL, NULL),
('2018TBL0001', '20170010002', '152', 'TBL', 'table', 'naya', '2074-08-02', '2017-11-18', '2075-02-02', '2018-05-16', '10', 18, 'date', NULL, NULL, 1, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `issuetbl`
--

INSERT INTO `issuetbl` (`issueid`, `issuedby`, `issuedto`, `issueddate`, `issueddateen`, `statusid`, `issueitemcode`, `reserve2`, `reserve3`) VALUES
(2, 'admin', 'aaa', '2012-02-02', '1955-05-16', 1, '2012TBL0002', NULL, NULL),
(3, 'admin', 'sunil', '2012-02-02', '1955-05-16', 3, '1959CHA0001', NULL, NULL),
(4, 'admin', 'anil', '2012-02-02', '1955-05-16', 3, '1959CHA0001', NULL, NULL),
(5, 'admin', 'anil', '2012-02-02', '1955-05-16', 3, '1959CHA0001', NULL, NULL),
(6, 'anil', 'admin', '2012-02-02', '1955-05-16', 2, '1959CHA0001', NULL, NULL),
(7, 'admin', 'aaa', '2012-02-02', '1955-05-16', 3, '1959CHA0001', NULL, NULL),
(8, 'admin', 'anil', '2012-02-02', '1955-05-16', 3, '1959CHA0001', NULL, NULL),
(9, 'admin', 'anil', '2012-02-02', '1955-05-16', 3, '1959CHA0001', NULL, NULL),
(10, 'sunil', 'admin', '2013-03-03', '1956-06-16', 3, '1959CHA0001', NULL, NULL),
(11, 'sunil', 'admin', '2012-02-02', '1955-05-16', 3, '1959CHA0001', NULL, NULL),
(12, 'admin', 'sunil', '2013-03-03', '1956-06-16', 3, '2012TBL0001', NULL, NULL),
(13, 'admin', 'aaa', '2012-02-02', '1955-05-16', 3, '1959CHA0001', NULL, NULL),
(14, 'admin', 'aaa', '2012-02-02', '1955-05-16', 1, '2012TBL0001', NULL, NULL),
(15, 'admin', 'aaa', '2012-02-02', '1955-05-16', 3, '1959CHA0001', NULL, NULL),
(16, 'admin', 'aaa', '2012-02-02', '1955-05-16', 1, '1959CHA0001', NULL, NULL),
(17, 'admin', 'aaa', '2012-02-02', '1955-05-16', 2, '2012TBL0001', NULL, NULL),
(18, 'sunil', 'aaa', '2013-03-03', '1956-06-16', 3, '1959CHA0001', NULL, NULL),
(19, 'admin', 'aaa', '2012-02-02', '1955-05-16', 1, '1959CHA0001', NULL, NULL),
(20, 'admin', 'admin', '2017-11-11', '1961-02-22', 3, '123132132', NULL, NULL),
(21, 'admin', 'admin', '2017-11-11', '1961-02-22', 2, '1959CHA0001', NULL, NULL),
(22, 'aaa', 'sunil', '2012-02-02', '1955-05-16', 3, '1959CHA0001', NULL, NULL),
(23, 'aaa', 'admin', '2010-02-02', '1953-05-15', 2, '1959CHA0001', NULL, NULL),
(24, 'sunil', 'aaa', '2012-02-02', '1955-05-16', 3, '1959CHA0001', NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transfertbl`
--

INSERT INTO `transfertbl` (`transferid`, `transferedby`, `branchby`, `transferedto`, `branchto`, `transfereddate`, `transfereddateen`, `statusid`, `reserve1`, `reserve2`, `reserve3`) VALUES
(1, 'admin', '1', 'sunil', 'adblkalimatidb', '201202', '021202', 3, NULL, NULL, NULL),
(2, 'admin', '1', '1', '1', '2012-02-02', '1955-05-16', 3, NULL, NULL, NULL);

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
  `staffcode` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `cid` int(10) DEFAULT NULL,
  `givenrole` varchar(500) NOT NULL,
  `edate` varchar(10) NOT NULL,
  `enddate` varchar(10) NOT NULL,
  `reserved` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usertbl`
--

INSERT INTO `usertbl` (`userid`, `staffcode`, `username`, `password`, `cid`, `givenrole`, `edate`, `enddate`, `reserved`) VALUES
(1, '1', 'admin', 'admin', 1, '', '', '', ''),
(200, '999', 'kalimati', 'kalimati', 2, '#nav1, #nav2, #nav2, #nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove, #nav6, #remove, #nav10', '2012-02-02', '2018-02-02', ''),
(201, '675', 'talakjung', 'talakjung', NULL, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '', '', ''),
(202, '405', 'yut', 'yut', NULL, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '', '', ''),
(203, '152', 'hardahal', 'hardahal', NULL, '#nav1, #nav2', '2017-12-21', '2018-01-31', NULL),
(204, '666', 'rum', 'rum', NULL, 'null', '2016-01-01', '2016-10-12', NULL),
(205, '64', 'papi', 'papi', NULL, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2017-12-20', '2017-12-21', NULL),
(206, '424', 'tandu', 'tandu', NULL, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(207, '2222', 'jj', 'jj', NULL, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2012-02-02', NULL),
(208, '4444', 'rrrr', 'rrrr', NULL, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(209, '6666', 'urimil', 'urimil', NULL, 'null', '2012-02-02', '2018-02-02', NULL),
(210, '897', 'qen', 'qen', NULL, 'null', '2012-02-02', '2019-02-02', NULL),
(211, 'kjdsflkj', 'kdfsjlqk', 'kdfsjlqk', NULL, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '', '', NULL),
(212, 'kjdsflkj', 'kdfsjlqk', 'kdfsjlqk', NULL, 'null', '2012-02-02', '2019-02-02', NULL),
(213, '664', 'ooo', 'ooo', NULL, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2019-02-02', NULL),
(214, '2', 'sunil', 'sunil', NULL, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(215, '2', 'sunil', 'sunil', 1, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(216, '3', 'shishir', 'shishir', 1, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(217, '3', 'shishir', 'shishir', 1, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(218, '4', 'binod', 'binod', 1, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2019-02-02', NULL),
(219, '4', 'binod', 'binod', 1, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2019-02-02', NULL),
(220, '5', 'suresh', 'suresh', 2, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(221, '5', 'suresh', 'suresh', 2, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(222, '6', 'ramesh', 'ramesh', 2, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(223, '7', 'rajiv', 'rajiv', 2, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(224, '7', 'rajiv', 'rajiv', 2, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(225, '13', 'lita', 'lita', 1, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2013-02-02', NULL),
(226, '14', 'kam', 'kam', 1, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(227, '15', 'pop', 'pop', 1, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(228, '16', 'popi', 'popi', 1, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2013-02-02', NULL),
(229, '20', 'tara', 'tara', 1, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2015-02-02', NULL),
(230, '21', 'sandyp', 'sandyp', 1, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(231, '22', 'chiran', 'chiran', 2, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2012-02-02', NULL),
(232, '24', 'uri', 'uri', 2, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2012-02-02', NULL),
(233, '25', 'yuki', 'yuki', 2, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(234, '27', 'umesh', 'umesh', 1, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-00-02', '2018-02-02', NULL),
(235, '30', 'tandukar', 'tandukar', 2, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(236, '31', 'tandu', 'tandu', 2, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(237, '37', 'rama', 'rama', 1, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(238, '40', 'anil', 'anil', 2, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(239, '41', 'mike', 'mike', 2, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(240, '43', 'sujan', 'sujan', 1, '#nav1, #nav2, #nav10', '2012-02-02', '2018-02-02', NULL),
(241, '44', 'maka', 'maka', 1, '#nav1, #nav2, #nav3, #nav10', '2012-02-02', '2018-02-02', NULL),
(242, '45', 'karki', 'karki', 2, '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove', '2012-02-02', '2018-02-02', NULL),
(243, '46', 'rupesh', 'rupesh', 2, '#nav1, #nav2, #nav3', '2012-02-02', '2018-02-02', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `warrantytbl`
--

INSERT INTO `warrantytbl` (`warrantyid`, `warrantystart`, `warrantystarten`, `warrantyend`, `warrantyenden`) VALUES
(188, '', '', '', ''),
(189, '', '', '', ''),
(190, '', '', '', ''),
(191, '', '', '', ''),
(192, '', '', '', ''),
(193, '', '', '', ''),
(194, '', '', '', ''),
(195, '', '', '', '');

-- --------------------------------------------------------

--
-- Structure for view `inventoryitemdetail`
--
DROP TABLE IF EXISTS `inventoryitemdetail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `inventoryitemdetail` AS select `inventorytbl`.`itemcode` AS `itemcode`,`inventorytbl`.`transactionid` AS `transactionid`,`inventorytbl`.`legacyid` AS `legacyid`,`inventorytbl`.`itemname` AS `itemname`,`inventorytbl`.`model` AS `model`,`inventorytbl`.`decisiondate` AS `decisiondate`,`inventorytbl`.`decisiondateen` AS `decisiondateen`,`inventorytbl`.`purchasedate` AS `purchasedate`,`inventorytbl`.`purchasedateen` AS `purchasedateen`,`inventorytbl`.`depreciationrate` AS `depreciationrate`,`inventorytbl`.`transactiondateen` AS `transactiondateen`,`grouptbl`.`groupcode` AS `groupcode`,`grouptbl`.`groupname` AS `groupname`,`inventoryotherdetailtbl`.`inventoryotherdetailid` AS `inventoryotherdetailid`,`inventoryotherdetailtbl`.`unitname` AS `unitname`,`inventoryotherdetailtbl`.`rate` AS `rate`,`inventoryotherdetailtbl`.`itemsize` AS `itemsize`,`inventoryotherdetailtbl`.`vehicleno` AS `vehicleno`,`inventoryotherdetailtbl`.`chesisno` AS `chesisno`,`inventoryotherdetailtbl`.`engineno` AS `engineno`,`inventoryotherdetailtbl`.`macaddress` AS `macaddress`,`inventoryotherdetailtbl`.`licenseno` AS `licenseno`,`inventoryotherdetailtbl`.`supplierid` AS `supplierid`,`companytbl`.`companyid` AS `companyid`,`companytbl`.`vatpan` AS `vatpan`,`companytbl`.`companyname` AS `companyname`,`companytbl`.`companyaddress` AS `companyaddress`,`companytbl`.`companycontactno` AS `companycontactno`,`companytbl`.`companyemail` AS `companyemail`,`companytbl`.`companycontactperson` AS `companycontactperson`,`amctbl`.`amcid` AS `amcid`,`amctbl`.`amcstart` AS `amcstart`,`amctbl`.`amcstarten` AS `amcstarten`,`amctbl`.`amcend` AS `amcend`,`amctbl`.`amcenden` AS `amcenden`,`amctbl`.`amccost` AS `amccost`,`amctbl`.`amccompanyid` AS `amccompanyid`,`insurancetbl`.`insuranceid` AS `insuranceid`,`insurancetbl`.`insurancecompanyid` AS `insurancecompanyid`,`insurancetbl`.`insurancestart` AS `insurancestart`,`insurancetbl`.`insurancestarten` AS `insurancestarten`,`insurancetbl`.`insuranceend` AS `insuranceend`,`insurancetbl`.`insuranceenden` AS `insuranceenden`,`insurancetbl`.`insurancepremiumamount` AS `insurancepremiumamount`,`warrantytbl`.`warrantyid` AS `warrantyid`,`warrantytbl`.`warrantystart` AS `warrantystart`,`warrantytbl`.`warrantystarten` AS `warrantystarten`,`warrantytbl`.`warrantyend` AS `warrantyend`,`warrantytbl`.`warrantyenden` AS `warrantyenden`,`fundsourcetbl`.`fundsourceid` AS `fundsourceid`,`fundsourcetbl`.`sourcename` AS `sourcename`,`itemconditiontbl`.`itemconditionid` AS `itemconditionid`,`itemconditiontbl`.`itemconditionname` AS `itemconditionname`,`companycodetbl`.`cid` AS `cid`,`companycodetbl`.`name` AS `name`,`companycodetbl`.`address` AS `address`,`companycodetbl`.`branchcode` AS `branchcode`,`companycodetbl`.`reserved` AS `reserved`,`companycodetbl`.`reserved1` AS `reserved1` from (((((((((`inventorytbl` join `grouptbl` on((`inventorytbl`.`groupcode` = `grouptbl`.`groupcode`))) join `inventoryotherdetailtbl` on((`inventorytbl`.`inventoryotherdetailid` = `inventoryotherdetailtbl`.`inventoryotherdetailid`))) join `companytbl` on((`inventoryotherdetailtbl`.`supplierid` = `companytbl`.`companyid`))) join `amctbl` on((`amctbl`.`amcid` = `inventoryotherdetailtbl`.`amcid`))) join `insurancetbl` on((`insurancetbl`.`insuranceid` = `inventoryotherdetailtbl`.`insuranceid`))) join `warrantytbl` on((`inventoryotherdetailtbl`.`warrantyid` = `warrantytbl`.`warrantyid`))) join `fundsourcetbl` on((`inventoryotherdetailtbl`.`fundsourceid` = `fundsourcetbl`.`fundsourceid`))) join `itemconditiontbl` on((`inventoryotherdetailtbl`.`itemconditionid` = `itemconditiontbl`.`itemconditionid`))) join `companycodetbl` on((`companycodetbl`.`cid` = `inventorytbl`.`cid`)));

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
  ADD PRIMARY KEY (`userid`), ADD KEY `fk_usertbl_cid` (`cid`);

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
  MODIFY `amcid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `billtbl`
--
ALTER TABLE `billtbl`
  MODIFY `billid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `companycodetbl`
--
ALTER TABLE `companycodetbl`
  MODIFY `cid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
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
  MODIFY `insuranceid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `inventoryotherdetailtbl`
--
ALTER TABLE `inventoryotherdetailtbl`
  MODIFY `inventoryotherdetailid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `issuetbl`
--
ALTER TABLE `issuetbl`
  MODIFY `issueid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
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
-- AUTO_INCREMENT for table `transfertbl`
--
ALTER TABLE `transfertbl`
  MODIFY `transferid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `unittbl`
--
ALTER TABLE `unittbl`
  MODIFY `unitid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usertbl`
--
ALTER TABLE `usertbl`
  MODIFY `userid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=244;
--
-- AUTO_INCREMENT for table `warrantytbl`
--
ALTER TABLE `warrantytbl`
  MODIFY `warrantyid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=196;
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
ADD CONSTRAINT `fk_inventorytbl_cid` FOREIGN KEY (`cid`) REFERENCES `companycodetbl` (`cid`) ON UPDATE CASCADE,
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

--
-- Constraints for table `usertbl`
--
ALTER TABLE `usertbl`
ADD CONSTRAINT `fk_usertbl_cid` FOREIGN KEY (`cid`) REFERENCES `companycodetbl` (`cid`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
