use myntra;

-- subquery
select * from data
where discounted_price = (select min(discounted_price) from data) ;

select * from data
where discounted_price > (select avg(discounted_price) from data) ;

-- no of products whose price is greater than average price
select count(*) from data
where discounted_price > (select avg(discounted_price) from data) ;

-- no of tshirts whose price is greater than average price of tshirt
select count(product_name) from data 
where discounted_price > (select avg(discounted_price) from data 
						  where product_tag = 'tshirts') and product_tag = 'tshirts' ;

select count(product_name) from data 
where product_tag = 'tshirts' and discounted_price > (select avg(discounted_price) from data 
													  where product_tag = 'tshirts')  ;
 
 
 