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

insert into people (first_name, last_name, age, city, country)
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

-- update age by adding 1 year for all people below age 25
update people
set age = age + 1
where age < 25;

-- update city to 'melbourne' where city is 'sydney'
update people
set city = 'melbourne'
where city = 'sydney';

-- update country to 'united kingdom' where country is 'uk'
update people
set country = 'united kingdom'
where country = 'uk';

-- update last name to 'tanaka' for person with first_name = 'aarav'
update people
set last_name = 'tanaka'
where first_name = 'aarav';

-- update country to 'united states' where country = 'usa'
update people
set country = 'united states'
where country = 'usa';

-- view the updated people table
select * from people;
