use myntra;

select * from data;

-- how many brands are associated 
select count(distinct brand_name) from data;

select count(*) from data where product_tag = 'tshirts' ;

select count(*) from data 
where product_tag = 'tshirts' and discounted_price < 2000 ;

select count(distinct brand_name) from data where product_tag = 'tshirts' ;

select count(distinct product_tag) from data where brand_name = 'H&M' ;

select distinct(product_name), rating from data 
where brand_name = 'GUESS' and rating_count > 0 
order by rating asc limit 5 ;

select sum(rating_count) from data where brand_name = 'levis' ;

-- select distinct(brand_name), rating_count from data order by rating_count desc limit 5 ;

select product_tag, sum(rating_count * discounted_price) as revenue
from data
where product_tag in ('tshirts' , 'shirts')
group by product_tag
order by revenue desc ;

select brand_name, sum(rating_count) as purchases
from data
group by brand_name
order by purchases desc limit 5 ;

select product_tag, sum(rating_count) as purchases
from data
group by product_tag
order by purchases desc limit 5 ; 

select brand_name, count(distinct product_tag) as cnt
from data
group by brand_name ; 

select product_tag, sum(rating_count) as purchases
from data
group by product_tag ; 

select brand_name, sum(rating_count * discounted_price) as revenue
from data
where brand_name in ('nike' , 'adidas' , 'puma')
group by brand_name
order by revenue desc; 

select brand_name, sum(rating_count * discounted_price) as revenue
from data
group by brand_name
order by revenue desc limit 10 ;

select product_tag, sum(rating_count * discounted_price) as revenue
from data
group by product_tag
order by revenue desc limit 5 ;  

-- nike tshirts between 2000-3000
select * from data 
where brand_name = 'nike' and product_tag = 'tshirts' and discounted_price between 2000 and 3000 ;

-- tshirts between 2000-3000 from either nike or adidas
select * from data 
where brand_name in ('nike','adidas') and product_tag = 'tshirts' and discounted_price between 2000 and 3000 ;

select distinct * from data  
where brand_tag = 'adidas' and discounted_price > 3000 and discounted_price < 5000;

select distinct product_name from data  
where brand_name not in ('adidas','puma') and (discounted_price between 5000 and  8000) ;

-- Finding the number of brands serves on myntra
select count(distinct brand_name) as 'total brands' 
from data;

-- Finding the number of categories nike serves
select count(distinct product_tag) as 'total categories' from data where brand_name = 'nike' ;

