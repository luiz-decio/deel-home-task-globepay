select
    external_ref as transaction_id,
    status,
    source,
    chargeback

from deel_globepay.raw.chargeback