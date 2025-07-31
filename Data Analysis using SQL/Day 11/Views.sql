use swiggy;

select * from restaurants;

drop view if exists my_view;

create view my_view as (
select name, city, rating, rating_count as 'orders', 
cuisine, cost*rating_count as 'revenue' from restaurants);

select * from my_view;

create view user_view as (
select name, city, rating, rating_count as 'orders', 
cuisine from restaurants);

select * from user_view;

create view sweets_view as (
select name, city, rating, rating_count as 'orders', 
cuisine from restaurants where cuisine = 'Sweets');

select * from sweets_view;

drop view if exists top_100;

create view top_100 as (
select name, city, rating, rating_count as 'orders', cost*rating_count as 'revenue',
cuisine from restaurants order by cost*rating_count desc limit 100);

select * from top_100;

create view atleast_100 as (
select name, city, rating, rating_count as 'orders',
cuisine from restaurants where rating_count >= 100);

select * from atleast_100;






