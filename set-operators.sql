CREATE TABLE customer1 (
    cust_id NUMBER(10) NOT NULL,
    cust_name VARCHAR2(50) NOT NULL,
    mobile NUMBER(10) NOT NULL,
    city VARCHAR(50) NOT NULL
);

INSERT INTO customer1 VALUES(100001, 'Arun', 09090909, 'Chennai');
INSERT INTO customer1 VALUES(100002, 'Bala', 82828282, 'Hyd');
INSERT INTO customer1 VALUES(100003, 'Rakesh', 5757575, 'Chennai');
INSERT INTO customer1 VALUES(100001, 'Arun', 41414141, 'Chennai');

commit;

SELECT * FROM customer1;

CREATE TABLE customer2 (
    cust_id NUMBER(10) NOT NULL,
    cust_name VARCHAR2(50) NOT NULL,
    phone NUMBER(10) NOT NULL,
    city VARCHAR(50) NOT NULL
);

INSERT INTO customer2 VALUES(100001, 'Arun', 09090909, 'Chennai');
INSERT INTO customer2 VALUES(100004, 'John', 82828282, 'Hyd');
INSERT INTO customer2 VALUES(100003, 'Rakesh', 5757575, 'Chennai');
INSERT INTO customer2 VALUES(100005, 'Sanjay', 41414141, 'Pune');

commit;

SELECT * FROM customer2;

CREATE TABLE emp_union_1 AS SELECT employee_id, first_name, last_name,email,phone_number,
salary, department_id FROM employees WHERE salary > 12000;

CREATE TABLE emp_union_2 AS SELECT employee_id, first_name, email, phone_number,
salary, department_id FROM employees WHERE salary > 15000;

SELECT * FROM emp_union_1

UNION 

SELECT * FROM emp_union_2;

--ORA-01789: в блоке запроса неверное число столбцов результата
--01789. 00000 -  "query block has incorrect number of result columns"

SELECT employee_id, first_name, email, phone_number, salary, department_id
FROM emp_union_1

UNION

SELECT employee_id, first_name, email, phone_number, salary, department_id
FROM emp_union_2;


SELECT employee_id, first_name, email, phone_number, salary, department_id
FROM emp_union_1

UNION ALL

SELECT employee_id, first_name, email, phone_number, salary, department_id
FROM emp_union_2;

SELECT employee_id, first_name, email, phone_number, salary, department_id
FROM emp_union_1

INTERSECT

SELECT employee_id, first_name, email, phone_number, salary, department_id
FROM emp_union_2;

SELECT employee_id, first_name, email, phone_number, salary, department_id
FROM emp_union_1

MINUS

SELECT employee_id, first_name, email, phone_number, salary, department_id
FROM emp_union_2;

SELECT employee_id, first_name, email, phone_number, salary, department_id
FROM emp_union_2

MINUS

SELECT employee_id, first_name, email, phone_number, salary, department_id
FROM emp_union_1;
