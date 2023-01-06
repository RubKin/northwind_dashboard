-- CUSTOMER QUERIES

SELECT * FROM orders LIMIT 2;

SELECT * FROM order_details LIMIT 2;

SELECT * FROM categories LIMIT 2;

SELECT * FROM products LIMIT 2;

-- SELECT company_name, city, country FROM customers;

-- SELECT DISTINCT country FROM customers;

-- SELECT DISTINCT city FROM customers;

-- SELECT DISTINCT city, country FROM customers ORDER BY country;

-- SELECT  customers.country, countries.initial, countries.latitude, countries.longitude FROM countries JOIN customers ON countries.country=customers.country;

SELECT product_name, category_id 
    FROM products
    WHERE product_name = 'Chai';

SELECT p.product_id, p.product_name, c.category_name
    FROM products AS p
    LEFT JOIN categories as c
    ON p.category_id=c.category_id;


-- SELECT p.product_id, p.product_name, c.category_name, od.order_id
--     FROM products AS p 
--     JOIN categories as c 
--     ON p.category_id=p.category_id
--     JOIN order_details as od 
--     ON od.product_id=p.product_id;

-- SELECT o.order_id, o.product_id, o.unit_price, o.quantity, o.discount

-- SELECT products.product_id, order_details.order_id, 
--     FROM order_details 
--     JOIN products   
--     ON products.product_id= order_details.order_id;
