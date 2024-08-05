--find latest transactions 
--find total spend
--find total unit

SELECT
  cust_code,
  basket_id,
  shop_date,
  SUM(quantity) AS units,
  SUM(spend) AS total_spend
FROM supermarket
WHERE basket_id in (SELECT FIRST_VALUE(basket_id) OVER(PARTION BY cust_code ORDER BY shop_date DESC)
                    FROM supermarket
                    )
GROUP BY cust_code , basket_id , shop_date
ORDER BY