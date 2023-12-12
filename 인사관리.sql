SELECT last_name, job_id, salary
FROM employees
WHERE salary = (SELECT MIN(salary)
FROM employees);

SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (SELECT MIN(salary)
FROM employees
WHERE department_id = 50);

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY(SELECT salary
FROM employees
WHERE job_id = 'IT_PROG')
AND job_id<>'IT_PROG';

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL(SELECT salary
FROM employees
WHERE job_id = 'IT_PROG')
AND job_id<>'IT_PROG';

SELECT employee_id, manager_id, department_id
FROM empl_demo
WHERE (manager_id, department_id) IN
                    (SELECT manager_id, department_id
                    FROM empl_demo
                    WHERE first_name = 'John')
AND first_name <> 'John';

SELECT employee_id, manager_id, department_id
FROM empl_demo
WHERE manager_id IN
                    (SELECT manager_id
                    FROM empl_demo
                    WHERE first_name = 'John')
AND department_id IN
                    (SELECT department_id
                    FROM empl_demo
                    WHERE first_name = 'John')
AND first_name <> 'John';

INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (370, 'Public Relations', 100, 1700);

SELECT *
FROM departments; 

INSERT INTO departments
VALUES (371, 'Public Relations', 100, 1700);

SELECT *
FROM departments; 

INSERT INTO departments (department_id, department_name)
VALUES (330, 'Purchasing');

INSERT INTO employees
VALUES (113, 'Louis', 'Popp', 'LPOPP', '515.124.4567',
        SYSDATE, 'AC_ACCOUNT', 6900, NULL, 205, 110);
        
SELECT *
FROM employees;

INSERT INTO employees
VALUES (114, 'Den', 'Raphealy', 'DRAPHEAL', '515.127.4561',
        TO_DATE('FEB 3, 1999', 'MON DD, YYYY'),
        'SA_REP', 11000, 0.2, 100, 60);

SELECT *
FROM employees;

INSERT INTO departments
VALUES (100, 'Finance', '', '');

SELECT *
FROM departments; 

INSERT INTO departments(department_id, department_name, location_id)
VALUES (&department_id, '&department_name', &location);

SELECT *
FROM departments; 

SELECT *
FROM copy_emp;

INSERT INTO sales_reps
SELECT employee_id, last_name, salary, commission_pct
  FROM employees
  WHERE job_id LIKE '%REP%';
  
  SELECT *
FROM sales_reps;

INSERT INTO copy_emp
SELECT *
FROM copy_emp;

INSERT INTO departments(department_id, department_name)
VALUES (120, 'Yedam');

SELECT *
FROM departments;

INSERT INTO departments(department_id, department_name, manager_id)
VALUES (130, 'YD', 100);

UPDATE employees
SET department_id = 50
WHERE employee_id = 113;

SELECT *
FROM employees;

UPDATE copy_emp
SET department_id = 110;

SELECT *
FROM copy_emp;

UPDATE employees
SET job_id = 'IT_PROG', commission_pct= NULL
WHERE employee_id =114;

SELECT *
FROM employees;

ROLLBACK;

SELECT *
FROM copy_emp;

INSERT INTO copy_emp
SELECT *
FROM employees;

SELECT *
FROM copy_emp;

COMMIT;

DELETE copy_emp;

ROLLBACK;

SELECT *
FROM copy_emp;

DELETE FROM departments
WHERE department_name = 'Finance';

SELECT *
FROM departments;

DELETE departments
WHERE department_id IN (30, 40);

SELECT *
FROM departments;

ROLLBACK;


SELECT *
FROM copy_emp;

DELETE copy_emp;

ROLLBACK;

TRUNCATE TABLE copy_emp;

SELECT *
FROM copy_emp;

ROLLBACK;
   
 --  1. 다음과 같이 실습에 사용할 MY_EMPLOYEE 테이블을 생성하시오.
CREATE TABLE my_employee
  (id         NUMBER(4) NOT NULL,
   last_name  VARCHAR2(25),
   first_name VARCHAR2(25),
   userid     VARCHAR2(8),
   salary     NUMBER(9,2));

--2. MY_EMPLOYEE 테이블의 구조를 표시하여 열 이름을 식별하시오.
SELECT *
FROM my_employee;

--3. 다음 예제 데이터를 MY_EMPLOYEE 테이블에 추가하시오.
INSERT INTO my_employee
VALUES (1, 'Pastel', 'Ralph', 'Rpatel', 895);

INSERT INTO my_employee
VALUES (2, 'Dancs', 'Betty', 'Bdancs', 860);

INSERT INTO my_employee
VALUES (3, 'Biri', 'Ben', 'Bbiri', 1100);

--4. 테이블에 추가한 항목을 확인하시오.
SELECT *
FROM my_employee;

--6. 사원 3의 성을 Drexler로 변경하시오.
UPDATE my_employee
SET last_name = 'Drexler'
WHERE id = 3;

--7. 급여가 900 미만인 모든 사원의 급여를 1000으로 변경하고 테이블의 변경 내용을 확인하시오.
UPDATE my_employee
SET salary = 1000
WHERE salary < 900;

SELECT *
FROM my_employee;

--8. MY_EMPLOYEE 테이블에서 사원 3을 삭제하고 테이블의 변경 내용을 확인하시오.
DELETE my_employee
WHERE id = 3;

SELECT *
FROM my_employee;

--11. 테이블의 내용을 모두 삭제하고 테이블 내용이 비어 있는지 확인하시오.
DELETE my_employee;

SELECT *
FROM my_employee;

COMMIT;

UPDATE employees
SET salary = 99999
WHERE employee_id = 176;

TRUNCATE TABLE aa;

SELECT *
FROM employees
where employee_id = 176;

commit;

SELECT table_name
From user_tables;

SELECT DISTINCT object_type
FROM user_objects;

SELECT *
FROM user_catalog;

CREATE TABLE hire_dates
    (id number(8),
    hire_date    DATE DEFAULT SYSDATE);
    
INSERT INTO hire_dates(id)
VALUES (35);

SELECT *
FROM hire_dates;

INSERT INTO hire_dates
VALUES (45, NULL);

CREATE TABLE dept
        (deptno NUMBER(2),
        dname VARCHAR2(14),
        loc VARCHAR2(13),
        create_date DATE DEFAULT SYSDATE);

SELECT *
FROM dept;
        
select table_name 
from user_tables;

CREATE TABLE dept80
AS
    SELECT employee_id, last_name,
            salary*12 ANNSAL,
            hire_date
    FROM employees
    WHERE department_id =80;
    
SELECT *
FROM dept80;

SELECT *
FROM employees;

ALTER TABLE dept80
ADD         (job_id VARCHAR2(9));

SELECT *
FROM dept80;

ALTER TABLE dept80
ADD         (hdate DATE DEFAULT SYSDATE);

ALTER TABLE dept80
MODIFY      (last_name VARCHAR2(30));

ALTER TABLE dept80
MODIFY       (last_name NUMBER(15));

ALTER TABLE dept80
DROP (job_id);

SELECT *
FROM dept80;

ALTER TABLE dept80
SET UNUSED (last_name);

SELECT *
FROM dept80;

ALTER table dept80
DROP UNUSED COLUMNS;

SELECT *
FROM dept80;

DROP TABLE dept80;

SELECT object_name, original_name, type
From user_recyclebin;

FLASHBACK TABLE dept80 TO BEFORE DROP;

SELECT *
FROM dept80;

DROP TABLE dept80 PURGE;

RENAME dept TO dept80;

TRUNCATE TABLE dept80;

