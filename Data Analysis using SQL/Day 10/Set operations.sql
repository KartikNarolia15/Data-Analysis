DROP DATABASE IF EXISTS users;
CREATE DATABASE users;
USE users;

CREATE TABLE IF NOT EXISTS users_2021  (UserID INT PRIMARY KEY, Name VARCHAR(50));
CREATE TABLE IF NOT EXISTS users_2022  (UserID INT PRIMARY KEY, Name VARCHAR(50));
CREATE TABLE IF NOT EXISTS users_2023  (UserID INT PRIMARY KEY, Name VARCHAR(50));

INSERT INTO users_2021 (UserID, Name) VALUES (1, 'Ashish'), (2, 'Laura'), (7, 'Prakash');
INSERT INTO users_2022 (UserID, Name) VALUES (1, 'Ashish'), (2, 'Laura'), (3, 'Charlie'), (4, 'Grace');
INSERT INTO users_2023 (UserID, Name) VALUES (1, 'Ashish'), (2, 'Laura'), (3, 'Charlie'), (4, 'Grace'), (5, 'Henry');

select * from users_2021;
select * from users_2022;
select * from users_2023;

-- union | remove duplicates
select * from users_2021 union select * from users_2022;
select * from users_2022 union select * from users_2021;
select * from users_2021 union select * from users_2023;
select * from users_2022 union select * from users_2023;
select * from users_2021 union select * from users_2022 union select * from users_2023;

-- union all | don't remove duplicates
select * from users_2021 union all select * from users_2022;
select * from users_2022 union all select * from users_2021;
select * from users_2021 union all select * from users_2023;
select * from users_2022 union all select * from users_2023;
select * from users_2021 union all select * from users_2022 union all select * from users_2023;
select * from users_2021 union all select * from users_2022 union select * from users_2023;
(select * from users_2021 union all select * from users_2022) union select * from users_2023;

-- except | show all the data of dominating table that is not there in other table
select * from users_2021 except select * from users_2022;
select * from users_2022 except select * from users_2021;
select * from users_2021 except select * from users_2023;
select * from users_2023 except select * from users_2021;
select * from users_2021 except select * from users_2022 except select * from users_2023;
select * from users_2023 except select * from users_2022 except select * from users_2021;

-- intersect | showing the common data
select * from users_2021 intersect select * from users_2022;
select * from users_2022 intersect select * from users_2023;
select * from users_2021 intersect select * from users_2023;
select * from users_2021 intersect select * from users_2022 intersect select * from users_2023;

-- 1. List the new users added in 2022
select * from users_2022 except select * from users_2021 ;

-- 2. List the users who left us
select * from users_2021 except select * from users_2022 except select * from users_2023 ;

-- 3. List all the users that are there throughout the database for year 2021 & 2022
select * from users_2021 union select * from users_2022 ;

-- 4. List all the users that are there throughout the database
select * from users_2021 union select * from users_2022 union select * from users_2023 ;

-- 5. List the users that are there with us from last 3 years
select * from users_2021 intersect select * from users_2022 intersect select * from users_2023 ;

-- 6. List the all the users except that users who are there with us from 3 years
select * from users_2021 union select * from users_2022 union select * from users_2023
except
select * from users_2021 intersect select * from users_2022 intersect select * from users_2023;


