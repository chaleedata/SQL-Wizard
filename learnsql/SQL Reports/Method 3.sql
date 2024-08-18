--Best solution for more complex reports,such as ones with percentages or multi-level aggregation.

WITH thai_revenue AS (
  SELECT
    employee_id,
    SUM(CASE
      WHEN ship_country = 'Thailand'
        THEN unit_price * quantity
      ELSE 0
    END) AS country_revenue,
    SUM(unit_price * quantity) AS total_revenue
  FROM orders o
  JOIN order_items oi
    ON o.order_id = oi.order_id
  GROUP BY employee_id),
japan_revenue AS (
  SELECT
    employee_id,
    SUM(CASE
      WHEN ship_country = 'Japan'
        THEN unit_price * quantity
      ELSE 0
    END) AS country_revenue,
    SUM(unit_price * quantity) AS total_revenue
  FROM orders o
  JOIN order_items oi
    ON o.order_id = oi.order_id
  GROUP BY employee_id)
SELECT 
  e.employee_id,
  e.first_name,
  e.last_name,
  ROUND(th_rev.country_revenue / th_rev.total_revenue * 100, 2) AS rev_percentage_th ,
  ROUND(jp_rev.country_revenue / jp_rev.total_revenue * 100, 2) AS rev_percentage_jp
FROM thai_revenue th_rev
JOIN japan_revenue jp_rev
  ON th_rev.employee_id = jp_rev.employee_id
JOIN employees e
  ON e.employee_id = th_rev.employee_id;