-- Product Information

-- Get a list of the most and least expensive products (name and unit price).

SELECT product_name, unit_price FROM products ORDER BY unit_price DESC LIMIT 20;

SELECT product_name, unit_price FROM products ORDER BY unit_price ASC LIMIT 20;

-- -- Get products that cost less than $20.

-- SELECT product_name, unit_price FROM products WHERE unit_price < 20 ORDER BY unit_price ASC;

-- -- Get products that cost between $15 and $25.

-- SELECT product_name, unit_price FROM products WHERE unit_price > 15 AND unit_price < 25;

-- -- Get products above average price.
-- SELECT AVG(unit_price) FROM products;
-- SELECT product_name, unit_price FROM products WHERE unit_price > (SELECT AVG(unit_price) FROM products);

-- -- Find the ten most expensive products.

-- SELECT product_name, unit_price FROM products ORDER BY unit_price DESC LIMIT 10;

-- -- Get a list of discontinued products (Product ID and name).

-- SELECT product_id, product_name FROM products WHERE discontinued = 1;

-- -- Count current and discontinued products.

-- SELECT (
--     SELECT COUNT(discontinued) FROM products WHERE discontinued = 0) AS discontinued,
--     (SELECT COUNT(discontinued) FROM products WHERE discontinued = 1) AS still_sold;


-- -- Find products with less units in stock than the quantity on order.

-- SELECT product_name, units_in_stock FROM products WHERE units_in_stock < units_on_order;

-- Sales per date

SELECT 
    TO_CHAR(o.order_date, 'YYYY-MM') AS date,
    c.category_name,
    ROUND(SUM(od.unit_price * od.quantity * (1-od.discount))) AS total_price
    FROM order_details AS od
    JOIN orders AS o 
    ON od.order_id=o.order_id
    JOIN customers as cs
    ON o.customer_id=cs.customer_id
    JOIN products as p 
    ON od.product_id=p.product_id
    JOIN categories as c  
    ON p.category_id=c.category_id
    GROUP BY date, c.category_name
    ORDER BY date;


SELECT 
    TO_CHAR(o.order_date, 'YYYY-MM-DD') AS date,
    ROUND(SUM(od.unit_price * od.quantity * (1-od.discount))) AS total_price
    FROM order_details AS od
    JOIN orders AS o 
    ON od.order_id=o.order_id
    JOIN customers as cs
    ON o.customer_id=cs.customer_id
    JOIN products as p 
    ON od.product_id=p.product_id
    JOIN categories as c  
    ON p.category_id=c.category_id
    GROUP BY date
    ORDER BY date;

SELECT 
    TO_CHAR(o.order_date, 'YYYY-MM') AS date,
    ROUND(SUM(od.unit_price * od.quantity * (1-od.discount))) AS total_price
    FROM order_details AS od
    JOIN orders AS o 
    ON od.order_id=o.order_id
    JOIN customers as cs
    ON o.customer_id=cs.customer_id
    JOIN products as p 
    ON od.product_id=p.product_id
    JOIN categories as c  
    ON p.category_id=c.category_id
    GROUP BY date
    ORDER BY date;