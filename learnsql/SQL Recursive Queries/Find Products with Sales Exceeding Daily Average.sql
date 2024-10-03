WITH daily_sales_product AS (
  -- Step 1: Calculate total sales per product per day
  SELECT 
    p.product_id, 
    p.product_name, 
    s.sale_date, 
    SUM(s.amount) AS total_sales_per_day
  FROM sales s
  JOIN products p
    ON s.product_id = p.product_id
  GROUP BY p.product_id, p.product_name, s.sale_date
), 
avg_daily_sales_product AS (
  -- Step 2: Calculate the average daily sales for each product
  SELECT 
    product_id, 
    AVG(total_sales_per_day) AS avg_daily_sales
  FROM daily_sales_product
  GROUP BY product_id
)
-- Step 3: Find products where daily sales exceeded the average daily sales
SELECT 
  dsp.product_id, 
  dsp.product_name, 
  dsp.sale_date, 
  dsp.total_sales_per_day, 
  adsp.avg_daily_sales
FROM daily_sales_product dsp
JOIN avg_daily_sales_product adsp
  ON dsp.product_id = adsp.product_id
WHERE dsp.total_sales_per_day > adsp.avg_daily_sales
ORDER BY dsp.product_name, dsp.sale_date;