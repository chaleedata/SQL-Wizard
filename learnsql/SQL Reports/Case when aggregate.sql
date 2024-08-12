--Can use aggregation in case expression
SELECT 
  SUM(CASE
    WHEN ship_country = 'Thailand' OR ship_country = 'Malaysia' THEN 1
  END) AS free_shipping,
  SUM(CASE
    WHEN ship_country != 'Thailand' AND ship_country != 'Malaysia' THEN 1
  END) AS paid_shipping
FROM orders;