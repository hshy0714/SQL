/*
����1.
�������� ���(employee_id), �̸�(firt_name), ��(last_name)�� �μ���(department_name) �� ��ȸ�Ͽ� 
�μ��̸�(department_name) ��������, ���(employee_id) ������������ �����ϼ���(106��)
*/
SELECT emp.employee_id, emp.first_name, emp.last_name, 
    dept.department_name
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id
ORDER BY dept.department_name,  -- ��������
    emp.employee_id DESC;

SELECT employee_id, first_name, last_name, department_name
FROM employees NATURAL JOIN departments;    --  Natural JOIN

/*
����2.
employees ���̺��� job_id�� ������ �������̵� ������ �ֽ��ϴ�
�������� ���(employee_id), �̸�(first_name), �޿�(salary), �μ���(department_name), ������� (job_title)�� 
��� (employee_id) �������� ���� �����ϼ���
�μ��� ���� Kimberely( ��� 178) �� ǥ������ �ʽ��ϴ�(106��)
*/
SELECT emp.employee_id ���,
    emp.first_name �̸�,
    emp.salary �޿�,
    dept.department_name �μ���,
    jobs.job_title ������
FROM employees emp, departments dept, jobs
WHERE emp.department_id = dept.department_id AND
    emp.job_id = jobs.job_id;
    

/*
����2-1.
����2���� �μ��� ���� Kimberely(��� 178) ���� ǥ���� ������(107��)
*/
SELECT emp.employee_id ���,
    emp.first_name �̸�,
    emp.salary �޿�,
    dept.department_name �μ���,
    jobs.job_title ������
FROM employees emp, departments dept, jobs
WHERE emp.department_id = dept.department_id(+) AND --  ���� ���̺��� ��� ��¿� ����
    emp.job_id = jobs.job_id;
    
-- ANSI SQL
SELECT emp.employee_id ���,
    emp.first_name �̸�,
    emp.salary �޿�,
    dept.department_name �μ���,
    jobs.job_title ������
FROM employees emp LEFT OUTER JOIN departments dept
                                ON emp.department_id = dept.department_id,
    jobs
WHERE emp.job_id=jobs.job_id;

/*
����3.
���ú��� ��ġ�� �μ����� �ľ��Ϸ��� �մϴ�
���þ��̵�, ���ø�, �μ���, �μ����̵� ���þ��̵� ������������ �����Ͽ� ����ϼ���
�μ��� ���� ���ô� ǥ������ �ʽ��ϴ�(27��)
*/
SELECT loc.location_id, city,
    department_name,
    dept.department_id
FROM locations loc, departments dept
WHERE loc.location_id = dept.location_id
ORDER BY loc.location_id;   --  ASC ����

/*
����3-1
����3���� �μ��� ���� ���õ� ǥ���մϴ�(43��)
*/
SELECT loc.location_id, city,
    department_name,
    dept.department_id
FROM locations loc, departments dept
WHERE loc.location_id = dept.location_id(+)    -- loc�� ��� ���ڵ带 ��¿� ���� LEFT OUTER JOIN
ORDER BY loc.location_id;

-- ANSI
SELECT loc.location_id, city,
    department_name,
    dept.department_id
FROM locations loc LEFT OUTER JOIN departments dept
                                ON loc.location_id = dept.location_id
ORDER BY loc.location_id;

/*
����4
����(regions)�� ���� ������� �����̸�(region_name), �����̸� (country_name)���� ����ϵ� 
�����̸�(��������), �����̸�(��������)���� �����ϼ���(25��)
*/
SELECT reg.region_name �����̸�,
    c.country_name �����̸�
FROM regions reg JOIN countries c ON (reg.region_id = c.region_id)
ORDER BY reg.region_name, c.country_name DESC;


/*
����5
�ڽ��� �Ŵ������� ä����(hire_date)�� ���� �����
���(employee_id), �̸�(first_name)�� ä����(hire_date), �Ŵ����̸�(first_name), �Ŵ����Ի��� (hire_date)�� ��ȸ�ϼ���
(37��)
*/
SELECT emp.employee_id, emp.first_name, emp.hire_date,
    man.first_name, man.hire_date
FROM employees emp, employees man
WHERE emp.manager_id = man.employee_id AND  -- JOIN ����
    emp.hire_date < man.hire_date;  --  ��¥ ��
    
/*
����6
���󺰷� ��� �μ����� ��ġ�ϰ� �ִ��� �ľ��Ϸ��� �մϴ�
�����, ������̵�, ���ø�, ���þ��̵�, �μ���, �μ����̵� 
����� �������� �� �����Ͽ� ����ϼ���
���� ���� ��� ǥ������ �ʽ��ϴ�
(27��)
*/
SELECT c.country_name, 
    c.country_id,
    loc.city,
    loc.location_id,
    dept.department_name,
    dept.department_id
FROM countries c, locations loc, departments dept
WHERE c.country_id = loc.country_id AND
    loc.location_id = dept.location_id
ORDER BY c.country_name;

/*
����7
job_history���̺��� ������ �������� �����͸� ������ �ִ�
������ �������̵� (job_id)�� 'AC_ACCOUNT'�� �ٹ��� ����� 
���, �̸�(Ǯ����), �������̵�, ������, �������� ����ϼ���
�̸��� first_name �� last_name �� ���� ����մϴ�
(2��)
*/
--SELECT * FROM job_history WHERE job_id='AC_ACCOUNT';
SELECT emp.employee_id ���,
    emp.first_name || ' ' || emp.last_name �̸�,
    emp.job_id �������̵�,
    jh.start_date ������,
    jh.end_date ������
FROM employees emp, job_history jh
WHERE emp.employee_id = jh.employee_id AND
    jh.job_id = 'AC_ACCOUNT';
    
/*
����8
�� �μ� (department)�� ���ؼ� �μ���ȣ(department_id), �μ��̸�(department_name),
�Ŵ���(manager)�� �̸� (first_name), ��ġ(locations)�� ����(city), 
����(countries)�� �̸�(countries_name) �׸��� �������� (regions)�� �̸� (resion_name)���� ���� ����� ������
(11��)
*/
SELECT dept.department_id, dept.department_name,
    man.first_name,
    loc.city,
    c.country_name,
    reg.region_name
FROM departments dept,
    employees man,
    locations loc,
    countries c,
    regions reg
WHERE dept.manager_id = man.employee_id AND
    dept.location_id = loc.location_id AND
    loc.country_id = c.country_id AND
    c.region_id = reg.region_id;

/*
����9
�� ���(employee)�� ���ؼ� ���(employee_id), �̸�(first_name), �μ���(department_name), 
�Ŵ���(manager)�� �̸�(first_name)�� ��ȸ�ϼ���
�μ��� ���� ���� Kimberely) �� ǥ���մϴ�
(106��)
*/
SELECT emp.employee_id ���,
    emp.first_name �̸�,
    dept.department_name �μ���,
    man.first_name "�Ŵ��� �̸�"
FROM employees emp, employees man, departments dept
WHERE emp.department_id = dept.department_id(+) AND -- LEFT OUTER
    emp.manager_id = man.employee_id;