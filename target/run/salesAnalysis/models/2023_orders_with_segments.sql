

  create or replace view `salesanalysis-450811`.`sales_analysis`.`2023_orders_with_segments`
  OPTIONS()
  as WITH orders_2023 AS (
    SELECT 
        o.orders_id,
        o.date_date,
        o.customers_id,
        COUNT(DISTINCT s.products_id) as qty_products
    FROM `salesanalysis-450811`.`salesAnalysis`.`orders` o
    LEFT JOIN `salesanalysis-450811`.`salesAnalysis`.`sales` s
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
LEFT JOIN `salesanalysis-450811`.`sales_analysis`.`order_segments_2023` seg
    ON o.orders_id = seg.orders_id
ORDER BY o.date_date, o.orders_id;

