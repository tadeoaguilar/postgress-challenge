--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
Select E.Emp_no, E.Last_name,E.First_name,E.Sex,S.Salary from Employees E
inner join Salaries S
on (E.Emp_no=S.Emp_no)

--2. List first name, last name, and hire date for employees who were hired in 1986.

Select E.First_name, E.Last_name, E.Hire_Date from Employees E where date_part('year', E.Hire_Date) = 1986

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

Select D.Dept_no,D.Dept_Name, M.Emp_no,E.Last_Name,E.First_Name from Dept_Manager M
inner join Employees E
on(M.Emp_no=E.Emp_no)
inner join Departments D
on (M.Dept_no =D.Dept_no)

--4. List the department of each employee with the following information
--: employee number, last name, first name, and department name.

Select  E.Emp_no,E.Last_Name,E.First_Name,D.Dept_Name from Dept_Emp M
inner join Employees E
on(M.Emp_no=E.Emp_no)
inner join Departments D
on (M.Dept_no =D.Dept_no)

--5. List first name, last name, 
--and sex for employees whose first name is "Hercules" and last names begin with "B."
Select  First_Name,Last_Name,Sex from Employees  where 
First_name = 'Hercules' and last_name like 'B%'

--6. List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.

Select  E.Emp_no,E.Last_Name,E.First_Name,D.Dept_Name from Dept_Emp M
inner join Employees E
on(M.Emp_no=E.Emp_no)
inner join Departments D
on (M.Dept_no =D.Dept_no)
Where D.Dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

Select  E.Emp_no,E.Last_Name,E.First_Name,D.Dept_Name from Dept_Emp M
inner join Employees E
on(M.Emp_no=E.Emp_no)
inner join Departments D
on (M.Dept_no =D.Dept_no)
Where D.Dept_name = 'Sales' or D.Dept_name = 'Development'


--8. In descending order, list the frequency count of employee 
--last names, i.e., how many employees share each last name.

select last_name, count(last_name) from Employees 
group by Last_Name order by count(last_name) desc