
    
    

with all_values as (

    select
        state as value_field,
        count(*) as n_records

    from DEEL_GLOBEPAY.analytics.stg_acceptance
    group by state

)

select *
from all_values
where value_field not in (
    'ACCEPTED','DECLINED'
)


