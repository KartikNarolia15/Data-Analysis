create database myntra;
use myntra;

select * from data;

# how many brands associated 
select count(distinct brand_tag) from data;

# how many tshirts
select count(*) from data where product_tag = 'tshirts' ;

# tshirts under 2000
select count(distinct product_link) from data where product_tag = 'tshirts' and discounted_price < 2000;

# brands selling tshirts
select count(distinct brand_name) from data where product_tag = 'tshirts' ;

#categories h&m selling
select count(distinct product_tag) from data where brand_name = 'H&M' ;

#list top 5 tshirts of nike
select product_name, rating_count from data 
where brand_name = 'nike' and product_tag = 'tshirts'
order by rating_count desc limit 5;

#list top 5 worse rated products from guess
select product_name from data
where brand_name = 'GUESS' and rating_count > 0
order by rating asc limit 5;

-- select product_name from data order by rating_count;

#total levis products
select sum(rating_count) from data where brand_name = 'levis' ; 

#total tshirts sold
select sum(rating_count) from data where product_tag = 'tshirts' ;

#top 5 best selling brands
select brand_name, sum(rating_count) as 'products_sold'
from data
group by brand_name
order by products_sold desc limit 5;

select product_tag, sum(rating_count) as 'products_sold'
from data
group by product_tag
order by products_sold desc limit 5;

#tshirt or shirt have generated more revenue
select product_tag, sum(rating_count * discounted_price) as 'revenue'
from data
where product_tag in ('tshirts' , 'shirts')
group by product_tag
order by revenue desc ;