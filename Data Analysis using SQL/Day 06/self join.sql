create database new;
use new;

create table employees (
    employeeid int primary key,
    name varchar(50),
    managerid int
);

insert into employees (employeeid, name, managerid) values
(1, 'alice', null),
(2, 'bob', 1),
(3, 'charlie', 1),
(4, 'david', 2),
(5, 'eve', 2),
(6, 'frank', 3);

select * from employees ; 

-- self join
select e1.name as employee, e2.name as manager
from employees as e1
join employees as e2
on e1.managerid = e2.employeeID ;



