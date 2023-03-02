-- Drop Tables In This Order Due To Keys --
DROP TABLE IF EXISTS salaries;
	---------------
DROP TABLE IF EXISTS dept_manager;
	---------------	
DROP TABLE IF EXISTS dept_emp;
	---------------	
DROP TABLE IF EXISTS employees;
	---------------
DROP TABLE IF EXISTS titles;
	---------------	
DROP TABLE IF EXISTS departments;
	---------------
	
	
	
-- Departments Table --
CREATE TABLE departments(
	dept_no VARCHAR(4) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(20)
	);
	
-- Employee Titles Table --
CREATE TABLE titles(
	title_id VARCHAR(5) NOT NULL PRIMARY KEY,
	title VARCHAR(20)
	);
	
-- Employee Information Table --
CREATE TABLE employees(
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(5),
	birth_date DATE,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	sex VARCHAR(1),
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
	);
		
-- Department Employee Numbers Table --
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY(emp_no, dept_no) 
	);
	
-- Departments Managers Table --
CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL PRIMARY KEY
	);

-- Employee Salary Table --
CREATE TABLE salaries(
	emp_no INT NOT NULL PRIMARY KEY,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	); 
