with orders as (
    select * from {{ ref('stg_orders') }}
),
payments as (
    select * from {{ ref('stg_payments') }}
),
final as (

    select
        payments.order_id as order_id,
        orders.customer_id as customer_id,
        orders.order_date as order_date,
        orders.status as status,
        coalesce(payments.amount, 0) as amount

    from orders
    left join payments using (order_id)

)

SELECT * FROM final