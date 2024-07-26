-- Update customer information by awarding 50 reward points to those 
-- with the highest transaction amounts in the past month.

UPDATE customers
SET reward_points = reward_points + 50
FROM (
    -- Select the customer_id and the maximum transaction amount for each customer in June
    SELECT customer_id, MAX(amount) as max_amount
    FROM transactions
    WHERE month = 'June'
    GROUP BY customer_id
) as max_transactions
WHERE customers.customer_id = max_transactions.customer_id;