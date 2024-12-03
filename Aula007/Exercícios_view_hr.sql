## 01) Criar uma view que liste o nome do funcionário, nome do departamento e nome do gerente
CREATE OR REPLACE VIEW emp_dep_view AS 
	SELECT e.first_name, e.last_name, 
	(
		SELECT d.department_name
		FROM departments d
		WHERE e.department_id = d.department_id
	) AS "Departamento", 
	(
		SELECT CONCAT(em.first_name, ' ', em.last_name)
		FROM employees em
		WHERE em.employee_id = e.manager_id
		GROUP BY e.first_name
	) AS 'Gerente'
	FROM employees e;


## 02) Criar uma view que liste o nome dos departamentos que não possuem funcionários
CREATE OR REPLACE VIEW dep_without_emp_view AS 
	SELECT d.department_name
	FROM departments d
	WHERE d.manager_id IS NULL;


## 03) Altere a view criada no primeiro exercício incluindo a coluna do salário
CREATE OR REPLACE VIEW emp_dep_view AS 
	SELECT e.first_name, e.last_name, 
	(
		SELECT d.department_name
		FROM departments d
		WHERE e.department_id = d.department_id
	) AS "Departamento", e.salary,
	(
		SELECT CONCAT(em.first_name, ' ', em.last_name)
		FROM employees em
		WHERE em.employee_id = e.manager_id
		GROUP BY e.first_name
	) AS 'Gerente'
	FROM employees e;
    
    select * from emp_dep_view;
    
## 04) Crie uma view que liste o nome dos países e dos locais
CREATE VIEW cou_reg_view AS
	SELECT  c.country_name 'Country Name',
			l.state_province 'State Province',
			l.city 'City',
            l.street_address 'Street Address'
    FROM countries c
    JOIN locations l
    ON c.country_id = l.country_id
    ORDER BY c.country_id;

## 05) Crie uma view que liste o nome do funcionário e do seu endereço
CREATE VIEW emp_add_view AS
	SELECT  CONCAT( e.first_name, ' ', e.last_name ) 'Employee Name',
			l.state_province 'State Province',
			l.city 'City',
            l.street_address 'Street Address'
    FROM employees e
    LEFT JOIN departments d
    ON e.manager_id = d.manager_id
    LEFT JOIN locations l
    ON d.location_id = l.location_id
    ORDER BY e.first_name, e.last_name;

## 6 – CRIE UMA VIEW QUE LISTA OS FUNCIONÁRIOS QUE GANHAM ACIMA DA MÉDIA DOS DEMAIS
CREATE VIEW emp_sal_view AS
	SELECT first_name
    FROM employees
    WHERE salary < 
	(
		SELECT AVG(salary) 
		FROM employees
	);

## 7 – CRIE UMA VIEW QUE LISTE O TOTAL, MÉDIA SALARIAL, QUANTIDADE DE FUNCIONARIOS POR DEPARTAMENTO JUNTO AO NOME DO DEPARTAMENTO.
CREATE VIEW tot_sal_amo_emp_view AS
	SELECT 
		SUM(e.salary) 'Total',
		AVG(e.salary) 'Average Salary',
		de.department_name 'Department Name',
		COUNT(em.employee_id) 'Employee Count'
	FROM employees e
	JOIN departments de
    ON e.manager_id = de.manager_id
	LEFT JOIN employees em 
    ON em.manager_id = de.manager_id
	GROUP BY de.department_name;

## 8 – CRIE UMA VIEW QUE LISTA OS JOBS QUE NÃO POSSUEM FUNCIONÁRIOS
CREATE VIEW job_without_emp_view AS
	SELECT j.job_title
    FROM jobs j
	JOIN employees e
    WHERE e.job_id <> j.job_id
    GROUP BY j.job_id;

## 9 – CRIE UMA VIEW QUE LISTE A QUANTIDADE DE FUNCIONÁRIOS POR PAIS
SELECT COUNT( e.employee_id )
FROM employees e, departments d, locations l, countries c;

## 10 – CRIE UMA VIEW QUE MOSTRE O NOME DO JOB, QUANTIDADE DE FUNCIONÁRIOS E A MÉDIA DO SALARIO MÉDIO POR JOB
