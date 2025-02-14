

  create or replace view `salesanalysis-450811`.`sales_analysis`.`orders_with_prods`
  OPTIONS()
  as WITH orders_with_products AS (
    SELECT 
        o.orders_id,
        o.date_date,
        COUNT(DISTINCT s.products_id) as qty_product
    FROM `salesanalysis-450811`.`salesAnalysis`.`orders` o
    LEFT JOIN `salesanalysis-450811`.`salesAnalysis`.`sales` s
        ON o.orders_id = s.order_id
    WHERE EXTRACT(YEAR FROM o.date_date) IN (2022, 2023)
    GROUP BY o.orders_id, o.date_date
)

SELECT 
    orders_id,
    date_date,
    qty_product
FROM orders_with_products
ORDER BY date_date, orders_id;

