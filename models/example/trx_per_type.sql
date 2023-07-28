
/*
    This is a script to find the most selling products accross the entire universe
*/

{{ config(materialized='table') }}

with pct_count as (
select device_id
-- uncomment for debugging
/*, count(*) num_trx
, sum(count(*)) over () total_trx 
*/
,count(*)/sum(count(*)) over () pct_of_total
from {{ ref('basic_model') }} 
group by 1
)

select * from pct_count
