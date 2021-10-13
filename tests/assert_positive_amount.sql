SELECT 
    order_id,
    sum(amount) as total
FROM {{ ref('stg_payments') }}
GROUP BY order_id
HAVING total < 0