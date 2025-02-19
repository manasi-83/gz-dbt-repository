with 

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select
        date_date,
        orders_id,
        pdt_id,
        revenue,
        CAST(quantity AS INT64) AS quantity

    from source

)

select * from renamed
