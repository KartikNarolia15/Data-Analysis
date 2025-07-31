use myntra;

select * from data;

select brand_name, rating from data where rating > (select avg(rating) from data);

select product_name, rating, (select avg(rating) from data) 
from data; 

select brand_name, (select sum(rating_count) from data where brand_name = p.brand_name)
from (select distinct brand_name from data) as p limit 100 ;

-- same using group by function
select brand_name, sum(rating_count) as total
from data
group by brand_name;