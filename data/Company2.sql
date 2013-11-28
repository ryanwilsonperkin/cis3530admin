###Authors: Corey Alexander, Jason St. Jacques, Ryan Wilson-Perkin.
###Date: 11/25/2013
###Course: CIS3530 Databases
###Instructor: C. Obimbo

##################################################################################################################

###Below are all the statments to create a database for our company.
###These statements will create a database and set up various triggers for the database to make sure that any information being put into the database is properly formatted as expected.
###Each table has its own set of triggers, such that there are three triggers per table, Insert, Update, and Delete.
###Each table has a primary key, unique key and foreign key.

##################################################################################################################

###Below are the creation statements for the company database. 
###These statments will create a database for a company with various foreign key, unique key, and primary key constraints. 
###The Department table must be created first and then the Employee table could be created, followed by every other table.


CREATE DATABASE comapnydb;

###This will create a table called Department, with a primary key of Dnumber, 
###a foreign key of mgr_ssn from Employee, and a unique key of Dname.
CREATE TABLE Department (
	Dname VARCHAR(15) NOT NULL,
	Dnumber INT NOT NULL,
	Mgr_ssn CHAR(9) NOT NULL,
	userid VARCHAR(8) NOT NULL,
	PRIMARY KEY (Dnumber),
	UNIQUE (Dname)
);

###This will create a table called Employee, with a primary key of SSN,
###a foreign key of Dno from Department, and a unique key of SSN.
CREATE TABLE Employee (
	Fname VARCHAR(10) NOT NULL,
	Minit CHAR NOT NULL,
	Lname VARCHAR(10) NOT NULL,
	SSN CHAR(9) NOT NULL,
	Address VARCHAR(15) NOT NULL,
	Sex CHAR NOT NULL,
	Salary INT NOT NULL,
	Super_ssn CHAR(9) NOT NULL, ### must be not null check the constraint later on
	Dno INT NOT NULL,
	BDate YEAR NOT NULL,
	EmpDate YEAR NOT NULL,
	userid VARCHAR(8) NOT NULL,
	PRIMARY KEY (SSN),
	UNIQUE (SSN),
	CONSTRAINT fk_Dno FOREIGN KEY(Dno) REFERENCES Department(Dnumber)
);

###This will create a table called DeptLocation, with a primary key of Dnumber & Dlocation, 
###a foreign key of Dnumber from Department, and a unique key of Dnumber & Dlocation.
CREATE TABLE DeptLocation (
	Dnumber INT NOT NULL,
	Dlocation VARCHAR(15) NOT NULL,
	PRIMARY KEY (Dnumber, Dlocation),
	UNIQUE(Dnumber, Dlocation),
	CONSTRAINT fk_Dnumber FOREIGN KEY(Dnumber) REFERENCES Department(Dnumber)
);

###This will create a table called Project, with a primary key of Pnumber, 
###a foreign key of Dnum form Department, and a unique key of Pname.
CREATE TABLE Project (
	Pname VARCHAR(15) NOT NULL,
	Pnumber INT NOT NULL,
	Plocation VARCHAR(15) NOT NULL,
	Dnum INT NOT NULL,
	userid VARCHAR(8) NOT NULL,
	AmtSpent INTEGER NOT NULL,
	AmtMade INTEGER NOT NULL,
	PRIMARY KEY (Pnumber),
	UNIQUE (Pname),
	CONSTRAINT fk_Ploc FOREIGN Key(Plocation) REFERENCES Department(Dlocation),
	CONSTRAINT fk_Dnum FOREIGN KEY(Dnum) REFERENCES Department(Dnumber)
);

###This will create a table called WorksOn, with a primary key of Essn & Pno, 
###a foreign key of Essn from Employee & Pno from Project, and a unique key of Essn & Pno.
CREATE TABLE WorksOn (
	Essn CHAR(9) NOT NULL,
	Pno INT NOT NULL,
	Hours DEC(4,1) NOT NULL,
	userid VARCHAR(8) NOT NULL,
	PRIMARY KEY (Essn, Pno),
	UNIQUE(Essn, Pno),
	CONSTRAINT fk_Essn FOREIGN KEY(Essn) REFERENCES Employee(SSN),
	CONSTRAINT fk_Pnum FOREIGN KEY(Pno) REFERENCES Project(Pnumber)
);

###This will create a table called Dependent, with a primary key of Essn & Dependent_name, 
###a foreign key of Essn from Employee, and a unique key of Dependent_name & Relationship.
CREATE TABLE Dependent (
	Essn CHAR(9) NOT NULL,
	Dependent_name VARCHAR(10) NOT NULL,
	Sex CHAR NOT NULL, 
	Bdate DATE NOT NULL,
	Relationship VARCHAR(15) NOT NULL,
	userid VARCHAR(8) NOT NULL,
	PRIMARY KEY (Essn, Dependent_name),
	UNIQUE(Dependent_name, Relationship),
	CONSTRAINT fk_Dssn FOREIGN KEY(Essn) REFERENCES Employee(SSN)
);
##################################################################################################################

###Below are the insert and update triggers for the WorksOn table.
###These triggers will check to make sure that anything be inserted or updated meets the constraints of the database.

