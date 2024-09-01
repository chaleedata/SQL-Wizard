--website_id = 2
--revenue on the next day
--difference between revenue on the next day and revenue

SELECT
  day,
  revenue,
  LEAD(revenue) OVER(ORDER BY day),
  LEAD(revenue) OVER(ORDER BY day) - revenue AS difference  
FROM marketdata
WHERE website_id = 2;