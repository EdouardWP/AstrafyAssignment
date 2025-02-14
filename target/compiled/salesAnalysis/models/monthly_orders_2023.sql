WITH orders_2023 AS (
    SELECT 
        orders_id,
        date_date,
        EXTRACT(MONTH FROM date_date) as month
    FROM `salesanalysis-450811`.`salesAnalysis`.`orders`
    WHERE EXTRACT(YEAR FROM date_date) = 2023
)

SELECT 
    month,
    COUNT(DISTINCT orders_id) as orders_count
FROM orders_2023 
GROUP BY month
ORDER BY month