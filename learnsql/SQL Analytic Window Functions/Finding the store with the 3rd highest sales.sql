WITH Sales_Rank AS (
    SELECT Store_ID, Day, Sales_Amount,
        ROW_NUMBER() OVER(PARTITION BY Day ORDER BY Sales_Amount DESC) AS Rank
    FROM Sales
)
SELECT Store_ID, Day, Sales_Amount, Rank
FROM Sales_Rank
WHERE Rank = 3;