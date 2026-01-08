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

--Lab 2: Implementation of DDL statements for creating tables
--a. Write a statement to create tables for DEPARTMENT, EMPLOYEE, DEPT_LOCATIONS, PROJECT and WORKS_ON.

--DEPARTMENT
-- DEPARTMENT
-- Field Data Type Constraint Type
-- Dname VARCHAR(50)
-- Dnumber INT PRIMARY KEY
-- Mgr_ssn INT
-- Mgr_start_date DATE

CREATE TABLE DEPARTMENT
(
    Dname VARCHAR(50),
    Dnumber INT PRIMARY KEY,
    Mgr_ssn INT,
    Mgr_start_date DATE
);

--EMPLOYEE
-- EMPLOYEE
-- Field Data Type Constraint Type
-- FName VARCHAR(50)
-- Minit VARCHAR(4)
-- LName VARCHAR(50)
-- Ssn INT PRIMARY KEY
-- BDate DATE
-- Address VARCHAR(50)
-- Sex VARCHAR(10)
-- Salary MONEY Salary&gt;0
-- Super_ssn INT
-- Dno INT FOREIGN KEY

CREATE TABLE EMPLOYEE
(
    FName VARCHAR(50),
    Minit VARCHAR(4),
    LName VARCHAR(50),
    Ssn INT PRIMARY KEY,
    BDate DATE,
    Address VARCHAR(50),
    Sex VARCHAR(10),
    Salary MONEY CHECK (Salary > 0),
    Super_ssn INT,
    Dno INT FOREIGN KEY REFERENCES DEPARTMENT(Dnumber)
);

--DEPT_LOCATIONS
-- DEPT_LOCATIONS
-- Field Data Type Constraint Type
-- DNumber INT FOREIGN KEY
-- DLocation INT PRIMARY KEY

CREATE TABLE DEPT_LOCATIONS
(
    Dnumber INT FOREIGN KEY REFERENCES DEPARTMENT(Dnumber),
    DLocation INT PRIMARY KEY
);

--PROJECT
-- PROJECT
-- Field Data Type Constraint Type
-- PName VARCHAR(50) UNIQUE
-- Pnumber INT PRIMARY KEY
-- PLocation VARCHAR(50)
-- Dnumber INT FOREIGN KEY

CREATE TABLE PROJECT
(
    PName VARCHAR(50) UNIQUE,
    PNumber INT PRIMARY KEY,
    PLocation VARCHAR(50),
    Dnumber INT FOREIGN KEY REFERENCES DEPARTMENT(Dnumber)
);

--WORKS_ON
-- WORKS_ON
-- Field Data Type Constraint Type
-- Essn INT FOREIGN KEY
-- Pno INT FOREIGN KEY
-- Hours INT

CREATE TABLE WORKS_ON
(
    Essn INT FOREIGN KEY REFERENCES EMPLOYEE(Ssn),
    Pno INT FOREIGN KEY REFERENCES PROJECT(Pnumber),
    Hours INT
);

ALTER TABLE DEPARTMENT
ADD CONSTRAINT PK_DEPARTMENT_Dnumber PRIMARY KEY (Dnumber);

SELECT name
FROM sys.key_constraints
WHERE parent_object_id = OBJECT_ID('DEPARTMENT')
    AND type = 'PK';

ALTER TABLE DEPARTMENT
DROP CONSTRAINT PK__DEPARTME__40A4CC7A71B77829;

ALTER TABLE PROJECT
DROP CONSTRAINT FK__PROJECT__Dnumber__5441852A;

ALTER TABLE DEPT_LOCATIONS
DROP CONSTRAINT FK__DEPT_LOCA__Dnumb__5070F446;

ALTER TABLE employee
DROP CONSTRAINT FK__EMPLOYEE__Dno__4D94879B

ALTER TABLE DEPARTMENT
DROP CONSTRAINT PK__DEPARTME__40A4CC7A71B77829;

--b. Write a statement to add PRIMARY KEY on existing table DEPARTMENT and FOREIGN KEY on EMPLOYEE.
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

-- i. DEPARTMENT
-- Dname Dnumber Mgr_ssn Mgr_start_date
-- Finance 1111 9090 06-05-2010
-- Human Resources 2222 8080 05-06-2009
-- IT 3333 7070 08-04-2008
-- Administration 4444 6060 15-09-2002

