CREATE DATABASE HR_PAYROLL;
USE HR_PAYROLL;

CREATE TABLE DEPARTMENTS
(
	DEPT_ID    INT   PRIMARY KEY,
	DEPT_NAME  VARCHAR(100) NOT NULL
);

CREATE TABLE EMPLOYEES
(
	EMP_ID  INT  PRIMARY KEY,
	FIRST_NAME   	VARCHAR(50),
	LAST_NAME   	 VARCHAR(50),
	EMAIL  			 VARCHAR(100),
	PHONE_NUMBER  		 VARCHAR(15),
	DEPT_ID		    	INT,
	DATE_OF_JOINING		DATE,
	SALARY				DECIMAL(10,2),
	FOREIGN KEY (DEPT_ID)  REFERENCES DEPARTMENTS (DEPT_ID)
);


CREATE TABLE SALARIES
(
	SALARY_ID		INT  PRIMARY KEY,
	EMP_ID			INT,
	SALARY_MONTH	DATE,
	BASIC_SALARY	DECIMAL(10,2),
	BONUS			DECIMAL(10,2),
	DEDUCTIONS		DECIMAL(10,2),
	FOREIGN KEY (EMP_ID)  REFERENCES EMPLOYEES (EMP_ID)
);

CREATE TABLE AUDIT_LOG
(
	LOG_ID		SERIAL	PRIMARY KEY,
	TABLE_NAME	VARCHAR(50),
	OPERATION	VARCHAR(20),
	CHANGED_BY	VARCHAR(50),
	CHANGE_DATE	TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE LEAVES
(
	LEAVE_ID		SERIAL	PRIMARY KEY,
	EMP_ID			INT,
	LEAVE_TYPE		VARCHAR(20),
	START_DATE		DATE,
	END_DATE		DATE,
	STATUS			VARCHAR(20),
	FOREIGN KEY (EMP_ID)  REFERENCES EMPLOYEES (EMP_ID)
);

SELECT * FROM DEPARTMENTS

INSERT INTO Departments (Dept_ID, Dept_Name)
VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Sales'),
(6, 'Operations'),
(7, 'Customer Support'),
(8, 'Legal'),
(9, 'Logistics'),
(10, 'R&D'),
(11, 'Administration'),
(12, 'Procurement'),
(13, 'Quality Assurance'),
(14, 'Production'),
(15, 'Training'),
(16, 'Compliance'),
(17, 'Public Relations'),
(18, 'Security'),
(19, 'Engineering'),
(20, 'Analytics'),
(21, 'Design'),
(22, 'Testing'),
(23, 'Corporate Strategy'),
(24, 'Executive Team');

SELECT * FROM EMPLOYEES;

INSERT INTO Employees (Emp_ID, First_Name, Last_Name, Email, Phone_Number, Dept_ID, Date_Of_Joining, Salary) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890', 1, '2021-01-15', 50000),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '1234567891', 2, '2020-03-10', 60000),
(3, 'Alice', 'Brown', 'alice.brown@example.com', '1234567892', 3, '2019-05-20', 55000),
(4, 'Bob', 'Taylor', 'bob.taylor@example.com', '1234567893', 4, '2021-08-25', 70000),
(5, 'Charlie', 'Jones', 'charlie.jones@example.com', '1234567894', 5, '2022-01-10', 45000),
(6, 'Diana', 'Evans', 'diana.evans@example.com', '1234567895', 6, '2021-06-15', 48000),
(7, 'Eva', 'Wilson', 'eva.wilson@example.com', '1234567896', 7, '2020-11-20', 62000),
(8, 'Frank', 'Hall', 'frank.hall@example.com', '1234567897', 8, '2019-02-18', 58000),
(9, 'Grace', 'Adams', 'grace.adams@example.com', '1234567898', 9, '2021-12-01', 49000),
(10, 'Hank', 'Lewis', 'hank.lewis@example.com', '1234567899', 10, '2020-09-25', 53000),
(11, 'Ivy', 'Clark', 'ivy.clark@example.com', '1234567810', 11, '2019-07-10', 61000),
(12, 'Jack', 'Walker', 'jack.walker@example.com', '1234567811', 12, '2021-03-12', 47000),
(13, 'Kate', 'White', 'kate.white@example.com', '1234567812', 13, '2022-06-30', 44000),
(14, 'Liam', 'Harris', 'liam.harris@example.com', '1234567813', 14, '2018-05-22', 51000),
(15, 'Mona', 'Young', 'mona.young@example.com', '1234567814', 15, '2020-02-14', 46000),
(16, 'Noah', 'King', 'noah.king@example.com', '1234567815', 16, '2019-09-17', 55000),
(17, 'Olivia', 'Green', 'olivia.green@example.com', '1234567816', 17, '2021-07-19', 59000),
(18, 'Paul', 'Scott', 'paul.scott@example.com', '1234567817', 18, '2020-11-01', 52000),
(19, 'Quinn', 'Roberts', 'quinn.roberts@example.com', '1234567818', 19, '2018-10-10', 57000),
(20, 'Rose', 'Wood', 'rose.wood@example.com', '1234567819', 20, '2021-05-05', 56000),
(21, 'Steve', 'Hill', 'steve.hill@example.com', '1234567820', 21, '2019-03-15', 48000),
(22, 'Tina', 'Baker', 'tina.baker@example.com', '1234567821', 22, '2020-06-20', 49000),
(23, 'Uma', 'Nelson', 'uma.nelson@example.com', '1234567822', 23, '2021-10-25', 58000),
(24, 'Victor', 'Carter', 'victor.carter@example.com', '1234567823', 24, '2018-01-10', 60000);


SELECT * FROM SALARIES;

INSERT INTO Salaries (Salary_ID, Emp_ID, Salary_Month, Basic_Salary, Bonus, Deductions)
VALUES
(1, 1, '2024-10-01', 50000, 5000, 2000),
(2, 2, '2024-10-01', 60000, 7000, 3000),
(3, 3, '2024-10-01', 55000, 4000, 2500),
(4, 4, '2024-10-01', 70000, 8000, 3200),
(5, 5, '2024-10-01', 45000, 3000, 1500),
(6, 6, '2024-10-01', 48000, 4000, 1800),
(7, 7, '2024-10-01', 62000, 7000, 2500),
(8, 8, '2024-10-01', 58000, 5000, 2100),
(9, 9, '2024-10-01', 49000, 4000, 1700),
(10, 10, '2024-10-01', 53000, 4500, 2000),
(11, 11, '2024-10-01', 61000, 5500, 2400),
(12, 12, '2024-10-01', 47000, 3500, 1600),
(13, 13, '2024-10-01', 44000, 3000, 1500),
(14, 14, '2024-10-01', 51000, 4000, 1900),
(15, 15, '2024-10-01', 46000, 3500, 1700),
(16, 16, '2024-10-01', 55000, 4500, 2100),
(17, 17, '2024-10-01', 59000, 5000, 2200),
(18, 18, '2024-10-01', 52000, 4200, 1900),
(19, 19, '2024-10-01', 57000, 4800, 2000),
(20, 20, '2024-10-01', 56000, 4700, 2100),
(21, 21, '2024-10-01', 48000, 4000, 1800),
(22, 22, '2024-10-01', 49000, 4100, 1900),
(23, 23, '2024-10-01', 58000, 5000, 2200),
(24, 24, '2024-10-01', 60000, 5500, 2300);

SELECT * FROM AUDIT_LOG;

INSERT INTO Audit_Log (Table_Name, Operation, Changed_By)
VALUES 
('Employees', 'INSERT', 'HR_Manager'),
('Salaries', 'INSERT', 'Finance_Head'),
('Leaves', 'UPDATE', 'HR_Manager'),
('Performance', 'DELETE', 'Admin'),
('Employees', 'UPDATE', 'HR_Assistant'),
('Departments', 'INSERT', 'Admin'),
('Salaries', 'UPDATE', 'Finance_Assistant'),
('Employees', 'DELETE', 'Admin'),
('Leaves', 'INSERT', 'HR_Officer'),
('AuditLog', 'INSERT', 'Admin'),
('Departments', 'DELETE', 'Admin'),
('Performance', 'INSERT', 'HR_Manager'),
('Leaves', 'UPDATE', 'HR_Assistant'),
('Employees', 'UPDATE', 'HR_Manager'),
('Salaries', 'INSERT', 'Finance_Head'),
('Departments', 'INSERT', 'Admin'),
('Performance', 'UPDATE', 'HR_Manager'),
('Leaves', 'DELETE', 'Admin'),
('Employees', 'INSERT', 'HR_Assistant'),
('Salaries', 'DELETE', 'Finance_Head'),
('AuditLog', 'INSERT', 'Admin'),
('Performance', 'INSERT', 'HR_Manager'),
('Employees', 'INSERT', 'HR_Assistant'),
('Salaries', 'UPDATE', 'Finance_Officer');


SELECT * FROM LEAVES;

INSERT INTO Leaves (Emp_ID, Leave_Type, Start_Date, End_Date, Status) 
VALUES
(1, 'Sick Leave', '2024-01-05', '2024-01-08', 'Approved'),
(2, 'Casual Leave', '2024-02-15', '2024-02-16', 'Pending'),
(3, 'Maternity Leave', '2024-03-01', '2024-06-30', 'Approved'),
(4, 'Paternity Leave', '2024-03-15', '2024-03-20', 'Pending'),
(5, 'Vacation', '2024-04-10', '2024-04-15', 'Rejected'),
(6, 'Sick Leave', '2024-05-05', '2024-05-07', 'Approved'),
(7, 'Sick Leave', '2024-06-10', '2024-06-12', 'Pending'),
(8, 'Casual Leave', '2024-07-01', '2024-07-03', 'Approved'),
(9, 'Vacation', '2024-08-15', '2024-08-20', 'Pending'),
(10, 'Sick Leave', '2024-09-05', '2024-09-07', 'Rejected'),
(11, 'Casual Leave', '2024-10-01', '2024-10-02', 'Approved'),
(12, 'Vacation', '2024-11-20', '2024-11-30', 'Pending'),
(13, 'Sick Leave', '2024-12-05', '2024-12-07', 'Approved'),
(14, 'Casual Leave', '2025-01-10', '2025-01-11', 'Rejected'),
(15, 'Vacation', '2025-02-20', '2025-02-25', 'Approved'),
(16, 'Paternity Leave', '2025-03-15', '2025-03-20', 'Pending'),
(17, 'Maternity Leave', '2025-04-01', '2025-07-30', 'Approved'),
(18, 'Casual Leave', '2025-05-15', '2025-05-16', 'Rejected'),
(19, 'Sick Leave', '2025-06-05', '2025-06-08', 'Pending'),
(20, 'Vacation', '2025-07-10', '2025-07-15', 'Approved'),
(21, 'Sick Leave', '2025-08-05', '2025-08-07', 'Pending'),
(22, 'Casual Leave', '2025-09-01', '2025-09-03', 'Approved'),
(23, 'Vacation', '2025-10-15', '2025-10-20', 'Pending'),
(24, 'Sick Leave', '2025-11-05', '2025-11-07', 'Rejected');


SELECT Emp_ID, First_Name, Last_Name, Dept_Name 
FROM Employees E 
JOIN Departments D ON E.Dept_ID = D.Dept_ID
WHERE Dept_Name = 'IT';


SELECT D.Dept_Name, SUM(E.Salary) AS TotalSalary 
FROM Employees E 
JOIN Departments D ON E.Dept_ID = D.Dept_ID
GROUP BY D.Dept_Name
HAVING SUM(E.Salary) > 10000;



SELECT First_Name, Last_Name, Salary, Dept_Name
FROM (
    SELECT E.First_Name, E.Last_Name, E.Salary, D.Dept_Name,
           RANK() OVER (PARTITION BY Dept_Name ORDER BY Salary DESC) AS Rank
    FROM Employees E
    JOIN Departments D ON E.Dept_ID = D.Dept_ID
) RankedEmployees
WHERE Rank = 1;


WITH EmployeeCTE AS (
    SELECT Emp_ID, First_Name, Last_Name, Salary FROM Employees
)
SELECT * FROM EmployeeCTE WHERE Salary > 50000;


ROLLBACK;

SELECT Email, COUNT(*)
FROM Employees
GROUP BY Email
HAVING COUNT(*) > 1;

SELECT * 
FROM Employees 
WHERE Email IS NULL;

DELETE FROM Employees
WHERE EMP_ID NOT IN (
    SELECT MIN(EMP_ID)
    FROM Employees
    GROUP BY Email
);

UPDATE Employees
SET Email = 'default@example.com'
WHERE Email IS NULL;

CREATE UNIQUE INDEX IDX_Email ON Employees (Email);

CREATE VIEW Dept_Wise_Employees AS 
SELECT D.Dept_Name, E.First_Name, E.Last_Name 
FROM Employees E 
JOIN Departments D ON E.Dept_ID = D.Dept_ID;


SELECT E.Emp_ID, E.First_Name, E.Last_Name, D.Dept_Name
FROM Employees E
LEFT JOIN Departments D ON E.Dept_ID = D.Dept_ID;


SELECT D.Dept_Name, 
       AVG(S.Basic_Salary) AS Avg_Salary, 
       SUM(S.Bonus) AS TotalBonuses,
       SUM(S.Deductions) AS TotalDeductions
FROM Salaries S
JOIN Employees E ON S.Emp_ID = E.Emp_ID
JOIN Departments D ON E.Dept_ID = D.Dept_ID
GROUP BY D.Dept_Name;


SELECT E.First_Name, E.Last_Name, E.Salary
FROM Employees E
WHERE E.Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE Dept_ID = E.Dept_ID
);

SELECT E.First_Name, E.Last_Name, P.Score, 
       RANK() OVER (PARTITION BY E.Dept_ID ORDER BY P.Score DESC) AS Rank
FROM Performance P
JOIN Employees E ON P.Emp_ID = E.Emp_ID;
