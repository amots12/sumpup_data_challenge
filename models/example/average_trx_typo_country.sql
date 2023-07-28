
/*
    This is a model for to calculate the average transaction amount by country and typology
*/

{{ config(materialized='table') }}


select  typology, country, avg(amount) average_amount
from {{ ref('basic_model')}}
group by 1,2
