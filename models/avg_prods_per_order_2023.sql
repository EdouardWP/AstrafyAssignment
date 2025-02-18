WITH order_products AS (
    SELECT 
        o.orders_id,
        o.date_date,
        EXTRACT(MONTH FROM o.date_date) as month,
        COUNT(DISTINCT s.products_id) as products_count
    FROM {{ source('salesanalysis', 'orders') }} o
    LEFT JOIN {{ source('salesanalysis', 'sales') }} s
        ON o.orders_id = s.order_id
    WHERE EXTRACT(YEAR FROM o.date_date) = 2023
    GROUP BY o.orders_id, o.date_date
)

SELECT 
    month,
    ROUND(AVG(products_count), 2) as avg_products_per_order
FROM order_products
GROUP BY month
ORDER BY month 