INSERT INTO DEPARTMENT
    (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES
    ('Finance', 1111, 9090, '2010-06-05'),
    ('Human Resources', 2222, 8080, '2009-06-05'),
    ('IT', 3333, 7070, '2008-04-08'),
    ('Administration', 4444, 6060, '2002-09-15');


SELECT *
FROM DEPARTMENT;

USE COMPANY;

-- ii. EMPLOYEE
-- Fname    Mini  Lname     SSN   Bdate       Address      Sex     Salary    Super_ssn  Dno
-- ------------------------------------------------------------------------------------------
-- John     WS    Smith     3270  09-06-1995  Mandeville   Male    125478    7070       3333
-- Tillroy  TB    Bent      6060  09-08-1981  St. Ann      Male    147899    NULL       4444
-- Samath   SS    Scott     6098  09-08-1998  St. Ann      Male    124576    6060       4444
-- Jenny    JS    Scott     7070  09-05-1979  St. Ann      Female  158789    3333       3333
-- Roy      RP    Palmer    8080  09-05-1980  Kingston     Male    179854    NULL       2222
-- Sandra   SW    Williams  9069  09-05-1998  Ochi Rios    Female  189756    9090       1111
-- Peter    PW    Williams  9090  09-05-1978  Kingston     Male    1321458   NULL       1111
-- Jimmy    JW    Walker    9785  09-09-1995  Mandeville   Male    234512    8080       2222

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

SELECT *
FROM EMPLOYEE;

-- iii. DEPT_LOCATIONS
-- Dnumber  Dlocation
-- -------------------
-- 1111     65878
-- 2222     78564
-- 4444     89874
-- 3333     65478

INSERT INTO DEPT_LOCATIONS
    (Dnumber, DLocation)
VALUES
    (1111, 65878),
    (2222, 78564),
    (4444, 89874),
    (3333, 65478);

SELECT *
FROM DEPT_LOCATIONS;

-- iv. PROJECT
-- Pname              Pnumber  Plocation         Dnumber
-- ------------------------------------------------------
-- Code Writing       6666     North-East Wing   4444
-- Unit Testing       7777     West Wing         3333
-- System Development 8888     South Wing        2222
-- Game Development   9999     North Wing        1111

INSERT INTO PROJECT
    (Pname, Pnumber, Plocation, Dnumber)
VALUES
    ('Code Writing', 6666, 'North-East Wing', 4444),
    ('Unit Testing', 7777, 'West Wing', 3333),
    ('System Development', 8888, 'South Wing', 2222),
    ('Game Development', 9999, 'North Wing', 1111);

SELECT *
FROM PROJECT;

-- v. WORKS_ON
-- Essn   Pno    Hours
-- --------------------
-- 9090   9999   35
-- 8080   8888   30
-- 7070   7777   35
-- 6060   6666   25

INSERT INTO WORKS_ON
    (Essn, Pno, Hours)
VALUES
    (9090, 9999, 35),
    (8080, 8888, 30),
    (7070, 7777, 35),
    (6060, 6666, 25);

SELECT *
FROM WORKS_ON;

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



--Lab 4: Retrieving data from SELECT statement

--a. Write a SQL statement to display all details of department
USE COMPANY;
SELECT *
FROM DEPARTMENT;

--b. Write a SQL statement to display first name, last name, date of birth, address and department number of employees.
SELECT FName, LName, BDate, Address, Dno
FROM EMPLOYEE;

--c. Write a SQL statement to display the distinct address employees.
SELECT DISTINCT Address
FROM EMPLOYEE;

--d. Write a SQL statement to display all the content of PROJECT providing alias project_no, project_name, project_location and depart_number.
SELECT
    Pnumber AS project_no,
    Pname AS project_name,
    Plocation AS project_location,
    Dnumber AS depart_number
FROM PROJECT;


--Lab 5: Restricting and Sorting data

--a. Find the name of employee name and department number whose address is “St. Ann”.
SELECT FName, LName, Dno
FROM EMPLOYEE
WHERE Address = 'St. Ann';  

--b. Find the name of department and department number whose department number is greater than 1111.
SELECT Dname, Dnumber
FROM DEPARTMENT
WHERE Dnumber > 1111;

--c. Find the name of the employee whose address is Mandeville and department number is greater than or equal to 2222.
SELECT FName, LName
FROM EMPLOYEE
WHERE Address = 'Mandeville' AND Dno >= 2222;

--d. Find the records of project whose department number is between 2222 and 4444.
SELECT *
FROM PROJECT
WHERE Dnumber BETWEEN 2222 AND 4444;

--e. Find the department number and department location of DEPT_LOCATIONS associated with department location “65878” or “89874” or “78564”.
SELECT Dnumber, Dlocation
FROM DEPT_LOCATIONS
WHERE Dlocation IN (65878, 89874, 78564);

--f. Find the name, address and salary of employee whose last name begins with S and department number greater than 1111.
SELECT FName, LName, Address, Salary
FROM EMPLOYEE
WHERE LName LIKE 'S%' AND Dno > 1111;

--g. Find the details of employee as First name, last name, address, date of birth and salary with increment of salary by 10%. Salary * 1.1 as new salary
SELECT
    FName,
    LName,
    Address,
    BDate,
    Salary,
    Salary * 1.1 AS new_salary
FROM EMPLOYEE;

--h. Find the records of department in the order of their department name in ascending and descending order.
SELECT *
FROM DEPARTMENT
ORDER BY Dname ASC;

SELECT *
FROM DEPARTMENT
ORDER BY Dname DESC;

--i. Find the records of employee whose address is St. Ann in the order of their salary in ascending and descending order.
SELECT *
FROM EMPLOYEE
WHERE Address = 'St. Ann'
ORDER BY Salary ASC;

SELECT *
FROM EMPLOYEE
WHERE Address = 'St. Ann'
ORDER BY Salary DESC;

--j. Find the record of all employee whose date of birth is greater than ‘1982-01-04’.
SELECT *
FROM EMPLOYEE
WHERE BDate > '1982-01-04';


--Lab 6: Set Operations

--a. Find the department number and employee number from Department and Employee table.
    SELECT Dnumber AS Number
    FROM DEPARTMENT
UNION
    SELECT Ssn AS Number
    FROM EMPLOYEE;

--b. Find the employee number which is present in both Department and Employee table.
    SELECT Ssn
    FROM EMPLOYEE
INTERSECT
    SELECT Mgr_ssn
    FROM DEPARTMENT;

--c. Find the employee number which is present in Employee table but not in Department table.
    SELECT Ssn
    FROM EMPLOYEE
EXCEPT
    SELECT Mgr_ssn
    FROM DEPARTMENT;


--Lab 7:Aggregate Functions

--a. Find the maximum and minimum of department number from Department table.
SELECT
    MAX(Dnumber) AS Max_Department_Number,
    MIN(Dnumber) AS Min_Department_Number
FROM DEPARTMENT;

--b. Find the average salary of Employee whose department number is 4444 and alias it as Average_salary.
SELECT
    AVG(Salary) AS Average_salary
FROM EMPLOYEE
WHERE Dno = 4444;

--c. Find the count and total salary of employee in each gender level and group by gender.
SELECT
    Sex,
    COUNT(*) AS Employee_Count,
    SUM(Salary) AS Total_Salary
FROM EMPLOYEE
GROUP BY Sex;

--d. Find the maximum salary and count of employee based on the department number and group by department number.
SELECT
    Dno,
    MAX(Salary) AS Max_Salary,
    COUNT(*) AS Employee_Count
FROM EMPLOYEE
GROUP BY Dno;

--e. Find the total and average number of hours worked in WORK_ON table and alias it with Total_Hours and Average_Hours respectively.
SELECT
    SUM(Hours) AS Total_Hours,
    AVG(Hours) AS Average_Hours
FROM WORKS_ON;


--Lab 8: Displaying Data from multiple table (JOINS)

--a. Write a query to display department number, department name and name of the employee who are involved in anyone of the department and order by department number.
SELECT D.Dnumber, D.Dname, E.FName, E.LName
FROM DEPARTMENT D
    JOIN EMPLOYEE E
    ON D.Dnumber = E.Dno
ORDER BY D.Dnumber;

--b. Write a query to display all records of employee and department name where manager employee number of department are same as employee number.
SELECT E.*, D.Dname
FROM EMPLOYEE E
    JOIN DEPARTMENT D
    ON D.Mgr_ssn = E.Ssn;

--c. Write a query to display using RIGHT OUTER JOIN for DEPARTMENT and EMPLOYEE table where employee number and manager employee number are same.
SELECT D.*, E.*
FROM DEPARTMENT D
    RIGHT JOIN EMPLOYEE E
    ON D.Mgr_ssn = E.Ssn;

--d. Write a query to display all the records of both EMPLOYEE and PROJECT table.
-- FULL OUTER JOIN
SELECT E.*, P.*
FROM EMPLOYEE E
    FULL OUTER JOIN PROJECT P
    ON E.Dno = P.Dnumber;

--e. Write a query to display employee name, Department name, project name and project hours.
SELECT E.FName, E.LName, D.Dname, P.Pname, W.Hours
FROM EMPLOYEE E
    JOIN DEPARTMENT D
    ON E.Dno = D.Dnumber
    JOIN WORKS_ON W
    ON E.Ssn = W.Essn
    JOIN PROJECT P
    ON W.Pno = P.Pnumber;

--f. Write a query to display Department name, count of employee, maximum salary, minimum salary and total salary of employee group by Department name.
SELECT D.Dname,
    COUNT(E.Ssn) AS Employee_Count,
    MAX(E.Salary) AS Max_Salary,
    MIN(E.Salary) AS Min_Salary,
    SUM(E.Salary) AS Total_Salary
FROM DEPARTMENT D
    LEFT JOIN EMPLOYEE E
    ON D.Dnumber = E.Dno
GROUP BY D.Dname;

--g. Write a query to display project location associated with the respective department name.
SELECT D.Dname, P.Plocation
FROM DEPARTMENT D
    JOIN PROJECT P
    ON D.Dnumber = P.Dnumber;


--Lab 9: Nested Queries (Sub query) in SQL

--a. Find the first name, last name and salary of employees greater than the average salary of the employees.
SELECT FName, LName, Salary
FROM EMPLOYEE
WHERE Salary > (
    SELECT AVG(Salary)
FROM EMPLOYEE
);

--b. Find the first name and last name of employees who are heading the department.
SELECT FName, LName
FROM EMPLOYEE
WHERE Ssn IN (
    SELECT Mgr_ssn
FROM DEPARTMENT
);

--c. Find the project name and project location whose hours to complete project is greater than minimum work hour.
SELECT P.Pname, P.Plocation
FROM PROJECT P
WHERE P.Pnumber IN (
    SELECT W.Pno
FROM WORKS_ON W
WHERE W.Hours > (
        SELECT MIN(Hours)
FROM WORKS_ON
    )
);

--d. Find the name of employees whose hours to complete the project is greater than minimum work hour.
SELECT E.FName, E.LName
FROM EMPLOYEE E
WHERE E.Ssn IN (
    SELECT W.Essn
FROM WORKS_ON W
WHERE W.Hours > (
        SELECT MIN(Hours)
FROM WORKS_ON
    )
);


--Lab 10: Views in SQL

--a. Create a view to display department number, department name, name of the employee, date of birth, address and salary.
CREATE VIEW Dept_Employee_View
AS
    SELECT D.Dnumber,
        D.Dname,
        E.FName,
        E.LName,
        E.Bdate,
        E.Address,
        E.Salary
    FROM EMPLOYEE E
        JOIN DEPARTMENT D ON E.Dno = D.Dnumber;

--b. Display the content of the view.
SELECT *
FROM Dept_Employee_View;

--c. Alter the view by adding the attribute project name where the employees are working.
ALTER VIEW Dept_Employee_View
AS
    SELECT D.Dnumber,
        D.Dname,
        E.FName,
        E.LName,
        E.Bdate,
        E.Address,
        E.Salary,
        P.Pname AS Project_Name
    FROM EMPLOYEE E
        JOIN DEPARTMENT D ON E.Dno = D.Dnumber
        JOIN WORKS_ON W ON E.Ssn = W.Essn
        JOIN PROJECT P ON W.Pno = P.Pnumber;

--d. Drop the view.
DROP VIEW Dept_Employee_View;
