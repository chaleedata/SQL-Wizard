-- First find total revenue per sale using CTE
WITH sales_total_revenue AS (
  SELECT
    s.sale_id,
    s.salesperson_id,
    SUM(price_per_item * quantity_sold) AS total_revenue
  FROM sales s
  JOIN sale_items si
    ON s.sale_id = si.sale_id
  GROUP BY s.sale_id,
    s.salesperson_id
)

-- Second, calculate the average total revenue for each salesperson
SELECT
  sp.salesperson_id,
  sp.first_name,
  sp.last_name,
  AVG(total_revenue) AS avg_total_revenue
FROM sales_total_revenue str
JOIN salespeople sp
  ON str.salesperson_id = sp.salesperson_id
WHERE sp.country = 'USA'
GROUP BY sp.salesperson_id,
  sp.first_name,
  sp.last_name;