select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select date_date
from `salesanalysis-450811`.`sales_analysis`.`order_segments_2023`
where date_date is null



      
    ) dbt_internal_test