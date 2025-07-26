use dummydb;

create table if not exists students (
    student_id int auto_increment primary key,
    full_name varchar(100) not null,
    age int check (age >= 18),
    email varchar(100) unique,
    department varchar(50) default 'general'
);

insert into students (full_name, age, email, department) values
('alice sharma', 20, 'alice@example.com', 'computer science'),
('bob mehta', 22, 'bob@example.com', 'electronics'),
('charlie verma', 19, 'charlie@example.com', 'mechanical'),
('divya singh', 21, 'divya@example.com', 'computer science'),
('eshan tiwari', 23, 'eshan@example.com', null);

select * from students;

-- add a new column phone_number to the students table
alter table students
add column phone_number varchar(10);

-- drop the phone_number column from the students table
alter table students
drop column phone_number;

-- rename the column email to email_id
alter table students
rename column email to email_id;

-- add the phone_number column again with a default value
alter table students
add column phone_number varchar(10) default '1234567890';
