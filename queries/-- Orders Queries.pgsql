--Customer Queries 

-- SELECT order_id, EXTRACT(DAY FROM(shipped_date - order_date)) 
--     FROM orders;

-- SELECT order_id, EXTRACT(DAY FROM(required_date - order_date)) 
--     FROM orders;   

SELECT * FROM orders LIMIT 2;

SELECT * FROM order_details LIMIT 2;

SELECT * FROM categories LIMIT 2;

SELECT * FROM products LIMIT 2;

SELECT o.ship_country, 
    SUM(od.unit_price * od.quantity * (1-od.discount)) AS total_price,
    c.latitude, c.longitude
    FROM orders AS o  
    JOIN order_details AS od
    ON o.order_id=od.order_id
    JOIN countries as c
    ON o.ship_country=c.country
    GROUP BY o.ship_country, c.latitude, c.longitude;

SELECT 
    TO_CHAR(o.order_date, 'YYYY-MM-DD') AS date,
    SUM(od.unit_price * od.quantity * (1-od.discount)) AS total_price
    FROM order_details AS od
    JOIN orders AS o 
    ON od.order_id=o.order_id
    JOIN customers as cs
    ON o.customer_id=cs.customer_id
    JOIN products as p 
    ON od.product_id=p.product_id
    JOIN categories as c  
    ON p.category_id=c.category_id
    GROUP BY date, c.category_name, cs.company_name
    ORDER BY date;


SELECT 
    TO_CHAR(o.order_date, 'YYYY-MM-DD') AS date,
    SUM(od.unit_price * od.quantity * (1-od.discount)) AS total_price,
    c.category_name, cs.company_name
    FROM order_details AS od
    JOIN orders AS o 
    ON od.order_id=o.order_id
    JOIN customers as cs
    ON o.customer_id=cs.customer_id
    JOIN products as p 
    ON od.product_id=p.product_id
    JOIN categories as c  
    ON p.category_id=c.category_id
    GROUP BY date, c.category_name, cs.company_name
    ORDER BY date;

SELECT c.category_name, 
    SUM(od.unit_price * od.quantity * (1-od.discount)) AS total_price,
    o.customer_id, TO_CHAR(o.order_date, 'YYYY-MM-DD') AS date
    FROM order_details AS od
    JOIN orders AS o 
    ON od.order_id=o.order_id
    JOIN products as p 
    ON od.product_id=p.product_id
    JOIN categories as c  
    ON p.category_id=c.category_id
    GROUP BY date,c.category_name, o.customer_id
    ORDER BY date;

-- SELECT SUM(o.order_id), c.category_name, 
--     EXTRACT(WEEK FROM o.order_date) AS week,
--     EXTRACT(YEAR FROM o.order_date) AS year
--     FROM orders as o
--     JOIN order_details as od
--     ON o.order_id=od.order_id
--     JOIN products as p 
--     ON od.product_id=p.product_id
--     JOIN categories as c  
--     ON p.category_id=c.category_id
--     GROUP BY c.category_name, week, year
;