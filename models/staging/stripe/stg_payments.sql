with payments  as (
    SELECT 
    orderid as order_id,
    amount/100 as amount 
    FROM {{ source('stripe', 'payment')}}
    WHERE status = 'success'
)

SELECT * FROM payments