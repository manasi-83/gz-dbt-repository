
SELECT 
    orders.orders_id,
    MIN(orders.date_date) AS date_date,  -- Aggregate to get the first date for each order
    SUM(orders.revenue) AS revenue,  -- Sum revenue for each order
    SUM(orders.margin) AS margin,  -- Sum margin for each order
    round(SUM(orders.purchase_cost), 2) AS purchase_cost,
    Sum(orders.quantity) AS quantity,
    SUM(ship.shipping_fee) AS shipping_fee,  -- Sum shipping fee
    SUM(ship.ship_cost) AS ship_cost,  -- Sum shipping cost
    SUM(ship.log_cost) AS log_cost,  -- Sum log cost
    (SUM(orders.margin) + SUM(ship.shipping_fee) - SUM(ship.log_cost) - SUM(ship.ship_cost)) AS operational_margin  -- Calculate operational margin
FROM {{ ref('int_orders_margin') }} AS orders
LEFT JOIN {{ ref('stg_raw__ship') }} AS ship 
    ON orders.orders_id = ship.orders_id
GROUP BY orders.orders_id





 /*  SELECT 
    orders.orders_id,
    MIN(orders.date_date) AS date_date,
    orders.revenue,
    orders.margin,                       
    ship.shipping_fee,                
    ship.ship_cost,                   
    ship.log_cost,                     
    (orders.margin + ship.shipping_fee - ship.log_cost - ship.ship_cost) AS operational_margin  
FROM {{ ref('int_orders_margin') }} AS orders
LEFT JOIN {{ ref('stg_raw__ship') }} AS ship 
ON orders.orders_id = ship.orders_id
GROUP BY orders.orders_id, orders.margin, ship.shipping_fee, ship.ship_cost, ship.log_cost*/

