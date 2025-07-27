use dummydb;

drop table if exists people;

create table if not exists people (
    id serial primary key,
    first_name varchar(30),
    last_name varchar(30),
    age int,
    city varchar(30),
    country varchar(30)
);

insert into people 
(first_name, last_name, age, city, country) 
values
('aarav', 'sharma', 25, 'tokyo', 'japan'),
('vihaan', 'verma', 28, 'new york', 'usa'),
('saanvi', 'jain', 22, 'london', 'uk'),
('ananya', 'singh', 30, 'sydney', 'australia'),
('vivaan', 'gupta', 27, 'berlin', 'germany'),
('aisha', 'khan', 24, 'paris', 'france'),
('krishna', 'iyer', 35, 'moscow', 'russia'),
('meera', 'reddy', 29, 'toronto', 'canada'),
('arjun', 'nair', 31, 'singapore', 'singapore'),
('isha', 'joshi', 26, 'cape town', 'south africa'),
('ryan', 'fernandes', 33, 'dubai', 'uae'),
('zara', 'shaikh', 21, 'rome', 'italy'),
('rehan', 'siddiqui', 34, 'beijing', 'china'),
('priya', 'agrawal', 32, 'amsterdam', 'netherlands'),
('neel', 'desai', 29, 'zurich', 'switzerland'),
('tara', 'patel', 23, 'barcelona', 'spain'),
('dhruv', 'kapoor', 27, 'seoul', 'south korea'),
('naina', 'mehta', 26, 'auckland', 'new zealand'),
('kabir', 'bose', 30, 'stockholm', 'sweden'),
('riya', 'saxena', 25, 'lisbon', 'portugal');

set sql_safe_updates = 0;

-- delete all people older than 35
delete from people
where age > 35;

-- delete people from the country 'russia'
delete from people
where country = 'russia';

-- delete people living in 'dubai'
delete from people
where city = 'dubai';

-- delete person with first name 'zara'
delete from people
where first_name = 'zara';

-- delete people from cities starting with the letter 's'
delete from people
where city like 's%';

-- delete people from countries that contain the word 'united'
delete from people
where country like '%united%';

-- delete people whose age is less than 23
delete from people
where age < 23;

-- delete people whose last name is 'sharma' or 'verma'
delete from people
where last_name in ('sharma', 'verma');

-- delete people with missing city and country
delete from people
where city is null and country is null;

select * from people ;