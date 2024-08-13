/*COUNT(order id) instead of COUNT()
This ensures that we only count rows with non- NULL order_id column values*/

SELECT c.customer_id, 
       COUNT(o.order_id) AS order_count
FROM customer c
LEFT JOIN orders o 
    ON o.customer_id = c.customer_id
GROUP BY c.customer_id