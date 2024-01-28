-- SQL-команды для создания таблиц
CREATE TABLE employees
(
	employee_id	int PRIMARY KEY,
	first_name text,
	last_name text,
	title text,
	birth_date date,
	notes text
);

CREATE TABLE customers
(
	customer_id varchar(100) PRIMARY KEY,
	company_name text,
	contact_name text
);

CREATE TABLE orders
(
	order_id int PRIMARY KEY,
	customer_id varchar(100) references customers(customer_id) not null,
	employee_id int references employees(employee_id) not null,
	order_date date,
	ship_city text
);

SELECT * FROM employees;
SELECT * FROM customers;
SELECT * FROM orders;
