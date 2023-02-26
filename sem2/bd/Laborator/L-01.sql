-- Comentariu Scurt

/*
    Comentariu lung
    
    CTRL + Enter sa rulezi current statement
*/ 

/*
Name: AlexCraciun
User: grupa34
Password: grupa34

> SavePassword

Hostname: 193.226.51.46
Seed: o11g

> Test 
> Connect
*/

describe employees;

select *
from EMPLOYEES;

select employee_id, salary
from employees
where salary > 10000;


select employee_id, salary
from employees
where salary > 10000
order by salary desc; -- 15 rez

select employee_id, salary
from employees
where salary > 10000
order by salary desc; -- ordoneaza dupa coloana 2 (salariu)


describe employees;

select employee_id, salary as sal
from employees
where salary > 10000
order by sal desc; -- ordoneaza dupa coloana 2 (salariu)


-- Apostroafele simple la string
-- Ghilimelele DOAR la AS

select employee_id, first_name || ' ' || last_name, job_id, hire_date
from employees;


select employee_id, first_name || ' ' || last_name || ', ' || job_id as "Angajat si Titlu", hire_date
from employees;

select 1 + 2
from dual;

select sysdate
from dual;

select * from v$version;

select to_char(sysdate, 'DAY /MM/ YEAR')
from dual;

-- null e considerata cea mai mare valoare

select to_char(sysdate, 'DD/MM/YYYY HH24:MI')
from dual;


select first_name || ' ' || last_name, job_id, hire_date
from employees
where hire_date between '20-Feb-1987' and '1-May-1989';

select last_name, first_name, job_id, salary
from employees
where (lower(job_id) like lower('%clerK%') or lower(job_id) like ('%rep%'))
and salary not in (3200, 2700, 2500, 3100, 6200);

-- AND are prioritate mai mare decat OR