###All of the Insert Triggers for WorksOn
delimiter //
CREATE TRIGGER ins_WorksOnCheck BEFORE INSERT ON WorksOn
	FOR EACH ROW
		BEGIN
			IF LENGTH(NEW.Essn) != 9 THEN ###Check if the length is not 9 
				SET NEW.Essn = NULL; 
			END IF;
			IF NEW.Pno <= 0 THEN ###Check if 0 or less
				SET NEW.Pno = NULL; 
			END IF;
			IF NEW.Hours <= 0 THEN ###Check if 0 or less
				SET NEW.Hours = 0;
			END IF; 
		END; //
delimiter ;

####All of the Update Triggers for WorksOn
delimiter //
CREATE TRIGGER upd_WorksOnCheck BEFORE UPDATE ON WorksOn
	FOR EACH ROW
		BEGIN
			IF LENGTH(NEW.Essn) != 9 THEN ###Check if the length is not 9
				SET NEW.Essn = NULL; 
			END IF;
			IF NEW.Pno <= 0 THEN ###Check if 0 or less
				SET NEW.Pno = NULL; 
			END IF;
			IF NEW.Hours <= 0 THEN ###Check if 0 or less
				SET NEW.Hours = 0;
			END IF; 
		END; //
delimiter ;

##################################################################################################################

###

###All of the Update Triggers for Employee
delimiter // 
CREATE TRIGGER ins_EmployeeCheck BEFORE INSERT ON Employee
	FOR EACH ROW
		BEGIN
			IF LENGTH(NEW.Fname) = 0 THEN   ###Check if the length is 0
				SET NEW.Fname = NULL;
			END IF;
			IF LENGTH(NEW.Lname) = 0 THEN   ###Check if the length is 0
				SET NEW.LName = NULL;
			END IF;
			IF LENGTH(NEW.Minit) = 0 THEN   ###Check if the length is 0
				SET NEW.Minit = NULL;
			END IF;
			IF LENGTH(NEW.SSN) != 9 THEN    ###Check if the length is not 9
				SET NEW.SSN = NULL;
			END IF;
			IF NEW.Salary <= 0 THEN ###Check if 0 or less
				SET NEW.Salary = 0; 
			END IF;
			IF LENGTH(NEW.Address) = 0 THEN ###Check if the length is 0
				SET NEW.Address = NULL; 
			END IF;
			IF LENGTH(NEW.sex) != 1 THEN    ###Check if the length is not 1
				SET NEW.sex = NULL; 
			END IF;
			IF(STRCMP(NEW.sex,"m") = 0) THEN    ###Check if the input is lowercase
				SET NEW.sex = 'M';
			ELSEIF (STRCMP(NEW.sex,"f") = 0) THEN
				SET NEW.sex = 'F'; 
			ELSEIF (STRCMP(NEW.sex,"M") !=0) && (STRCMP(NEW.sex,"F") != 0) THEN ###Check if the input is uppercase
				SET NEW.sex = NULL;
			END IF;
			IF LENGTH(NEW.Super_ssn) != 9 && LENGTH(NEW.Super_ssn) != 0  THEN ###Check if the length is not 9 and not 0
				SET NEW.Super_ssn = NULL;
			END IF;
			IF NEW.Dno <= 0 THEN    ###Check if the number is 0 or less
				SET NEW.Dno = NULL;
			END IF;
			IF NEW.BDate < 1970 THEN   ###Check if the date is 1969 or less
				SET NEW.BDate = NULL; 
			END IF; 
			IF NEW.BDate > 2013 THEN   ###Check if the date is 2014 or greater
				SET NEW.BDate = NULL; 
			END IF;
			IF NEW.EmpDate < 1970 THEN ###Check if the date is 1969 or less
				SET NEW.EmpDate = NULL; 
			END IF; 
			IF NEW.EmpDate > 2013 THEN ###Check if the date is 2014 or greater
				SET NEW.EmpDate = NULL; 
			END IF; 
			IF NEW.EmpDate <= NEW.BDate THEN ###Check if the date is less then bdate
				SET NEW.EmpDate = NULL; 
			END IF;
		END; //
delimiter ;

