----------
-- JOIN
----------

DESC employees;
DESC department;

-- �몢 �뀒�씠釉붾줈遺��꽣 紐⑤뱺 �뜲�씠�꽣瑜� 遺덈윭�삱 寃쎌슦
-- CROSS JOIN : 移대뵒�쟾 �봽濡쒕뜒�듃
-- �몢 �뀒�씠釉붿쓽 議고빀 媛��뒫�븳 紐⑤뱺 �젅肄붾뱶�쓽 �뙇
SELECT employees.employee_id, employees.department_id,
    departments.department_id, departments.department_name
FROM employees, departments
ORDER BY employees.employee_id;

-- �씪諛섏쟻�쑝濡쒕뒗 �씠�윴 寃곌낵瑜� �썝�븯吏� �븡�쓣 寃�
-- 泥� 踰덉㎏ �뀒�씠釉붿쓽 department_id �젙蹂댁� �몢 踰덉㎏ �뀒�씠釉붿쓽 department_id瑜� �씪移�
SELECT employees.employee_id, employees.first_name, employees.department_id,
    departments.department_id, departments.department_name
FROM employees, departments 
WHERE employees.department_id = departments.department_id;  --  �몢 �뀒�씠釉붿쓽 �뿰寃� �젙蹂� 議곌굔�쓣 遺��뿬
--  INNER JOIN, Equi JOIN

--  而щ읆紐낆쓽 紐⑦샇�꽦�쓣 �뵾�븯湲� �쐞�빐 �뀒�씠釉붾챸.而щ읆紐�
--  �뀒�씠釉붿뿉 蹂꾨챸(alias)瑜� 遺숈뿬二쇰㈃ �렪由�
SELECT employee_id, first_name, -- 而щ읆 紐낆씠 �냼�냽�씠 紐낇솗�븯硫� �뀒�씠釉� 紐낆� 紐낆떆�븯吏� �븡�븘�룄 �맂�떎
    emp.department_id,
    dept.department_id,
    department_name
FROM employees emp, departments dept    --  蹂꾩묶�쓣 遺��뿬�븳 �뀒�씠釉붿쓽 紐⑸줉
WHERE emp.department_id = dept.department_id;


----------
--  INNER JOIN: Simple Join
----------
SELECT *FROM employees; --  107紐�

SELECT first_name,
    emp.department_id,
    dept.department_id,
    department_name
FROM employees emp, departments dept -- �뀒�씠釉� 蹂꾩묶
WHERE emp.department_id = dept.department_id;   --  106

--  JOIN �릺吏� �븡�� �궗�엺�� �늻援ъ씤媛�?
--  遺��꽌�뿉 諛곗냽�릺吏� �븡�� �궗�썝
SELECT first_name, department_id
FROM employees
WHERE department_id is null;

SELECT first_name,
    department_id,
    department_name
FROM employees JOIN departments
                    USING (department_id);  --  JOIN�븷 而щ읆�쓣 紐낆떆
                    
--  JOIN ON
SELECT first_name,
    emp.department_id,
    department_name
FROM employees emp JOIN departments dept
                ON (emp.department_id = dept.department_id); -- ON -> JOIN 臾몄쓽 WHERE �젅
                
--  Natural Join
--  �몢 �뀒�씠釉붿뿉 議곗씤�쓣 �븷 �닔 �엳�뒗 怨듯넻 �븘�뱶媛� �엳�쓣 寃쎌슦( 怨듯넻 �븘�뱶媛� 紐낇솗�븷 �븣)
SELECT first_name, department_id, department_name
FROM employees NATURAL JOIN departments;


----------
-- Theta JOIN
----------
-- �엫�쓽�쓽 議곌굔�쓣 �궗�슜�븯�릺 JOIN 議곌굔�씠 = 議곌굔�씠 �븘�땶 寃쎌슦�쓽 議곗씤
SELECT * FROM jobs WHERE job_id='AD_ASST';  -- min: 3000, max: 6000
SELECT first_name, salary FROM employees emp, jobs j
WHERE j.job_id='AD_ASST' AND
    salary BETWEEN j.min_salary AND j.max_salary; 
    
    
