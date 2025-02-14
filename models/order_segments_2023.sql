WITH customer_order_counts AS (
    -- Count previous orders for each customer in the 12 months before each 2023 order
    SELECT 
        o2023.orders_id,
        o2023.date_date,
        o2023.customers_id,
        COUNT(DISTINCT prev_orders.orders_id) as previous_orders_12m
    FROM {{ source('salesanalysis', 'orders') }} o2023
    LEFT JOIN {{ source('salesanalysis', 'orders') }} prev_orders
        ON o2023.customers_id = prev_orders.customers_id
        AND prev_orders.date_date BETWEEN 
            DATE_SUB(o2023.date_date, INTERVAL 12 MONTH) 
            AND DATE_SUB(o2023.date_date, INTERVAL 1 DAY)
    WHERE EXTRACT(YEAR FROM o2023.date_date) = 2023
    GROUP BY o2023.orders_id, o2023.date_date, o2023.customers_id
)

SELECT 
    orders_id,
    date_date,
    CASE 
        WHEN previous_orders_12m = 0 THEN 'New'
        WHEN previous_orders_12m BETWEEN 1 AND 3 THEN 'Returning'
        WHEN previous_orders_12m >= 4 THEN 'VIP'
    END as segment
FROM customer_order_counts
ORDER BY date_date, orders_id 