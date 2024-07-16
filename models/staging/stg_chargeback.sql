select
    external_ref as transaction_id,
    chargeback

from {{ source('RAW', 'chargeback') }}