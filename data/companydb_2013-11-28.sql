# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.6.13)
# Database: companydb
# Generation Time: 2013-11-28 18:58:07 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Department`;

CREATE TABLE `Department` (
  `Dname` varchar(15) NOT NULL,
  `Dnumber` int(11) NOT NULL,
  `Mgr_ssn` char(9) NOT NULL,
  `userid` varchar(8) NOT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE KEY `Dname` (`Dname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `ins_DepartmentCheck` BEFORE INSERT ON `Department` FOR EACH ROW BEGIN
IF NEW.Dnumber <= 0 THEN SET NEW.Dnumber = NULL; END IF;
IF LENGTH(NEW.Dname) = 0 THEN SET NEW.Dname = NULL; END IF;
IF LENGTH(NEW.Mgr_ssn) != 9 THEN SET NEW.Mgr_ssn = NULL; END IF;
END */;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `upd_DepartmentCheck` BEFORE UPDATE ON `Department` FOR EACH ROW BEGIN
IF NEW.Dnumber <= 0 THEN SET NEW.Dnumber = NULL; END IF;
IF LENGTH(NEW.Dname) = 0 THEN SET NEW.Dname = NULL; END IF;
IF LENGTH(NEW.Mgr_ssn) != 9 THEN SET NEW.Mgr_ssn = NULL; END IF;
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;

# Dump of table Employee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Employee`;

CREATE TABLE `Employee` (
  `Fname` varchar(10) NOT NULL,
  `Minit` char(1) NOT NULL,
  `Lname` varchar(10) NOT NULL,
  `SSN` char(9) NOT NULL,
  `Address` varchar(15) NOT NULL,
  `Sex` char(1) NOT NULL,
  `Salary` int(11) NOT NULL,
  `Super_ssn` char(9) NOT NULL,
  `Dno` int(11) NOT NULL,
  `BDate` year(4) NOT NULL,
  `EmpDate` year(4) NOT NULL,
  `userid` varchar(8) NOT NULL,
  PRIMARY KEY (`SSN`),
  UNIQUE KEY `SSN` (`SSN`),
  KEY `fk_Dno` (`Dno`),
  CONSTRAINT `fk_Dno` FOREIGN KEY (`Dno`) REFERENCES `Department` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `ins_EmployeeCheck` BEFORE INSERT ON `Employee` FOR EACH ROW BEGIN
IF LENGTH(NEW.Fname) = 0 THEN   
SET NEW.Fname = NULL;
END IF;
IF LENGTH(NEW.Lname) = 0 THEN   
SET NEW.LName = NULL;
END IF;
IF LENGTH(NEW.Minit) = 0 THEN   
SET NEW.Minit = NULL;
END IF;
IF LENGTH(NEW.SSN) != 9 THEN    
SET NEW.SSN = NULL;
END IF;
IF NEW.Salary <= 0 THEN 
SET NEW.Salary = 0; 
END IF;
IF LENGTH(NEW.Address) = 0 THEN 
SET NEW.Address = NULL; 
END IF;
IF LENGTH(NEW.sex) != 1 THEN    
SET NEW.sex = NULL; 
END IF;
IF(STRCMP(NEW.sex,"m") = 0) THEN    
SET NEW.sex = 'M';
ELSEIF (STRCMP(NEW.sex,"f") = 0) THEN
SET NEW.sex = 'F'; 
ELSEIF (STRCMP(NEW.sex,"M") !=0) && (STRCMP(NEW.sex,"F") != 0) THEN 
SET NEW.sex = NULL;
END IF;
IF LENGTH(NEW.Super_ssn) != 9 && LENGTH(NEW.Super_ssn) != 0  THEN 
SET NEW.Super_ssn = NULL;
END IF;
IF NEW.Dno <= 0 THEN    
SET NEW.Dno = NULL;
END IF;
IF NEW.BDate < 1970 THEN   
SET NEW.BDate = NULL; 
END IF; 
IF NEW.BDate > 2013 THEN   
SET NEW.BDate = NULL; 
END IF;
IF NEW.EmpDate < 1970 THEN 
SET NEW.EmpDate = NULL; 
END IF; 
IF NEW.EmpDate > 2013 THEN 
SET NEW.EmpDate = NULL; 
END IF; 
IF NEW.EmpDate <= NEW.BDate THEN 
SET NEW.EmpDate = NULL; 
END IF;
END */;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `upd_EmployeeCheck` BEFORE UPDATE ON `Employee` FOR EACH ROW BEGIN
IF LENGTH(NEW.Fname) = 0 THEN   
SET NEW.Fname = NULL;
END IF;
IF LENGTH(NEW.Lname) = 0 THEN   
SET NEW.LName = NULL;
END IF;
IF LENGTH(NEW.Minit) = 0 THEN   
SET NEW.Minit = NULL;
END IF;
IF LENGTH(NEW.SSN) != 9 THEN    
SET NEW.SSN = NULL;
END IF;
IF LENGTH(NEW.Address) = 0 THEN 
SET NEW.Address = NULL; 
END IF;
IF NEW.Salary <= 0 THEN 
SET NEW.Salary = 0; 
END IF;
IF LENGTH(NEW.sex) != 1 THEN    
SET NEW.sex = NULL; 
END IF;
IF(STRCMP(NEW.sex,"m") = 0) THEN    
SET NEW.sex = 'M';
ELSEIF (STRCMP(NEW.sex,"f") = 0) THEN
SET NEW.sex = 'F'; 
ELSEIF (STRCMP(NEW.sex,"M") !=0) && (STRCMP(NEW.sex,"F") != 0) THEN 
SET NEW.sex = NULL;
END IF;
IF LENGTH(NEW.Super_ssn) != 9 && LENGTH(NEW.Super_ssn) != 0 THEN 
SET NEW.Super_ssn = NULL;
END IF;
IF NEW.Dno <= 0 THEN    
SET NEW.Dno = NULL;
END IF;
IF NEW.BDate < 1970 THEN   
SET NEW.BDate = NULL; 
END IF; 
IF NEW.BDate > 2013 THEN   
SET NEW.BDate = NULL; 
END IF;
IF NEW.EmpDate < 1970 THEN 
SET NEW.EmpDate = NULL; 
END IF; 
IF NEW.EmpDate > 2013 THEN 
SET NEW.EmpDate = NULL; 
END IF; 
IF NEW.EmpDate <= NEW.BDate THEN 
SET NEW.EmpDate = NULL; 
END IF;
IF NEW.EmpDate < OLD.EmpDate THEN 
SET NEW.EmpDate = NULL;
END IF;
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table Dependent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Dependent`;

CREATE TABLE `Dependent` (
  `Essn` char(9) NOT NULL,
  `Dependent_name` varchar(10) NOT NULL,
  `Sex` char(1) NOT NULL,
  `Bdate` date NOT NULL,
  `Relationship` varchar(15) NOT NULL,
  `userid` varchar(8) NOT NULL,
  PRIMARY KEY (`Essn`,`Dependent_name`),
  UNIQUE KEY `Dependent_name` (`Dependent_name`,`Relationship`),
  CONSTRAINT `fk_Dssn` FOREIGN KEY (`Essn`) REFERENCES `Employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `ins_DependentCheck` BEFORE INSERT ON `Dependent` FOR EACH ROW BEGIN
IF LENGTH(NEW.Essn) != 9 THEN 
SET NEW.Essn = NULL;
END IF;
IF LENGTH(NEW.Dependent_name) = 0 THEN 
SET NEW.Dependent_name = NULL; 
END IF;
IF LENGTH(NEW.sex) != 1 THEN 
SET NEW.sex = NULL; 
END IF; 
IF(STRCMP(NEW.sex,"m") = 0) THEN 
SET NEW.sex = 'M'; 
ELSEIF (STRCMP(NEW.sex,"f") = 0) THEN 
SET NEW.sex = 'F'; 
ELSEIF (STRCMP(NEW.sex,"M") !=0) && (STRCMP(NEW.sex,"F") != 0) THEN 
SET NEW.sex = NULL; 
END IF;
IF NEW.BDate < 1913-01-01 THEN 
SET NEW.BDate = NULL; 
END IF;
IF NEW.BDate > CURDATE() THEN
SET NEW.BDate = NULL; 
END IF;
IF LENGTH(NEW.Relationship) != 1 THEN 
SET NEW.Relationship = NULL; 
END IF; 
IF(STRCMP(NEW.Relationship,"father") = 0) THEN 
SET NEW.Relationship = 'Father';
ELSEIF(STRCMP(NEW.Relationship,"mother") = 0) THEN 
SET NEW.Relationship = 'Mother';
ELSEIF(STRCMP(NEW.Relationship,"son") = 0) THEN 
SET NEW.Relationship = 'Son';
ELSEIF(STRCMP(NEW.Relationship,"daughter") = 0) THEN 
SET NEW.Relationship = 'Daughter';
ELSEIF (STRCMP(NEW.Relationship,"Father") !=0) && (STRCMP(NEW.Relationship,"Mother") != 0)
&& (STRCMP(NEW.Relationship,"Son") !=0) && (STRCMP(NEW.Relationship,"Daughter") != 0) THEN 
SET NEW.Relationship = NULL; 
END IF;
END */;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `upd_DependentCheck` BEFORE UPDATE ON `Dependent` FOR EACH ROW BEGIN
IF LENGTH(NEW.Essn) != 9 THEN 
SET NEW.Essn = NULL;
END IF;
IF LENGTH(NEW.Dependent_name) = 0 THEN 
SET NEW.Dependent_name = NULL; 
END IF;
IF LENGTH(NEW.sex) != 1 THEN 
SET NEW.sex = NULL; 
END IF; 
IF(STRCMP(NEW.sex,"m") = 0) THEN 
SET NEW.sex = 'M'; 
ELSEIF (STRCMP(NEW.sex,"f") = 0) THEN 
SET NEW.sex = 'F'; 
ELSEIF (STRCMP(NEW.sex,"M") !=0) && (STRCMP(NEW.sex,"F") != 0) THEN 
SET NEW.sex = NULL; 
END IF;
IF NEW.BDate < 1913-01-01 THEN 
SET NEW.BDate = NULL; 
END IF;
IF NEW.BDate > CURDATE() THEN
SET NEW.BDate = NULL; 
END IF;
IF LENGTH(NEW.Relationship) != 1 THEN 
SET NEW.Relationship = NULL; 
END IF; 
IF(STRCMP(NEW.Relationship,"father") = 0) THEN 
SET NEW.Relationship = 'Father';
ELSEIF(STRCMP(NEW.Relationship,"mother") = 0) THEN 
SET NEW.Relationship = 'Mother';
ELSEIF(STRCMP(NEW.Relationship,"son") = 0) THEN 
SET NEW.Relationship = 'Son';
ELSEIF(STRCMP(NEW.Relationship,"daughter") = 0) THEN 
SET NEW.Relationship = 'Daughter';
ELSEIF (STRCMP(NEW.Relationship,"Father") !=0) && (STRCMP(NEW.Relationship,"Mother") != 0)
&& (STRCMP(NEW.Relationship,"Son") !=0) && (STRCMP(NEW.Relationship,"Daughter") != 0) THEN 
SET NEW.Relationship = NULL; 
END IF;
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table DeptLocation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DeptLocation`;

CREATE TABLE `DeptLocation` (
  `Dnumber` int(11) NOT NULL,
  `Dlocation` varchar(15) NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  UNIQUE KEY `Dnumber` (`Dnumber`,`Dlocation`),
  CONSTRAINT `fk_Dnumber` FOREIGN KEY (`Dnumber`) REFERENCES `Department` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `ins_DeptLocationCheck` BEFORE INSERT ON `DeptLocation` FOR EACH ROW BEGIN IF NEW.Dnumber <= 0 THEN SET NEW.Dnumber = NULL; END IF; IF LENGTH(NEW.Dlocation) = 0 THEN SET NEW.Dlocation = NULL; END IF; END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;



# Dump of table Project
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Project`;

CREATE TABLE `Project` (
  `Pname` varchar(15) NOT NULL,
  `Pnumber` int(11) NOT NULL,
  `Plocation` varchar(15) NOT NULL,
  `Dnum` int(11) NOT NULL,
  `userid` varchar(8) NOT NULL,
  `AmtSpent` int(11) NOT NULL,
  `AmtMade` int(11) NOT NULL,
  PRIMARY KEY (`Pnumber`),
  UNIQUE KEY `Pname` (`Pname`),
  KEY `fk_Dnum` (`Dnum`),
  CONSTRAINT `fk_Dnum` FOREIGN KEY (`Dnum`) REFERENCES `Department` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `ins_ProjectCheck` BEFORE INSERT ON `Project` FOR EACH ROW BEGIN
IF LENGTH(NEW.Pname) = 0 THEN 
SET NEW.Pname = NULL; 
END IF;
IF NEW.Pnumber <= 0 THEN 
SET NEW.Pnumber = NULL;
END IF;
IF LENGTH(NEW.Plocation) = 0 THEN 
SET NEW.Plocation = NULL; 
END IF;
IF NEW.Dnum <= 0 THEN
SET NEW.Dnum = 0;
END IF;
IF NEW.AmtSpent <= 0 THEN
SET NEW.AmtSpent = 0;
END IF;
IF NEW.AmtMade <= 0 THEN 
SET NEW.AmtMade = 0;
END IF;
END */;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `upd_ProjectCheck` BEFORE UPDATE ON `Project` FOR EACH ROW BEGIN
IF LENGTH(NEW.Pname) = 0 THEN 
SET NEW.Pname = NULL; 
END IF;
IF NEW.Pnumber <= 0 THEN 
SET NEW.Pnumber = NULL;
END IF;
IF LENGTH(NEW.Plocation) = 0 THEN 
SET NEW.Plocation = NULL; 
END IF;
IF NEW.Dnum <= 0 THEN
SET NEW.Dnum = 0;
END IF;
IF NEW.AmtSpent <= 0 THEN
SET NEW.AmtSpent = 0;
END IF;
IF NEW.AmtMade <= 0 THEN 
SET NEW.AmtMade = 0;
END IF;
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table WorksOn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `WorksOn`;

CREATE TABLE `WorksOn` (
  `Essn` char(9) NOT NULL,
  `Pno` int(11) NOT NULL,
  `Hours` decimal(4,1) NOT NULL,
  `userid` varchar(8) NOT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  UNIQUE KEY `Essn` (`Essn`,`Pno`),
  KEY `fk_Pnum` (`Pno`),
  CONSTRAINT `fk_Essn` FOREIGN KEY (`Essn`) REFERENCES `Employee` (`SSN`),
  CONSTRAINT `fk_Pnum` FOREIGN KEY (`Pno`) REFERENCES `Project` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
