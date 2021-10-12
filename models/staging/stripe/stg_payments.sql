with payments  as (
    SELECT 
    orderid as order_id,
    amount/100 as amount 
    FROM "DBT_TEST"."STRIPE"."PAYMENT"
    WHERE status = 'success'


)

SELECT * FROM payments