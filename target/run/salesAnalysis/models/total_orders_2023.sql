

  create or replace view `salesanalysis-450811`.`sales_analysis`.`total_orders_2023`
  OPTIONS()
  as WITH orders_2023 AS (
    SELECT 
        orders_id,
        date_date
    FROM `salesanalysis-450811`.`salesAnalysis`.`orders`
    WHERE EXTRACT(YEAR FROM date_date) = 2023
)

SELECT 
    COUNT(DISTINCT orders_id) as total_orders_2023
FROM orders_2023;

