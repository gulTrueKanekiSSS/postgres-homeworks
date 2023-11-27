
-- SQL-команды для создания таблиц
CREATE DATABASE north

CREATE TABLE employees
(
	employee_id serial PRIMARY KEY,
	first_name varchar(100) NOT NULL,
	last_name varchar(100) NOT NULL,
	title varchar(100),
	birth_date varchar(100),
	notes text
);

CREATE TABLE customers
(
	customer_id varchar(100) PRIMARY KEY,
	company_name varchar(50),
	contact_name varchar(50)
);

CREATE TABLE orders
(
	order_id serial PRIMARY KEY,
	customer_id varchar(100) REFERENCES customers(customer_id),
	employee_id int NOT NULL REFERENCES employees(employee_id),
	order_date date NOT NULL,
	ship_city varchar(100)
);

