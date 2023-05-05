-- MIN() se aplica peste o coloana, nu o subcerere
select d.department_id, d.department_name, round(avg(e.salary), 2)
from employees e, departments d
where e.department_id = d.department_id
group by d.department_id, d.department_name
having round(avg(e.salary), 2) = (
    select max(round(avg(e.salary), 2))
    from employees e, departments d
    where e.department_id = d.department_id
    group by d.department_id, d.department_name
    )


-- creeaza un inline-view


-- cel mai mic salariu din departamentul care are cel mai mare salariu mediu
select *
from employees e
where (department_id, e.salary) = ( select d.department_id, min(e.salary)
                                    from employees e, departments d
                                    where e.department_id = d.department_id
                                    group by d.department_id, d.department_name
                                    having round(avg(e.salary), 2) = (  select max(round(avg(e.salary), 2))
                                                                        from employees e, departments d
                                                                        where e.department_id = d.department_id
                                                                        group by d.department_id, d.department_name
                                                                        )
);

select *
from employees e, departments d
where e.department_id = d.department_id and
    lower(d.department_name) like 'executive'
order by salary asc;

select *
from departments;

select *
from employees;


select count(*)
from employees e, departments d
where e.department_id = d.department_id
having 


select count(d.department_id)
from employees e, departments d
where e.department_id = d.department_id
group by d.department_id, d.department_name
having e.department_id in (

);


select d.department_id
from employees e, departments d
where e.department_id = d.department_id
group by d.department_id, d.department_name
having count(*) < 4;

select *
from departments;