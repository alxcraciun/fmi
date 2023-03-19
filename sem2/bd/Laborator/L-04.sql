-- fiecare locatie, toate departamentele, locatiile fara departamente

select *
from locations l left outer join departments d 
on l.location_id = d.location_id; 

-- if you want to add new rows, you need to use COMMIT; command

select *
from locations l left outer join departments d 
on l.location_id = d.location_id; 

select department_id "Cod departament"
from employees
where upper(job_id) = 'SA_REP';

union -- e important sa compari acelasi tip de date si aceleasi coloane

select department_id
from departments
where lower(department_name) like '%re%';

-- Sa se obtina codurile departamentelor in care nu lucreaza nimeni (MINUS)

select d.department_id -- toate departamentele
from departments d
minus
select e.department_id -- departamentele in care se lucreaza
from employees e;


-- Sa se obtina codurile departamentelor in care nu lucreaza nimeni (NOT IN)

select d.department_id
from departments d
where d.department_id not in (select UNIQUE department_id from employees e where e.department_id is not null);
-- am evitat cazul cu null ca altfel imi dadea null la toate

select d.department_id
from departments d
where lower(department_name) like '%re%'
intersect
select e.department_id
from employees e
where upper(job_id) like '%HR_REP%';


-- Ex 17
select last_name, salary
from employees
where manager_id = 
(
    select employee_id
    from employees
    where manager_id is null
);


-- Ex 20
select *
from employees
where salary > ANY 
(
    select salary
    from employees
    where upper(job_id) like '%CLERK%'
)
order by salary desc;

-- este ORDER BY nu sort