Create table departments (
dept_no Varchar(20) Not Null,
dept_name Varchar(20) Not null,
Primary Key (dept_no)
);

Create Table titles (
title_id Varchar(20) Not Null,
title Varchar(20) Not Null,
Primary Key (title_id)
);

Create Table employees (
emp_no INT Not null,
emp_title_id Varchar(255) Not null,
birth_date Date Not Null,
first_name Varchar (255) Not null,
last_name Varchar (255) Not null,
sex Varchar (255) Not null,
hire_date Date Not Null,
Primary Key (emp_no),
Foreign Key (emp_title_id) References titles (title_id)
);

Create Table dept_manager(
dept_no Varchar (255) Not null,
emp_no INT Not Null,
Foreign Key (emp_no) References employees (emp_no),
Foreign Key (dept_no) References departments (dept_no),
	Primary Key (dept_no, emp_no)
);

Create Table dept_employee(
emp_no INT Not null,
dept_no Varchar Not Null,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
PRIMARY KEY (emp_no, dept_no)
);

Create Table salaries(
emp_no INT Not null,
salary INT Not null,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
PRIMARY KEY (emp_no)
);
