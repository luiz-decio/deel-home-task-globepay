select
    external_ref as transaction_id,
    status,
    date_time as transaction_date,
    state,
    case when amount < 0 then amount * -1 else amount end as amount,
    country,
    currency,
    parse_json(rates) as exchange_rates

from deel_globepay.raw.acceptance