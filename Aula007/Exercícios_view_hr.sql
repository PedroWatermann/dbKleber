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

## 05) Crie uma view que liste o nome do funcionário e do seu endereço