
-- 1. Create Database
CREATE DATABASE IF NOT EXISTS Mydb;

-- 2. Create Schema
CREATE SCHEMA IF NOT EXISTS Mydb.hrdata;

-- 3. Create Departments Table
CREATE OR REPLACE TABLE Mydb.hrdata.departments (
    department_id INT AUTOINCREMENT PRIMARY KEY,
    department_name STRING NOT NULL,
    location STRING
);

-- 4. Create Jobs Table
CREATE OR REPLACE TABLE Mydb.hrdata.jobs (
    job_id INT AUTOINCREMENT PRIMARY KEY,
    job_title STRING NOT NULL,
    min_salary NUMBER(10,2),
    max_salary NUMBER(10,2)
);

-- 5. Create Employees Table
CREATE OR REPLACE TABLE Mydb.hrdata.employees (
    employee_id INT AUTOINCREMENT PRIMARY KEY,
    first_name STRING,
    last_name STRING NOT NULL,
    email STRING UNIQUE,
    phone_number STRING,
    hire_date DATE,
    job_id INT,
    salary NUMBER(10,2),
    department_id INT,
    FOREIGN KEY (job_id) REFERENCES Mydb.hrdata.jobs(job_id),
    FOREIGN KEY (department_id) REFERENCES Mydb.hrdata.departments(department_id)
);
