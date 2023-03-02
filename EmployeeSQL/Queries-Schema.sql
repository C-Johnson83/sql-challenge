SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no "Employee No.", e.last_name as "Last Name", e.first_name as "First Name", e.sex as "Sex", s.salary as "Salary"
FROM employees e
  JOIN salaries s
    ON(e.emp_no = s.emp_no)
     ORDER BY "Employee No." ASC;
	 
	 
--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT last_name as "Last Name", first_name as "First Name", hire_date as "Hire Date"
 FROM employees
  WHERE DATE_PART('Year', hire_date) = '1986'
   ORDER BY "Hire Date" ASC;
   
 
--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT t.title as "Title", m.dept_no as "Department No.", d.dept_name as "Department Name", m.emp_no "Employee No.", e.last_name as "Last Name", e.first_name as "First Name"
 FROM dept_manager m
  JOIN departments d
   ON (m.dept_no = d.dept_no)
    JOIN employees e
	 ON (e.emp_no = m.emp_no)
	  JOIN titles t
	   ON (t.title_id = e.emp_title_id)
	    ORDER BY "Department No.", "Employee No." ASC;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT n.dept_no as "Department No.", e.emp_no "Employee No.", e.last_name as "Last Name", e.first_name as "First Name", n.dept_name as "Department Name"
 FROM employees e
  JOIN dept_emp d 
   ON (e.emp_no = d.emp_no)
    JOIN departments n
     ON (n.dept_no = d.dept_no)
	   ORDER BY "Department No.", "Employee No." ASC;


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name as "First Name", last_name as "Last Name", sex as "Sex"
 FROM employees
  WHERE first_name ='Hercules' AND
   last_name LIKE 'B%'
    ORDER BY "Last Name" ASC;


--List each employee in the Sales department, including their employee number, last name, and first name 
SELECT d.dept_name as "Department Name",e.emp_no "Employee No.", e.last_name as "Last Name", e.first_name as "First Name"
 FROM employees e
  JOIN dept_emp 
   ON (dept_emp.emp_no=e.emp_no)
    JOIN departments d 
	 ON (d.dept_no=dept_emp.dept_no)
      WHERE d.dept_name IN ('Sales')
	   ORDER BY "Employee No." ASC;
	  
	  
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name 
SELECT d.dept_name as "Department Name", e.emp_no as "Employee No.", e.last_name as "Last Name", e.first_name as "First Name"
 FROM employees e
  JOIN dept_emp 
   ON (dept_emp.emp_no=e.emp_no)
    JOIN departments d 
	 ON (d.dept_no=dept_emp.dept_no)
      WHERE d.dept_name IN ('Sales','Development')
	   ORDER BY "Employee No." ASC;


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name as "Last Name", COUNT(*) AS "Frequency Counts"
 FROM employees
  GROUP BY last_name
   ORDER BY "Frequency Counts" DESC;