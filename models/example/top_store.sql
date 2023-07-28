
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

select store_id, sum(case when status = 'accepted' then amount end) sum_sales
from {{ ref('basic_model')}} 
group by 1
order by sum(amount) desc
limit 10
