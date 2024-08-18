-- Add another dimension to our reports

SELECT 
    a.employee_id,
    c.first_name,
    c.last_name,
    SUM(CASE 
        WHEN a.ship_country IN ('Japan', 'Thailand', 'Korea') 
        THEN b.unit_price * b.quantity 
        ELSE 0 
    END) AS asia_orders,
    SUM(CASE 
        WHEN a.ship_country NOT IN ('Japan', 'Thailand', 'Korea') 
        THEN b.unit_price * b.quantity 
        ELSE 0 
    END) AS other_orders
FROM orders a
JOIN order_items b ON a.order_id = b.order_id
JOIN employees c ON a.employee_id = c.employee_id
GROUP BY 
    a.employee_id, 
    c.first_name, 
    c.last_name;