--calculate the total sales for each salesperson but still want to keep each individual sale in the result
SELECT 
    salesperson_id,
    sales_date,
    amount,
    SUM(amount) OVER (PARTITION BY salesperson_id) AS total_sales
FROM 
    sales;