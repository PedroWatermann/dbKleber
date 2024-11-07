SELECT *
FROM employees e
WHERE e.department_id = 
	(
	SELECT department_id
	FROM departments d
	WHERE UPPER(d.department_name) = 'SALES'
    )
ORDER BY e.employee_id;