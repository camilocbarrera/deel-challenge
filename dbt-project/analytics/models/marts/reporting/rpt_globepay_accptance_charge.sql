SELECT
     stg_globepay__acceptance_report.external_ref      AS external_ref
   , stg_globepay__acceptance_report.status            AS status
   , stg_globepay__acceptance_report.source            AS source
   , stg_globepay__acceptance_report.ref               AS ref
   , stg_globepay__acceptance_report.date_time         AS date_time
   , stg_globepay__acceptance_report.state             AS state
   , stg_globepay__acceptance_report.cvv_provided      AS cvv_provided
   , stg_globepay__acceptance_report.amount            AS amount
   , stg_globepay__acceptance_report.country           AS country
   , stg_globepay__acceptance_report.currency          AS currency
   , stg_globepay__acceptance_report.rates             AS rates
   , stg_globepay__acceptance_report.rate_aud          AS rate_aud
   , stg_globepay__acceptance_report.rate_cad          AS rate_cad
   , stg_globepay__acceptance_report.rate_eur          AS rate_eur
   , stg_globepay__acceptance_report.rate_gbp          AS rate_gbp
   , stg_globepay__acceptance_report.rate_mxn          AS rate_mxn
   , stg_globepay__acceptance_report.rate_sgd          AS rate_sgd
   , stg_globepay__acceptance_report.rate_usd          AS rate_usd
   , stg_globepay__chargeback_report.chargeback_status AS chargeback_status
   , stg_globepay__chargeback_report.chargeback_source AS chargeback_source
   , stg_globepay__chargeback_report.chargeback        AS chargeback

FROM {{ ref('stg_globepay__acceptance_report' )}}
LEFT JOIN {{ ref('stg_globepay__chargeback_report') }} USING ( external_ref )
WHERE TRUE

