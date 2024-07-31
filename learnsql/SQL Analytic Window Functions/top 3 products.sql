-- show  the top 3 products in each category

WITH rankproduct AS (
    SELECT  category,
            product,
            gross,
            ROW_NUMBER() OVER (PARTITION BY category ORDER BY gross DESC) as rank
    FROM supermarket
)
SELECT category , product , gross
FROM rankproduct
WHERE rank <= 3;