WITH acceptance_report     AS (
     SELECT *
     FROM {{ source('raw_deel','globepay_acceptance_report') }}

     WHERE TRUE

)
SELECT
     external_ref                   AS external_ref
   , status                         AS status
   , source                         AS source
   , ref                            AS ref
   , date_time                      AS date_time
   , state                          AS state
   , cvv_provided                   AS cvv_provided
   , amount                         AS amount
   , country                        AS country
   , currency                       AS currency
   , PARSE_JSON( rates )            AS rates
   , PARSE_JSON( rates ):AUD::FLOAT AS rate_aud
   , PARSE_JSON( rates ):CAD::FLOAT AS rate_cad
   , PARSE_JSON( rates ):EUR::FLOAT AS rate_eur
   , PARSE_JSON( rates ):GBP::FLOAT AS rate_gbp
   , PARSE_JSON( rates ):MXN::FLOAT AS rate_mxn
   , PARSE_JSON( rates ):SGD::FLOAT AS rate_sgd
   , PARSE_JSON( rates ):USD::FLOAT AS rate_usd

FROM acceptance_report
WHERE TRUE
