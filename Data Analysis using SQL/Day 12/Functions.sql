use swiggy;
DROP TABLE IF EXISTS messy_indian_dataset;

CREATE TABLE IF NOT EXISTS messy_indian_dataset (
    id INT,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    purchase_amount DECIMAL(10, 2),
    purchase_date DATE
);

-- Insert messy data into the table for Indian users
INSERT INTO messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) VALUES
(1, 'Rajesh Patel', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05'),
(2, 'Priya Sharma', 25, 'Female', 'priya@example.com', '9876543211', 'Delhi', 'Delhi', NULL, '2023-02-15'),
(3, 'Amit Kumar', 35, 'Male', 'amit@example.com', '9876543212', 'Bangalore', 'Karnataka', 750.25, '2023-03-25'),
(4, 'Ritu Singh', 28, 'Female', NULL, '9876543213', 'Kolkata', 'West Bengal', 1200.75, '2023-04-10'),
(5, 'Rajesh Patel', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05'),
(6, 'Priya Sharma', 25, 'Female', 'priya@example.com', '9876543211', 'Delhi', 'Delhi', 800.00, '2023-02-15'),
(7, 'Amit Kumar', NULL, 'Male', 'amit@example.com', NULL, 'Bangalore', 'Karnataka', 750.25, '2023-03-25'),
(8, 'Ritu Singh', 28, 'Female', 'ritu@example.com', '9876543213', 'Kolkata', 'West Bengal', 1200.75, '2023-04-10'),
(9, 'Ankit Tiwari', 32, 'Male', 'ankit@example.com', '9876543214', 'Lucknow', 'Uttar Pradesh', 900.00, '2023-05-20'),
(10, 'Swati Gupta', 27, 'Female', 'swati@example.com', '9876543215', 'Jaipur', 'Rajasthan', 1500.00, NULL);

select * from messy_indian_dataset;

drop function if exists calculateAge;
delimiter //
create function calculateAge(birthdate date) returns int
deterministic
begin
	declare age int;
    set age = year(curdate()) - year(birthdate);
    return age;
end; //
delimiter ;    

select calculateAge('2002-04-15') as age;

drop function if exists calculateSI;
delimiter //
create function calculateSI(p int, r int, t int) returns int
deterministic
begin
	declare SI int;
    set SI = (p*r*t)/100;
    return SI;
end; //
delimiter ;    

select calculateSI(10000,9,2) as SI;

drop function if exists CalculateTax;
delimiter //
create function CalculateTax(amount DECIMAL(10,2), tax_rate DECIMAL(5,2)) RETURNS DECIMAL(10,2)
deterministic
begin 
	declare tax decimal(10,2);
    set tax = amount * (tax_rate / 100);
    return tax;
end //
delimiter ;

select CalculateTax(1000.15,18) as tax_amount;

drop function if exists GetAgeCategory;
delimiter //
create function GetAgeCategory(age INT) RETURNS VARCHAR(20)
deterministic
begin 
	declare category varchar(20);
    if age < 18 then
		set category = 'child';
	elseif age between 18 and 65 then
		set category = 'adult';
	else
		set category = 'senior';
	end if;
    
    return category;
end //
delimiter ;

select GetAgeCategory(19) as category;








