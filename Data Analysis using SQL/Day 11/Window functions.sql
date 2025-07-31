use swiggy;

select * from restaurants;

select *, round(avg(rating) over(),2) as 'avg rating',
          round(max(rating) over(),2) as 'max rating',
          round(min(rating) over(),2) as 'min rating' 
from restaurants;

select *, round(avg(cost) over(),0) as 'avg cost',
          round(max(cost) over(),0) as 'max cost',
          round(min(cost) over(),0) as 'min cost' 
from restaurants;

select *, 
round(avg(cost) over(partition by city)) as 'avg cost'
from restaurants;

select * from (select *, avg(cost) over() as 'avg_cost' from restaurants) as t
where t.cost > t.avg_cost ;

select * from (select *, avg(cost) over(partition by cuisine) as 'avg_cost' from restaurants) as t
where t.cost > t.avg_cost ;

select *, 
rank() over(order by cost desc) as 'rank' 
from restaurants;

select *, 
rank() over(partition by city order by cost desc) as 'rank' 
from restaurants;

select *, 
dense_rank() over(order by cost desc) as 'dense_rank' 
from restaurants;

select *, 
rank() over(order by cost desc) as 'rank',
dense_rank() over(order by cost desc) as 'dense_rank'
from restaurants;

select *, 
row_number() over(order by cost desc) as 'row_number'
from restaurants;

select *, 
row_number() over(partition by city order by cost desc) as 'row_number'
from restaurants;

select *, 
rank() over(order by cost desc) as 'rank',
dense_rank() over(order by cost desc) as 'dense_rank',
row_number() over(order by cost desc) as 'row_number'
from restaurants;

select *,
concat(city,' - ', row_number() over(partition by city order by cost desc)) as 'rank' 
from restaurants;

select * from
	(select *, cost*rating_count as 'revenue',
	row_number() over(partition by city order by cost*rating_count desc) as 'rank'
	from restaurants) as t
where t.rank < 6; 

select * from
	(select *, cost*rating_count as 'revenue',
	row_number() over(partition by cuisine order by cost*rating_count desc) as 'rank'
	from restaurants) as t
where t.rank < 6; 

select cuisine, sum(cost*rating_count) as 'revenue' from
(select *, cost*rating_count,
row_number() over(partition by cuisine order by cost*rating_count desc) as 'rank'
from restaurants) as t
where t.rank < 6
group by cuisine
order by revenue desc limit 5;

select count(*) from restaurants;

select sum(cost*rating_count) as 'total' from
(select *, cost*rating_count,
row_number() over(order by cost*rating_count desc) as 'rank'
from restaurants) as t
where t.rank <= 614;

with 
	q1 as  (select sum(cost*rating_count) as 'top_revenue' from
           (select *, cost*rating_count,
		   row_number() over(order by cost*rating_count desc) as 'rank'
           from restaurants) as t
           where t.rank <= 12280),
    q2 as  (select sum(cost*rating_count) as 'total_revenue' from restaurants)

select (top_revenue/total_revenue)*100 as 'revenue %' from q1,q2 ;  
