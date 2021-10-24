{%- set methods = ['bank_transfer', 'coupon', 'credit_card', 'gift_card']-%}

WITH payments AS (

    SELECT 
    * 
    FROM {{ source('stripe', 'payment')}}
),
pivoted AS (
    SELECT 
        orderid,
        {% for method in methods -%}
            sum(case when paymentmethod = '{{method}}' then amount else 0 end) as {{method}}_amount
            {%- if not loop.last -%} , {%- endif %}
        {% endfor -%}

    FROM payments
    WHERE status = 'success'
    GROUP BY 1
)


SELECT * FROM pivoted
