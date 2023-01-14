WITH chargeback_report     AS (
     SELECT *
     FROM {{ source('raw_deel','globepay_chargeback_report') }}
     WHERE TRUE

)


SELECT
     external_ref AS external_ref
   , status       AS chargeback_status
   , source       AS chargeback_source
   , chargeback   AS chargeback
FROM chargeback_report
WHERE TRUE


