-- DECODE(exp, exp1, R1, exp2, R2, R3)
-- verifica daca exp == exp1, daca da face R1
-- daca nu verifica exp == exp2, daca da face R2
-- daca niciuna nu merge face R3

select job_id, sum(salary)
from employees
group by job_id;

select job_id, nvl(sum(decode(department_id, 30, salary)), 0)
from employees
group by job_id;

-- Cererea externa creeaza o linie candidat
-- Cererea interna verifica fiecare linie cu cea candidat
-- Deci, se executa prima cererea si apoi subcererea
-- Concluzia, a doua subcerere depinde de prima

select last_name, salary, department_id
from employees e
where salary > (
    select avg(salary)
    from employees
    where department_id = e.department_id
);


select last_name, salary, department_id, 
    (
        select round(avg(salary))
        from employees
        where department_id = e.department_id
    ) "Media", 
    (
        select department_name
        from departments
        where department_id = e.department_id
    ) "Nume Departament",
    (
        select count(*)
        from employees
        where department_id = e.department_id
    ) "Numar Angajati"
from employees e
where salary > (
    select avg(salary)
    from employees
    where department_id = e.department_id
);

select *
from employees;


select 
    first_name || ' ' || last_name "Nume",
    salary, 
    department_id
from employees e
where (e.department_id, e.salary) in (
    select department_id, min(salary)
    from employees
    group by department_id
);

-- subcerere necorelata
select 
    first_name || ' ' || last_name "Nume",
    salary, 
    department_id
from employees e
where (e.department_id, e.salary) in (
    select department_id, min(salary)
    from employees
    group by department_id
);

select 
    first_name || ' ' || last_name "Nume",
    salary, 
    e.department_id
from employees e,
    (
        select department_id, min(salary) min_salary
        from employees
        group by department_id
    ) aux
where
    e.department_id = aux.department_id and
    e.salary = aux.min_salary;

with
dept_min_sal as
(
    select min(salary) as sal, department_id
    from employees
    group by department_id
)

-- Subcererile nesincronizate se executa independent
-- Ele se executa primele si sunt folosite de cererea parinte

-- where > all () toate
-- where > any () macar unul


-- WHERE EXISTS ()
-- Locatiile in care exista cel putin un departament
select l.location_id, l.city
from locations l
where exists 
    (
        select 'x', 
        from departments d
        where d.location_id = l.location_id
    );


-- Operatorul de WHERE EXISTS () poate fi inlocuit cu IN

select 
    first_name || ' ' || last_name "Nume",
    e.department_id
from employees e,
    (
        select max(salary) max_salary
        from employees
        where department_id = 30
    ) aux
where 
    exists 
    (
        select 'x'
        from employees 
        where 
            salary = aux.max_salary and 
            department_id = e.department_id
    );

