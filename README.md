# sql-challenge

# ERD Diamgram was created to show a visual representation of the relationships and cardinality between these attributes and entities.

# Created tables in pgAdmin and transferred data from CSV files into the tables. See scheme below:
<!-- Create table departments (
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

#Used the tables created to then create queries to answer the following questions:
 --List the employee number, last name, first name, sex, and salary of each employee--
Select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
join salaries
on employees.emp_no = salaries.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986--
Select employees.first_name, employees.last_name, employees.hire_date
from employees
where employees.hire_date between '1/1/1986' and '12/31/1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name--
Select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager
join employees
on	dept_manager.emp_no = employees.emp_no
join departments
on	dept_manager.dept_no = departments.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.--
Select dept_employee.dept_no, dept_employee.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_employee
join employees
on	dept_employee.emp_no = employees.emp_no
join departments
on	dept_employee.dept_no = departments.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.--
Select employees.first_name, employees.last_name, employees.sex
from employees
where first_name = 'Hercules' and last_name like 'B%'; 

--List each employee in the Sales department, including their employee number, last name, and first name.--
Select departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
from employees
join dept_employee
on employees.emp_no = dept_employee.emp_no
join departments on dept_employee.dept_no = departments.dept_no
where departments.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.--
Select departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
from employees
join dept_employee
on employees.emp_no = dept_employee.emp_no
join departments on dept_employee.dept_no = departments.dept_no
where departments.dept_name in ('Sales','Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).--
Select  employees.last_name, Count(last_name) AS "Number of employees who share the same last names"
from employees
group by employees.last_name
order by "Number of employees who share the same last names" DESC;
