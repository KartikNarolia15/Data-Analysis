create database if not exists apple;
use apple;

create table if not exists customers (
   user_id int,
   user_name varchar(15),
   phone_number int,
   email_id varchar(20)
);

select * from customers;

# Add Column
alter table customers add new_column int;

# Modify Column
alter table customers modify new_column varchar(10);

# Rename Column
alter table customers rename column new_column to brand_new_column;

# Drop Column
alter table customers drop column brand_new_column;

# Rename Table
rename table customers to customers_table;
