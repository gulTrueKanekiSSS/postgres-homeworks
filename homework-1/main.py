"""Скрипт для заполнения данными таблиц в БД Postgres."""
import csv

import psycopg2

connection = psycopg2.connect(
    database="north",
    host="localhost",
    user="postgres",
    password="12345",
    port="5432"
)

cursor = connection.cursor()

with open("north_data/customers_data.csv", 'r') as f:
    reader = csv.reader(f)
    next(reader)
    for row in reader:
        cursor.execute("INSERT INTO customers (customer_id, company_name, contact_name) VALUES (%s, %s, %s)",
                    (row[0], row[1], row[2]))


with open("north_data/employees_data.csv", 'r') as f:
    reader = csv.reader(f)
    next(reader)
    for row in reader:
        cursor.execute("INSERT INTO employees (first_name, last_name, title, birth_date, notes) VALUES (%s, %s, %s, %s, %s)",
                    (row[0], row[1], row[2], row[3], row[4]))

with open("north_data/orders_data.csv", 'r') as f:
    reader = csv.reader(f)
    next(reader)
    for row in reader:
        cursor.execute("INSERT INTO orders (order_id, customer_id, employee_id, order_date, ship_city) VALUES (%s, %s, %s, %s, %s)",
                    (row[0], row[1], row[2], row[3], row[4]))


connection.commit()
connection.close()
