select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        segment as value_field,
        count(*) as n_records

    from `salesanalysis-450811`.`sales_analysis`.`order_segments_2023`
    group by segment

)

select *
from all_values
where value_field not in (
    'New','Returning','VIP'
)



      
    ) dbt_internal_test