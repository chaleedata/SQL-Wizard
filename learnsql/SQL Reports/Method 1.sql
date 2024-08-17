--Groups were represented as rows and created with a single CASE WHEN statement.

WITH product_con as (
  	SELECT  product_id ,
			CASE WHEN  units_in_stock <= 10then 'Low'
        	     WHEN units_in_stock between 10 and 30 then 'Average'
                ELSE 'High'  end  as availability
FROM products
  )
SELECT availability , count(product_id) as product_count
FROM product_con
GROUP BY availability