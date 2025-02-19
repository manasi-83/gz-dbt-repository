SELECT 
        s.orders_id,
        MIN(s.date_date) AS date_date,  -- Get the first date for each order, or use MAX() if you want the most recent
        round(SUM(s.revenue), 2) AS revenue,
        SUM(s.quantity) AS quantity,
        round(SUM(s.purchase_cost), 2) AS purchase_cost,  
        round(SUM(s.margin), 2) AS margin  
    FROM {{ ref('int_sales_margin') }} AS s  -- Referencing int_sales_margin model
    GROUP BY s.orders_id