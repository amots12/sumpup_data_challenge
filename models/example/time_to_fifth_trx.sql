
/*
    This is a script to find the time it takes for an average shop to get to the fifth transaction.
*/

{{ config(materialized='table') }}

-- convert 'happened_at' column to timestamp 
with trx_time as (
     
select  store_id
, to_timestamp(happened_at,'MM/DD/YYYY HH:MI:SS') happened_at
--,happened_at
, id
from {{ ref('basic_model') }} 

),
-- add sequence of order pfor each store, find the timestamps of the first and fifth transactions. 
trx_seq as (
    select distinct store_id
    ,FIRST_VALUE(happened_at) OVER (PARTITION BY store_id ORDER BY happened_at asc RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) first_trx
    ,NTH_VALUE (happened_at, 5) OVER (PARTITION BY store_id ORDER BY happened_at asc RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fifth_trx
    from 
    trx_time 
    
),

-- compute the timespan between the first and fifth transactions
days_diff_per_store as (
    select * , {{ datediff('first_trx', 'fifth_trx', "day") }} time_to_fifth
    from trx_seq
    where fifth_trx is not null
)
 
/*
-- uncomment for debugging
*/
--, final as (select * from days_diff_per_store)
/*
-- comment for debugging
*/

, final as (select avg(time_to_fifth) avergae_days_to_fifth, count(*) n_count from days_diff_per_store)

select * from final





