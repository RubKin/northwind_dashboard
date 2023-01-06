-- Products Queries:

SELECT * FROM orders LIMIT 2;

SELECT * FROM order_details LIMIT 2;

SELECT * FROM categories LIMIT 2;

SELECT * FROM products LIMIT 2;

-- SELECT product_name, category_id 
--     FROM products
--     WHERE product_name = 'Chai';

--Get the names and the quantities in stock for each product.

SELECT product_id, product_name, units_in_stock FROM products;

-- Get a list of current products (Product ID and name).

SELECT product_id, product_name FROM products WHERE units_in_stock >= 1;

-- Get a list of the most and least expensive products (name and unit price).

SELECT product_id, product_name, unit_price FROM products ORDER BY unit_price DESC LIMIT 20;

SELECT product_id, product_name, unit_price FROM products ORDER BY unit_price ASC LIMIT 20;

-- Get products that cost less than $20.

SELECT product_id, product_name, unit_price FROM products WHERE unit_price < 20 ORDER BY unit_price ASC;

-- Get products that cost between $15 and $25.

SELECT product_id, product_name, unit_price FROM products WHERE unit_price > 15 AND unit_price < 25;

-- Get products above average price.
SELECT AVG(unit_price) FROM products;
SELECT product_id, product_name, unit_price FROM products WHERE unit_price > (SELECT AVG(unit_price) FROM products);

-- Find the ten most expensive products.

SELECT product_id, product_name, unit_price FROM products ORDER BY unit_price DESC LIMIT 10;

-- Get a list of discontinued products (Product ID and name).

SELECT product_id, product_name FROM products WHERE discontinued = 1;

-- Count current and discontinued products.

SELECT (
    SELECT COUNT(discontinued) FROM products WHERE discontinued = 0) AS discontinued,
    (SELECT COUNT(discontinued) FROM products WHERE discontinued = 1) AS still_sold;


-- Find products with less units in stock than the quantity on order.

SELECT product_id, product_name, units_in_stock FROM products WHERE units_in_stock < units_on_order;


SELECT p.product_id, p.product_name, c.category_name
    FROM products AS p
    LEFT JOIN categories as c
    ON p.category_id=c.category_id;

--Average selling price per product per unit
SELECT p.product_id, p.product_name, c.category_name, ROUND(AVG(od.unit_price))
    FROM products AS p
    LEFT JOIN categories as c
    ON p.category_id=c.category_id
    LEFT JOIN order_details as od
    ON od.product_id=p.product_id
    GROUP BY p.product_id, p.product_name, c.category_name
    ORDER BY p.product_name;


-- Stock VALUE
SELECT ROUND(SUM(unit_price * units_in_stock)) FROM  products;
-- Units on order VALUE
SELECT ROUND(SUM(unit_price*units_on_order)) FROM products;
