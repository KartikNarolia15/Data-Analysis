create database if not exists swiggy;
use swiggy;

select * from restaurants;

-- Which restaurant of abohar is visited by least number of people?
select name, city, rating_count from restaurants where city = "Abohar" 
and rating_count = (select min(rating_count) from restaurants where city = "Abohar") ;

-- Which restaurant has generated maximum revenue all over india?
select *, (rating_count*cost) as revenue from restaurants
where rating_count*cost = (select max(rating_count*cost) from restaurants) ;

-- How many restaurants are having rating more than the average rating?
select count(*) from restaurants 
where rating > (select avg(rating) from restaurants) ;

-- Which restaurant of Delhi has generated most revenue
select *, (rating_count*cost) as revenue from restaurants 
where city = "Delhi" 
and rating_count*cost = (select max(rating_count*cost) from restaurants where city = "Delhi") ;

-- Which restaurant of more than average cost of an restaurant in Delhi has generated most revenue
select *, (rating_count*cost) as revenue from restaurants 
where city = "Delhi" 
and rating_count*cost = (select max(rating_count*cost) from restaurants where city = "Delhi")
and cost > (select avg(cost) from restaurants where city = "Delhi") ;




