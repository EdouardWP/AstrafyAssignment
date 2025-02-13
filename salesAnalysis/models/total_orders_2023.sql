WITH orders_2023 AS (
    SELECT 
        orders_id,
        date_date
    FROM {{ source('salesanalysis', 'orders') }}
    WHERE EXTRACT(YEAR FROM date_date) = 2023
)

SELECT 
    COUNT(DISTINCT orders_id) as total_orders_2023
FROM orders_2023 