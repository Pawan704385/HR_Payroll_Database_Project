# HR_Payroll_Database_Project
This project demonstrates a SQL-based HR and payroll system to manage employee data, departments, attendance, and salary calculations. It includes SQL queries for table creation, data insertion, and reporting.


# HR Payroll Database Project

## Project Overview
This project is a demonstration of an SQL-based HR and payroll system to manage employee data, departments, attendance, and salary calculations. It uses PostgreSQL for database management and showcases skills in table creation, data manipulation, and report generation.

## Technologies Used
- SQL (PostgreSQL)
- GitHub

## Features
1. **Employee Management**: Store employee details such as name, age, department, and attendance.
2. **Department Management**: Manage departments with a structured department table.
3. **Salary Calculation**: Automatically calculate total salary based on base salary, bonuses, and deductions.
4. **Attendance Tracking**: Record and report employee attendance.

## Instructions to Run the Project
1. Clone this repository to your local machine.
2. Run the `CREATE_TABLES.sql` script to create the necessary tables.
3. Insert data into the tables using `INSERT_DATA.sql`.
4. Run the queries in `QUERIES.sql` to generate reports and manage the data.

## Key SQL Queries
- Calculate total salary of employees:
  ```sql
  SELECT emp_id, (base_salary + bonus - deductions) AS total_salary FROM salaryprjct1;
