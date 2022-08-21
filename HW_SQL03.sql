--SQL - HR exercise
--01
SELECT 
	 employees.first_name
	,employees.last_name
	,departments.department_id
	,departments.department_name
FROM employees
	 INNER JOIN departments ON departments.department_id = employees.department_id
--02
SELECT 
	 employees.first_name
	,employees.last_name
	,departments.*
	,locations.city
	,locations.state_province
FROM employees
	 INNER JOIN departments ON departments.department_id = employees.department_id
	 INNER JOIN locations ON locations.location_id = departments.location_id
--03
SELECT 
	 employees.first_name
	,employees.last_name
	,jobs.job_title
	,employees.salary
	,jobs.min_salary
	,jobs.max_salary
FROM employees
	 INNER JOIN jobs ON employees.salary BETWEEN jobs.min_salary AND jobs.max_salary
--04
SELECT 
	 employees.first_name
	,employees.last_name
	,departments.department_id
	,departments.department_name
FROM employees
	 INNER JOIN departments ON departments.department_id = employees.department_id
WHERE departments.department_id IN (80,40)
--05
SELECT 
	 employees.first_name 
	,employees.last_name 
	,departments.department_name
	,locations.city 
	,locations.state_province 
FROM employees 
	INNER JOIN departments ON employees.department_id = departments.department_id 
	INNER JOIN locations ON departments.location_id = locations.location_id 
WHERE employees.first_name LIKE '%z%';
--06
SELECT 
	 employees.first_name 
	,employees.last_name 
	,departments.department_id
	,departments.department_name
FROM employees 
	RIGHT JOIN departments ON employees.department_id = departments.department_id 
--07
SELECT 
	 employees.first_name 
	,employees.last_name 
	,employees.salary
FROM employees
WHERE employees.salary > ANY (SELECT employees.salary FROM employees WHERE employees.employee_id = 182)
--08
SELECT
	 E.first_name AS employee_name
	,M.first_name AS manager_name
FROM employees AS E
	INNER JOIN employees AS M ON M.employee_id = E.manager_id
--09
SELECT 
	 departments.department_name
	,locations.city
	,locations.state_province
FROM departments
	INNER JOIN locations ON locations.location_id = departments.location_id

--10
SELECT 
	 employees.first_name
	,employees.last_name
	,departments.department_id
	,departments.department_name
FROM departments
	RIGHT JOIN employees ON employees.department_id = departments.department_id
--11	
SELECT 
	 E.first_name AS Employee_Name
	,M.first_name AS Manager
FROM employees AS E
	 LEFT JOIN employees AS M ON M.employee_id = E.manager_id
--12
SELECT 
	 employees.first_name
	,employees.last_name
	,employees.department_id
FROM employees
WHERE
--employees.department_id IN(SELECT employees.department_id FROM employees WHERE employees.first_name = 'Taylor' ) - No Taylor in the DB
  employees.department_id IN(SELECT employees.department_id FROM employees WHERE employees.first_name = 'Britney' )

--13
SELECT 
	 jobs.job_title
	,departments.department_name
	,employees.first_name + ' ' + employees.last_name AS employees_name
	,job_history.start_date
	,job_history.end_date
FROM employees
	INNER JOIN departments ON departments.department_id = employees.department_id
	INNER JOIN jobs ON jobs.job_id = employees.job_id 
	INNER JOIN job_history ON job_history.employee_id = employees.employee_id
WHERE job_history.start_date = '1993-01-01' 
AND job_history.end_date BETWEEN '1993-01-01' AND '1997-08-31'
--14
SELECT 
	jobs.job_title
	,employees.first_name + ' ' + employees.last_name AS employees_name
	,employees.salary
	,jobs.max_salary
	,jobs.max_salary - employees.salary AS salary_difference
FROM employees
	 INNER JOIN jobs ON jobs.job_id = employees.job_id
--15
DECLARE @AVG_SALARY TABLE (department_id INT NOT NULL, average_salary DECIMAL(18,2)  NULL)
INSERT INTO @AVG_SALARY
SELECT 
	 employees.department_id
	,AVG(employees.salary) AS average_salary
FROM employees
GROUP BY employees.department_id

DECLARE @COUNT_COMMISION TABLE (department_id INT NOT NULL, num_of_employees_with_commision INT  NULL)
INSERT INTO @COUNT_COMMISION
SELECT 
	 employees.department_id
	,COUNT(employees.employee_id) AS number_of_employees_with_commision
FROM employees
WHERE employees.commission_pct > 0
GROUP BY employees.department_id

SELECT 
	 departments.department_name
	,AVG_SALARY.average_salary
	,ISNULL (COUNT_COMMISION.num_of_employees_with_commision,0) AS number_of_employees_with_commision
FROM departments
	 INNER JOIN @AVG_SALARY AS AVG_SALARY ON AVG_SALARY.department_id = departments.department_id
	 LEFT JOIN  @COUNT_COMMISION AS COUNT_COMMISION ON COUNT_COMMISION.department_id = departments.department_id
ORDER BY average_salary DESC
--16
SELECT 
	 jobs.job_title
	,employees.first_name + ' ' + employees.last_name AS employees_name
	,jobs.max_salary - employees.salary AS salary_difference
FROM employees
	 INNER JOIN jobs ON jobs.job_id = employees.job_id
WHERE employees.department_id  = 80
--17
SELECT 
	countries.country_name
	,locations.city
	,departments.department_name
FROM countries
	 INNER JOIN locations ON locations.country_id = countries.country_id
	 INNER JOIN departments ON departments.location_id = locations.location_id

--18
SELECT 
	 departments.department_name
	,employees.first_name + ' ' + employees.last_name AS name_of_manager
FROM employees
	 INNER JOIN departments ON departments.manager_id = employees.employee_id
--19
SELECT 
	 jobs.job_title
	,CAST(AVG(employees.salary) AS DECIMAL(18, 2)) AS avg_salary
FROM employees
	 INNER JOIN jobs ON jobs.job_id = employees.job_id
GROUP BY jobs.job_title
--20
SELECT 
	 job_history.*
FROM employees
	 INNER JOIN job_history ON job_history.employee_id = employees.employee_id
WHERE employees.salary >= 12000
--21
--22
