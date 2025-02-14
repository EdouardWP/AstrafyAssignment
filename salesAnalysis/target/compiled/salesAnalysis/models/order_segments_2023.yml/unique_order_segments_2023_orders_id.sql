
    
    

with dbt_test__target as (

  select orders_id as unique_field
  from `salesanalysis-450811`.`sales_analysis`.`order_segments_2023`
  where orders_id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


