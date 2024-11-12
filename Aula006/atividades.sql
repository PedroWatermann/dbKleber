## 1) Obtenha todos os funcionários que têm o mesmo cargo que "Curtis Davies".
SELECT * 
FROM employees
WHERE job_id= 
(
	SELECT job_id 
	FROM employees m 
	WHERE m.first_name='Curtis' 
	AND m.last_name='Davies'
);


## 2) Encontre a localização dos departamentos gerenciados por "Steven King".
SELECT d.department_name 
FROM departments d
WHERE manager_id= 
(
	SELECT e.employee_id
	FROM employees e
	WHERE first_name='Steven' 
    AND last_name='King'
);

select * from departments;


## 3) Obtenha os funcionários que foram contratados após o último funcionário do departamento de TI.
SELECT *
FROM employees
WHERE hire_date > 
(
	SELECT MAX(hire_date)
    FROM employees e, departments d
    WHERE e.department_id = d.department_id
    AND d.department_name = "IT" 
    GROUP BY e.department_id
);


## 4) Obtenha todos os funcionários que não têm um gerente no mesmo departamento.
SELECT * 
FROM employees e
WHERE e.employee_id = e.manager_id
OR department_id <> 
(
	SELECT m.department_id 
	FROM employees m 
    WHERE m.employee_id=e.manager_id
);


## 5) Encontre todos os departamentos que têm menos de 5 funcionários.
SELECT d.department_name 
FROM departments d
WHERE 5 >
(
	SELECT COUNT(e.employee_id)
    FROM employees e
    WHERE e.department_id = d.department_id
)
AND d.manager_id IS NOT NULL;


## 6) Liste os funcionários que ganham um salário superior à média salarial do seu departamento.
SELECT * 
FROM employees em
WHERE em.salary > 
(
	SELECT AVG(e.salary) 
	FROM employees e
	WHERE em.department_id = e.department_id
);