--OVER() all rows in the query result
SELECT id , 
       category,
       SUM(total_price) OVER() as total
FROM order