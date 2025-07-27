-- use the dummy database
use dummydb;

-- drop the employeedetails table if it already exists
drop table if exists employeedetails;

-- create the employeedetails table
create table if not exists employeedetails (
	id serial primary key,
    name varchar(20) not null,
    department varchar(20),
    salary int not null,
    joining timestamp default current_timestamp
);

-- insert sample records into employeedetails
insert into employeedetails (name, department, salary)
values
('A', 'Engineering', 100000),
('B', 'Management', 150000),
('C', 'Consulting', 200000);

-- select all records from the employeedetails table
select * from employeedetails;

-- drop the studentdetails table if it already exists
drop table if exists studentdetails;

-- create the studentdetails table
create table if not exists studentdetails (
	id serial primary key,
    name varchar(20) not null,
    stream varchar(20),
    status varchar(20),
    joining timestamp default current_timestamp
);

-- insert sample records into studentdetails
insert into studentdetails (name, status, stream)
values
('Ashish', 'Active', 'Science'),
('Badshah', 'NA', 'Commerce'),
('Chandoo', 'Active', 'Arts'),
('Mathew', 'Active', 'Medical'),
('Shahrukh', 'NA', 'Sports');

-- select all records from the studentdetails table
select * from studentdetails;
