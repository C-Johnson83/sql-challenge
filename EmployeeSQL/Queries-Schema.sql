SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
  JOIN salaries s
    ON(e.emp_no = s.emp_no)
     ORDER BY emp_no ASC;
	 
	 
--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT last_name, first_name, hire_date
 FROM employees
  WHERE DATE_PART('Year', hire_date) = '1986'
   ORDER BY hire_date ASC;
   
 
--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT t.title, m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
 FROM dept_manager m
  JOIN departments d
   ON (m.dept_no = d.dept_no)
    JOIN employees e
	 ON (e.emp_no = m.emp_no)
	  JOIN titles t
	   ON (t.title_id = e.emp_title_id)
	    ORDER BY dept_no, emp_no ASC;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT n.dept_no, e.emp_no, e.last_name, e.first_name, n.dept_name
 FROM employees e
  JOIN dept_emp d 
   ON (e.emp_no = d.emp_no)
    JOIN departments n
     ON (n.dept_no = d.dept_no)
	  ORDER BY dept_no, emp_no ASC;


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
 FROM employees
  WHERE first_name ='Hercules'AND
   last_name LIKE 'B%'
    ORDER BY last_name ASC;


--List each employee in the Sales department, including their employee number, last name, and first name 
SELECT d.dept_name,e.emp_no, e.last_name, e.first_name
 FROM employees e
  JOIN dept_emp 
   ON (dept_emp.emp_no=e.emp_no)
    JOIN departments d 
	 ON (d.dept_no=dept_emp.dept_no)
      WHERE d.dept_name IN ('Sales')
	   ORDER BY emp_no ASC;
	  
	  
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name 
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
 FROM employees e
  JOIN dept_emp 
   ON (dept_emp.emp_no=e.emp_no)
    JOIN departments d 
	 ON (d.dept_no=dept_emp.dept_no)
      WHERE d.dept_name IN ('Sales','Development')
	   ORDER BY emp_no ASC;


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(*) AS "frequency_counts"
 FROM employees
  GROUP BY last_name
   ORDER BY "frequency_counts" DESC;