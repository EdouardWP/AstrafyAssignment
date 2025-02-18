WITH orders_2023 AS (
    SELECT 
        o.orders_id,
        o.date_date,
        o.customers_id,
        COUNT(DISTINCT s.products_id) as qty_products
    FROM {{ source('salesanalysis', 'orders') }} o
    LEFT JOIN {{ source('salesanalysis', 'sales') }} s
        ON o.orders_id = s.order_id
    WHERE EXTRACT(YEAR FROM o.date_date) = 2023
    GROUP BY o.orders_id, o.date_date, o.customers_id
)

SELECT 
    o.orders_id,
    o.date_date,
    o.qty_products,
    seg.segment
FROM orders_2023 o
LEFT JOIN {{ ref('order_segments_2023') }} seg
    ON o.orders_id = seg.orders_id
ORDER BY o.date_date, o.orders_id 