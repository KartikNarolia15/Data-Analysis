use myntra;

-- Finding the names of unique brands
select distinct brand_name from data ;

-- Finding the number of unique brands
select count(distinct brand_name) from data ;

-- Finding the number of products in each brands (doubt)
select brand_name, count(product_tag) as cnt
from data 
group by brand_name ; 

-- Finding the top 5 brand who has the most number of products | different product in their inventory
select brand_name, count(product_tag) as cnt
from data 
group by brand_name
order by cnt desc limit 5 ; 

-- Finding the top 5 brands who sold the most number of products
select brand_name, sum(rating_count) as products_sold
from data
group by brand_name
order by products_sold desc limit 5 ; 

-- Finding the top 5 most expensive brands based on their discounted price
select brand_name, round(avg(discounted_price),2) as average
from data
group by brand_name
order by average desc limit 5 ; 

-- Finding the top 5 least expensive brands based on their discounted price
select brand_name, round(avg(discounted_price),2) as average
from data
group by brand_name
order by average asc limit 5 ; 

-- Finding the top 10 best-selling product categories 
select product_tag, sum(rating_count) as people
from data
group by product_tag
order by people desc limit 10 ;

-- Finding the top 10 brands who gives maximum discount
select brand_name, round(avg(discount_percent),2) as discount
from data 
group by brand_name
order by discount desc limit 10 ;

-- Finding the top 5 most expensive product categories
select product_tag, round(avg(discounted_price),2) as price
from data
group by product_tag
order by price desc limit 5 ; 

-- Which category of any specific brand is sold the most?
select product_tag, sum(rating_count) as sold
from data
where brand_name = 'adidas'
group by product_tag
order by sold desc ;

select product_tag, sum(rating_count) as sold
from data
where brand_name = 'nike'
group by product_tag
order by sold desc ;

select product_tag, sum(rating_count) as sold
from data
where brand_name = 'puma'
group by product_tag
order by sold desc ;
