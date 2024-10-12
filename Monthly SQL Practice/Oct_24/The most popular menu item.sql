/*
Select the menu item ordered the most by quantity. Show the following three columns:
- The ID of the menu item.
-The name of the menu item.
- The total quantity ordered of the menu item.
*/


--First use the CTE + LIMIT approach
WITH food_data AS (
    SELECT a.item_id, item_name, SUM(quantity)
    FROM item a
    JOIN ticket_item b ON a.item_id = b.item_id
    GROUP BY a.item_id, item_name
    ORDER BY SUM(quantity) DESC
)
SELECT * FROM food_data LIMIT 1;

-- Pros: More readable and simple to understand
-- Cons: Performance it sort the entire result set before picking the top row and Scalability for large datasets


--Second use HAVING clause
SELECT
  i.item_id,
  i.item_name,
  SUM(quantity)
FROM item i
JOIN ticket_item ti
  ON i.item_id = ti.item_id
GROUP BY 
  i.item_id, 
  i.item_name
HAVING SUM(quantity) >= ALL(
  SELECT
    SUM(quantity)
  FROM ticket_item
  GROUP BY item_id
);
-- Pros: Better performance and Precise filtering
-- Cons: More complex: The query is less intuitive to read and Dependent on optimizer