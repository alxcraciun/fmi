select * 
from INFORMATION_SCHEMA.COLUMNS
where upper(TABLE_NAME) = 'EMPLOYEES';


-- Exercitiul 2
select initcap(first_name), upper(last_name),  length(last_name)
from employees
where 
    last_name like upper('J%') or 
    last_name like upper('M%') or 
    last_name like upper('__A%');


-- Exercitiul 3
select last_name, last_name, employee_id, department_id
from employees
where initcap(trim(both ' ' from first_name)) = 'Steven';


--- Exercitiul 4
select employee_id, last_name, first_name, length(last_name), instr(lower(last_name), 'a')
from employees
where substr(lower);

-- sysdate nu are delay
-- e o variabila care se seteaza cand fac query-ul


-- Exercitiul 5



-- Exercitiul 6
select 
    job_id, 
    last_name || first_name as "Nume", 
    salary, 
    round(salary * 115/100, 2) as "Salariu nou"
from employees;

-- Exercitiul 7



-- Exercitiul 8


/*

cand dai insert la date

trigger

- inainte de insert
- dupa insertul respectiv

*/