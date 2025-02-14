
    
    

with dbt_test__target as (

  select orders_id as unique_field
  from `salesanalysis-450811`.`sales_analysis`.`orders_with_prods`
  where orders_id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


