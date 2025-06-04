use openai;

insert into users 
(user_id, name, mail, phone, dob, city, marital_status, sex)
values
("101", "Kartik", "kn@gmail.com", "1234567890", "2002-04-15", "Delhi", "Single", "Male"),
("102", "Viraaj", "vn@gmail.com", "1234567899", "2006-04-15", "Delhi", "Single", "Male"),
("103", "Katrina", "kan@gmail.com", "1234567898", "2000-04-15", "Pune", "Single", "Female"),
("104", "Kiara", "kin@gmail.com", "1234567897", "2002-04-18", "Mumbai", "Married", "Female"),
("105", "Kartike", "ken@gmail.com", "1234567896", "2002-08-15", "Bangalore", "Single", "Male");

select * from users;

update users
set name = "Kartike"
where user_id = "105" ;

update users
set name = "Arjun", mail = "arj@gmail.com"
where user_id = "105" ;

delete from users
where name = "Kiara" and mail = "kin@gmail.com" ;

CREATE TABLE user_1 (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    status VARCHAR(20)
);

INSERT INTO user_1 
(name, email, status) 
VALUES
('Alice Johnson', 'alice@example.com', 'active'),
('Bob Smith', 'bob@example.com', 'inactive'),
('Charlie Lee', 'charlie@example.com', 'active'),
('Diana Cruz', 'diana@example.com', 'inactive');

select * from user_1;
truncate table user_1;

select name, email
from user_1 ;

