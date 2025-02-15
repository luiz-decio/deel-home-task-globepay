with acceptance as (

    select

        transaction_id,
        transaction_date,
        state,
        amount,
        country,
        currency,

        -- Get the USD rate using get_rate macro
        {{ get_rate('exchange_rates', 'currency') }} as currency_rate

    from {{ ref('stg_acceptance') }}
),

chargeback as (

    select * from {{ ref('stg_chargeback') }}

),

final as (

    select

        a.*,
        a.amount / a.currency_rate as usd_amount,
        c.chargeback,
        current_timestamp() as _insert_date

    from acceptance a

    left join chargeback c using (transaction_id)

)

select * from final