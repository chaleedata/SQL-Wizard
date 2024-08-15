--Multi-Level aggregation in groups theory

--first find total price use CTE
WITH order_total_prices AS (
  SELECT
    o.order_id,
    o.employee_id,
    SUM(unit_price * quantity) AS total_price
  FROM orders o
  JOIN order_items oi
    ON o.order_id = oi.order_id
  GROUP BY o.order_id,
    o.employee_id
)

--second Use AVG to aggregation total_price
SELECT
  e.employee_id,
  e.first_name,
  e.last_name,
  AVG(total_price) AS avg_total_price
FROM order_total_prices otp
JOIN employees e
  ON otp.employee_id = e.employee_id
WHERE e.region = 'THA'
GROUP BY e.employee_id,
  e.first_name,
  e.last_name;