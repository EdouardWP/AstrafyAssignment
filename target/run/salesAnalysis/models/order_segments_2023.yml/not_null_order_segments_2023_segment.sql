select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select segment
from `salesanalysis-450811`.`sales_analysis`.`order_segments_2023`
where segment is null



      
    ) dbt_internal_test