----------
-- OUTER JOIN
----------
/*
議곌굔 留뚯”�븯�뒗 吏앹씠 �뾾�뒗 �뒠�뵆�룄 NULL�쓣 �룷�븿�빐�꽌 異쒕젰�뿉 李몄뿬�떆�궎�뒗 JOIN
紐⑤뱺 �젅肄붾뱶瑜� 異쒕젰�븷 �뀒�씠釉붿쓽 �쐞移섏뿉 �뵲�씪�꽌 LEFT, RIGHT, FULL OUTER JOIN�쑝濡� 援щ텇
ORACLE�쓽 寃쎌슦, null�씠 異쒕젰�릺�뒗 議곌굔履쎌뿉 (+)
*/
--  INNER JOIN 李멸퀬 - 106
--  LEFT OUTER JOIN: ORACLE ver
SELECT first_name,
    emp.department_id,
    dept.department_id,
    department_name
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id (+); -- LEFT OUTER JOIN

--  LEFT OUTER JOIN: ANSI SQL
SELECT first_name,
    emp.department_id,
    dept.department_id,
    department_name
FROM employees emp LEFT OUTER JOIN departments dept -- emp �뀒�씠釉붿쓽 紐⑤뱺 �젅肄붾뱶�뒗 異쒕젰�뿉 李몄뿬
                    ON emp.department_id = dept.department_id;
                    

--  RIGHT OUTER JOIN: Oracle
SELECT first_name,
    emp.department_id,
    dept.department_id,
    department_name
FROM employees emp, departments dept
WHERE emp.department_id (+) = dept.department_id;   --  departments �뀒�씠釉붿쓽 紐⑤뱺 寃곌낵瑜� 異쒕젰

--  RIGHT OUTER JOIN: ANSI SQL
SELECT first_name,
    emp.department_id,
    dept.department_id,
    department_name
FROM employees emp RIGHT OUTER JOIN departments dept
                    ON emp.department_id = dept.department_id;
                    

-- FULL OUTER JOIN: �뼇履� �뀒�씠釉� 紐⑤몢 異쒕젰�뿉 李몄뿬
/*
SELECT first_name,
    emp.department_id,
    dept.department_id,
    department_name
FROM employees emp, department dept
WHERE emp.department_id (+) = dept.department_id (+); -- FULL OUTER JOIN�� 遺덇�
*/

SELECT first_name,
    emp.department_id,
    dept.department_id,
    department_name
FROM employees emp FULL OUTER JOIN departments dept
                    ON emp.department_id = dept.department_id;
                    
                    
--  SELF JOIN: �옄�떊�쓽 FK媛� �옄�떊�쓽 PK瑜� 李몄“�븯�뒗 諛⑹떇�쓽 JOIN
--  �옄�떊�쓣 �몢 踰� �샇異쒗븯誘�濡� Alias �궗�슜�븷 �닔 諛뽰뿉 �뾾�뒗 JOIN
SELECT emp.employee_id, emp.first_name, -- �궗�썝 �젙蹂�
    emp.manager_id,
    man.first_name
FROM employees emp, employees man
WHERE emp.manager_id = man.employee_id;

-- ANSI SQL
SELECT emp.employee_id, emp.first_name,
    emp.manager_id,
    man.first_name
FROM employees emp JOIN employees man
                    ON emp.manager_id = man.employee_id;
                    
                    
----------
-- Aggregation (吏묎퀎)
----------
-- �뿬�윭 媛쒖쓽 媛믪쓣 吏묎퀎�븯�뿬 �븯�굹�쓽 寃곌낵 媛믪쓣 �궛異�

-- count: 媛��닔 �꽭湲� �븿�닔
-- employees �뀒�씠釉붿� 紐� 媛쒖쓽 �젅肄붾뱶瑜� 媛�吏�怨� �엳�뒗媛�?
SELECT COUNT(*) FROM employees; -- *�뒗 �쟾泥� �젅肄붾뱶 移댁슫�듃瑜� 吏묎퀎 (�궡遺� 媛믪씠 null�씠 �엳�뼱�룄 吏묎퀎)
SELECT COUNT(commission_pct) FROM employees;    --  �듅�젙 而щ읆�쓣 紐낆떆�븯硫� null�씤 寃껋� 吏묎퀎�뿉�꽌 �젣�쇅
SELECT COUNT(*) FROM employees WHERE commission_pct is not null; -- �쐞�쓽 寃껉낵 媛숈� �쓽誘�

