-- Step 1: Calculate total amount earned by each salesman grouped by their ID and city
-- Step 2: Calculate the average total amount earned for each city
-- Step 3: Compare each salesman's total earnings with the city average

WITH data_total_amount AS (
    SELECT b.id, b.city_id, b.first_name, b.last_name, SUM(amount_earned) AS total_amount
    FROM daily_sales a
    JOIN salesman b ON a.salesman_id = b.id
    GROUP BY b.id, b.city_id, b.first_name, b.last_name
), 
data_avg_total_amount AS (
    SELECT city_id, AVG(total_amount) AS avg_total_amount
    FROM data_total_amount
    GROUP BY city_id
)
SELECT a.first_name, a.last_name, 
    CASE 
        WHEN a.total_amount > b.avg_total_amount THEN 'Above average'
        ELSE 'Below average'
    END AS label
FROM data_total_amount a
JOIN data_avg_total_amount b ON a.city_id = b.city_id;