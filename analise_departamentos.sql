SELECT * FROM employees.employees;
SELECT * FROM employees.dept_emp;
SELECT * FROM employees.titles;

	-- Mostra quantos funcionários tem na empresa
	-- Faz as contas dos totais de funcionários.
SELECT COUNT(*) AS total_funcionarios FROM employees;

	-- Calcula o número total de funcionários por departamento.
	-- A consulta considera apenas as alocações ativas na data atual.
SELECT dept_no, COUNT(DISTINCT emp_no) AS total_funcionarios
FROM dept_emp
WHERE from_date <= CURDATE() AND to_date >= CURDATE()
GROUP BY dept_no
ORDER BY total_funcionarios DESC;

	-- Calcula a média salarial por departamento.
SELECT dept_no, AVG(salary) AS media_salarial
FROM salaries
JOIN dept_emp ON salaries.emp_no = dept_emp.emp_no
GROUP BY dept_no;

	-- Encontra os 10 funcionários mais antigos da empresa.
	-- A consulta utiliza as tabelas 'employees' e 'dept_emp' e ordena os resultados por data de contratação.
	-- Apenas os funcionários ativos na data atual são considerados.
SELECT e.emp_no, e.first_name, e.last_name, e.hire_date
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
ORDER BY e.hire_date ASC
LIMIT 10;

	-- Calcula a média salarial anual ao longo do tempo.
	-- A consulta utiliza a tabela 'salaries' e agrupa os resultados por ano.
	-- A média salarial é calculada para cada ano em que houve alterações salariais registradas.
SELECT YEAR(from_date) AS ano, AVG(salary) AS salario_medio
FROM salaries
GROUP BY ano
ORDER BY ano;