--  �빀怨� �븿�닔: SUM
--  湲됱뿬�쓽 珥� �빀?
SELECT SUM(salary) FROM employees;

--  �룊洹� �븿�닔: AVG
--  �룊洹� 湲됱뿬 �궛�젙
SELECT AVG(salary) FROM employees;

--  �궗�썝�뱾�씠 諛쏅뒗 �룊洹� 而ㅻ�몄뀡 鍮꾩쑉
SELECT AVG(commission_pct) FROM employees;  --  null �뜲�씠�꽣�뒗 吏묎퀎�뿉�꽌 諛곗젣
SELECT AVG(nvl(commission_pct, 0)) FROM employees;

--  null�씠 �룷�븿�맂 吏묎퀎�뒗 null 媛믪쓣 �룷�븿�븷 寃껋씤吏� �븘�땶吏�瑜� 寃곗젙�븯怨� 吏묎퀎

--  salary�쓽 理쒖넖媛�, 理쒕뙎媛�, �룊洹좉컪, 以묒븰媛�
SELECT MIN(salary), MAX(salary), AVG(salary), MEDIAN(salary)
FROM employees;

--  �쓷�엳 踰뷀븯�뒗 �삤瑜�
--  遺��꽌�쓽 �븘�씠�뵒, 湲됱뿬�쓽 �룊洹좎쓣 異쒕젰�븯怨좎옄
SELECT department_id, AVG(salary) FROM employees;   --  Error

--  留뚯빟�뿉 遺��꽌蹂� �룊洹� �뿰遊됱쓣 援ы븯�젮硫�?
--  遺��꽌蹂� Group�쓣 吏��뼱以� �뜲�씠�꽣瑜� ���긽�쑝濡� 吏묎퀎 �븿�닔 �닔�뻾
SELECT department_id, ROUND (AVG(salary), 2)
FROM employees
GROUP BY department_id
ORDER BY department_id;

--  吏묎퀎 �븿�닔瑜� �궗�슜�븳 SELECT 而щ읆 紐⑸줉�뿉�뒗
--  吏묎퀎�뿉 李몄뿬�븳 �븘�뱶, 吏묎퀎�븿�닔留� �삱 �닔 �엳�떎

--  遺��꽌蹂� �룊洹� 湲됱뿬瑜� �궡由쇱감�닚�쑝濡� 異쒕젰
SELECT department_id, ROUND(AVG(salary), 2) sal_avg -- 蹂꾩묶 �궗�슜
FROM employees
GROUP BY department_id
ORDER BY sal_avg DESC;

--  遺��꽌蹂� �룊洹� 湲됱뿬瑜� �궛異� �룊洹� 湲됱뿬媛� 2000�씠�긽�씤 遺��꽌瑜� 異쒕젰
SELECT department_id, AVG(salary)
FROM employees
WHERE AVG(salary) >= 2000   --  �씠 �떆�젏�뿉�꽌�뒗 AVG(salary)媛� �닔�뻾�릺吏� �븡�� �긽�깭 -> �뾾�떎
GROUP BY department_id;
--  Error: 吏묎퀎 �옉�뾽�씠 �씪�뼱�굹湲� �쟾�뿉 WHERE �젅�씠 �떎�뻾�릺湲� �븣臾�

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id  --   洹몃９�븨
    HAVING AVG(salary) >= 7000  --  HAVING : Group by�뿉 議곌굔�쓣 遺��뿬�븷 �븣  �궗�슜
ORDER BY department_id;

-- ROLLUP
-- GROUP BY 절과 함께 사용
-- GROUP BY의 결과에 좀더 상세한 요약을 제공하는 기능 수행 (Item Subtotal)
-- 부서별 급여의 합계 추출(부서 아이디, job_id)
SELECT department_id,
    job_id,
    SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;

SELECT department_id,
    job_id,
    SUM(salary)
FROM employees
GROUP BY ROLLUP(department_id, job_id);


-- CUBE 함수
-- CrossTable에 대한 Summary를 함께 제공
-- Rollup 함수로 추출된 Subtotal에 
-- Column Total 값을 추출할 수 있다
SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY CUBE(department_id, job_id)
ORDER BY department_id;
