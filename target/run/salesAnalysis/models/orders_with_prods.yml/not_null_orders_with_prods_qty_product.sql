select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select qty_product
from `salesanalysis-450811`.`sales_analysis`.`orders_with_prods`
where qty_product is null



      
    ) dbt_internal_test