#All of the Update Triggers for Employee
delimiter // 
CREATE TRIGGER upd_EmployeeCheck BEFORE UPDATE ON Employee
	FOR EACH ROW
		BEGIN
			IF LENGTH(NEW.Fname) = 0 THEN   ###Check if the length is 0
				SET NEW.Fname = NULL;
			END IF;
			IF LENGTH(NEW.Lname) = 0 THEN   ###Check if the length is 0
				SET NEW.LName = NULL;
			END IF;
			IF LENGTH(NEW.Minit) = 0 THEN   ###Check if the length is 0
				SET NEW.Minit = NULL;
			END IF;
			IF LENGTH(NEW.SSN) != 9 THEN    ###Check if the length is not 9
				SET NEW.SSN = NULL;
			END IF;
			IF LENGTH(NEW.Address) = 0 THEN ###Check if the length is 0
				SET NEW.Address = NULL; 
			END IF;
			IF NEW.Salary <= 0 THEN ###Check if 0 or less
				SET NEW.Salary = 0; 
			END IF;
			IF LENGTH(NEW.sex) != 1 THEN    ###Check if the length is not 1
				SET NEW.sex = NULL; 
			END IF;
			IF(STRCMP(NEW.sex,"m") = 0) THEN    ###Check if the input is lowercase
				SET NEW.sex = 'M';
			ELSEIF (STRCMP(NEW.sex,"f") = 0) THEN
				SET NEW.sex = 'F'; 
			ELSEIF (STRCMP(NEW.sex,"M") !=0) && (STRCMP(NEW.sex,"F") != 0) THEN ###Check if the input is uppercase
				SET NEW.sex = NULL;
			END IF;
			IF LENGTH(NEW.Super_ssn) != 9 && LENGTH(NEW.Super_ssn) != 0 THEN ###Check if the length is not 9 and not 0
				SET NEW.Super_ssn = NULL;
			END IF;
			IF NEW.Dno <= 0 THEN    ###Check if the number is 0 or less
				SET NEW.Dno = NULL;
			END IF;
			IF NEW.BDate < 1970 THEN   ###Check if the date is 1969 or less
				SET NEW.BDate = NULL; 
			END IF; 
			IF NEW.BDate > 2013 THEN   ###Check if the date is 2014 or greater
				SET NEW.BDate = NULL; 
			END IF;
			IF NEW.EmpDate < 1970 THEN ###Check if the date is 1969 or less
				SET NEW.EmpDate = NULL; 
			END IF; 
			IF NEW.EmpDate > 2013 THEN ###Check if the date is 2014 or greater
				SET NEW.EmpDate = NULL; 
			END IF; 
			IF NEW.EmpDate <= NEW.BDate THEN ###Check if the date is less then bdate
				SET NEW.EmpDate = NULL; 
			END IF;
			IF NEW.EmpDate < OLD.EmpDate THEN ###Check if the new date is less than the old date
				SET NEW.EmpDate = NULL;
			END IF;
		END; //
delimiter ;

##################################################################################################################

###

#All of the Update Triggers for DeptLocation
delimiter //
CREATE TRIGGER ins_DeptLocationCheck BEFORE INSERT ON DeptLocation 
FOR EACH ROW 
	BEGIN
		IF NEW.Dnumber <= 0 THEN ###Check if 0 or less
			SET NEW.Dnumber = NULL; 
		END IF; 
		IF LENGTH(NEW.Dlocation) = 0 THEN ###Check if length is 0
			SET NEW.Dlocation = NULL; 
		END IF;
	END //
delimiter ;

#All of the Update Triggers for DeptLocation
delimiter //
CREATE TRIGGER upd_DeptLocationCheck BEFORE UPDATE ON DeptLocation 
FOR EACH ROW 
	BEGIN
		IF NEW.Dnumber <= 0 THEN ###Check if 0 or less
			SET NEW.Dnumber = NULL; 
		END IF; 
		IF LENGTH(NEW.Dlocation) = 0 THEN ###Check if length is 0
			SET NEW.Dlocation = NULL; 
		END IF;
	END //
delimiter ;

##################################################################################################################

###

#All of the Insert Triggers for Department
delimiter //
CREATE TRIGGER ins_DepartmentCheck BEFORE INSERT ON Department
	FOR EACH ROW
		BEGIN
			IF NEW.Dnumber <= 0 THEN SET NEW.Dnumber = NULL; END IF;
			IF LENGTH(NEW.Dname) = 0 THEN SET NEW.Dname = NULL; END IF;
			IF LENGTH(NEW.Mgr_ssn) != 9 THEN SET NEW.Mgr_ssn = NULL; END IF;
		END; //
delimiter ;



#All of the Update Triggers for Department
delimiter //
CREATE TRIGGER upd_DepartmentCheck BEFORE UPDATE ON Department
	FOR EACH ROW
		BEGIN
			IF NEW.Dnumber <= 0 THEN SET NEW.Dnumber = NULL; END IF;
			IF LENGTH(NEW.Dname) = 0 THEN SET NEW.Dname = NULL; END IF;
			IF LENGTH(NEW.Mgr_ssn) != 9 THEN SET NEW.Mgr_ssn = NULL; END IF;
		END; //
delimter ;

##################################################################################################################

###

#All of the Insert Triggers for Dependent
delimiter //
CREATE TRIGGER ins_DependentCheck BEFORE INSERT ON Dependent
	FOR EACH ROW
		BEGIN
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
		END; //
delimiter ;

#All of the Update Triggers for Dependent
delimiter //
CREATE TRIGGER upd_DependentCheck BEFORE UPDATE ON Dependent
	FOR EACH ROW
		BEGIN
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
		END; //
delimiter ;

##################################################################################################################

delimiter //
CREATE TRIGGER ins_ProjectCheck BEFORE INSERT ON Project
	FOR EACH ROW
		BEGIN
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
		END; //
delimiter ;

delimiter //
CREATE TRIGGER upd_ProjectCheck BEFORE UPDATE ON Project
	FOR EACH ROW
		BEGIN
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
		END; //
delimiter ;


