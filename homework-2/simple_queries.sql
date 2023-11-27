SELECT contact_name, city FROM customers

SELECT order_id, shipped_date - order_date as differnce_orders FROM orders

SELECT DISTINCT country FROM customers

SELECT COUNT(order_id) FROM orders

SELECT COUNT(DISTINCT (ship_country)) FROM orders