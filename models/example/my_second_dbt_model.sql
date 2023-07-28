
-- Use the `ref` function to select from other models
with pct_count as (
select device_id, count(*) num_trx, count(*)/sum(count(*)) over ()
from {{ ref('basic_model') }} 
group by 1
)

select * from pct_count
--where id = 1
