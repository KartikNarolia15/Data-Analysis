use myntra;

select * from data;

select product_name as 'Product Name', brand_name as 'Brand Name'
from data;   

select marked_price, discounted_price, marked_price - discounted_price,
	   round((marked_price - discounted_price)/marked_price * 100,2) as 'Discount Percent'
from data;  

select count(*) from data;

select count(distinct brand_name) from data;

select count(distinct brand_name), count(distinct brand_tag) from data;

select distinct product_tag from data where brand_name = 'adidas' ;

select avg(marked_price), avg(discounted_price) 
from data where brand_name = 'adidas' and product_tag = 'sports-shoes' ;

