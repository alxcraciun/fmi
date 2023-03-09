select
    e.*,
    d.*
from
    employees   e
    join departments d
    on e.department_id = d.department_id;

select
    e.employee_id                      as "ID Employee",
    e.first_name || ' ' || e.last_name as "Nume",
    d.department_name,
    e.department_id,
    e.manager_id                       as "Managerul Direct",
    d.manager_id                       as "Managerul Departament"
from
    employees   e
    join departments d
    on e.department_id = d.department_id;

select
    e.employee_id                      as "ID Employee",
    e.first_name || ' ' || e.last_name as "Nume",
    d.department_name,
    e.department_id,
    e.manager_id                       as "Managerul Direct",
    d.manager_id                       as "Managerul Departament"
from
    employees   e
    join departments d
    on e.department_id = d.department_id;

select
    e.first_name || ' ' || e.last_name as "Nume",
    e.salary,
    job_title
from
    jobs        j
    join employees e
    on e.job_id = j.job_id join departments d
    on e.department_id = d.department_id
    join locations l
    on d.location_id = l.location_id join countries c
    on l.country_id = c.country_id
    join regions r
    on c.region_id = r.region_id
where
    e.manager_id = 100;

select
    e.first_name || ' ' || e.last_name as "Nume",
    e.salary,
    job_title
from
    jobs        j
    join employees e
    on e.job_id = j.job_id join departments d
    on e.department_id = d.department_id
    join locations l
    on d.location_id = l.location_id join countries c
    on l.country_id = c.country_id
    join regions r
    on c.region_id = r.region_id
where
    e.manager_id = 100;

-- JOIN ... USING departments_id
-- JOIN ... ON e.departments_id = d.departments_id
--! USING nu va merge cu *, nu mai trebuie prefixat d.department_id

select
    first_name || ' ' || last_name as "Nume",
    extract(month from hire_date) as "Luna Angajarii",
    extract(year from hire_date) as "Anul Angajarii",
    department_id
from
    employees
where
    department_id = (
        select
            department_id
        from
            employees
        where
            upper(last_name) = 'GATES'
    )
    and upper(last_name) != 'GATES'
    and lower(last_name) like '%a%';

-- afiseaza si cazurile in care e.department_id este null
select e.*, d.*
from departments d, employees e
where d.department_id = e.department_id(+)
order by d.department_id desc;


-- FULL / LEFT / RIGHT OUTERJOIN
-- nu merge sa pun (+) la ambele
-- pot folosi si UNION pt FULL OUTERJOIN

DESCRIBE employees;



-- in loc de extract() pot folosi to_char(e.hire_date, 'YYYY')
-- daca subcererea mea are mai multe rezultate folosesc IN