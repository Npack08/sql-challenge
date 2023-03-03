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