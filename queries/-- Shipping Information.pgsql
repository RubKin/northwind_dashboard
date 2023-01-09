-- Shipping Information

-- freights shipped per country

-- Countries that shipped the most
SELECT o.ship_country AS country, COUNT(o.order_id) AS num_of_orders 
    FROM orders AS o 
    GROUP BY ship_country
    ORDER BY num_of_orders
    DESC;
-- with MAP

SELECT o.ship_country AS country, 
    SUM(od.unit_price*od.quantity*(1-od.discount)) AS total_order,
    COUNT(o.order_id) AS num_of_orders,
    SUM(freight) AS total_freight
    FROM orders AS o 
    JOIN order_details AS od
    ON o.order_id=od.order_id
    GROUP BY ship_country
    ORDER BY total_order
    DESC;

SELECT o.ship_country AS country, COUNT(o.order_id) AS num_of_orders,
    c.initial as country_code
    FROM orders AS o 
    JOIN countries AS c 
    ON o.ship_country=c.country
    GROUP BY ship_country, country_code
    ORDER BY num_of_orders
    DESC;

-- countires that order the most based on Freight size

SELECT ship_country AS country, SUM(freight) AS total_freight
    FROM orders 
    GROUP BY ship_country
    ORDER BY total_freight
    DESC;

-- Map
SELECT o.ship_country AS country , SUM(freight) AS total_freight,
    c.initial as country_code
    FROM orders AS o
    JOIN countries AS c 
    ON o.ship_country=c.country
    GROUP BY o.ship_country, country_code
    ORDER BY total_freight
    DESC;



-- No of Orders, Total Freight and Total VALUE
-- SELECT o.ship_country AS country, COUNT(o.order_id) AS num_of_orders,
--     SUM(freight) AS total_freight,
--     ROUND(SUM(od.unit_price*od.quantity*(1-od.discount))) AS total_order
--     FROM orders AS o 
--     JOIN order_details AS od
--     ON o.order_id=od.order_id
--     GROUP BY ship_country
--     ORDER BY num_of_orders, total_freight, total_order
--     DESC;

-- Shipping Company Information

-- No of orders
SELECT s.company_name,
    COUNT(o.order_id) AS num_of_orders
    FROM orders AS o
    JOIN shippers AS s 
    ON o.ship_via=s.shipper_id
    GROUP BY s.company_name
    ORDER BY num_of_orders
    DESC;

-- Total Freight size
SELECT s.company_name,
    SUM(o.freight) AS freight_size
    FROM orders AS o
    JOIN shippers AS s 
    ON o.ship_via=s.shipper_id
    GROUP BY s.company_name
    ORDER BY freight_size
    DESC;
SELECT * FROM orders LIMIT 2;

-- Average shipping days per country
SELECT ship_country, 
    ROUND(AVG(EXTRACT(EPOCH FROM(((shipped_date - order_date) / 60 ) / 60) /24))) 
    AS shipping_days 
    FROM orders
    GROUP BY ship_country
    ORDER BY shipping_days
    DESC;

-- Aveage shipping days per shipping company
SELECT s.company_name, 
    ROUND(AVG(EXTRACT(EPOCH FROM(((o.shipped_date - o.order_date) / 60 ) / 60) /24))) 
    AS shipping_days 
    FROM orders AS o
    JOIN shippers AS s 
    ON o.ship_via=s.shipper_id
    GROUP BY s.company_name;
