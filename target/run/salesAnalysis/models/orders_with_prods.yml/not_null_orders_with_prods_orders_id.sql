select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select orders_id
from `salesanalysis-450811`.`sales_analysis`.`orders_with_prods`
where orders_id is null



      
    ) dbt_internal_test