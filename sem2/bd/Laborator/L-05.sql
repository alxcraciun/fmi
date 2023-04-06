-- sterge un departament existent
drop table departamente_ong;


-- Exercitiul 15
-- commit automat 
create table departamente_cae
(
    cod_dep number(2),
    nume varchar2(15) constraint NL_nume_cae NOT NULL,
    cod_director number(4)
);

-- Exercitiul 16
insert into departamente_cae
values(10,	'Administrativ',	100);
insert into departamente_cae
values(20, 'Proiectare',	101);
insert into departamente_cae
values(30,	'Programare',	Null);

select * from departamente_cae;


-- Exercitiul 17
alter table departamente_cae
add constraint pk_depart_cae primary key (cod_dep); 

SELECT constraint_name, constraint_type, table_name
from user_constraints
where lower(table_name) in ('departamente_cae');

-- Exercitiul 18
create table ANGAJATI_cae
(
  cod_ang number(4) constraint pk_ang_cae primary key, 
  nume varchar2(20) constraint null_nume_cae not null, 
  prenume varchar2(20), 
  email char(15) constraint unq_email_cae unique, 
  data_ang date default sysdate, 
  job varchar2(10), 
  cod_sef number(4) constraint fk_ang_ang_cae references angajati_cae(cod_ang), 
  salariu number(8, 2),
  cod_dep number(2) constraint ck_cod_dep_cae check(cod_dep>0), 
  comision number(4,2),
  constraint unq_nume_pren_cae unique(nume, prenume),
  constraint ck_sal_com_cae check( salariu>comision *100),
  constraint fk_ang_depart_cae foreign key(cod_dep) references departamente_cae(cod_dep)--se poate punse si la nivel de coloana
);


SELECT constraint_name, constraint_type, table_name
FROM     user_constraints
WHERE  lower(table_name) IN ('angajati_cae');

COMMIT;

-- drop & truncate au COMMIT automat
-- drop sterge tabela
-- delete + commit = truncate

-- from user_constraints

-- CHIAR DACA NU A MERS INSERT-ul, SECVENTA TOT CRESTE
-- seq.nextval isi da singur COMMIT

/*
    CONSTRAINT TYPES:

    C =
    R = 
    U = 
    P = 
*/

select *
from angajati_cae;

select *
from departamente_cae;

insert into angajati_cae(Cod_ang, Nume ,Prenume, Email, Data_ang ,Job, Cod_sef, Salariu, Cod_dep)
values( 100 ,'Nume1', 'Prenume1', Null ,Null, 'Director', null, 20000 ,10);
insert into angajati_cae
values (101, 'Nume2', 'Prenume2', 'Nume2@gmail.com', to_date( '02-02-2004', 'dd-mm-yyyy'), 'Inginer', 100, 10000 ,10, 0.1);
insert into angajati_cae
values (102, 'Nume3', 'Prenume3', 'Nume3@gmail.com', to_date('05-06-2004', 'dd-mm-yyyy'), 'Analist', 101, 5000, 20, null);
insert into angajati_cae (Cod_ang, Nume, Prenume, Job, Cod_sef, Salariu, Cod_dep)
values (103, 'Nume4', 'Prenume4', 'Inginer', 100, 9000, 20);
--atentie la data de angajare a lui 103
insert into angajati_cae
values (104, 'Nume5', 'Prenume5', 'Nume5@gmail.com', Null, 'Analist', 101, 3000, 30, 0.2);

select * from angajati_cae;
commit;
rollback;

insert into angajati_cae(Cod_ang, Nume ,Prenume, Email, Data_ang ,Job, Cod_sef, Salariu, Cod_dep)
values( 200 ,'NumeX', 'PrenumeX', Null ,Null, 'Director', null, 20000 ,10);

select first_name || ' ' || last_name as "Nume", department_id, salary, commission_pct
from employees
where 
    (salary, commission_pct) in 
    (
        select e.salary, e.commission_pct
        from employees e 
            join departments d on e.department_id = d.department_id 
            join locations l on d.location_id = l.location_id
        where lower(l.city) = 'oxford' 
    )
order by salary, commission_pct;