use myntra;

-- Finding the most expensive product on myntra
select product_name, discounted_price from data
order by discounted_price desc limit 1;

-- Finding the least expensive product on myntra
select product_name, discounted_price from data
order by discounted_price asc limit 1;

-- Finding the top 5 most expensive product on myntra
select product_name, discounted_price from data
order by discounted_price desc limit 5;

-- Top 5 products based on best rating | rating*rating count
select product_name, rating, rating_count, round(rating*rating_count,2) as 'parameter' 
from data 
order by parameter desc limit 5;

-- Finding the second most expensive product
select product_name, discounted_price from data
order by discounted_price desc limit 1 offset 1 ;

-- Finding the second least expensive product
select product_name, discounted_price from data
order by discounted_price asc limit 1 offset 1 ;

-- Finding the 10th most expensive product
select product_name, discounted_price from data
order by discounted_price desc limit 1 offset 9 ;

 -- Finding the worst rated product by nike
select product_name, rating, rating_count, round(rating*rating_count) as 'comb_rating' 
from data 
where brand_name = 'nike' and rating_count > 0
order by comb_rating asc limit 1 ;

-- Finding the worst rated product by nike & rating is not zero
select product_name, rating from data
where brand_name = 'nike' and rating != 0 
order by rating asc limit 1 ;

-- Worst rated 10 products based on the rating of 100 people atleast
select product_name, rating from data
where rating != 0 and rating_count > 100
order by rating asc limit 10 ;

-- Sort the products in alphaetical descending order based on their product_name and show the last 10 of them
select product_name from data
order by product_name asc;

-- Finding the top 10 best rated tshirts from nike or adidas | rating*rating count
select product_name, rating, rating_count, round(rating*rating,2) as parameter from data
where brand_name in ('nike','adidas') and product_tag = 'tshirts'
order by parameter desc limit 10 ;

-- Finding the list of tshirts from nike and adidas prices between 1000 and 1200
-- Sort them based on ascending order of brand_name & price
select brand_name, product_name, discounted_price from data
where brand_name in ('nike','adidas') and product_tag = 'tshirts' 
	  and discounted_price between 1000 and 1200
order by brand_name, discounted_price asc ; 



