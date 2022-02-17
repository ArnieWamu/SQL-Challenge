-- List the following details of each employee: employee number, last name, first name, sex, and salary

SELECT employees.emp_no AS Employee_Number, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE date_part ('year', hire_date)='1986';

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

SELECT d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name
FROM departments AS d
INNER JOIN dept_manager AS dm
ON d.dept_no=dm.dept_no
INNER JOIN employees AS e
ON dm.emp_no=e.emp_no;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no=de.emp_no
LEFT JOIN departments AS d
ON de.dept_no=d.dept_no;

-- List first name, last name, and sex for employees whose
-- first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex 
FROM employees
WHERE first_name= 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no=de.emp_no
LEFT JOIN departments AS d
ON de.dept_no=d.dept_no
WHERE d.dept_name='Sales';

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no=de.emp_no
LEFT JOIN departments AS d
ON de.dept_no=d.dept_no
WHERE d.dept_name='Sales' OR d.dept_name='Development';

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "Last_Name_Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Last_Name_Frequency" DESC;