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