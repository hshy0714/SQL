--  문제 1

SELECT first_name || ' ' || last_name as "FULL NAME",
    salary,
    phone_number,
    hire_date
FROM employees
ORDER BY hire_date;


--  문제 2

SELECT job_title, max_salary
FROM jobs
ORDER BY max_salary DESC;


--  문제 3

SELECT first_name,
    salary,
    manager_id,
    commission_pct
FROM employees
WHERE salary > 3000 AND
    manager_id is not null AND --  =null로 체크하면 안됌
    commission_pct is null
ORDER BY salary DESC;


--  문제 4

SELECT job_title, max_salary
FROM jobs
WHERE max_salary >= 10000
ORDER BY max_salary DESC;


--  문제 5

SELECT first_name, salary, nvl(commission_pct, 0) -- commission_pct가 null이면 0을 취한다
FROM employees
WHERE salary >= 10000 AND salary < 14000
ORDER BY salary DESC;


--  문제 6

SELECT first_name, salary, TO_CHAR(hire_date, 'YYYY-MM') hire_date, department_id
FROM employees
WHERE department_id IN (10, 90, 100);


--  문제 7

SELECT first_name, salary
FROM employees
WHERE lower(first_name) LIKE '%s%';


--  문제 8

SELECT department_name
FROM departments
ORDER BY length(department_name) DESC;


--  문제 9

SELECT UPPER(country_name) country_name
FROM countries
ORDER BY UPPER(country_name) ASC;


--  문제 10

SELECT first_name, salary,
    replace(phone_number, '.', '-') phone_number, -- . -> - 로 치환
    hire_date
FROM employees 
WHERE hire_date <= '03/12/31';