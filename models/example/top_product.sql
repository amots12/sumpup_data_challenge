
/*
    This is a script to find the most selling products accross the entire universe
*/

{{ config(materialized='table') }}

select product_name, count(*) num_sales
from {{ ref('basic_model')}}
group by 1
order by count(*) desc
limit 10
