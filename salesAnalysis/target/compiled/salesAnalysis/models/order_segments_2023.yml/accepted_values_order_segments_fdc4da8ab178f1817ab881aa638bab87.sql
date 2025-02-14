
    
    

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


