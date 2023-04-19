select *
from employees
where salary = (
    select min(salary)
    from employees
);

-- subcerere corelata => intai cea din afara (slow)
-- subcererere necorelata in FROM => inline-view (fast)
-- subcerere necorelata in WHERE=> intai cea dinauntru (fast)

-- sincronizat <==> corelat

-- cand vrei sa faci count faci
-- a) count(*)
-- b) count(employee_id)
-- niciodata count(department_id)

-- nicio functie de agregare nu ia in considerare NULL values

select d.department_name as "Nume Departament", l.city as "Oras", count(*) as "Numar Angajati", round(avg(e.salary)) as "Salariu Mediu"
from employees e, departments d, locations l
where 
    e.department_id = d.department_id and 
    d.location_id = l.location_id
group by d.department_id, d.department_name, l.city, d.location_id;


select department_name, city, nr_ang, sal_mediu, aux.dept_id
from locations l, departments d, (
    select department_id dept_id, count(*) nr_ang, round(avg(salary)) sal_mediu --- trebuie sa pune alias pt coloanele cu fct de agregare
    from employees
    group by department_id
    ) aux
where l.location_id = d.location_id
and aux.dept_id = d.department_id;