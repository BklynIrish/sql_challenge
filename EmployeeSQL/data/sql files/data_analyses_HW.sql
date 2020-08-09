--#### Data Analysis


--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
INNER JOIN salaries s on e.emp_no = s.emp_no 

--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT e.first_name, e.last_name, e.hire_date 
from employees e
WHERE e.hire_date between '1986/01/01' and '1986/12/31'

--3. List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.
  --table deptarments has dept_name and dept-no
  --table dept-manager has dept_no, emp_no
  --table dept_emp has emp-no, dept_no
  --table employees has emp_name and emp_no

SELECT e.first_name, e.last_name, dm.emp_no, d.dept_name, d.dept_no
FROM employees e
INNER JOIN dept_manager dm on e.emp_no = dm.emp_no 
INNER JOIN departments d on dm.dept_no = d.dept_no


--4. List the department of each employee with the following information: employee number, last name, 
--first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
INNER JOIN dept_emp de on de.emp_no = e.emp_no 
INNER JOIN departments d on de.dept_no = d.dept_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names 
--begin with "B."

SELECT e.first_name, e.last_name, e.sex
from employees e
WHERE e.first_name = 'Hercules' and e.last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
INNER JOIN dept_emp de on de.emp_no = e.emp_no 
INNER JOIN departments d on de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
INNER JOIN dept_emp de on de.emp_no = e.emp_no 
INNER JOIN departments d on de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' or d.dept_name = 'Development'

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

Select last_name, count(last_name) as freq from employees
Group by last_name
Order by freq DESC

