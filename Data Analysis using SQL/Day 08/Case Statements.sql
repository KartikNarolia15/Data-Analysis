CREATE DATABASE IF NOT EXISTS DummyDB;
USE DummyDB;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees (name, department, salary) VALUES
('Alice', 'HR', 45000),
('Bob', 'Engineering', 85000),
('Charlie', 'Engineering', 65000),
('Diana', 'Sales', 50000),
('Ethan', 'HR', 40000),
('Fiona', 'Sales', 60000);


SELECT id, name, department, salary,
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_grade
FROM employees;


SELECT name, department,
    CASE department
        WHEN 'HR' THEN 'Support'
        WHEN 'Engineering' THEN 'Technical'
        WHEN 'Sales' THEN 'Client-Facing'
        ELSE 'Other'
    END AS role_category
FROM employees;


select name, salary,
	case
		when salary > 80000 then 'Good Salary'
        when salary between 50000 and 80000 then 'Avg Salary'
        else 'Low Salary'
    end as 'Salary Grade'
from employees;    


select name, department,
	case department
		when 'HR' then 'HR Dept'
        when 'Engineering' then 'R&D Dept'
        when 'Sales' then 'Sales Dept'
        else 'Others'
	end as 'Department Type'
from employees;    


select name, department,
    case 
        when department = 'HR' then 'HR Dept'
        when department = 'Engineering' then 'R&D Dept'
        when department = 'Sales' then 'Sales Dept'
        else 'Others'
    end as `department type`
from employees;


create table employee_details (
    id int auto_increment primary key,
    name varchar(100),
    department varchar(50),
    salary int,
    experience int
);

insert into employee_details (name, department, salary, experience) values
('alice', 'hr', 45000, 2),
('bob', 'engineering', 85000, 5),
('charlie', 'engineering', 65000, 1),
('diana', 'sales', 50000, 4),
('ethan', 'hr', 40000, 6),
('fiona', 'sales', 60000, 3);


select name, department, salary, experience,
    case 
        when department = 'engineering' then 
            case 
                when experience >= 5 then 'senior engineer'
                when experience >= 2 then 'mid-level engineer'
                else 'junior engineer'
            end
        when department = 'hr' then 
            case 
                when experience >= 5 then 'hr manager'
                else 'hr associate'
            end
        when department = 'sales' then 
            case 
                when salary >= 60000 then 'sales lead'
                else 'sales rep'
            end
        else 'others'
    end as role_title
from employee_details;


select name, department, salary, experience,
    case 
        when department = 'engineering' then 
			case
				when experience >= 5 then 'Senior Eng'
                when experience between 2 and 4 then 'Mid-level Eng'
                else 'Junior Eng'
            end
        when department = 'hr' then
			case
				when experience >= 5 then 'Senior HR'
                else 'Junior HR'
            end
        when department = 'sales' then
			case
				when salary >= 60000 then 'Sales lead'
                else 'Sales rep'
            end
        else 'Others'
     end as 'Title'
from employee_details;    
				


