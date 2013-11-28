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
IF NEW.BDate < 1901 THEN   
SET NEW.BDate = NULL; 
END IF; 
IF NEW.BDate > 2013 THEN   
SET NEW.BDate = NULL; 
END IF;
IF NEW.EmpDate < 1901 THEN 
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
IF NEW.BDate < 1901 THEN   
SET NEW.BDate = NULL; 
END IF; 
IF NEW.BDate > 2013 THEN   
SET NEW.BDate = NULL; 
END IF;
IF NEW.EmpDate < 1901 THEN 
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
  UNIQUE KEY `Dependent_name` (`Essn`,`Dependent_name`,`Relationship`),
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
IF NEW.BDate < 1901 THEN 
SET NEW.BDate = NULL; 
END IF;
IF NEW.BDate > 2013 THEN
SET NEW.BDate = NULL; 
END IF;
IF LENGTH(NEW.Relationship) = 1 THEN 
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
ELSEIF(STRCMP(NEW.Relationship,"spouse") = 0) THEN 
SET NEW.Relationship = 'Spouse';
ELSEIF (STRCMP(NEW.Relationship,"Father") !=0) && (STRCMP(NEW.Relationship,"Mother") != 0)
&& (STRCMP(NEW.Relationship,"Son") !=0) && (STRCMP(NEW.Relationship,"Daughter") != 0) 
&& (STRCMP(NEW.Relationship,"Spouse") != 0) THEN 
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
IF NEW.BDate < 1901 THEN 
SET NEW.BDate = NULL; 
END IF;
IF NEW.BDate > 2013 THEN
SET NEW.BDate = NULL; 
END IF;
IF LENGTH(NEW.Relationship) = 1 THEN 
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
ELSEIF(STRCMP(NEW.Relationship,"spouse") = 0) THEN 
SET NEW.Relationship = 'Spouse';
ELSEIF (STRCMP(NEW.Relationship,"Father") !=0) && (STRCMP(NEW.Relationship,"Mother") != 0)
&& (STRCMP(NEW.Relationship,"Son") !=0) && (STRCMP(NEW.Relationship,"Daughter") != 0) 
&& (STRCMP(NEW.Relationship,"Spouse") != 0) THEN 
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

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES ('Headquarters',1,'888665555','Charlie'),('Marketing',2,'444555777','Ryan'),('Administration',4,'987654321','Charlie'),('Research',5,'333445555','Charlie'),('Finance',7,'353467409','Charlie'),('Engineering',11,'359624751','ikanji'),('Model',24,'123456789','Horia');
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES ('Kira','A','Vorobej','012012333','Dundas, ON','F',55000,'987654321',4,1991,2011,'avermeul'),('Mary','J','Hind','100040001','Dundas, ON','F',333000,'333445555',5,1953,1983,'avermeul'),('Harry','O','Potter','105947378','London,  On','M',43000,'460836586',1,1960,1975,'acolmena'),('Sebastian','T','Kuras','111111111','Houston, TX','M',90000,'999999999',5,1973,1998,'jcooperb'),('Alex','E','Vermeulen','111222333','Dundas, ON','F',150000,'888665555',5,1983,2003,'avermeul'),('John','B','Smith','123456789','Houston, TX','M',60000,'333445555',5,1985,2011,'Charlie'),('Victoria','J','Smith','198782427','Guelph, ON','F',127000,'444555777',2,1952,1972,'Charlie'),('Tamara','E','Walters','198928552','Hamilton, ON','F',980000,'888665555',4,1952,1972,'Charlie'),('Jessica','A','Jonesboro','199098293','Guelph, ON','F',164000,'460836586',11,1955,1975,'Charlie'),('Keane','W','Saunders','199171129','London, ON','F',180000,'333445555',5,1963,1990,'Charlie'),('Samuel','C','Anderson','199196331','Paris, ON','M',240000,'925468826',24,1950,1970,'Charlie'),('Andrea','R','Austin','199302835','Hamilton, ON','M',160000,'333445555',5,1963,2010,'Charlie'),('Fahad','Y','Selles','199305628','Guelph, ON','M',40000,'999999999',5,1978,2008,'Charlie'),('Jack','U','Nicholson','199489442','Guelph, ON','M',80000,'888665555',5,1953,1998,'Charlie'),('Robert','I','De Niro','199608611','Hamilton, ON','M',100000,'987654321',4,1968,1984,'Charlie'),('Jennifer','X','Armstrong','199685000','Guelph, ON','F',130000,'888665555',7,1955,1999,'Charlie'),('Rajan','C','Patel','199705791','Paris, ON','M',164000,'888665555',11,1951,1992,'Charlie'),('Emily','V','Asher','199923690','London, ON','F',10000,'999999999',5,1993,2012,'Charlie'),('Elizabeth','N','Asling','200002511','Hamilton, ON','F',227000,'444555777',2,1962,1982,'Charlie'),('Claire','D','Atkins','200178650','Guelph, ON','M',27000,'444555777',2,1993,2011,'Charlie'),('Al','F','Pacino','200243095','Hamilton, ON','M',150000,'333445555',5,1979,2000,'Charlie'),('Tom','E','Hanks','200352295','Paris, ON','M',197000,'807844760',4,1952,1972,'Charlie'),('Dustin','Y','Hoffman','200369792','Guelph, ON','M',50000,'333445555',5,1990,2008,'Charlie'),('Brad','A','Pitt','200493155','London, ON','M',97000,'444555777',2,1952,1972,'Charlie'),('Anthony','S','Hopkins','200587814','Hamilton, ON','M',170000,'444555777',2,1962,1980,'Charlie'),('Marlon','X','Brando','200626576','Guelph, ON','F',56000,'359624751',11,1952,2010,'Charlie'),('Jessica','C','Austin','200757441','Guelph, ON','F',123000,'444555777',2,1992,2012,'Charlie'),('Matthew','V','Austin','200802224','Hamilton, ON','M',200000,'333445555',5,1983,2010,'Charlie'),('Lauren','J','Baldwin','201052043','Paris, ON','F',890000,'359624751',11,1963,2000,'Charlie'),('Angelika','H','Ayers','201073976','Guelph, ON','F',56000,'202058568',11,1980,1999,'Charlie'),('Jared','K','Aziz','201165466','London, ON','M',50000,'987654321',4,1979,2001,'Charlie'),('Emma','L','Azizi','201272287','Hamilton, ON','F',40000,'123456789',24,1990,2010,'Charlie'),('Kelly','W','Barham','201443758','Hamilton, ON','F',140000,'843025296',24,1952,1973,'Charlie'),('Charlotte','Q','Balahura','201450220','Guelph, ON','F',65000,'629575266',24,1970,1993,'Charlie'),('Colin','R','Baroey','201654020','Guelph, ON','M',70000,'444555777',2,1955,1975,'Charlie'),('Ashley','V','Barta','201739519','London, ON','F',72000,'333445555',1,1952,2004,'Charlie'),('MacKenzie','A','Barsky','201774583','Paris, ON','M',99000,'987654321',4,1970,1997,'Charlie'),('Catherine','B','Bartlett','201941078','Hamilton, ON','F',80000,'315565726',24,1953,1973,'Charlie'),('Catherine','I','Bartley','201959328','Guelph, ON','F',150000,'315565726',24,1960,1981,'Charlie'),('Richard','T','Ramla','202058568','Houston,  TX','M',90000,'296045397',5,1982,2000,'acolmena'),('Sarah','A','Walters','202176619','Hamilton, ON','F',132000,'296045397',11,1955,1988,'Charlie'),('Denzel','O','Washington','202185616','Guelph, ON','M',150000,'202058568',11,1980,1999,'Charlie'),('Cassandra','D','Jonesboro','202247633','Guelph, ON','F',80000,'987654321',4,1953,1975,'Charlie'),('Kaitlyn','G','Anderson','202428993','Paris, ON','F',84000,'888665555',1,1954,1997,'Charlie'),('Aaron','Z','Austin','202561262','Guelph, ON','M',86000,'888665555',24,1953,1990,'Charlie'),('Tony','W','Saunders','202561319','Hamilton, ON','M',86000,'333445555',4,1987,2010,'Charlie'),('Emily','S','Nicholson','202744742','London, ON','F',50000,'987654321',4,1979,2002,'Charlie'),('Karly','A','Selles','202785848','Paris, ON','F',100000,'987654321',4,1993,2013,'Charlie'),('Laurence','C','De Niro','202860324','Hamilton, ON','M',40000,'999999999',5,1971,2009,'Charlie'),('Valentine','X','Muravyov','218167890','Waldorf, MD','M',80000,'444555777',2,1952,1990,'Ryan'),('Tushar','L','Dobhal','222222222','Houston, TX','M',70000,'999999999',5,1950,1994,'jcooperb'),('James','O','Bond','231456456','London, On','M',25000,'888665555',1,1960,1990,'ikanji'),('William','M','Rawson','232171234','Herndon, WV','M',60000,'444555777',2,1952,1972,'Ryan'),('Michael','M','Monroe','268268702','Toronto, On','M',54000,'359624751',11,1959,2001,'ikanji'),('Leonard','K','Carnes','295501234','Convoy, OH','M',127000,'444555777',2,1952,1972,'Ryan'),('Shuchi','A','Pandit','296045397','Guelph, ON','F',980000,'888665555',4,1952,1972,'acolmena'),('Melissa','K','Iv','306737594','Toronto,  On','F',164000,'460836586',11,1955,1975,'acolmena'),('Heidi','N','Klum','315565726','Guelph, ON','F',240000,'925468826',24,1950,1970,'Horia'),('Karen','T','Winters','321400789','Houston, TX','F',180000,'333445555',5,1963,1990,'Charlie'),('Jean','C','Taylor','321456789','Houston, TX','M',160000,'333445555',5,1963,2010,'Charlie'),('Alex','Q','Gaijic','333333333','Houston, TX','M',40000,'999999999',5,1978,2008,'jcooperb'),('Frank','T','Wong','333445555','Houston, TX','M',80000,'888665555',5,1953,1998,'Charlie'),('Trevor','T','Davis','338888555','Almonte, ON','M',100000,'987654321',4,1968,1984,'Charlie'),('Josaiah','H','Timmins','353467409','Guelph, ON','M',130000,'888665555',7,1955,1999,'Charlie'),('Cindy','H','Crawford','359624751','Toronto, On','F',164000,'888665555',11,1951,1992,'Charlie'),('Mohammad','P','Ali','444444444','Houston, TX','M',10000,'999999999',5,1993,2012,'Charlie'),('Jean','J','Lansing','444555777','Milwaukee, WI','F',227000,'',2,1962,1982,'Ryan'),('Bonnie','Z','Baker','449721234','Richardson, TX','F',27000,'444555777',2,1993,2011,'Ryan'),('Joyce','A','Roberts','453422453','Houston, TX','F',150000,'333445555',5,1979,2000,'Charlie'),('Joyce','A','English','453453453','Houston, TX','F',50000,'333445555',5,1990,2008,'Charlie'),('Carmel','D','Schembri','460836586','Guelph, On','M',197000,'807844760',4,1952,1972,'acolmena'),('Paula','J','Krach','515821234','Elk City, KS','F',67000,'444555777',2,1952,1972,'Ryan'),('Shannon','C','Page','546031234','Redmond, WA','M',170000,'444555777',2,1962,1980,'Ryan'),('Pamela','A','English','546546877','Guelph, On','F',56000,'359624751',11,1952,2010,'Charlie'),('Khadijah','L','Sabbagh','550561234','Arroyo, CA','F',123000,'444555777',2,1992,2012,'Ryan'),('Scott','A','Dougan','558181999','Midland, ON','M',200000,'333445555',5,1983,2010,'Charlie'),('Rachel','A','Castillo','560123563','Guelph,  On','F',56000,'202058568',11,1980,1999,'acolmena'),('Donald','F','Regan','566879301','Toronto, On','M',890000,'359624751',11,1963,2000,'Charlie'),('Delores','E','Patterson','606088000','Orangeville, ON','F',50000,'987654321',4,1979,2001,'Charlie'),('Rosie','N','Jones','607465254','Fredericton, NB','F',40000,'123456789',24,1990,2010,'Horia'),('Daniela','N','Pestova','629568526','St. Johns, NF','F',65000,'629575266',24,1970,1993,'Horia'),('Brooklyn','N','Decker','629575266','Guelph, ON','F',140000,'843025296',24,1952,1973,'Horia'),('Carolyn','D','Dattilo','631541234','Redmond, WA','F',70000,'444555777',2,1955,1975,'Ryan'),('Imran','Z','Kanji','666258951','Guelph, On','M',99000,'987654321',4,1970,1997,'Charlie'),('Ramesh','K','Narayan','666884444','Humble, TX','M',72000,'333445555',5,1952,2004,'Charlie'),('Lucy','N','Pinder','681525266','Paris, ON','F',80000,'315565726',24,1953,1973,'Horia'),('Marissa','N','Miller','688325296','Guelph, ON','F',240000,'315565726',24,1960,1981,'Horia'),('JamesJ','F','Thomson','777929575','Toronto, On','M',850000,'202058568',11,1980,1999,'acolmena'),('Donald','N','Duck','807844760','Mississauga,  ON','M',31000,'296045397',11,1955,1988,'acolmena'),('Anne','E','Bilodeau','888445555','Houston, TX','M',150000,'987654321',4,1953,1975,'Charlie'),('James','E','Borg','888665555','Houston, TX','M',150000,'',1,1954,1997,'Charlie'),('Jackie','G','Robinson','891029345','Montreal, QC','M',132000,'987654321',4,1987,2010,'Charlie'),('Jenna','N','Shea','925468826','St John, NB','F',80000,'677465254',24,1953,1990,'Horia'),('Patrick','H','Ho','981350323','Toronto,  On','M',84000,'807844760',11,1962,2011,'acolmena'),('Justin','T','Trudeau','987654001','Bellaire, TX','F',86000,'333445555',5,1953,1970,'Charlie'),('Jennifer','S','Wallace','987654321','Bellaire, TX','F',86000,'888665555',4,1950,1986,'Charlie'),('Hassan','V','Karim','987789987','Houston, TX','M',100000,'987654321',4,1993,2013,'Charlie'),('Ahmad','V','Jabbar','987987987','Houston, TX','M',50000,'987654321',4,1979,2002,'Charlie'),('Tom','M','Groves','989796959','Houston, TX','M',40000,'999999999',5,1971,2009,'Charlie'),('Andrew','J','Zawadi','999117777','Spring, TX','M',250000,'987654321',4,1990,2010,'Charlie'),('Alicia','J','Zelaya','999887777','Spring, TX','F',50000,'987654321',4,1968,2010,'Charlie'),('Jared','M','Cooperband','999999999','Houston, TX','M',990000,'888665555',5,1950,2001,'Charlie');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Dependent` WRITE;
/*!40000 ALTER TABLE `Dependent` DISABLE KEYS */;
INSERT INTO `Dependent` VALUES ('123456789','Alice','F','2008-12-31','Daughter','Charlie'),('123456789','Elizabeth','F','1987-05-05','Spouse','Charlie'),('123456789','Michael','M','2008-01-01','Son','Charlie'),('231456456','Moneypenny','F','1968-05-13','Spouse','ikanji'),('268268702','Minnie','F','1978-08-11','Spouse','ikanji'),('268268702','Pluto','M','1988-07-31','Son','ikanji'),('321400789','Julia','F','1973-05-05','Spouse','Charlie'),('321456789','Angus','M','1995-01-08','Son','Charlie'),('321456789','Francine','F','1968-05-07','Spouse','Charlie'),('321456789','Tracey','F','1998-12-12','Daughter','Charlie'),('333445555','Alice','F','2006-04-05','Daughter','Charlie'),('333445555','Joy','F','1985-05-03','Spouse','Charlie'),('333445555','Theodore','M','2003-10-25','Son','Charlie'),('444555777','Emily','F','1978-05-26','Spouse','Ryan'),('453422453','Emma','F','2005-04-06','Daughter','Charlie'),('453422453','Thomas','M','2003-10-03','Son','Charlie'),('515821234','James','M','1992-04-14','Son','Ryan'),('550561234','Yuri','M','1993-12-25','Spouse','Ryan'),('666258951','Halle','F','1999-11-05','Daughter','ikanji'),('666258951','Maximus','M','2007-01-09','Son','ikanji'),('666258951','Megan','F','1987-01-21','Spouse','ikanji'),('987654001','Charlotte','F','1963-02-25','Spouse','Charlie'),('987654321','Abner','M','1992-02-29','Spouse','Charlie');
/*!40000 ALTER TABLE `Dependent` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `DeptLocation` WRITE;
/*!40000 ALTER TABLE `DeptLocation` DISABLE KEYS */;
INSERT INTO `DeptLocation` VALUES (1,'Houston'),(2,'Redmond'),(4,'Stafford'),(5,'Bellaire'),(5,'Houston'),(5,'Sugarland');
/*!40000 ALTER TABLE `DeptLocation` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
INSERT INTO `Project` VALUES ('ProductX',1,'Bellaire',5,'Charlie',2000000,5000000),('ProductY',2,'Sugarland',5,'Charlie',1000546,3500300),('ProductZ',3,'Houston',5,'Charlie',2000345,500000),('Tesseract',4,'Redmond',2,'Ryan',2100300,3200100),('Computerization',10,'Stafford',4,'Charlie',4100200,5000000),('MancalaGame',15,'Sugarland',5,'avermeul',2001000,500000),('Reorganization',20,'Houston',1,'Charlie',3000200,500000),('VSecret',24,'Guelph',24,'Horia',1000000,2800100),('Newbenefits',30,'Stafford',4,'Charlie',500000,1500200),('Construction',44,'Sugarland',5,'Charlie',3000000,140000),('Innovation',117,'Guelph',11,'ikanji',1000000,1000000),('Fraud',118,'Toronto',11,'ikanji',2000000,3400100);
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `WorksOn` WRITE;
/*!40000 ALTER TABLE `WorksOn` DISABLE KEYS */;
INSERT INTO `WorksOn` VALUES ('100040001',2,6.0,'avermeul'),('111111111',3,20.0,'jcooperb'),('111111111',20,20.0,'jcooperb'),('111222333',1,6.0,'avermeul'),('111222333',3,15.0,'avermeul'),('123456789',1,33.0,'Charlie'),('123456789',2,8.0,'Charlie'),('198782427',4,40.0,'Charlie'),('198928552',10,20.0,'Charlie'),('198928552',30,20.0,'Charlie'),('199098293',117,40.0,'Charlie'),('199171129',15,20.0,'Charlie'),('199171129',44,20.0,'Charlie'),('199196331',24,35.0,'Charlie'),('199196331',118,5.0,'Charlie'),('199302835',15,25.0,'Charlie'),('199302835',44,15.0,'Charlie'),('199305628',3,23.0,'Charlie'),('199305628',15,15.0,'Charlie'),('199489442',3,5.0,'Charlie'),('199489442',15,15.0,'Charlie'),('199489442',44,20.0,'Charlie'),('199608611',10,18.0,'Charlie'),('199608611',30,22.0,'Charlie'),('199685000',44,40.0,'Charlie'),('199705791',117,40.0,'Charlie'),('199923690',44,35.0,'Charlie'),('200002511',4,37.0,'Charlie'),('200178650',4,40.0,'Charlie'),('200243095',44,39.0,'Charlie'),('200352295',30,40.0,'Charlie'),('200369792',44,40.0,'Charlie'),('200493155',4,35.0,'Charlie'),('200587814',4,37.0,'Charlie'),('200626576',117,40.0,'Charlie'),('200757441',4,39.0,'Charlie'),('200802224',44,40.0,'Charlie'),('201052043',117,35.0,'Charlie'),('201073976',117,40.0,'Charlie'),('201165466',30,37.0,'Charlie'),('201272287',24,40.0,'Charlie'),('201443758',24,40.0,'Charlie'),('201450220',24,39.0,'Charlie'),('201654020',4,40.0,'Charlie'),('201739519',44,37.0,'Charlie'),('201774583',30,35.0,'Charlie'),('201941078',24,40.0,'Charlie'),('201959328',24,39.0,'Charlie'),('202176619',117,40.0,'Charlie'),('202185616',117,40.0,'Charlie'),('202247633',30,35.0,'Charlie'),('202428993',20,37.0,'Charlie'),('202561262',24,39.0,'Charlie'),('202561319',30,40.0,'Charlie'),('202744742',30,40.0,'Charlie'),('202785848',30,40.0,'Charlie'),('202860324',44,35.0,'Charlie'),('218167890',4,20.0,'Ryan'),('222222222',3,35.0,'jcooperb'),('222222222',20,5.0,'jcooperb'),('231456456',20,12.0,'ikanji'),('268268702',117,35.0,'ikanji'),('315565726',24,33.0,'Horia'),('321400789',15,10.0,'Charlie'),('321400789',20,3.0,'Charlie'),('321400789',30,5.0,'Charlie'),('321400789',117,2.0,'Charlie'),('321456789',2,7.0,'Charlie'),('321456789',44,33.0,'Charlie'),('333333333',20,40.0,'jcooperb'),('333445555',1,3.0,'Charlie'),('333445555',2,6.0,'Charlie'),('333445555',3,7.0,'Charlie'),('333445555',10,10.0,'Charlie'),('333445555',15,10.0,'Charlie'),('333445555',20,3.0,'Charlie'),('333445555',30,5.0,'Charlie'),('333445555',117,2.0,'Charlie'),('338888555',10,11.0,'avermeul'),('359624751',117,25.0,'ikanji'),('359624751',118,15.0,'ikanji'),('444555777',4,18.0,'Ryan'),('453422453',2,20.0,'Charlie'),('453422453',44,20.0,'Charlie'),('453453453',1,20.0,'Charlie'),('453453453',2,20.0,'Charlie'),('515821234',4,20.0,'Ryan'),('546031234',4,5.0,'Ryan'),('546546877',118,40.0,'ikanji'),('558181999',3,35.0,'avermeul'),('566879301',118,40.0,'ikanji'),('606088000',20,17.0,'avermeul'),('607465254',24,33.0,'Horia'),('629575266',24,33.0,'Horia'),('631541234',4,10.0,'Ryan'),('666258951',10,40.0,'ikanji'),('666884444',3,40.0,'Charlie'),('681525266',24,33.0,'Horia'),('888445555',20,15.0,'Charlie'),('888445555',30,20.0,'Charlie'),('891029345',2,5.0,'Charlie'),('891029345',3,7.0,'Charlie'),('891029345',10,10.0,'Charlie'),('891029345',44,3.0,'Charlie'),('925468826',24,33.0,'Horia'),('987654001',3,40.0,'Charlie'),('987654001',20,15.0,'Charlie'),('987654001',30,20.0,'Charlie'),('987654321',20,15.0,'Charlie'),('987654321',30,20.0,'Charlie'),('987789987',10,35.0,'Charlie'),('987789987',30,5.0,'Charlie'),('987987987',10,35.0,'Charlie'),('987987987',30,5.0,'Charlie'),('999117777',10,10.0,'Charlie'),('999117777',30,30.0,'Charlie'),('999887777',10,10.0,'Charlie'),('999887777',30,30.0,'Charlie'),('999999999',3,20.0,'jcooperb'),('999999999',20,20.0,'jcooperb');
/*!40000 ALTER TABLE `WorksOn` ENABLE KEYS */;
UNLOCK TABLES;
