CREATE TABLE employeeprjct1 (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_title VARCHAR(50),
    department_id INT,
    hire_date DATE,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE departmentprjct1 (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employeeprjct1(emp_id)
);

CREATE TABLE attendanceprjct1 (
    emp_id INT,
    check_in_time TIMESTAMP,
    check_out_time TIMESTAMP,
    work_hours DECIMAL(5, 2),
    attendance_date DATE,
    PRIMARY KEY (emp_id, attendance_date),
    FOREIGN KEY (emp_id) REFERENCES employeeprjct1(emp_id)
);

CREATE TABLE salaryprjct1 (
    emp_id INT,
    base_salary DECIMAL(10, 2),
    bonus DECIMAL(10, 2),
    deductions DECIMAL(10, 2),
    total_salary DECIMAL(10, 2),  -- No computed column, we will calculate this manually
    salary_month DATE,
    PRIMARY KEY (emp_id, salary_month),
    FOREIGN KEY (emp_id) REFERENCES employeeprjct1(emp_id)
);

INSERT INTO employeeprjct1 (emp_id, first_name, last_name, job_title, department_id, hire_date, email)
VALUES 
(101, 'John', 'Doe', 'Software Engineer', 1, '2021-06-15', 'john.doe@example.com'),
(102, 'Jane', 'Smith', 'Data Analyst', 2, '2022-01-22', 'jane.smith@example.com'),
(103, 'Michael', 'Brown', 'HR Manager', 3, '2020-11-05', 'michael.brown@example.com');

INSERT INTO departmentprjct1 (department_id, department_name, manager_id)
VALUES 
(1, 'IT', 101),
(2, 'Data', 102),
(3, 'HR', 103);

INSERT INTO attendanceprjct1 (emp_id, check_in_time, check_out_time, work_hours, attendance_date)
VALUES 
(101, '2024-11-01 09:00:00', '2024-11-01 17:00:00', 8.0, '2024-11-01'),
(102, '2024-11-01 09:30:00', '2024-11-01 18:00:00', 7.5, '2024-11-01'),
(103, '2024-11-01 09:15:00', '2024-11-01 17:30:00', 8.25, '2024-11-01');

INSERT INTO salaryprjct1 (emp_id, base_salary, bonus, deductions, total_salary, salary_month)
VALUES 
(101, 50000.00, 5000.00, 2000.00, (50000.00 + 5000.00 - 2000.00), '2024-10-31'),
(102, 40000.00, 3000.00, 1500.00, (40000.00 + 3000.00 - 1500.00), '2024-10-31'),
(103, 60000.00, 6000.00, 2500.00, (60000.00 + 6000.00 - 2500.00), '2024-10-31');


CREATE VIEW salaryprjct1_view AS
SELECT 
    emp_id,
    base_salary,
    bonus,
    deductions,
    (base_salary + bonus - deductions) AS total_salary,
    salary_month
FROM salaryprjct1;

SELECT e.emp_id, e.first_name, e.last_name, d.department_name
FROM employeeprjct1 e
JOIN departmentprjct1 d ON e.department_id = d.department_id;



SELECT emp_id, SUM(work_hours) AS total_work_hours
FROM attendanceprjct1
WHERE EXTRACT(MONTH FROM attendance_date) = 11
AND EXTRACT(YEAR FROM attendance_date) = 2024
GROUP BY emp_id;


SELECT emp_id, total_salary
FROM salaryprjct1
WHERE salary_month = '2024-10-31';


SELECT emp_id, base_salary, bonus, total_salary
FROM salaryprjct1
WHERE bonus > 5000;


SELECT d.department_name, e.first_name || ' ' || e.last_name AS manager_name
FROM departmentprjct1 d
JOIN employeeprjct1 e ON d.manager_id = e.emp_id
WHERE d.department_name = 'IT';


SELECT * FROM salaryprjct1_view;


