-- Queries

--Get the names and the quantities in stock for each product.

SELECT product_name, units_in_stock FROM products;

-- Get a list of current products (Product ID and name).

SELECT product_id, product_name FROM products WHERE units_in_stock >= 1;

-- Get a list of the most and least expensive products (name and unit price).

SELECT product_name, unit_price FROM products ORDER BY unit_price DESC LIMIT 20;

SELECT product_name, unit_price FROM products ORDER BY unit_price ASC LIMIT 20;

-- Get products that cost less than $20.

SELECT product_name, unit_price FROM products WHERE unit_price < 20 ORDER BY unit_price ASC;

-- Get products that cost between $15 and $25.

SELECT product_name, unit_price FROM products WHERE unit_price > 15 AND unit_price < 25;

-- Get products above average price.
SELECT AVG(unit_price) FROM products;
SELECT product_name, unit_price FROM products WHERE unit_price > (SELECT AVG(unit_price) FROM products);

-- Find the ten most expensive products.

SELECT product_name, unit_price FROM products ORDER BY unit_price DESC LIMIT 10;

-- Get a list of discontinued products (Product ID and name).

SELECT product_id, product_name FROM products WHERE discontinued = 1;

-- Count current and discontinued products.

SELECT (
    SELECT COUNT(discontinued) FROM products WHERE discontinued = 0) AS discontinued,
    (SELECT COUNT(discontinued) FROM products WHERE discontinued = 1) AS still_sold;


-- Find products with less units in stock than the quantity on order.

SELECT product_name, units_in_stock FROM products WHERE units_in_stock < units_on_order;

-- Find the customer who had the highest order amount

SELECT customer_id, COUNT(DISTINCT order_id) FROM orders GROUP BY customer_id ORDER BY 2 DESC LIMIT 1;

-- Get orders for a given employee and the according customer

SELECT employee_id, customer_id, COUNT(order_id)FROM orders GROUP BY employee_id, customer_id ORDER BY employee_id;

-- Find the hiring age of each employee

SELECT employee_id, last_name, first_name, EXTRACT(day FROM ((birth_date -hiredate)/ -365)) AS age FROM employees;
SELECT employee_id, last_name, first_name, EXTRACT(year FROM ((birth_date -hiredate))) AS age FROM employees;


-- Create views and/or named queries for some of these queries