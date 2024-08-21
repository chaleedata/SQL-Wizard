/*focuses on organizing customers in descending order of their credit scores,
 with the highest scores ranked at the top*/

SELECT customer_id,
       credit_score,
       RANK() OVER (ORDER BY credit_score DESC) AS credit_score_rank
FROM customer_data
ORDER BY credit_score DESC;