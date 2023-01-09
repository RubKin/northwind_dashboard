-- Sales Information


-- Sales per Country

-- Coutnries with the biggest order VALUES
-- SELECT o.ship_country AS country, 
--     ROUND(SUM(od.unit_price*od.quantity*(1-od.discount))) AS total_order
--     FROM orders AS o
--     JOIN order_details AS od
--     ON o.order_id=od.order_id
--     GROUP BY o.ship_country
--     ORDER BY total_order
--     DESC;

-- Map
SELECT o.ship_country AS country, 
    ROUND(SUM(od.unit_price*od.quantity*(1-od.discount))) AS total_order,
    c.initial as country_code
    FROM orders AS o
    JOIN order_details AS od
    ON o.order_id=od.order_id
    JOIN countries AS c 
    ON o.ship_country=c.country
    GROUP BY o.ship_country, country_code
    ORDER BY total_order
    DESC;

-- Total Value of Orders
SELECT s.company_name,
    SUM(od.unit_price*od.quantity*(1-od.discount)) AS total_order
    FROM orders AS o
    JOIN shippers AS s 
    ON o.ship_via=s.shipper_id
    JOIN order_details AS od
    ON o.order_id=od.order_id
    GROUP BY s.company_name
    ORDER BY total_order
    DESC;


