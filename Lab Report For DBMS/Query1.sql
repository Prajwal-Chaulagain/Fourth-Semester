--Lab 1: Implementation of DDL statements for creating database
--a. Write a SQL statement to create a database named COMPANY.
CREATE DATABASE COMPANY;

--b. Write a SQL statement to rename the created database.
USE master;
GO

ALTER DATABASE COMPANY MODIFY NAME = COMPANY_NEW;

--c. Write a SQL statement to drop database.
USE master;
GO

DROP DATABASE COMPANY_NEW;

--Lab 2 Implementation of DDL statements for creating tables
--a. Write a statement to create tables for DEPARTMENT, EMPLOYEE, DEPT_LOCATIONS, PROJECT and WORKS_ON.

CREATE TABLE DEPARTMENT (
    Dname VARCHAR(50),
    Dnumber INT PRIMARY KEY,
    Mgr_ssn INT,
    Mgr_start_date DATE
);

CREATE TABLE EMPLOYEE (
    FName       VARCHAR(50),
    Minit       VARCHAR(4),
    LName       VARCHAR(50),
    Ssn         INT PRIMARY KEY,
    BDate       DATE,
    Address     VARCHAR(50),
    Sex         VARCHAR(10),
    Salary      MONEY CHECK (Salary > 0),
    Super_ssn   INT,
    Dno         INT FOREIGN KEY REFERENCES DEPARTMENT(Dnumber)
);

CREATE TABLE DEPT_LOCATIONS (
    Dnumber INT FOREIGN KEY REFERENCES DEPARTMENT(Dnumber), 
    DLocation INT PRIMARY KEY
);

CREATE TABLE PROJECT ( 
    PName VARCHAR(50) UNIQUE, 
    PNumber INT PRIMARY KEY,
    PLocation VARCHAR(50), 
    Dnumber INT FOREIGN KEY REFERENCES DEPARTMENT(Dnumber)
);

CREATE TABLE WORKS_ON (
    Essn INT FOREIGN KEY REFERENCES EMPLOYEE(Ssn),
    Pno INT FOREIGN KEY REFERENCES PROJECT(Pnumber),    

    Hours INT
);

--b. Write a statement to add PRIMARY KEY on existing table DEPARTMENT and FOREIGN KEY on EMPLOYEE.
--
ALTER TABLE DEPARTMENT
ADD CONSTRAINT PK_DEPARTMENT_Dnumber PRIMARY KEY (Dnumber);

SELECT name
FROM sys.key_constraints
WHERE parent_object_id = OBJECT_ID('DEPARTMENT')
AND type = 'PK';

ALTER TABLE DEPARTMENT
DROP CONSTRAINT PK__DEPARTME__40A4CC7A11FAE47A;

ALTER TABLE PROJECT
DROP CONSTRAINT FK__PROJECT__Dnumber__2F2FFC0C;

ALTER TABLE DEPT_LOCATIONS
DROP CONSTRAINT FK__DEPT_LOCA__Dnumb__2B5F6B28;

ALTER TABLE employee
DROP CONSTRAINT FK__EMPLOYEE__Dno__2882FE7D;

ALTER TABLE DEPARTMENT
DROP CONSTRAINT PK__DEPARTME__40A4CC7A11FAE47A;
--
ALTER TABLE DEPARTMENT
ADD CONSTRAINT PK_DEPARTMENT_Dnumber PRIMARY KEY (Dnumber);

ALTER TABLE EMPLOYEE
ADD CONSTRAINT FK_EMPLOYEE_DEPARTMENT FOREIGN KEY (Dno)
REFERENCES DEPARTMENT(Dnumber);

--c. Write a statement to drop table DEPARTMENT.

DROP TABLE DEPARTMENT;


--d. Write a statement to modify the range of Address column in EMPLOYEE table to varchar(60).

ALTER TABLE EMPLOYEE
ALTER COLUMN Address VARCHAR(60);

--e. Write a statement of drop a column PLocation from PROJECT table and again add the same column in the table.

ALTER TABLE PROJECT
DROP COLUMN PLocation;

ALTER TABLE PROJECT
ADD PLocation VARCHAR(50);


--Lab 3: Implementation of DML statements
--a. Write the SQL statement to insert the data in the respective tables.
--i. DEPARTMENT
INSERT INTO DEPARTMENT
    (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES
    ('Finance', 1111, 9090, '2010-06-05'),
    ('Human Resources', 2222, 8080, '2009-06-05'),
    ('IT', 3333, 7070, '2008-04-08'),
    ('Administration', 4444, 6060, '2002-09-15');


--SELECT *
--FROM DEPARTMENT;

--USE COMPANY;

--ii. EMPLOYEE
INSERT INTO EMPLOYEE
    (FName, Minit, LName, Ssn, BDate, Address, Sex, Salary, Super_ssn, Dno)
VALUES
    ('John', 'WS', 'Smith', 3270, '1995-06-09', 'Mandeville', 'Male', 125478, 7070, 3333),
    ('Tillroy', 'TB', 'Bent', 6060, '1981-08-09', 'St. Ann', 'Male', 147899, 4444, 4444),
    ('Samath', 'SS', 'Scott', 6098, '1998-08-09', 'St. Ann', 'Male', 124576, 6060, 4444),
    ('Jenny', 'JS', 'Scott', 7070, '1979-05-09', 'St. Ann', 'Female', 158789, 3333, 3333),
    ('Roy', 'RP', 'Palmer', 8080, '1980-05-09', 'Kingston', 'Male', 179854, 2222, 2222),
    ('Sandra', 'SW', 'Williams', 9069, '1998-05-09', 'Ochi Rios', 'Female', 189756, 9090, 1111),
    ('Peter', 'PW', 'Williams', 9090, '1978-05-09', 'Kingston', 'Male', 132145, 1111, 1111),
    ('Jimmy', 'JW', 'Walker', 9785, '1995-09-09', 'Mandeville', 'Male', 234512, 8080, 2222);

--SELECT *
--FROM EMPLOYEE;

--iii. DEPT_LOCATIONS
INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation)
VALUES 
(1111, 65878),
(2222, 78564),
(4444, 89874),
(3333, 65478);

--iv. PROJECT
INSERT INTO PROJECT
    (Pname, Pnumber, Plocation, Dnumber)
VALUES
    ('Code Writing', 6666, 'North-East Wing', 4444),
    ('Unit Testing', 7777, 'West Wing', 3333),
    ('System Development', 8888, 'South Wing', 2222),
    ('Game Development', 9999, 'North Wing', 1111);

--SELECT * FROM PROJECT;


--v. WORKS_ON
INSERT INTO WORKS_ON (Essn, Pno, Hours)
VALUES
(9090, 9999, 35),
(8080, 8888, 30),
(7070, 7777, 35),
(6060, 6666, 25);

SELECT * FROM WORKS_ON;

--a. Write a SQL statement to update the department number to 3333 whose Ssn is 7070 in EMPLOYEE table.

UPDATE EMPLOYEE
SET Dno = 3333
WHERE Ssn = 7070;

--b. Write a SQL statement to update the hours to 28 whose Essn is 6060 and Pno is 6666 in WORKS ON table.

UPDATE WORKS_ON
SET Hours = 28
WHERE Essn = 6060 AND Pno = 6666;


--c. Write a statement to delete a record from WORKS_ON table Pnumber is 8888.

DELETE FROM WORKS_ON
WHERE Pno = 8888;

