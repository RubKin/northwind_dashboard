-- Customer Information

-- Total Sales per Customer

SELECT c.company_name, o.customer_id, c.country,
    ROUND(SUM(od.unit_price*od.quantity*(1-od.discount))) AS total_order
    FROM customers AS c
    JOIN orders AS o
    ON c.customer_id=o.customer_id
    JOIN order_details as od
    ON o.order_id=od.order_id
    GROUP BY c.company_name, c.country, o.customer_id
    ORDER BY total_order
    DESC; 

-- Top 5 custmomers
SELECT c.company_name, o.customer_id, c.country,
    ROUND(SUM(od.unit_price*od.quantity*(1-od.discount))) AS total_order
    FROM customers AS c
    JOIN orders AS o
    ON c.customer_id=o.customer_id
    JOIN order_details as od
    ON o.order_id=od.order_id
    GROUP BY c.company_name, c.country, o.customer_id
    ORDER BY total_order
    DESC
    LIMIT 5; 

-- Bottom 5 customers
SELECT c.company_name, o.customer_id, c.country,
    ROUND(SUM(od.unit_price*od.quantity*(1-od.discount))) AS total_order
    FROM customers AS c
    JOIN orders AS o
    ON c.customer_id=o.customer_id
    JOIN order_details as od
    ON o.order_id=od.order_id
    GROUP BY c.company_name, c.country, o.customer_id
    ORDER BY total_order
    LIMIT 5; 

-- SELECT c.company_name, c.country, o.customer_id
--     FROM customers AS c
--     JOIN orders AS o
--     ON c.customer_id=o.customer_id
--     GROUP BY c.company_name; 

-- SELECT c.company_name, c.country, o.customer_id,
--     ROUND(SUM(od.unit_price*od.quantity*(1-od.discount))) AS total_order
--     FROM customers AS c
--     JOIN orders AS o
--     ON c.customer_id=o.customer_id
--     JOIN order_details
--     ON order_details.order_id=orders.order_id

--     GROUP BY c.company_name; 