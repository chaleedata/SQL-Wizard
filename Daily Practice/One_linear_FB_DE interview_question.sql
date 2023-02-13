-- Write an SQL query to find the ids of products that are both low fat and recyclable.

Input: 
Products table:
+-------------+----------+------------+
| product_id  | low_fats | recyclable |
+-------------+----------+------------+
| 0           | Y        | N          |
| 1           | Y        | Y          |
| 2           | N        | Y          |
| 3           | Y        | Y          |
| 4           | N        | N          |
+-------------+----------+------------+

Output: 
+-------------+
| product_id  |
+-------------+
| 1           |
| 3           |
+-------------+

SELECT product_id FROM Products WHERE low_fats = 'Y' AND recyclable = 'Y' ORDER BY 1 ASC

-- Addition find percentage
SELECT ROUND(AVG(CASE WHEN low_fats = 'Y' OR recyclable = 'Y' THEN 1 ELSE 0 END),2) AS PERCENTAGE