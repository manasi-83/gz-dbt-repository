
SELECT 
    MIN(oper.date_date) AS date,  
    COUNT(DISTINCT oper.orders_id) AS total_transactions, 
    round(SUM(oper.revenue), 2) AS total_revenue,  -- Directly reference the revenue field
    round((SUM(oper.revenue) / COUNT(DISTINCT oper.orders_id)), 2) AS average_basket,
    round(SUM(oper.operational_margin), 2) AS operational_margin,  -- Operational margin from the same model
    round(SUM(oper.purchase_cost), 2) AS total_purchase_cost,  -- Purchase cost from the same model
    round(SUM(oper.shipping_fee), 2) AS total_shipping_fees,  -- Shipping fee from the same model
    round(SUM(oper.log_cost), 2) AS total_log_costs,  -- Log cost from the same model
    round(SUM(oper.quantity), 2) AS total_quantity_sold  -- Quantity from the same model
FROM {{ ref('int_orders_operational') }} AS oper 
GROUP BY oper.date_date 