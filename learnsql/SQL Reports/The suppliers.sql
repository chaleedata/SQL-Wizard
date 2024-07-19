/* We'd like to see information about all the suppliers who provide the store
four or more different products. Show the following columns:
supplier_id , company_name , and products_count (the number of
products supplied).*/

SELECT
  s.supplier_id, 
  s.company_name, 
  COUNT(*) AS products_count
FROM products p
JOIN suppliers s 
  ON p.supplier_id = s.supplier_id
GROUP BY s.supplier_id,
  s.company_name
HAVING COUNT(*) > 3;