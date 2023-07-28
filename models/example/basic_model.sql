
/*
    This is a script to create the basic table to combine all datasets into a combined dataset. 
    The combined dataset is used by downstream models to compute the different metrics
*/

{{ config(materialized='table') }}

with source_data as (

select * from {{ ref('transaction')}} 
left join (select id device_idd,type, store_id from {{ ref('device')}}) device on device.device_idd = transaction.device_id 
left join (select id store_idd ,name
,address	
,city	
,country	
,created_at	store_created_at
,typology	
,customer_id from {{ ref('store')}}) store on device.store_id = store.store_idd)



select * from source_data

