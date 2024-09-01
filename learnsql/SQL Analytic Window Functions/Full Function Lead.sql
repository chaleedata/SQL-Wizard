--Customer Purchase Behavior Analysis
--Find next spending within 5 days
--Shows 0 instead of NULL if no LEAD

SELECT
  customer_id,
  product_category,
  purchase_date,
  amount_spent AS current_spending,
  LEAD(amount_spent, 5, 0) OVER(ORDER BY purchase_date) AS next_spending_within_5_days,
FROM purchases
WHERE purchase_date BETWEEN '2024-01-01' AND '2024-01-31'