-- Drop tables if they exist
DROP TABLE if exists departments;
DROP TABLE if exists titles;
DROP TABLE if exists employees;
DROP TABLE if exists dept_emp;
DROP TABLE if exists salaries;
DROP TABLE if exists dept_manager;

-- Create table "departments"
CREATE TABLE bldepartments(
	dept_no varchar(5) not null primary key,
	dept_name varchar(25) not null
);

-- Create table "titles"
CREATE TABLE titles (
	title_id varchar(5) not null primary key,
	title varchar(50) not null
);

-- Create table "employees"
CREATE TABLE employees (
	emp_no INT not null,
	emp_title_id varchar (5) not null,
	foreign key (emp_title_id) references titles(title_id),
	birth_date DATE not null,
	first_name VARCHAR(50) not null,
	last_name VARCHAR(50) not null,
	sex VARCHAR(5) not null,
	hire_date DATE not null,
	constraint "pk_employees" primary key (emp_no)
);

-- Create table "dept_emp"
CREATE TABLE dept_emp (
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no),
	dept_no varchar(5) not null,
	foreign key (dept_no) references departments(dept_no),
 	primary key (emp_no, dept_no)
);

-- Create table "salaries"
CREATE TABLE salaries (
	emp_no int not null primary key,
	foreign key (emp_no) references employees(emp_no),
	salary money not null
);

-- Create table "dept_manager"
CREATE TABLE dept_manager (
	dept_no varchar(5) not null,
	foreign key (dept_no) references departments(dept_no),
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no),
	primary key (dept_no, emp_no)
);