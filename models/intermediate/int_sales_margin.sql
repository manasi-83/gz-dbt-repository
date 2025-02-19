
SELECT 
    s.orders_id,
    s.date_date,
    s.pdt_id,
    CAST(s.quantity AS INT64) AS quantity,
    s.revenue,
    CAST(p.purchase_price AS FLOAT64) AS purchase_price,
    (s.quantity * p.purchase_price) AS purchase_cost,  -- Ensure multiplication works
    (s.revenue - (s.quantity * p.purchase_price)) AS margin
FROM {{ ref('stg_raw__sales') }} AS s
LEFT JOIN {{ ref('stg_raw__product') }} AS p
ON s.pdt_id = p.products_id

