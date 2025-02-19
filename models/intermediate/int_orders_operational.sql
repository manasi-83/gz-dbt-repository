

   SELECT 
    orders.orders_id,
    MIN(orders.date_date) AS date_date, 
    orders.margin,                       
    ship.shipping_fee,                
    ship.ship_cost,                   
    ship.log_cost,                     
    (orders.margin + ship.shipping_fee - ship.log_cost - ship.ship_cost) AS operational_margin  
FROM {{ ref('int_orders_margin') }} AS orders
LEFT JOIN {{ ref('stg_raw__ship') }} AS ship 
ON orders.orders_id = ship.orders_id
GROUP BY orders.orders_id, orders.margin, ship.shipping_fee, ship.ship_cost, ship.log_cost
