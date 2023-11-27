-- Напишите запросы, которые выводят следующую информацию:
-- 1. заказы, отправленные в города, заканчивающиеся на 'burg'. Вывести без повторений две колонки (город, страна) (см. таблица orders, колонки ship_city, ship_country)


-- 2. из таблицы orders идентификатор заказа, идентификатор заказчика, вес и страну отгрузки. Заказ отгружен в страны, начинающиеся на 'P'. Результат отсортирован по весу (по убыванию). Вывести первые 10 записей.


-- 3. фамилию, имя и телефон сотрудников, у которых в данных отсутствует регион (см таблицу employees)


-- 4. количество поставщиков (suppliers) в каждой из стран. Результат отсортировать по убыванию количества поставщиков в стране


-- 5. суммарный вес заказов (в которых известен регион) по странам, но вывести только те результаты, где суммарный вес на страну больше 2750. Отсортировать по убыванию суммарного веса (см таблицу orders, колонки ship_region, ship_country, freight)


-- 6. страны, в которых зарегистрированы и заказчики (customers) и поставщики (suppliers) и работники (employees).


-- 7. страны, в которых зарегистрированы и заказчики (customers) и поставщики (suppliers), но не зарегистрированы работники (employees).

SELECT DISTINCT(ship_city, ship_country) FROM orders WHERE ship_city LIKE '%burg';

SELECT order_id, customer_id, freight, ship_country FROM orders WHERE ship_country LIKE 'P%' ORDER BY freight DESC LIMIT 10;

SELECT last_name, first_name, home_phone FROM employees WHERE region IS NULL;

SELECT country, COUNT(*) AS amount FROM suppliers GROUP BY country ORDER BY amount DESC;

SELECT ship_country, SUM(freight) as sum_freights FROM orders WHERE ship_region IS NOT NULL  GROUP BY ship_country HAVING SUM(freight) > 2750 ORDER BY sum_freights DESC;

SELECT country
FROM suppliers
INTERSECT
SELECT country
FROM customers
INTERSECT
SELECT country
FROM employees;

SELECT country
FROM suppliers
INTERSECT
SELECT country
FROM customers
EXCEPT
SELECT country
FROM employees